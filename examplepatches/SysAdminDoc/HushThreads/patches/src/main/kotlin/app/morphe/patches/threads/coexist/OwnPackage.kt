/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c21b570b (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.threads.coexist

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.settings.EXTENSION_ROOT
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Attr
import org.w3c.dom.Document
import org.w3c.dom.Element

/** The call each of Threads' own authority literals goes through, into the register it was loaded into. */
internal const val AUTHORITY_CALL =
    "$EXTENSION_PACKAGE/coexist/OwnAuthorities;->name(Ljava/lang/String;)Ljava/lang/String;"

internal const val CONTENT = "content://"

internal fun Document.elements(tag: String): List<Element> {
    val nodes = getElementsByTagName(tag)
    return (0 until nodes.length).map { nodes.item(it) as Element }
}

/**
 * The providers the app declares: those under `<application>`. A `<provider>` under `<queries>`
 * names another app's, which it only looks up.
 */
internal fun Document.declaredProviders(): List<Element> = elements("provider").filter { (it.parentNode as? Element)?.tagName == "application" }

/** Threads' own provider authorities: every entry of a declared provider's list that's under [packageName]. */
internal fun Document.ownAuthorities(packageName: String): Set<String> = declaredProviders()
    .flatMap { it.getAttribute("android:authorities").split(';') }
    .map { it.trim() }
    .filter { it.startsWith("$packageName.") }
    .toSet()

/** Threads' own permissions: every one it declares under [packageName]. */
internal fun Document.ownPermissions(packageName: String): Set<String> = elements("permission")
    .map { it.getAttribute("android:name") }
    .filter { it.startsWith("$packageName.") }
    .toSet()

/**
 * What following a renamed package moved: mentions of a permission, authorities, and declarations
 * still under the stock package.
 */
internal data class Followed(val permissions: Int, val authorities: Int, val declarations: Int = 0)

/**
 * After the package was renamed away from [originalPackage]: moves every permission still declared
 * under one of [stockPermissions] under the new package, points every mention of a permission this
 * manifest no longer declares at the renamed declaration, and moves every authority still in
 * [stockAuthorities] under the new package. Answers what it moved, or null when the package is
 * still [originalPackage], and then it changes nothing.
 *
 * Threads' own permissions are signature permissions, so a copy that still declares one under the
 * stock name can't install beside a Threads signed with another key, Meta's own included
 * (INSTALL_FAILED_DUPLICATE_PERMISSION), and a component that still requires one under the stock
 * name asks for a permission the copy doesn't declare.
 */
internal fun Document.followRenamedPackage(
    originalPackage: String,
    stockAuthorities: Set<String>,
    stockPermissions: Set<String>,
): Followed? {
    val renamedTo = documentElement.getAttribute("package")
    if (renamedTo.isEmpty() || renamedTo == originalPackage) return null

    fun movedUnder(name: String) = renamedTo + name.removePrefix(originalPackage)
    var declarations = 0
    for (declaration in elements("permission")) {
        val name = declaration.getAttribute("android:name")
        if (name !in stockPermissions) continue
        declaration.setAttribute("android:name", movedUnder(name))
        declarations++
    }

    val declared = elements("permission").map { it.getAttribute("android:name") }.toSet()
    fun cloneDeclarationOf(name: String): String? = listOfNotNull(
        movedUnder(name).takeIf { name.startsWith("$originalPackage.") },
        "${renamedTo}_$name",
    ).firstOrNull { it in declared }

    var permissions = 0
    for (element in elements("*")) {
        val attributes = element.attributes
        for (at in 0 until attributes.length) {
            val attribute = attributes.item(at) as? Attr ?: continue
            if (element.tagName == "permission" && attribute.nodeName == "android:name") continue
            if (attribute.value in declared) continue
            val clone = cloneDeclarationOf(attribute.value) ?: continue
            attribute.value = clone
            permissions++
        }
    }

    var authorities = 0
    for (provider in declaredProviders()) {
        val entries = provider.getAttribute("android:authorities").split(';')
        val moved = entries.map { entry ->
            val authority = entry.trim()
            if (authority !in stockAuthorities) return@map entry
            authorities++
            entry.replace(authority, movedUnder(authority))
        }
        if (moved != entries) provider.setAttribute("android:authorities", moved.joinToString(";"))
    }
    return Followed(permissions, authorities, declarations)
}

/** The authority [this] names when it's one of [authorities] or a content:// address on one, else null. */
internal fun String.ownAuthority(authorities: Set<String>): String? {
    if (this in authorities) return this
    if (!startsWith(CONTENT)) return null
    return removePrefix(CONTENT).takeWhile { it != '/' && it != '?' && it != '#' }.takeIf { it in authorities }
}

/** The string this instruction loads with const-string, or null. */
internal fun Instruction.loadedString(): String? {
    if (opcode != Opcode.CONST_STRING && opcode != Opcode.CONST_STRING_JUMBO) return null
    return ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
}

/**
 * The string the call at [at] in [body] fetches from Redex's table of outlined strings, or null.
 * The caller writes the index as a constant just before the call, and the table is a static
 * (I)String that switches on it first thing, each case loading one literal and returning it.
 */
internal fun BytecodePatchContext.outlinedString(body: List<Instruction>, at: Int): String? {
    val call = body[at]
    if (call.opcode != Opcode.INVOKE_STATIC) return null
    val target = (call as ReferenceInstruction).reference as? MethodReference ?: return null
    if (target.returnType != "Ljava/lang/String;" || target.parameterTypes.map { it.toString() } != listOf("I")) return null
    val index = body.getOrNull(at - 1)?.takeIf {
        it.opcode in INDEX_CONSTANTS && (it as OneRegisterInstruction).registerA == (call as FiveRegisterInstruction).registerC
    }?.let { (it as NarrowLiteralInstruction).narrowLiteral } ?: return null
    val table = classDefByOrNull(target.definingClass)?.methods?.firstOrNull {
        it.name == target.name && it.returnType == target.returnType && it.parameterTypes.map { type -> type.toString() } == listOf("I")
    } ?: return null
    val implementation = table.implementation ?: return null
    val code = implementation.instructions.toList()
    val switch = code.firstOrNull()?.takeIf { it.opcode == Opcode.PACKED_SWITCH || it.opcode == Opcode.SPARSE_SWITCH } ?: return null
    if ((switch as OneRegisterInstruction).registerA != implementation.registerCount - 1) return null
    // The switch is at address 0, so its payload's and its cases' offsets are addresses.
    val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    val payload = code.getOrNull(addresses.indexOf((switch as OffsetInstruction).codeOffset)) as? SwitchPayload ?: return null
    val case = payload.switchElements.singleOrNull { it.key == index } ?: return null
    val loads = addresses.indexOf(case.offset).takeIf { it >= 0 } ?: return null
    val returns = code.getOrNull(loads + 1)?.takeIf { it.opcode == Opcode.RETURN_OBJECT } ?: return null
    if ((returns as OneRegisterInstruction).registerA != (code[loads] as? OneRegisterInstruction)?.registerA) return null
    return code[loads].loadedString()
}

private val INDEX_CONSTANTS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST)

