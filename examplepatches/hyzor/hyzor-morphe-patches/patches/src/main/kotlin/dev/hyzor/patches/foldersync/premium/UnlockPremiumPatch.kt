/*
 * Copyright 2026 arandomhooman
 * https://github.com/arandomhooman/hoomans-morphe-patches
 *
 * Ported from the FolderSync 4.9.3 / 4.12.0 "Unlock Premium" patch in
 * hoomans-morphe-patches (GPLv3), re-resolved for 4.14.0.
 */

package dev.hyzor.patches.foldersync.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import dev.hyzor.patches.foldersync.shared.Constants.FOLDERSYNC

/**
 * FolderSync decides premium from one value: `VersionFeaturesConfig.b` (`isPaidVersion`).
 *
 * ### The gate
 *
 * The lite build constructs `VersionFeaturesConfig(GOOGLE_PLAY_FREE, isPaid, MAX_VALUE,
 * MAX_VALUE)`. Every premium surface reads the boolean straight off the config:
 * `DashboardViewModel`, `FolderPairListViewModel`, both `FolderPairDetailsViewModel`s,
 * `AutomationManagerImpl`/`AutomationViewModel`, and the folder-pair and account limits
 * (`c`/`d`, already `Int.MAX_VALUE` in the lite build). `VersionFeaturesConfig.a()` is
 * `showAds` — `!isPaid && flavour == GOOGLE_PLAY_FREE` — so the same flag removes the ads.
 * `AdManagerAdMob` and the About screen read the preference directly instead.
 *
 * ### Why the constructor, not the preference
 *
 * 4.14.0 keeps the same live-rebuild path as 4.12.0. `AppLiteVersionFeatures` (in the Android
 * subpackage `dk.tacit.android.foldersync.services`) seeds a `MutableStateFlow` with a config built
 * from `getPremiumVersionPurchased()`, and collects `AppPreferenceManager`'s
 * `PreferenceState` flow, rebuilding the config from `PreferenceState.premiumVersionPurchased`
 * on every emission. The Play billing coroutine reports a failed/absent purchase with
 * `setPremiumVersionPurchased(false)`, which pushes a fresh `PreferenceState` and rebuilds
 * the config with `isPaid = false`. Forcing only the preference getter is therefore
 * overwritten a moment later.
 *
 * Forcing the constructor's boolean argument instead means *every* config the app builds —
 * the initial seed and each rebuild (and each `copy()`) — stores `isPaidVersion = true`.
 * The argument is `p2`; the 4.14.0 constructor uses it only for the `iput-boolean` into `b`,
 * and the fingerprint pins that store, so injecting `const/4 p2, 0x1` at the top of the
 * constructor cannot disturb another use of the parameter.
 *
 * ### Belt and suspenders
 *
 * The preference getter is forced too. It seeds the initial config, backs the About screen's
 * "(Premium)" suffix and the ad manager's own check, and covers any future direct reader that
 * does not go through the config flow. Its only writer is the Play Billing result, which is
 * never `true` for a non-owner.
 *
 * Everything here is client side: the app's own premium checks change, the sync providers and
 * anything the FolderSync backend verifies do not.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks FolderSync's premium without the in-app purchase and removes the " +
        "ads, so you get unlimited sync pairs and the advanced options.",
    default = true,
) {
    compatibleWith(FOLDERSYNC)

    execute {
        // p2 is the isPaidVersion argument. The constructor's first instruction is the
        // Object.<init> call; p2 is not read before the iput-boolean pinned by the fingerprint.
        VersionFeaturesConfigCtorFingerprint.method.addInstructions(0, "const/4 p2, 0x1")

        // Replaces the SharedPreferences read with `return true`. v0 is an existing local of
        // the method, so the injected block is verifier-safe; the old body becomes dead code.
        PremiumVersionPurchasedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )
    }
}
