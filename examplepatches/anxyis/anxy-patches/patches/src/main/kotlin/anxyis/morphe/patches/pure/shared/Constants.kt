package anxyis.morphe.patches.pure.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Pure Motion patch source: clean-room implementation of the Tanryu-equivalent
 * unlock for official Alight Motion, with zero Tanryu branding.
 *
 * VERSION POLICY: locked to 5.0.270 (versionCode 1002578) ONLY. All anchors
 * below use exact obfuscated class/method names from that build plus
 * structural assertions. Alight obfuscates every release, so these patches
 * intentionally do NOT try to be version-tolerant: incompatible versions must
 * fail fast (Compatibility below) rather than patch the wrong code.
 * A new Alight version needs a fresh recon + new anchors, never fuzzy reuse.
 *
 * Stock base this source was derived from (APKMirror bundle, arm64):
 * base.apk sha256 cafd733c6bbc12d17b8a43a5f779587c89b03cc8e64f234e6fc881b0f1c99e87
 */
val ALIGHT_5270 = Compatibility(
    name = "Alight Motion",
    packageName = "com.alightcreative.motion",
    description = "Needs the original 5.0.270 APK. Get it on APKMirror: https://www.apkmirror.com/uploads?appcategory=alight-motion-video-and-animation-editor — pick version 5.0.270.1002578.",
    appIconColor = 0x00FFA8,
    apkFileType = ApkFileType.APK,
    targets = listOf(
        AppTarget(version = "5.0.270.1002578", versionCode = 1002578, description = "Original APK from APKMirror (see app description for link)."),
        AppTarget(version = "5.0.270", versionCode = 1002578, description = "Original APK from APKMirror (see app description for link)."),
    ),
)
