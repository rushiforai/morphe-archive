package semicoloncolonel.mobilestream.patches.yttvshell.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

// YouTube TV's own Android TV app (com.google.android.youtube.tvunplugged) runs on an older,
// un-patchable classic Cobalt engine. Regular YouTube for Android TV
// (com.google.android.youtube.tv) runs on the newer Chromium-based Cobalt, which exposes
// WebContents.evaluateJavaScript, so it can be scripted. This patch set points that app's Cobalt
// start URL at the YouTube TV living-room web app (youtube.com/tv/upg) and injects an ad and
// tracking blocker, giving an ad-free YouTube TV on Android TV. It replaces the regular
// YouTube-for-TV app, which uses the same package name.
object Constants {
    val COMPATIBILITY = Compatibility(
        name = "YouTube TV (Android TV)",
        packageName = "com.google.android.youtube.tv",
        description = "IMPORTANT: this patches the YouTube FOR Android TV app " +
            "(com.google.android.youtube.tv), but it does NOT give you regular YouTube. It " +
            "converts that app into a separate, ad-free YouTube TV app called \"YT TV+\" that " +
            "loads the YouTube TV live and DVR service and removes the ads YouTube injects into " +
            "it. YT TV+ installs alongside the original app, so regular YouTube for Android TV is " +
            "left untouched. (YouTube TV's own app, com.google.android.youtube.tvunplugged, runs " +
            "on a different engine and cannot be patched; this is the way to an ad-free YouTube " +
            "TV on Android TV.)",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF0000,
        targets = listOf(AppTarget(version = "7.32.300", description = "Android TV build")),
        formFactor = FormFactor.TV,
    )
}
