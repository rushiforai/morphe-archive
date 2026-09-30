/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0).
 */
package app.morphe.patches.threads.misc.sharelinks

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val SANITIZE =
    "Lapp/morphe/extension/hushthreads/misc/LinkCleaner;->sanitizeShared(Ljava/lang/String;)Ljava/lang/String;"

/**
 * The parser of the server's answer to `media/<id>/permalink/`, the one request behind every link
 * Threads hands out for a post: Copy link, Share to another app, Send and the share sheet's own
 * rows. It reads the `permalink` field and stores it in a fresh response object. The method's name
 * comes from the JSON parser interface it implements, so Redex keeps it, and the two strings say
 * which of the app's many parsers this is.
 */
internal object PermalinkResponseParserFingerprint : Fingerprint(
    name = "unsafeParseFromJson",
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("permalink"),
        string("XDTPermalinkResponse"),
    ),
)

/**
 * Takes Threads' tracking tags off the links you share.
 *
 * Threads asks its server for a post's link each time you share it, and the server answers with
 * `xmt`, a code that ties the link to you, and `slof` added to it. The link goes through the
 * extension as the app reads it from that answer, before anything stores it, so every place that
 * shares the link gets the clean one. With the switch off, paused, or before the settings are
 * ready, the extension hands the link back as it came.
 *
 * Found by reading 449 (2026-09-29): the parser stores the string into the response object's one
 * String field right after it creates the object.
 */
@Suppress("unused")
val sanitizeSharingLinksPatch = bytecodePatch(
    name = "Sanitize sharing links",
    description = "Takes Threads' tracking tags, such as xmt, off the links you share or copy. " +
        "The post a link opens stays the same.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.threads())
    dependsOn(threadsExtensionPatch)

    execute {
        val method = PermalinkResponseParserFingerprint.method
        val instructions = method.implementation!!.instructions.toList()

        // The response object is created after its type name is loaded, and the parsed link is the
        // first String stored into it.
        val typeName = PermalinkResponseParserFingerprint.instructionMatches[1].index
        val created = (typeName until instructions.size).firstOrNull { instructions[it].opcode == Opcode.NEW_INSTANCE }
            ?: throw PatchException("Sanitize sharing links: ${method.definingClass}->${method.name} creates no response")
        val store = (created until instructions.size).firstOrNull {
            val instruction = instructions[it]
            instruction.opcode == Opcode.IPUT_OBJECT &&
                instruction.getReference<FieldReference>()?.type == "Ljava/lang/String;"
        } ?: throw PatchException(
            "Sanitize sharing links: ${method.definingClass}->${method.name} stores no String into its response",
        )
        val link = (instructions[store] as TwoRegisterInstruction).registerA

        // At the store's own label, so a branch that jumped to the store runs the call too.
        method.addInstructionsAtControlFlowLabel(
            store,
            """
                invoke-static/range { v$link .. v$link }, $SANITIZE
                move-result-object v$link
            """,
        )

        enableStatus("sanitizeSharingLinks")
    }
}
