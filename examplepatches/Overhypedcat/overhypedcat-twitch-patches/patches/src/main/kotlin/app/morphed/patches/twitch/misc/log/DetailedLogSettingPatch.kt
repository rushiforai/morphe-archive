package app.morphed.patches.twitch.misc.log

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphed.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import app.morphed.patches.twitch.shared.indicesOf
import com.android.tools.smali.dexlib2.Opcode

private const val SETTING_CLASS = "Lapp/morphed/extension/twitch/patches/DetailedLogSetting;"

@Suppress("unused")
val detailedLogSettingPatch = bytecodePatch(
    name = "Detailed log setting",
    description = "Adds a Detailed log switch to Settings, Preferences. While it is on, a detailed log " +
        "of the ad blocker and the video player's connections is written to Downloads.",
    default = true
) {
    compatibleWith(COMPATIBILITY_TWITCH)

    extendWith("extensions/twitch.mpe")

    execute {
        // Add the switch after the screen's own rows, every time the screen is filled.
        PreferencesScreenFingerprint.method.apply {
            val thisRegister = implementation!!.registerCount - 1
            indicesOf(Opcode.RETURN_VOID).forEach { returnIndex ->
                addInstruction(
                    returnIndex,
                    "invoke-static/range { v$thisRegister .. v$thisRegister }, $SETTING_CLASS->addTo(Ljava/lang/Object;)V"
                )
            }
        }

        // The screen's own handler skips the switch (it has no key); this one acts on it.
        PreferencesSwitchFingerprint.method.apply {
            val firstParameter = implementation!!.registerCount - 2
            addInstruction(
                0,
                "invoke-static/range { v$firstParameter .. v${firstParameter + 1} }, " +
                    "$SETTING_CLASS->onToggle(Ljava/lang/Object;Z)V"
            )
        }
    }
}
