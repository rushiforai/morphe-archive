package app.ytvr.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * The preference key the app reads its version name from (`AppVersionOverride`).
 *
 * It is an anchor, not just a setting: the version spoof finds its accessors by this literal
 * instead of by the class's obfuscated name. (The retired osName spoof used it to tell that
 * class apart from the other `Z(Context)` feature checks; that patch was removed 2026-10-12,
 * see FINGERPRINTS.md for its measurement record.)
 */
const val VERSION_NAME_OVERRIDE_KEY = "pref_override_build_version_name"

/**
 * The app version this bundle is verified against -- the newest normal (non-experimental)
 * AppTarget below, single-sourced so the Spoof app version option default cannot drift from
 * the support pinning on a version bump. scripts/check-upstream-version.mjs reads this
 * constant alongside the literal AppTarget versions.
 */
const val SUPPORTED_APP_VERSION = "1.90.05"

object Constants {
    val COMPATIBILITY_YOUTUBE_VR = Compatibility(
        name = "YouTube VR", // App name as it appears in the Android launcher.
        packageName = "com.google.android.apps.youtube.vr.oculus",
        // User-facing description of the app *and* what this bundle does to it, which is the
        // convention other community bundles follow (patches-list.json carries it as
        // `compatiblePackages[].description`, and Morphe Manager and third-party patch indexes
        // read that file). It is deliberately one sentence per audience: the first says which
        // build of the app this is -- the Quest one, not the store package the phone patches
        // target -- and the second says what a user gets from patching it.
        description = "The Meta Quest build of YouTube VR. These patches make playback ad-free, " +
            "add SponsorBlock and a starting video quality, and install as a clone beside the " +
            "store app.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF0000, // Icon color in Morphe Manager. Usually the same color as the icon background.
        targets = listOf(
            // ---------------------------------------------------------------------------------
            // Support policy for app versions
            //
            // The fingerprints are re-derived per version (R8 reassigns every name on each
            // release), so only versions that were actually checked against an APK are listed
            // as normal targets. A version that is not listed is *skipped*, not failed -- the
            // patcher exits 0 and the output has none of the fixes -- which is why
            // scripts/patch-and-install.ps1 asserts that the expected patches were applied.
            //
            // When a new version appears and nobody has re-derived the fingerprints yet, add it
            // as an EXPERIMENTAL target instead of a normal one. That is the honest "you may try
            // it, it is not guaranteed" channel: it shows up in Morphe Manager (and in
            // patches-list.json) rather than hiding behind a CLI flag. Never list an untested
            // version as a normal target.
            //
            //     AppTarget(
            //         version = "1.89.0",
            //         isExperimental = true,
            //         description = "Untested: the fingerprints were not re-derived for this " +
            //             "build, so some patches are expected to fail. Patch with " +
            //             "`--force --continue-on-error` and report which patches failed " +
            //             "(see docs/FINGERPRINTS.md).",
            //     ),
            //
            // To try any unlisted build without touching this file, the CLI accepts
            // `-f/--force` (skip the compatibility check) and `--continue-on-error`, which keeps
            // whatever applied and reports the rest. Users can do the same from Morphe Manager
            // by allowing the selection of an un-suggested app version.
            //
            // If a target should only match a specific ABI's version code, pass
            // `versionCodes = mapOf(SupportedAbi.ARM64_V8A to 19005000)`; this app ships
            // arm64-v8a only.
            //
            // Pruning (the Morphe discipline): at most TWO normal targets may be listed, and
            // each must carry a `// Kept: <reason>` comment directly above it. When a third
            // version is added, drop the oldest in the same change. The rule is enforced by
            // SupportedVersionsPolicyTest, because a list that only grows makes the name-pinned
            // fingerprints accumulate branches and the cross-version collision risk with them.
            // The why-kept comment must sit ABOVE the AppTarget( line: the upstream checker's
            // regex (`AppTarget\s*\(\s*version`) cannot cross a comment line, so a comment
            // inside the parens would hide the target from it.
            // ---------------------------------------------------------------------------------
            // Kept: newest verified target -- fingerprints re-derived against this APK.
            AppTarget(
                version = "1.90.05",
                description = "Verified: every fingerprint was re-derived against this build.",
            ),
            // Kept: previous verified target; headsets that have not taken the 1.90.05
            // store update are still served 1.89.09, and dropping it strands them.
            AppTarget(
                version = "1.89.09",
                description = "Verified: every fingerprint was re-derived against this build.",
            ),
        ),
    )
}
