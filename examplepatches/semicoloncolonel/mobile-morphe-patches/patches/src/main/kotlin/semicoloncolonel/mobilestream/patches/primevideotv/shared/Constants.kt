package semicoloncolonel.mobilestream.patches.primevideotv.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor
import semicoloncolonel.mobilestream.patches.shared.misc.forTvSource

// Prime Video's Android TV app runs its player inside the native Ignite engine
// (libignite.so), downloading its ad decisions at runtime, so the ads are not
// reachable from the dex. The ad strip is a native hook on libignite instead;
// see nativehook/ and ads/SkipAdsPatch.kt.
object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Prime Video (Android TV)",
        packageName = "com.amazon.amazonvideo.livingroom",
        description = "The Prime Video app for Android TV.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1399FF,
        targets = listOf(
            AppTarget("6.24.13+v16.0.1.93-allAbis", description = "Android TV build"),
        ),
        formFactor = FormFactor.TV,
    ).forTvSource()
}
