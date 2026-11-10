/*
 * Adapted from Hushfacebook (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0),
 * facebook/coexist/SharedPermissions.kt. Modified for facebook-morphe-patches, 2026:
 * the renamed permission prefix is this project's instead of Hushfacebook's.
 */
package app.fbpatches.patches.facebook.coexist

import app.fbpatches.patches.facebook.shared.EXTENSION_CLASSES
import app.fbpatches.patches.facebook.shared.EXTENSION_PACKAGE
import app.fbpatches.patches.facebook.shared.patchLog
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Attr
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val PATCH = "Install beside Meta's apps"

internal const val FACEBOOK_PREFIX = "com.facebook."

/** Where the renamed permissions live. Named after this project, not after one app. */
internal const val RENAMED_PREFIX = "app.justalurker."

internal const val APP_COMMUNICATION = "com.facebook.permission.prod.FB_APP_COMMUNICATION"
internal const val RECEIVER_ACCESS = "com.facebook.receiver.permission.ACCESS"

/** How Facebook's code spells [APP_COMMUNICATION] when it fills in its build flavour itself. */
internal const val APP_COMMUNICATION_FORMAT = "com.facebook.permission.%s.FB_APP_COMMUNICATION"

/** The shared permissions, in the order Facebook's manifest declares them. */
internal val SHARED_PERMISSIONS = listOf(APP_COMMUNICATION, RECEIVER_ACCESS)

/** Every literal Facebook's code loads that names one of them. */
internal val SHARED_LITERALS = SHARED_PERMISSIONS + APP_COMMUNICATION_FORMAT

/** The console call each literal goes through, into the register the literal was loaded into. */
internal const val NAME_CALL =
    "$EXTENSION_PACKAGE/coexist/SharedPermissions;->name(Ljava/lang/String;)Ljava/lang/String;"

/** [name] under [RENAMED_PREFIX]: `com.facebook.X` becomes `app.justalurker.X`. */
internal fun renamed(name: String): String {
    require(name.startsWith(FACEBOOK_PREFIX)) { "$name isn't one of Facebook's names" }
    return RENAMED_PREFIX + name.removePrefix(FACEBOOK_PREFIX)
}

/** How a shared permission's mentions in the manifest were counted, per kind. */
internal data class Mentions(val declared: Int, val requested: Int, val guards: Int)

private enum class Kind { DECLARED, REQUESTED, GUARD }

private class Mention(val element: Element, val attribute: Attr, val kind: Kind)

/** An element's kind of mention for an attribute holding a permission name. */
private fun kindOf(element: Element, attribute: Attr): Kind {
    val isName = attribute.nodeName.substringAfter(':') == "name"
    return when {
        isName && element.tagName == "permission" -> Kind.DECLARED
        isName && element.tagName.startsWith("uses-permission") -> Kind.REQUESTED
        else -> Kind.GUARD
    }
}

/**
 * Renames both shared permissions everywhere this manifest names one: the declaration, the
 * uses-permission, and every attribute of any element holding exactly that name, which is how a
 * component, a provider path or anything else says it's guarded by it.
 *
 * Answers the mentions it moved, per permission. Nothing is renamed unless each permission is
 * declared exactly once and neither new name is in the manifest already: a Facebook that stopped
 * declaring one, or declares it twice, or an APK patched before, is something to look at, not
 * something to guess about.
 */
internal fun Document.renameSharedPermissions(): Map<String, Mentions> {
    val mentions = SHARED_PERMISSIONS.associateWith { mutableListOf<Mention>() }
    val renamedNames = SHARED_PERMISSIONS.map(::renamed).toSet()
    val alreadyThere = sortedSetOf<String>()

    val elements = getElementsByTagName("*")
    for (index in 0 until elements.length) {
        val element = elements.item(index) as? Element ?: continue
        val attributes = element.attributes
        for (at in 0 until attributes.length) {
            val attribute = attributes.item(at) as? Attr ?: continue
            val value = attribute.value
            if (value in renamedNames) alreadyThere += value
            mentions[value]?.add(Mention(element, attribute, kindOf(element, attribute)))
        }
    }

    val counted = mentions.mapValues { (_, found) ->
        Mentions(
            declared = found.count { it.kind == Kind.DECLARED },
            requested = found.count { it.kind == Kind.REQUESTED },
            guards = found.count { it.kind == Kind.GUARD },
        )
    }
    val problems = buildList {
        counted.forEach { (name, count) ->
            if (count.declared != 1) add("the manifest declares $name ${count.declared} times, not once")
        }
        alreadyThere.forEach { add("$it is in the manifest already") }
    }
    if (problems.isNotEmpty()) {
        throw PatchException("$PATCH: " + problems.joinToString("; ") + ". Nothing was renamed.")
    }

    mentions.values.flatten().forEach { it.element.setAttribute(it.attribute.nodeName, renamed(it.attribute.value)) }
    return counted
}

/** The string this instruction loads with const-string, or null. */
internal fun Instruction.loadedString(): String? {
    if (opcode != Opcode.CONST_STRING && opcode != Opcode.CONST_STRING_JUMBO) return null
    return ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
}

/** The shared literal this instruction loads, or null. */
internal fun Instruction.sharedLiteral(): String? = loadedString()?.takeIf { it in SHARED_LITERALS }

/** True when this method loads a shared literal. It only reads, so it needs no proxy. */
internal fun Method.loadsSharedLiteral(): Boolean =
    implementation?.instructions?.any { it.sharedLiteral() != null } == true

/**
 * Hands every shared literal this method loads to the extension, right after the load, into the
 * register the load wrote. Answers how many it handed over.
 *
 * `const-string` writes an 8-bit register, and so does `move-result-object`. The call is a range
 * call, which reads a register at any number: the patcher leaves out, without a word, an
 * instruction whose register doesn't fit its field, so a 4-bit call on v16 would vanish.
 */
internal fun MutableMethod.routeSharedLiterals(): Int {
    val sites = (implementation ?: return 0).instructions.withIndex()
        .filter { (_, instruction) -> instruction.sharedLiteral() != null }
        .map { it.index }

    sites.asReversed().forEach { index ->
        val register = getInstruction<OneRegisterInstruction>(index).registerA
        if (register > 255) {
            throw PatchException("$PATCH: $definingClass->$name loads a permission name into v$register")
        }
        addInstructions(
            index + 1,
            """
                invoke-static/range { v$register .. v$register }, $NAME_CALL
                move-result-object v$register
            """,
        )
    }
    return sites.size
}

/**
 * Hands every shared literal Facebook's code loads to the extension. Answers how many it handed
 * over. The classes are found through the patcher's string index, and the extension's own classes,
 * which hold the same literals to compare against, are left alone.
 */
internal fun BytecodePatchContext.routeSharedLiterals(): Int {
    val owners = SHARED_LITERALS
        .flatMap { classDefByStrings(it, StringComparisonType.EQUALS) }
        .map { it.type }
        .filterNot { it.startsWith(EXTENSION_CLASSES) }
        .distinct()

    val routed = owners.sumOf { type ->
        mutableClassDefBy(type).methods.filter { it.loadsSharedLiteral() }.sumOf { it.routeSharedLiterals() }
    }
    if (routed == 0) {
        throw PatchException("$PATCH: this Facebook build loads none of the shared permission names")
    }
    patchLog.info("$PATCH: routed $routed shared permission name load(s)")
    return routed
}
