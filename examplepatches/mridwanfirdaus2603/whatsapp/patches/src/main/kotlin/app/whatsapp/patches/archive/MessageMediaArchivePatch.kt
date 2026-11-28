package app.whatsapp.patches.archive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.whatsapp.patches.shared.Constants.WHATSAPP_COMPATIBILITY
import app.whatsapp.patches.shared.propsHookPatch

private const val EXTENSION_CLASS = "Lapp/whatsapp/extension/PatchSettingsExtension;"

/**
 * Keep Messages & Media Archive patch (WhatsAppMessageMediaArchive).
 *
 * Provides user-controlled local archiving for eligible messages and media
 * that the user has legitimately received or owns.
 *
 * Does not bypass sender deletion controls, anti-revoke, or disappearing-message
 * restrictions.
 */
@Suppress("unused")
val messageMediaArchivePatch = patch(
    name = "Keep Messages & Media",
    description = "Provide user-controlled local archiving for eligible messages and media.",
    default = true
) {
    compatibleWith(WHATSAPP_COMPATIBILITY)

    dependsOn(propsHookPatch)

    extendWith("extensions/extension.mpe")

    execute {
        val hookedResume = ConversationOnResumeFingerprint.methodOrNull?.also { method ->
            method.addInstructions(
                0,
                "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onConversationResume(Landroid/app/Activity;)V"
            )
        }

        if (hookedResume == null) {
            ConversationOnCreateFingerprint.methodOrNull?.let { method ->
                val insertIdx = method.implementation!!.instructions.size - 1
                method.addInstructions(
                    insertIdx,
                    "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onConversationResume(Landroid/app/Activity;)V"
                )
            }
        }
    }
}
