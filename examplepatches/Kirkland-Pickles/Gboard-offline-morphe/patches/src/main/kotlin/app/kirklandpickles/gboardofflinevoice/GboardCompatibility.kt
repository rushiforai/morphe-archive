package app.kirklandpickles.gboardofflinevoice

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility

private const val GBOARD_PACKAGE = "com.google.android.inputmethod.latin"

internal val GBOARD = Compatibility(
    name = "Gboard",
    packageName = GBOARD_PACKAGE,
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x1A73E8,
)

