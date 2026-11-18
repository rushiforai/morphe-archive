package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY_PUTMASK = Compatibility(
        name = "PutMask",
        packageName = "com.putmask.facefilter",
        targets = listOf(
            AppTarget(version = "9.1.0")
        )
    )
    val COMPATIBILITY_TWINE = Compatibility(
        name = "Twine RSS Reader",
        packageName = "dev.sasikanth.rss.reader",
        targets = listOf(
            AppTarget(version = "3.9.0")
        )
    )
}
