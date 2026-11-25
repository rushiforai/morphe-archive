/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at 2cb2182 (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 * Forked there from https://github.com/SysAdminDoc/Hushfacebook at c21b570b (GPL-3.0).
 *
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.pinterest.coexist

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.util.MethodUtil
import org.w3c.dom.Attr
import org.w3c.dom.Document
import org.w3c.dom.Element

/** The call each of Pinterest's own authority literals goes through, into the register it was loaded into. */
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

/** The app's own provider authorities: every entry of a declared provider's list that's under [packageName]. */
internal fun Document.ownAuthorities(packageName: String): Set<String> = declaredProviders()
    .flatMap { it.getAttribute("android:authorities").split(';') }
    .map { it.trim() }
    .filter { it.startsWith("$packageName.") }
    .toSet()

/** The app's own permissions: every one it declares under [packageName]. */
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
 * Pinterest's own permissions are signature permissions, so a copy that still declares one under
 * the stock name can't install beside a Pinterest signed with another key, Pinterest's own included
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
 * Hands every literal of Pinterest's code naming one of its own [authorities] to the extension,
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

/** The call reCAPTCHA's report of the app's package goes through, taking the Context it asked. */
internal const val REPORTED_PACKAGE_CALL =
    "$EXTENSION_PACKAGE/coexist/OwnAuthorities;->reportedPackage(Landroid/content/Context;)Ljava/lang/String;"

/** The reCAPTCHA SDK Pinterest's sign-in carries, which keeps its package even in an R8 build. */
internal const val RECAPTCHA_SDK = "Lcom/google/android/recaptcha/"

private val PACKAGE_OWNERS = setOf("Landroid/content/Context;", "Landroid/content/ContextWrapper;", "Landroid/app/Application;")

/** How far past a package read the SDK may hand it on; its builders take a few instructions to reach the field. */
private const val REPORT_REACH = 10

/**
 * Where [this] sends the app's package to reCAPTCHA: a `getPackageName()` call and its
 * move-result, with that result reaching, before anything writes over it or jumps, either a
 * two-argument `put` in the SDK (the signals sent with a token) or a one-String setter on an SDK
 * class (the request fields, the init request's among them, which is the one the server refuses a
 * copy on). R8 moves some of those builders out of the SDK's package, so the sender can sit
 * anywhere. The SDK's other reads of the package look the app up in PackageManager, which needs
 * the real name, and none of them reaches a send.
 */
internal fun Method.reportedPackageSites(): List<Int> {
    val body = implementation?.instructions?.toList() ?: return emptyList()
    return body.indices.filter { at ->
        val call = body[at]
        val asked = (call as? ReferenceInstruction)?.reference as? MethodReference
        if (call.opcode != Opcode.INVOKE_VIRTUAL || asked == null || asked.name != "getPackageName" ||
            asked.parameterTypes.isNotEmpty() || asked.definingClass !in PACKAGE_OWNERS
        ) return@filter false
        val kept = body.getOrNull(at + 1)
        if (kept?.opcode != Opcode.MOVE_RESULT_OBJECT) return@filter false
        val value = (kept as OneRegisterInstruction).registerA
        for (next in body.subList(at + 2, minOf(body.size, at + REPORT_REACH))) {
            if (next.sendsToRecaptcha(value, definingClass)) return@filter true
            val op = next.opcode
            if (!op.canContinue() || next is OffsetInstruction) return@filter false
            if (op.setsRegister() && next is OneRegisterInstruction &&
                (next.registerA == value || (op.setsWideRegister() && next.registerA + 1 == value))
            ) return@filter false
        }
        false
    }
}

/** Whether this call hands register [value] to reCAPTCHA: a signals `put` inside the SDK, or a one-String setter of an SDK class. */
private fun Instruction.sendsToRecaptcha(value: Int, owner: String): Boolean {
    val call = this as? FiveRegisterInstruction ?: return false
    val to = (this as ReferenceInstruction).reference as? MethodReference ?: return false
    val put = (opcode == Opcode.INVOKE_VIRTUAL || opcode == Opcode.INVOKE_INTERFACE) && to.name == "put" &&
        to.parameterTypes.size == 2 && call.registerCount == 3 && call.registerE == value && owner.startsWith(RECAPTCHA_SDK)
    val setter = opcode == Opcode.INVOKE_VIRTUAL && to.definingClass.startsWith(RECAPTCHA_SDK) && call.registerCount == 2 &&
        call.registerD == value && to.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;") && to.returnType == "V"
    return put || setter
}

/**
 * Has the reCAPTCHA SDK send the app's package through the extension, which answers Pinterest's
 * own in a renamed copy. Pinterest's reCAPTCHA key accepts only `com.pinterest`, so without this
 * the SDK's init request is refused ("Package name not allowed") and every email sign-in on a copy
 * fails with "Something went wrong". The call takes the same register the SDK asked, in a 4-bit
 * form like the call it replaces. Answers how many it replaced.
 */
internal fun BytecodePatchContext.reportPinterestToRecaptcha(): Int {
    val found = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.filterTo(found) { it.reportedPackageSites().isNotEmpty() }
    }
    return found.sumOf { original ->
        val method = mutableClassDefBy(original.definingClass).methods.single { MethodUtil.methodSignaturesMatch(it, original) }
        val sites = method.reportedPackageSites()
        sites.forEach { at ->
            val context = method.getInstruction<FiveRegisterInstruction>(at).registerC
            method.replaceInstruction(at, "invoke-static { v$context }, $REPORTED_PACKAGE_CALL")
        }
        sites.size
    }
}
