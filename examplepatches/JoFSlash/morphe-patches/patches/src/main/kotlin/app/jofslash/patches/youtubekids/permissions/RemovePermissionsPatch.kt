package app.jofslash.patches.youtubekids.permissions

import app.jofslash.patches.youtubekids.shared.Constants.COMPATIBILITY_YOUTUBE_KIDS
import app.jofslash.patches.youtubekids.shared.editManifest
import app.jofslash.patches.youtubekids.shared.removeNamed
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/youtubekids/VoiceSearch;"

// The search screen finds its microphone button and sets its click listener.
internal object VoiceSearchButtonFingerprint : Fingerprint(
    filters = listOf(
        resourceLiteral(ResourceType.ID, "voice_search_button"),
        methodCall(name = "setOnClickListener"),
    ),
)

private val removePermissionsManifestPatch = resourcePatch {
    execute {
        editManifest {
            it.removeNamed(
                "uses-permission",
                setOf(
                    // Voice search only.
                    "android.permission.RECORD_AUDIO",
                    // Shared storage; the app keeps its files in its own folder.
                    "android.permission.WRITE_EXTERNAL_STORAGE",
                    // Sizes of other apps.
                    "android.permission.GET_PACKAGE_SIZE",
                    // Background work is scheduled again when the app starts.
                    "android.permission.RECEIVE_BOOT_COMPLETED",
                    // Google services settings, as the app names it and as GmsCore support does.
                    "com.google.android.providers.gsf.permission.READ_GSERVICES",
                    "app.revanced.android.providers.gsf.permission.READ_GSERVICES",
                )
            )
        }
    }
}

@Suppress("unused")
val removePermissionsPatch = bytecodePatch(
    name = "Remove unneeded permissions",
    description = "Removes the microphone permission (voice search), storage access, reading app sizes, " +
            "starting at boot and reading Google services settings. The voice search button is hidden, " +
            "as it can't listen any more; typing a search works as before.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_YOUTUBE_KIDS)

    extendWith("extensions/youtubekids.mpe")
    dependsOn(removePermissionsManifestPatch)

    execute {
        VoiceSearchButtonFingerprint.let {
            val setListener = it.instructionMatches.last().index
            val button = it.method.getInstruction<FiveRegisterInstruction>(setListener).registerC
            it.method.addInstruction(
                setListener + 1,
                "invoke-static { v$button }, $EXTENSION_CLASS->hide(Landroid/view/View;)V"
            )
        }
    }
}
