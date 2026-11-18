package io.github.jordanwoodson.patches.rumble.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import io.github.jordanwoodson.patches.rumble.settings.rumbleSettings
import io.github.jordanwoodson.patches.rumble.settings.settingsPatch
import io.github.jordanwoodson.patches.rumble.shared.Constants.COMPATIBILITY_RUMBLE
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.rumble.shared.RUMBLE
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.shared.settings.isEnabled

private const val KEY = "unlock_premium"

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Turns on Rumble's local premium state once you sign in (or sign out and in again): the app then " +
        "treats you as a Premium member, which skips its ad requests and Premium upsells. Rumble's server still " +
        "decides premium-only videos, live gates, downloads and premium comments, and may refuse them.",
) {
    compatibleWith(COMPATIBILITY_RUMBLE)
    dependsOn(settingsPatch)

    execute {
        val match = ProfilePremiumFingerprint.matchAllOrNull()?.singleOrNull()
            ?: throw PatchException("Rumble: expected exactly one UserProfile.isPremium getter. " +
                "This patch targets Rumble ${RUMBLE.version}; recheck the profile model before updating compatibility.")
        Locators.record("rumble.unlock_premium.profile_premium", match.method)

        // The profile mapper passes this value to the session's isUserPremiumKey flow.
        // Change only the value read: after a false read, return whether the switch is on. Keep the original
        // return register and all other profile data, including nullable subscription metadata. A
        // signed-out session has no profile to map.
        val fieldRead = match.instructionMatches.first()
        val register = fieldRead.getInstruction<OneRegisterInstruction>().registerA
        match.method.apply {
            addInstructionsWithLabels(
                fieldRead.index + 1,
                """
                    if-nez v$register, :premium
                    ${isEnabled(KEY, "v$register")}
                """,
                ExternalLabel("premium", getInstruction(fieldRead.index + 1)),
            )
        }

        rumbleSettings.add(
            SwitchSetting(
                KEY,
                "Unlock Premium",
                "Rumble's local premium state; the server still decides premium content. Applies at the next " +
                    "start while signed in.",
                Section.PREMIUM,
            ),
        )
    }
}
