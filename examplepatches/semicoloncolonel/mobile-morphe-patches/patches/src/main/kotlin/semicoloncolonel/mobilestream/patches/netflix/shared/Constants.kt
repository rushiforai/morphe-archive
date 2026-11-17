package semicoloncolonel.mobilestream.patches.netflix.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    // Netflix ships its own native tamper guard, so every Netflix patch is
    // experimental: it only applies to a build that has been re-signed, and
    // the guard's self-kill is blocked in-process by the bundled native hook.
    // The targets are the builds the patches were checked against. The
    // Application class is read from the manifest, so it needs no update per
    // version.
    val COMPATIBILITY = Compatibility(
        name = "Netflix",
        packageName = "com.netflix.mediaclient",
        description = "The Netflix app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE50914,
        // Netflix embeds the build number and version code in its version
        // name, so the full string must match exactly: "9.93.0 build 7 74878".
        // Build 7 of 9.93.0 is a beta, which the bypass was first developed
        // against, so it stays experimental in every release. 9.92.0 build 9
        // and 9.93.0 build 8 are public.
        targets = listOf(
            AppTarget("9.92.0 build 9 74772", versionCode = 74772),
            AppTarget("9.93.0 build 7 74878", versionCode = 74878, isExperimental = true),
            AppTarget("9.93.0 build 8 74808", versionCode = 74808),
        ),
    )
}
