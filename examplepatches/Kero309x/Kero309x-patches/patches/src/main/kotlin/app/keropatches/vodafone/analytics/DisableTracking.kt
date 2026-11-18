// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.vodafone.analytics

import app.keropatches.core.PatchCategory
import app.keropatches.vodafone.VodafoneApp
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * The one method every tracked event passes through.
 *
 * The application keeps a dispatcher whose only job is to route an event to the
 * tool that carries it: the analytics tool, the social-media tool, the survey
 * tool or the technical tool, which does nothing. The class is renamed by the
 * shrinker, so it is identified by the class and the signature together.
 */
private object EventDispatcherFingerprint : Fingerprint(
    definingClass = "Lo/LivenessInstructionsUi;",
    name = "AnimatedBarChartPreview",
    isStatic = false,
    returnType = "V",
    parameters = listOf(
        "Lvodafone/vis/engezly/tracking/common/model/ToolType;",
        "Ljava/lang/String;",
        "Ljava/util/Map;",
    ),
)

/**
 * The handler the dashboard, the offers screen and the gift screens call
 * directly, without going through the dispatcher.
 *
 * It sends the same kind of event to the social-media SDKs, so silencing only
 * the dispatcher would leave those screens reporting.
 */
private object SocialEventHandlerFingerprint : Fingerprint(
    definingClass = "Lo/clearOnScrollListeners;",
    name = "AnimatedBarChartKtAnimatedBarChart1111",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Lo/clearOnChildAttachStateChangeListeners;"),
)

/**
 * The second entry point of the same handler, used for events that carry an
 * amount next to their key.
 */
private object SocialAmountEventHandlerFingerprint : Fingerprint(
    definingClass = "Lo/clearOnScrollListeners;",
    name = "AnimatedBarChartKtAnimatedBarChart1111",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "D"),
)

/**
 * The Google Analytics call the login flow makes on its own.
 *
 * The experiment events are reported straight through the analytics API, so
 * they do not pass the application's own dispatcher. The API method is the one
 * place both of them go through, and it carries nothing but the event.
 */
private object GoogleAnalyticsEventFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "logEvent",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;"),
)

/**
 * Stops the application reporting what the user does.
 *
 * The client reports its usage through one dispatcher that routes an event to
 * the tool that carries it. The patch changes it in three layers:
 *
 * 1. The dispatcher is silenced, so no analytics event, no social-media event
 *    and no survey event leaves the application. The survey prompt is submitted
 *    through the same dispatcher, so it stops appearing as well.
 * 2. The social-media handler is silenced, because the dashboard, the offers
 *    screen, the gift screens and the scratch card call it directly instead of
 *    going through the dispatcher.
 * 3. The Google Analytics call is silenced, because the login flow reports its
 *    experiment events straight through that API.
 *
 * Every method the patch touches is void, so no caller can be left waiting for
 * a value that is never produced. The events are built before they are
 * reported, so a little work is still done for an event that is never sent;
 * nothing else about the screens changes.
 *
 * The third-party SDKs are still created and started by the application, so the
 * traffic they produce on their own, such as install attribution and session
 * reporting, is not covered by this patch.
 */
@Suppress("unused")
val disableTrackingPatch = bytecodePatch(
    name = "Disable usage tracking",
    description = "Stops the app reporting its usage, social-media, survey and experiment events.",
    default = true,
) {
    compatibleWith(VodafoneApp.compatibility)
    category(PatchCategory.PRIVACY.label)

    execute {
        EventDispatcherFingerprint.method.returnEarly()
        SocialEventHandlerFingerprint.method.returnEarly()
        SocialAmountEventHandlerFingerprint.method.returnEarly()
        GoogleAnalyticsEventFingerprint.method.returnEarly()
    }
}
