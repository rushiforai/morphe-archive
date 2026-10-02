/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.sharelinks

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.instagram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.instagram.misc.extension.enableStatus
import app.morphe.patches.instagram.misc.extension.handleTargets
import app.morphe.patches.instagram.misc.extension.instagramExtensionPatch
import app.morphe.patches.instagram.misc.extension.requireStatusMethod
import app.morphe.patches.instagram.misc.extension.writeTargetCoverage
import app.morphe.patches.instagram.misc.settings.EXTENSION_ROOT
import app.morphe.patches.instagram.misc.settings.sendToStandIn
import app.morphe.patches.instagram.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PATCH = "Sanitize sharing links"

private const val CLEANER = "$EXTENSION_PACKAGE/misc/LinkCleaner;"

private const val SANITIZE = "$CLEANER->sanitizeShared(Ljava/lang/String;)Ljava/lang/String;"

/**
 * A framework call a link leaves Instagram through, and whether it's an instance call, whose
 * stand-in takes the receiver first.
 */
internal data class LinkExit(val definingClass: String, val name: String, val shape: String, val virtual: Boolean) {
    /** The LinkCleaner method of the same name that stands in for this call. */
    val standIn: String
        get() {
            val parameters = shape.substringAfter('(').substringBefore(')')
            val receiver = if (virtual) definingClass else ""
            return "$CLEANER->$name($receiver$parameters)${shape.substringAfter(')')}"
        }

    fun matches(instruction: Instruction): Boolean {
        val expected = if (virtual) {
            instruction.opcode == Opcode.INVOKE_VIRTUAL || instruction.opcode == Opcode.INVOKE_VIRTUAL_RANGE
        } else {
            instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE
        }
        if (!expected) return false
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return false
        return call.definingClass == definingClass && call.name == name &&
            call.parameterTypes.joinToString("", "(", ")") + call.returnType == shape
    }
}

/** Every copy to the clipboard: Instagram builds the clip as plain text and sets it here. */
internal val CLIPBOARD_EXITS = listOf(
    LinkExit("Landroid/content/ClipboardManager;", "setPrimaryClip", "(Landroid/content/ClipData;)V", virtual = true),
)

/** Every system share sheet: the shared text rides in the target intent's EXTRA_TEXT. */
internal val SHARE_SHEET_EXITS = listOf(
    LinkExit(
        "Landroid/content/Intent;", "createChooser",
        "(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;", virtual = false,
    ),
    LinkExit(
        "Landroid/content/Intent;", "createChooser",
        "(Landroid/content/Intent;Ljava/lang/CharSequence;Landroid/content/IntentSender;)Landroid/content/Intent;",
        virtual = false,
    ),
)

/**
 * Every activity Instagram starts. A share straight to one app, the row of app icons in Instagram's
 * own share sheet among them, is an ACTION_SEND intent with no share sheet in between, and it leaves
 * through here whichever way its text was filled in. The stand-ins clean only ACTION_SEND intents.
 * Instagram's launchers all end in these two; it never starts an activity through Activity's own.
 */
internal val DIRECT_SHARE_EXITS = listOf(
    LinkExit("Landroid/content/Context;", "startActivity", "(Landroid/content/Intent;)V", virtual = true),
    LinkExit(
        "Landroid/content/Context;", "startActivity",
        "(Landroid/content/Intent;Landroid/os/Bundle;)V", virtual = true,
    ),
)

@Suppress("unused")
val sanitizeSharingLinksPatch = bytecodePatch(
    name = "Sanitize sharing links",
    description = "Takes stkn, igsh, utm_source and Instagram's other tracking keys off the links you copy " +
        "or share, and opens a bio link without going through Instagram's click tracker. The post, reel, " +
        "story or profile a link opens stays the same.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.instagram())
    dependsOn(instagramExtensionPatch)

    execute {
        requireStatusMethod("sanitizeSharingLinks")

        val targets = listOf("permalink parser", "story link parser", "clipboard copies", "share sheets", "direct shares")
        handleTargets(PATCH, "ways a link leaves Instagram", targets,
            coverage = { writeTargetCoverage("sanitizeSharingLinks", it) }) { target ->
            when (target) {
                "permalink parser" -> sanitizeParsedLink(PermalinkParserFingerprint, PERMALINK_TYPE)
                "story link parser" -> sanitizeParsedLink(StoryShareUrlParserFingerprint, STORY_SHARE_URL_TYPE)
                "clipboard copies" -> if (rerouteLinkExits(CLIPBOARD_EXITS) > 0) null
                    else "no code calls ClipboardManager.setPrimaryClip"
                "share sheets" -> if (rerouteLinkExits(SHARE_SHEET_EXITS) > 0) null
                    else "no code calls Intent.createChooser"
                else -> if (rerouteLinkExits(DIRECT_SHARE_EXITS) > 0) null
                    else "no code calls Context.startActivity"
            }
        }

        enableStatus("sanitizeSharingLinks")
    }
}

/**
 * Cleans the link a share-link parser reads, just before it's stored in the model the parser
 * builds. The model is named by [typeName], loaded right before it's made, and the link is the first
 * String field stored after that. Answers null when done, or why not.
 */
private fun BytecodePatchContext.sanitizeParsedLink(fingerprint: Fingerprint, typeName: String): String? {
    val matches = fingerprint.matchAllOrNull().orEmpty()
    if (matches.size != 1) return "expected one parser naming $typeName, found ${matches.size}"
    val parser = matches.single().method
    val store = parser.linkStore(typeName)
        ?: return "the parser naming $typeName stores no String field after loading its type name"
    val (index, register) = store
    parser.addInstructions(
        index,
        """
            invoke-static/range { v$register .. v$register }, $SANITIZE
            move-result-object v$register
        """,
    )
    return null
}

/** The index and source register of the first `iput-object` of a String after [typeName] is loaded. */
internal fun Method.linkStore(typeName: String): Pair<Int, Int>? {
    val instructions = implementation?.instructions?.toList() ?: return null
    val load = instructions.indexOfFirst { instruction ->
        (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
            ((instruction as ReferenceInstruction).reference as StringReference).string == typeName
    }
    if (load < 0) return null
    for (index in load + 1 until instructions.size) {
        val instruction = instructions[index]
        if (instruction.opcode != Opcode.IPUT_OBJECT) continue
        val field = (instruction as ReferenceInstruction).reference as FieldReference
        if (field.type == "Ljava/lang/String;") return index to (instruction as TwoRegisterInstruction).registerA
    }
    return null
}

/**
 * Sends each call to one of [exits] in Instagram's own code to its LinkCleaner stand-in, which
 * cleans the text and makes the real call. Answers how many calls it sent.
 */
internal fun BytecodePatchContext.rerouteLinkExits(exits: List<LinkExit>): Int {
    val owners = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        if (classDef.methods.any { method -> method.exitSites(exits).isNotEmpty() }) owners += classDef.type
    }
    return owners.sumOf { type ->
        mutableClassDefBy(type).methods.sumOf { method -> method.rerouteExits(exits) }
    }
}

private fun MutableMethod.rerouteExits(exits: List<LinkExit>): Int {
    val sites = exitSites(exits)
    sites.asReversed().forEach { (index, exit) -> sendToStandIn(index, exit.standIn) }
    return sites.size
}

private fun Method.exitSites(exits: List<LinkExit>): List<Pair<Int, LinkExit>> =
    implementation?.instructions?.withIndex()?.mapNotNull { (index, instruction) ->
        exits.firstOrNull { it.matches(instruction) }?.let { index to it }
    }.orEmpty()
