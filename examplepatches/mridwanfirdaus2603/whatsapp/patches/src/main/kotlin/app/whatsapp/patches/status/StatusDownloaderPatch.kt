package app.whatsapp.patches.status

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.whatsapp.patches.shared.Constants.WHATSAPP_COMPATIBILITY
import app.whatsapp.patches.shared.propsHookPatch

private const val EXTENSION_CLASS = "Lapp/whatsapp/extension/PatchSettingsExtension;"

/**
 * Download Status patch (WhatsAppStatusDownloader).
 *
 * Adds a native-looking download action to WhatsApp's Status viewer for
 * eligible image and video Status media that the user is authorized to view.
 *
 * Respects sender restrictions and does not bypass View Once protections.
 */
@Suppress("unused")
val statusDownloaderPatch = patch(
    name = "Download Status",
    description = "Save supported WhatsApp Status media to local storage when authorized.",
    default = true
) {
    compatibleWith(WHATSAPP_COMPATIBILITY)

    dependsOn(propsHookPatch)

    extendWith("extensions/extension.mpe")

    execute {
        val hookedResume = StatusPlaybackOnResumeFingerprint.methodOrNull?.also { method ->
            method.addInstructions(
                0,
                "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onStatusPlaybackResume(Landroid/app/Activity;)V"
            )
        }

        if (hookedResume == null) {
            StatusPlaybackOnCreateFingerprint.methodOrNull?.let { method ->
                val insertIdx = method.implementation!!.instructions.size - 1
                method.addInstructions(
                    insertIdx,
                    "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onStatusPlaybackResume(Landroid/app/Activity;)V"
                )
            }
        }

        StatusPlaybackContactFragmentOnResumeFingerprint.methodOrNull?.let { method ->
            method.addInstructions(
                0,
                "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onStatusFragmentResume(Ljava/lang/Object;)V"
            )
        }
    }
}
