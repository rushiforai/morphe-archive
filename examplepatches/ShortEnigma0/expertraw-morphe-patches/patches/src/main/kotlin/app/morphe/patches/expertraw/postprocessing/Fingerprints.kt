/*
 * Expert RAW patches for Morphe.
 * Licensed under the GNU General Public License version 3 (GPLv3), with the Additional
 * Terms under Section 7 described in the LICENSE file of this repository.
 */
package app.morphe.patches.expertraw.postprocessing

import app.morphe.patcher.Fingerprint
import app.morphe.patches.expertraw.shared.Constants.APP

/** 12MP / 24MP makers: Samsung's own "one frame only" decision (normally: manual exposure > 250 ms). */
internal object IsSingleFrameConditionFingerprint : Fingerprint(
    definingClass = "$APP/core2/maker/ExpertRawPhotoMaker;",
    name = "isSingleFrameCondition",
    returnType = "Z",
    parameters = listOf(),
)

/** 50MP (ArcSoft high-res) maker: frame list builder, p1 = single-frame flag. */
internal object ArcUpdateEvListFingerprint : Fingerprint(
    definingClass = "$APP/core2/maker/ArcHighResExpertRawPhotoMaker;",
    name = "updateEvList",
    returnType = "I",
    parameters = listOf("Z"),
)

/** Post-processing worker: parks "pending" requests until the camera goes to background. */
internal object WaitRequestFingerprint : Fingerprint(
    definingClass = "$APP/core2/processor/PostProcessThread;",
    name = "waitRequest",
    returnType = "Z",
    parameters = listOf(),
)

/** Sends START_FOREGROUND / SET_PROGRESS / CANCEL_* to the "Refining image" notification service. */
internal object NotificationSendMessageFingerprint : Fingerprint(
    definingClass = "$APP/core2/processor/PostProcessNotificationManager;",
    name = "sendMessage",
    returnType = "V",
    parameters = listOf("$APP/core2/processor/PostProcessNotificationManager\$PostProcessServiceMsg;", "I", "I"),
)

/** MediaScanner completion callback for a saved photo. */
internal object ScanFileCompletedFingerprint : Fingerprint(
    definingClass = "$APP/core2/processor/PostProcessDBHelper;",
    returnType = "V",
    parameters = listOf(
        "Ljava/util/concurrent/atomic/AtomicReference;",
        "Ljava/util/concurrent/CountDownLatch;",
        "Ljava/lang/String;",
        "Landroid/net/Uri;",
    ),
)

internal object CameraActivityOnResumeFingerprint : Fingerprint(
    definingClass = "$APP/GalaxyRaw;",
    name = "onResume",
    returnType = "V",
    parameters = listOf(),
)

/** Uri handed to Gallery when the camera thumbnail is tapped. */
internal object LatestMediaGetUriFingerprint : Fingerprint(
    definingClass = "$APP/LatestMediaContent;",
    name = "getUri",
    returnType = "Landroid/net/Uri;",
    parameters = listOf(),
)
