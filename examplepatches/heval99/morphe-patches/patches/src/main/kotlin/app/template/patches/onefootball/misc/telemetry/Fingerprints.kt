package app.template.patches.onefootball.misc.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

private const val METHOD_CALL = "Lio/flutter/plugin/common/MethodCall;"
private const val RESULT = "Lio/flutter/plugin/common/MethodChannel\$Result;"
private const val HANDLERS = "Lcom/onefootball/core/flutter/methodhandlers/"

// The app's own preference store; kept by name (it is a Dagger-bound class). The tracking
// pipeline asks it before dispatching an event or starting RudderStack.
internal object IsTrackingOptedOutFingerprint : Fingerprint(
    definingClass = "Lcom/onefootball/repository/preferences/PreferencesImpl;",
    name = "isTrackingOptedOut",
    returnType = "Z",
    parameters = listOf(),
)

internal object ComscoreStartFingerprint : Fingerprint(
    definingClass = "Lcom/comscore/Analytics;",
    name = "start",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

// The Flutter tracking channels: each handler in the chain of responsibility checks the call's
// method name, answers the call itself, or passes it to getNext().
private fun handler(name: String) = HANDLERS + name + ";"

internal object LogEventHandleFingerprint : Fingerprint(
    definingClass = handler("LogEventMethodHandler"),
    name = "handle",
    returnType = "V",
    parameters = listOf(METHOD_CALL, RESULT),
)

internal object TrackXpaEventHandleFingerprint : Fingerprint(
    definingClass = handler("TrackXpaEventMethodHandler"),
    name = "handle",
    returnType = "V",
    parameters = listOf(METHOD_CALL, RESULT),
)

internal object TrackMatchesStreamFilterEventHandleFingerprint : Fingerprint(
    definingClass = handler("TrackMatchesStreamFilterEventMethodHandler"),
    name = "handle",
    returnType = "V",
    parameters = listOf(METHOD_CALL, RESULT),
)

// Facebook App Events. The core logEvent (name, value, parameters, isImplicit, uuid) is found by
// its shape plus the kill-switch string; R8 renamed the class, so no names are used. The App Events
// enqueue (logEvent(AccessTokenAppIdPair, AppEvent), static, only called by the core logEvent) is the
// void method with two reference parameters that holds "fb_mobile_activate_app"; it is a second
// layer behind the core logEvent.
internal object FacebookLogEventFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/Double;",
        "Landroid/os/Bundle;",
        "Z",
        "Ljava/util/UUID;",
    ),
    strings = listOf(string("app_events_killswitch")),
)

internal object FacebookAppEventsEnqueueFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf(string("fb_mobile_activate_app")),
    custom = { method, _ ->
        method.implementation != null && method.parameterTypes.size == 2 &&
            method.parameterTypes.all { it.startsWith("L") }
    },
)
