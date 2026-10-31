package app.syncpatches.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * The exact app target this patch bundle was developed and tested against.
     */
    const val APK_VERSION = "v23.06.30-13:39"
    const val APK_VERSION_CODE = 23033

    private fun sync(name: String, packageName: String) = Compatibility(
        name = name,
        packageName = packageName,
        apkFileType = ApkFileType.APK,
        targets = listOf(
            AppTarget(
                version = APK_VERSION,
            )
        ),
    )

    val SYNC_FREE = sync("Sync for Reddit", "com.laurencedawson.reddit_sync")
    val SYNC_PRO = sync("Sync Pro", "com.laurencedawson.reddit_sync.pro")
    val SYNC_DEV = sync("Sync Dev", "com.laurencedawson.reddit_sync.dev")

    /**
     * The extension class of the title font patch. Must match the class
     * packaged in `extensions/titlefont.mpe`.
     */
    const val TITLE_FONT_EXTENSION_CLASS = "Lapp/syncpatches/titlefont/TitleFontFix;"

    /**
     * The extension class of the predictive back patch. Must match the class
     * packaged in `extensions/predictiveback.mpe`.
     */
    const val PREDICTIVE_BACK_EXTENSION_CLASS = "Lapp/syncpatches/predictiveback/PredictiveBackFix;"
}