/**
 * Hands every literal this method loads that [routes] picks to [call], a static method taking and
 * answering a String, right after the load, into the register the load wrote. Answers how many it
 * handed over. An error names [owner] and calls the literal [literal].
 *
 * `const-string` writes an 8-bit register, and so does `move-result-object`. The call is a range
 * call, which reads a register at any number: the patcher leaves out, without a word, an
 * instruction whose register doesn't fit its field, so a 4-bit call on v16 would vanish.
 */
internal fun MutableMethod.routeLiterals(call: String, owner: String, literal: String, routes: (String) -> Boolean): Int {
    val sites = (implementation ?: return 0).instructions.withIndex()
        .filter { (_, instruction) -> instruction.loadedString()?.let(routes) == true }
        .map { it.index }
    sites.asReversed().forEach { index ->
        val register = getInstruction<OneRegisterInstruction>(index).registerA
        if (register > 255) {
            throw PatchException("$owner: $definingClass->$name loads $literal into v$register")
        }
        addInstructions(
            index + 1,
            """
                invoke-static/range { v$register .. v$register }, $call
                move-result-object v$register
            """,
        )
    }
    return sites.size
}

/**
 * Hands every literal of Threads' code naming one of its own [authorities] to the extension,
 * which answers the running app's. Answers how many it handed over. Every one is under
 * [packageName], which the string index finds with a prefix, and the extension is left alone.
 */
internal fun BytecodePatchContext.routeOwnAuthorities(owner: String, packageName: String, authorities: Set<String>): Int {
    val owners = listOf("$packageName.", "$CONTENT$packageName.")
        .flatMap { classDefByStrings(it, StringComparisonType.STARTS_WITH) }
        .map { it.type }
        .filterNot { it.startsWith(EXTENSION_ROOT) }
        .distinct()
    return owners.sumOf { type ->
        mutableClassDefBy(type).methods
            .filter { method -> method.implementation?.instructions?.any { it.loadedString()?.ownAuthority(authorities) != null } == true }
            .sumOf { it.routeLiterals(AUTHORITY_CALL, owner, "an authority") { literal -> literal.ownAuthority(authorities) != null } }
    }
}
