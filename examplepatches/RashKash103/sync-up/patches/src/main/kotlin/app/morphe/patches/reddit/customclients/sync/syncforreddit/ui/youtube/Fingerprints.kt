package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.youtube

import app.morphe.patcher.Fingerprint

private const val PROVIDER = "Lcom/google/android/youtube/player/YouTubePlayer\$Provider;"

private const val RESULT = "Lcom/google/android/youtube/player/YouTubeInitializationResult;"

private const val ON_INITIALIZED_LISTENER =
    "Lcom/google/android/youtube/player/YouTubePlayer\$OnInitializedListener;"

/**
 * Where the sheet's embedded player gives up.
 *
 * <p>Both of the app's listeners answer the same two parameters, so the pair is not enough on its
 * own to tell them apart; this is the one that is not the activity, and it is told by the frame
 * it was handed to draw the video in. Its own name is the minifier's and so is its class's, which
 * is why neither is written down. There is one method taking these two parameters on the class —
 * the other takes three.
 */
internal val embeddedPlayerFailedFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(PROVIDER, RESULT),
    custom = { _, classDef ->
        classDef.interfaces.contains(ON_INITIALIZED_LISTENER) &&
                classDef.fields.any { it.type == "Landroid/widget/FrameLayout;" }
    },
)

/**
 * Where the full screen player gives up.
 *
 * <p>Matched on the message it formats when the reason is one it has nothing particular to say
 * about, which is a whole string of the method and the only one of its four that neither names a
 * reason nor spans two lines.
 */
internal val fullScreenPlayerFailedFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(PROVIDER, RESULT),
    strings = listOf("There was an error initializing the YouTubePlayer (%1\$s)"),
)
