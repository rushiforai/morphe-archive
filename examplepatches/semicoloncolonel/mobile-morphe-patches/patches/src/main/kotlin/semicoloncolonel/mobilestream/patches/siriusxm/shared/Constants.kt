package semicoloncolonel.mobilestream.patches.siriusxm.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "SiriusXM",
        packageName = "com.sirius",
        description = "The SiriusXM app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0000EB,
        // Multiple public Play versions are supported so users who cannot
        // update still get patches. 2611.2.1 is pinned by version code to the
        // phone build, since the Android TV build shares its version name.
        targets = listOf(
            AppTarget("2611.2.1", 1726111300),
            AppTarget("2610.4.0"),
        ),
    )
}
