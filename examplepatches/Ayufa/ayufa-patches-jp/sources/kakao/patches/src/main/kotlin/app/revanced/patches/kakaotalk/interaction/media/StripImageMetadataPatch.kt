package app.revanced.patches.kakaotalk.interaction.media

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patches.shared.misc.settings.preference.SwitchPreference
import app.morphe.util.findInstructionIndicesReversedOrThrow
import app.morphe.util.setExtensionIsPatchIncluded
import app.revanced.patches.kakaotalk.interaction.media.fingerprints.ImageUploadFileFingerprint
import app.revanced.patches.kakaotalk.misc.settings.PreferenceScreen
import app.revanced.patches.kakaotalk.misc.settings.addSettingsTabPatch
import app.revanced.patches.kakaotalk.shared.Constants.COMPATIBILITY_KAKAO
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS =
    "Lapp/revanced/extension/kakaotalk/patches/StripImageMetadataPatch;"

private const val SANITIZE =
    "$EXTENSION_CLASS->sanitize(Ljava/io/File;)Ljava/io/File;"

@Suppress("unused")
val stripImageMetadataPatch = bytecodePatch(
    name = "Strip image metadata",
    description = "オリジナル画質で送信される画像から、GPSの撮影位置を含むEXIFメタデータを除去します。画像とその向きはそのまま保持されます。",
) {
    compatibleWith(COMPATIBILITY_KAKAO)
    dependsOn(addSettingsTabPatch)

    execute {
        PreferenceScreen.CHAT.addPreferences(
            SwitchPreference(
                key = "morphe_pref_strip_image_metadata",
                titleKey = "morphe_settings_patch_strip_image_metadata",
                summary = true,
            ),
        )
        setExtensionIsPatchIncluded(EXTENSION_CLASS)

        // Strip metadata from every image file this helper returns for upload.
        ImageUploadFileFingerprint.method.apply {
            findInstructionIndicesReversedOrThrow(Opcode.RETURN_OBJECT).forEach { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA

                addInstructionsAtControlFlowLabel(
                    index,
                    """
                        invoke-static { v$register }, $SANITIZE
                        move-result-object v$register
                    """,
                )
            }
        }
    }
}