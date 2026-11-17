package semicoloncolonel.mobilestream.patches.hulutv.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.forTvSource
import app.morphe.patcher.patch.FormFactor

// Hulu's Android TV app (com.hulu.livingroomplus) is a native WebKit (WKF)
// engine app: the dex is JNI shims only, and the player, manifest and ad logic
// live in libwkf_support.so (libcurl + OpenSSL). It cannot be dex-patched like
// the phone app (com.hulu.plus). Instead this bundles a native library and
// loads it at WKFapplication.onCreate; the library hooks SSL_read inside
// libwkf_support.so (an exported symbol) and strips the stitched ad Periods
// from the DASH manifest in-process, with no root.
//
// The native interception approach, and the bundle/load patch scaffolding,
// follow ajstrick81's native-adstrip-toolkit (GPL-3.0). The manifest
// period-stripping follows HuluMpdFilter (the phone patch), itself after
// ajstrick81's PlutoDashManifestProbe. A separate package from the Hulu phone
// patch, so the two never collide.
object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Hulu (Android TV)",
        packageName = "com.hulu.livingroomplus",
        description = "The Android TV app, not the phone app. Removes the ads " +
            "Hulu stitches into its on-demand manifests, through an in-process " +
            "native hook, with no root. Live broadcast commercials are part of " +
            "the broadcast and still play. Patch the full APKM bundle, and " +
            "install the patched file as a single app. If it is saved with a " +
            "bundle extension such as .apkm or .apks, rename it to end in .apk " +
            "first.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1CE783,
        targets = listOf(
            AppTarget(version = "C59F39CFP3.10.33", versionCode = 3010033, isExperimental = true, description = "Android TV build"),
        ),
        formFactor = FormFactor.TV,
    ).forTvSource(
        tvDescription = "Removes the ads Hulu stitches into its on-demand manifests, through an " +
            "in-process native hook, with no root. Live broadcast commercials are part of the " +
            "broadcast and still play. Patch the full APKM bundle, and install the patched file " +
            "as a single app. If it is saved with a bundle extension such as .apkm or .apks, " +
            "rename it to end in .apk first.",
    )
}
