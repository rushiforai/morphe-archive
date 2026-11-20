package app.southstar21.patches.youtubemusic.layout.liquidglass

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * WatchWhileLayout (the main layout: content, mini player and full player) measures the content
 * to the screen less the tab bar's height. The class and the override keep their names.
 */
internal object WatchWhileLayoutOnMeasureFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/apps/youtube/music/watchpage/ui/WatchWhileLayout;",
    name = "onMeasure",
    accessFlags = listOf(AccessFlags.PROTECTED, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("I", "I"),
    strings = listOf("visiblePivotBarHeight is 0"),
)
