package app.stayfree.patches.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.stayfree.patches.inbox.hasEverLoggedInStayFreshPatch
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE

/**
 * `Theme.isThemeAvailable(SettingsViewModel)` — the enum keeps its name through R8. A theme with
 * a `notEarnedTextResId` is available only if its unlock condition holds:
 *  - SILVER … ADAMANTIUM themes: the matching gamification level reached,
 *  - BLACK: a paired device (`oc8.m()`),
 *  - STAYFRESH (Neon): signed up for Inbox Control (`oc8.e()`).
 * The theme picker (`sh`) and settings (`t06`) both ask it before applying a theme.
 */
private object IsThemeAvailableFingerprint : Fingerprint(
    definingClass = "Lcom/burockgames/timeclocker/common/enums/Theme;",
    name = "isThemeAvailable",
    returnType = "Z",
    parameters = listOf("L"),
)

/**
 * 20.14.1 ships no billing library and no premium flag at all: StayFree's former premium
 * features (usage limits, block keywords/notifications, morning routine, night owl, PIN,
 * challenges, usage assistant, …) are plain toggles available to everyone. What remains
 * locked is cosmetic content — themes behind gamification levels / device pairing / Inbox
 * Control sign-up, and custom app icons behind Inbox Control sign-up — so that is what this
 * patch unlocks.
 */
@Suppress("unused")
val unlockAllFeaturesPatch = bytecodePatch(
    name = "Unlock all premium features",
    description = "Unlocks every theme (gamification-level, Black and Neon themes) and all " +
        "custom app icons without earning levels, pairing a device or signing up for Inbox " +
        "Control.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)

    // Custom app icons are gated only on hasUserEverLoggedInStayFresh.
    dependsOn(hasEverLoggedInStayFreshPatch)

    execute {
        IsThemeAvailableFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
