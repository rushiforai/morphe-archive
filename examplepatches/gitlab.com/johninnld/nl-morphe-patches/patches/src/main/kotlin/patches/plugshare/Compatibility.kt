package patches.plugshare

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val plugShare = Compatibility(
    name = "PlugShare (Automotive)", packageName = "com.xatori.Plugshare", apkFileType = ApkFileType.APK,
    signatures = setOf(
        "047adf45005752f339e34cc9ac056dc00d7813ee343584ffcf99439dd21c4707",
        "3257d599a49d2c961a471ca9843f59d341a405884583fc087df4237b733bbd6d",
    ),
    targets = listOf(AppTarget(version = "AAOS v1.8.2", versionCode = 100400, minSdk = 29)),
)
internal val originalInput = patches.shared.originalInput(plugShare)
