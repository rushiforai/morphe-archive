package app.whatsapp.patches.metaai

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.whatsapp.patches.shared.Constants.WHATSAPP_COMPATIBILITY
import app.whatsapp.patches.shared.propsHookPatch

private const val EXTENSION_CLASS = "Lapp/whatsapp/extension/PatchSettingsExtension;"

/**
 * Meta AI UI Cleanup patch.
 *
 * Hides supported Meta AI-related interface entry points via:
 * 1. Verified Meta AI AB-Props overrides (controlled at runtime via SharedPreferences).
 * 2. Presentation-layer cleanup in HomeActivity (hiding Meta AI FAB and cleaning search bar hint).
 *
 * Preserves normal WhatsApp search, personal/group chats, and all messaging features.
 */
@Suppress("unused")
val metaAICleanupPatch = patch(
    name = "Meta AI UI Cleanup",
    description = "Hides supported Meta AI-related interface entry points.",
    default = true
) {
    compatibleWith(WHATSAPP_COMPATIBILITY)

    dependsOn(propsHookPatch)

    extendWith("extensions/extension.mpe")

    execute {
        val hooked = HomeActivityOnResumeFingerprint.methodOrNull?.also { method ->
            method.addInstructions(
                0,
                "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onHomeActivityResume(Landroid/app/Activity;)V"
            )
        }

        if (hooked == null) {
            HomeActivityOnCreateFingerprint.methodOrNull?.let { method ->
                val insertIdx = method.implementation!!.instructions.size - 1
                method.addInstructions(
                    insertIdx,
                    "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onHomeActivityResume(Landroid/app/Activity;)V"
                )
            }
        }
    }
}
