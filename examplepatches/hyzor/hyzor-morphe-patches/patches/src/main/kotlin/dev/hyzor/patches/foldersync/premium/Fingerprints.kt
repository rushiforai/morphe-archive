/*
 * Copyright 2026 arandomhooman
 * https://github.com/arandomhooman/hoomans-morphe-patches
 *
 * Ported from the FolderSync "Unlock Premium" patch in hoomans-morphe-patches (GPLv3),
 * re-resolved for 4.14.0.
 */

package dev.hyzor.patches.foldersync.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.Opcode

private const val VERSION_FEATURES_CONFIG =
    "Ldk/tacit/foldersync/services/VersionFeaturesConfig;"

/**
 * `VersionFeaturesConfig(<init>)` — the one place the premium flag is written.
 *
 * 4.14.0 keeps the same four-field data class as 4.12.0:
 *
 *   `a: VersionIdentifier`     the build flavour (`GOOGLE_PLAY_FREE` in the lite APK)
 *   `b: boolean`               `isPaidVersion`, the premium gate read by every consumer
 *   `c: int`                   `maxAccounts` (already `Int.MAX_VALUE` in the lite build)
 *   `d: int`                   `maxFolderPairs` (already `Int.MAX_VALUE`)
 *
 * The single constructor stores its second argument into `b`. Pinning the boolean store
 * means a future field reshuffle fails here instead of forcing the wrong boolean.
 */
object VersionFeaturesConfigCtorFingerprint : Fingerprint(
    definingClass = VERSION_FEATURES_CONFIG,
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Ldk/tacit/foldersync/services/VersionIdentifier;",
        "Z",
        "I",
        "I",
    ),
    filters = listOf(
        // iput-boolean p2, p0, Ldk/tacit/foldersync/services/VersionFeaturesConfig;->b:Z
        fieldAccess(
            opcode = Opcode.IPUT_BOOLEAN,
            definingClass = VERSION_FEATURES_CONFIG,
            name = "b",
        ),
    ),
)

/**
 * `AppPreferenceManager.getPremiumVersionPurchased()Z` — the `"premium_version"` preference.
 *
 * It seeds the initial `VersionFeaturesConfig` and backs the direct readers that skip the
 * config state flow (`AdManagerAdMob`, the About screen). The class and method names are not
 * obfuscated, but the literal pins the exact read so a rename or a reshuffle fails loudly
 * rather than patching a different preference.
 */
object PremiumVersionPurchasedFingerprint : Fingerprint(
    definingClass = "Ldk/tacit/foldersync/services/AppPreferenceManager;",
    name = "getPremiumVersionPurchased",
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("premium_version"),
)
