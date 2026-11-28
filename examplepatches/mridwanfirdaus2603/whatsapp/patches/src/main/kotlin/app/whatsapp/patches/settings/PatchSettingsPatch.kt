package app.whatsapp.patches.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.whatsapp.patches.shared.Constants.WHATSAPP_COMPATIBILITY
import app.whatsapp.patches.shared.propsHookPatch

private const val EXTENSION_CLASS = "Lapp/whatsapp/extension/PatchSettingsExtension;"

/**
 * Patch Settings Integration patch.
 *
 * Integrates a native-looking "Pengaturan Patch" entry into WhatsApp's
 * Settings screen between "Bahasa Aplikasi" and "Bantuan dan masukan".
 * Tapping it opens a dedicated settings screen with runtime switches
 * backed by SharedPreferences and patch compatibility information.
 */
@Suppress("unused")
val patchSettingsPatch = patch(
    name = "Patch Settings",
    description = "Adds a native Patch Settings menu into WhatsApp Settings.",
    default = true
) {
    compatibleWith(WHATSAPP_COMPATIBILITY)

    dependsOn(propsHookPatch)

    extendWith("extensions/extension.mpe")

    execute {
        val resumeCandidates = listOf(
            SettingsTabOnResumeFingerprint,
            SettingsOnResumeFingerprint,
        )
        for (fp in resumeCandidates) {
            fp.methodOrNull?.addInstructions(
                0,
                "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->injectSettingsEntry(Landroid/app/Activity;)V"
            )
        }

        val createCandidates = listOf(
            SettingsTabOnCreateFingerprint,
            SettingsOnCreateFingerprint,
        )
        for (fp in createCandidates) {
            fp.methodOrNull?.let { method ->
                val insertIdx = method.implementation!!.instructions.size - 1
                method.addInstructions(
                    insertIdx,
                    "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->injectSettingsEntry(Landroid/app/Activity;)V"
                )
            }
        }
    }
}
