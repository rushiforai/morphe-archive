// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami.analytics

import app.morphe.patcher.Fingerprint

/**
 * The analytics facade's bootstrap.
 *
 * Stock hands a runnable to the IO pool that creates the Firebase instance and
 * starts the Amplitude, Adjust, Branch and Facebook SDKs. Nothing else creates
 * them, so never running the bootstrap is what stops the SDKs rather than
 * silencing them after they have already phoned home.
 *
 * Returning early is safe for callers: the Firebase field is null-checked at its
 * only read, and the Branch latch is awaited only inside the bootstrap itself, so
 * no code waits for a start that will not happen.
 */
internal object AnalyticsInitFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/analytics/Analytics;",
    name = "init",
    isStatic = true,
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Z",
        "Lcom/anghami/ghost/analytics/Analytics\$FacebookAppEventLogger;",
    ),
)

/**
 * The experiment client's bootstrap, called from the analytics bootstrap.
 *
 * The client is the only thing the rest of the app reads from this class, and the
 * one caller outside it treats a missing client as "use the default value", so
 * never creating it removes attribution without changing any screen.
 */
internal object ExperimentInitFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/analytics/AmplitudeExperiment;",
    name = "init",
    isStatic = true,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

/**
 * Every void method of the analytics facade that reaches a third-party SDK.
 *
 * The dozen `post…Event` helpers that build an event object are not listed: they
 * all end in one of these sinks, so answering the sinks covers the whole event
 * vocabulary without touching an event definition.
 *
 * Being void matters. A caller cannot read a result the sink would have returned,
 * so silencing one cannot leave a screen waiting on a value. The two methods that
 * *are* read are deliberately absent: the experiment reader returns a value, and
 * `shouldSendEventAndRecordTimeStamp` decides whether the caller even builds an
 * event. Neither reaches the network by itself.
 */
internal object AnalyticsSinkFingerprints {
    private const val FACADE = "Lcom/anghami/ghost/analytics/Analytics;"

    val all: List<Fingerprint> = listOf(
        // Amplitude, one overload per shape of event.
        sink("postEvent", "Lcom/anghami/ghost/analytics/Events\$AnalyticsEvent;"),
        sink("postEvent", "Lcom/anghami/ghost/analytics/Events\$AnalyticsEvent;", "Ljava/lang/String;"),
        sink("postEvent", "Lcom/anghami/ghost/analytics/Events\$AnalyticsEvent;", "Ljava/util/Map;"),
        sink("postEvent", "Ljava/lang/String;"),

        // Firebase Analytics.
        sink("postGoogleAnalyticsEvent", "Ljava/lang/String;", "Landroid/os/Bundle;"),

        // Branch, including the purchase it reports separately.
        sink("postBranchEvent", "Ljava/lang/String;", "Ljava/util/Map;"),
        sink(
            "logBranchPurchaseEvent",
            "Lcom/android/billingclient/api/Purchase;",
            "Ljava/lang/Float;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
        ),

        // Adjust, attribution events with and without parameters.
        sink("postAdjustEvent", "Ljava/lang/String;"),
        sink("postAdjustEvent", "Ljava/lang/String;", "Ljava/util/Map;"),

        // Adjust, the deep link opened from outside the app. It is the only
        // Adjust call that is not folded into `postAdjustEvent`, which is why it
        // is listed separately rather than assumed to be covered.
        sink("postOpenLinkAdjustEvent", "Landroid/net/Uri;", "Landroid/content/Context;"),
    )

    private fun sink(name: String, vararg parameters: String) = Fingerprint(
        definingClass = FACADE,
        name = name,
        isStatic = true,
        returnType = "V",
        parameters = parameters.toList(),
    )
}
