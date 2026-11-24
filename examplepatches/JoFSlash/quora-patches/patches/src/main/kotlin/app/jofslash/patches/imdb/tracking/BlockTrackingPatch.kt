package app.jofslash.patches.imdb.tracking

import app.jofslash.patches.imdb.shared.Constants.COMPATIBILITY_IMDB
import app.jofslash.patches.imdb.shared.methodOf
import app.jofslash.patches.imdb.shared.returnBoolean
import app.jofslash.patches.imdb.shared.returnEarly
import app.jofslash.patches.imdb.shared.returnUnit
import app.morphe.patcher.patch.bytecodePatch

// comScore audience measurement: notifyStart() builds the PublisherConfiguration and calls
// Analytics.start(context).
private const val COMSCORE = "Lcom/imdb/mobile/metrics/Comscore;"

// Branch deep-link + install attribution: initSessionWhenSafe(CoroutineScope, Continuation) is the
// suspend entry that starts the Branch session.
private const val BRANCH_INJECTABLE = "Lcom/imdb/mobile/metrics/BranchInjectable;"

// AWS Pinpoint. The whole subsystem is gated by PinpointCoordinator.isActive()
// (= !featureRolloutsManager.isPinpointDisabled()): the coroutine launched in the constructor only
// calls awsMobileClient.get() (which builds AWSMobileClient -> new PinpointManager) and
// updatePinpointUserId when isActive() is true, and every public method (enableDefaultTopicSubscriptions,
// recordEvent, setAttribute, handleUserDataChange, ...) is behind the same guard. firstLaunch() and
// reportSubscriptionMetrics() are extra belt-and-braces (the latter is Amazon Pmet, not the Pinpoint SDK).
private const val PINPOINT_EVENT_COORDINATOR = "Lcom/imdb/mobile/notifications/PinpointEventCoordinator;"
private const val PINPOINT_COORDINATOR = "Lcom/imdb/mobile/notifications/PinpointCoordinator;"

// Amazon clickstream: the app adds every page view and event to ClickStreamBufferImpl, and
// ClickstreamTimer.start() starts the periodic Timer that sends the buffer.
private const val CLICKSTREAM_TIMER = "Lcom/imdb/mobile/imdbloggingsystem/tr/ClickstreamTimer;"
private const val CLICKSTREAM_BUFFER = "Lcom/imdb/mobile/metrics/ClickStreamBufferImpl;"

// Play install referrer -> clickstream: InstallReferrerRetriever.retrieve() connects to the install
// referrer service and sends the referrer.
private const val INSTALL_REFERRER_RETRIEVER = "Lcom/imdb/mobile/metrics/InstallReferrerRetriever;"

@Suppress("unused")
val blockTrackingPatch = bytecodePatch(
    name = "Block tracking",
    description = "Stops the third-party trackers: comScore audience measurement, Branch attribution, the AWS " +
            "Pinpoint analytics and endpoint SDK, the Amazon clickstream and the Play install-referrer lookup. " +
            "Push notifications still come through Braze. Browsing, search and your watchlist aren't touched.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_IMDB)

    execute {
        // comScore: nothing is registered or started.
        methodOf(COMSCORE, "notifyStart").returnEarly()

        // Branch: the suspend session-init returns Unit at once, so no Branch session starts.
        methodOf(BRANCH_INJECTABLE, "initSessionWhenSafe").returnUnit()

        // AWS Pinpoint: stop the SDK from ever initializing. isActive() -> false is the app's own
        // "Pinpoint disabled" switch, so the constructor coroutine skips awsMobileClient.get() and
        // updatePinpointUserId (no AWSMobileClient, no PinpointManager, no TargetingClient endpoint
        // loop), and every public Pinpoint method becomes a no-op. Push goes through Braze (over FCM),
        // which is separate and untouched.
        methodOf(PINPOINT_COORDINATOR, "isActive").returnBoolean(false)

        // getDeviceToken() and getEndpointId() aren't behind isActive(); returning null from the
        // (private) getPinpointManager() stops those paths from building the SDK too. Every internal
        // caller already null-checks it.
        methodOf(PINPOINT_COORDINATOR, "getPinpointManager").returnEarly()

        // Belt-and-braces: the first-launch analytics event and the subscription-metrics report
        // (the latter via Amazon Pmet, independent of the Pinpoint SDK) are not sent either.
        methodOf(PINPOINT_EVENT_COORDINATOR, "firstLaunch").returnEarly()
        methodOf(PINPOINT_COORDINATOR, "reportSubscriptionMetrics").returnEarly()

        // Amazon clickstream: nothing is added to the buffer (it would grow for as long as the app
        // runs, as nothing sends it), and the periodic send never starts.
        methodOf(CLICKSTREAM_BUFFER, "add").returnEarly()
        methodOf(CLICKSTREAM_TIMER, "start").returnEarly()

        // Install referrer: the Play referrer is never read or sent to the clickstream.
        methodOf(INSTALL_REFERRER_RETRIEVER, "retrieve").returnEarly()
    }
}
