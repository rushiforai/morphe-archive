/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.patches.tracking

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

/**
 * ProfileTrackingFeatureImpl.sendCustomProfileViewEvent(viewee, networkDistance, privacySettings, bundle): sends
 * the ProfileViewEvent, with the viewer's privacy mode, when a profile or a search hero card is opened.
 */
private object SendProfileViewEventFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/profile/components/tracking/ProfileTrackingFeatureImpl;",
    name = "sendCustomProfileViewEvent",
    returnType = "V",
)

/**
 * Tracker.send(event, pageInstance, trackingControl): every analytics event of the app, also the ProfileViewEvent
 * of LinkedIn's server drawn profile screen.
 */
private object TrackerSendFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/litrackinglib/metric/Tracker;",
    name = "send",
    returnType = "V",
    parameters = listOf(
        "Lcom/linkedin/android/tracking/v2/event/CustomTrackingEventBuilder;",
        "Lcom/linkedin/android/tracking/v2/event/PageInstance;",
        "Ljava/lang/String;",
    ),
)

/**
 * SduiRepository.makeStreamingNetworkCall(namespace, name, request, route, ...): the requests of the server driven
 * screens and actions, logged to find what records a profile visit.
 */
private object SduiRequestFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/infra/sdui/repo/SduiRepository;",
    name = "makeStreamingNetworkCall",
)

/** Tracker.sendViaLiTracker(eventName, event, ...): one of the two senders every analytics event leaves through. */
private object SendViaLiTrackerFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/litrackinglib/metric/Tracker;",
    name = "sendViaLiTracker",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/Map;", "Z"),
)

/** MetricQueue.sendViaTfe(eventName, bytes, event): the other sender. */
private object SendViaTfeFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/litrackinglib/network/MetricQueue;",
    name = "sendViaTfe",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "[B", "Ljava/util/Map;"),
)

@Suppress("unused")
val anonymousProfileViewingPatch = bytecodePatch(
    name = "Anonymous profile viewing",
    description = "Adds an option (off by default, experimental) to visit profiles without being listed in " +
        "\"Who viewed your profile\": the analytics events of profile pages are not sent.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch)

    execute {
        markIncluded("isAnonymousProfileViewingIncluded")

        SendProfileViewEventFingerprint.method.apply {
            // At method entry every local register is free, so v0 can be used as scratch.
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_PACKAGE/LokiPatches;->skipProfileViewEvent()Z
                    move-result v0
                    if-eqz v0, :send
                    return-void
                """,
                ExternalLabel("send", getInstruction(0))
            )
        }

        // p1..p4 are the namespace, the name, the request and the route: all objects, so no scratch register is needed.
        SduiRequestFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p1 .. p4 }, $EXTENSION_PACKAGE/LokiPatches;->onSduiRequest(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V"
        )

        // Both senders have locals, so v0 is free at their entry.
        SendViaLiTrackerFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p1 .. p2 }, $EXTENSION_PACKAGE/LokiPatches;->dropLiTrackerEvent(Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :send
                    return-void
                """,
                ExternalLabel("send", getInstruction(0))
            )
        }
        SendViaTfeFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p1 .. p3 }, $EXTENSION_PACKAGE/LokiPatches;->dropTfeEvent(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :send
                    return-void
                """,
                ExternalLabel("send", getInstruction(0))
            )
        }

        TrackerSendFingerprint.method.apply {
            // The method has locals, so v0 is free at its entry. p1 is the event.
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p1 .. p1 }, $EXTENSION_PACKAGE/LokiPatches;->dropTrackingEvent(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :send
                    return-void
                """,
                ExternalLabel("send", getInstruction(0))
            )
        }
    }
}
