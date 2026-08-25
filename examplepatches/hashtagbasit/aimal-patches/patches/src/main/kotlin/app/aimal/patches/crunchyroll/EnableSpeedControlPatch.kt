package app.aimal.patches.crunchyroll

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

@Suppress("unused")
val enableSpeedControlPatch = bytecodePatch(
    name = "Enable speed control",
    description = "Enables playback speed options (0.5x-2.0x) in the video player.",
    default = true,
) {
    compatibleWith(CRUNCHYROLL)

    execute {
        val configClassName = PlaybackSpeedConfigToStringFingerprint.classDef.type

        val isEnabledFingerprint = Fingerprint(
            returnType = "Z",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            parameters = listOf(),
            custom = { _, classDef -> classDef.type == configClassName },
        )

        isEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
