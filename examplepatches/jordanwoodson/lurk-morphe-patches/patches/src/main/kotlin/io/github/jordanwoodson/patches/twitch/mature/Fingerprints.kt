package io.github.jordanwoodson.patches.twitch.mature

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.string

/**
 * Whether the viewer already acknowledged a content label: Twitch's debug override
 * "override_mature_checks" first, then the "<user>_<label>" entry that Start Watching saves. Every
 * native label gate asks it (live and VOD gating, the content-gate overlay and the clip player).
 */
internal object MatureLabelAcknowledgedFingerprint : Fingerprint(
    returnType = "Z", parameters = listOf("Ljava/lang/String;"),
    strings = listOf("override_mature_checks"),
)

/**
 * The player's content label ("Intended for certain audiences", or its error text), drawn by a view delegate's render
 * from the label's state.
 */
internal object ContentLabelRenderFingerprint : Fingerprint(
    returnType = "V", parameters = listOf("Ltv/twitch/android/core/mvp/viewdelegate/ViewDelegateState;"),
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "ccl_disclosure_label"),
        resourceLiteral(ResourceType.STRING, "ccl_disclosure_label_error"),
    ),
)

/** MatureContent(matureContentTagNames, channelName, shouldAnimate, trackingModel): the content label's Showing state. */
internal object ContentLabelShowingFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    filters = listOf(string("MatureContent(matureContentTagNames=")),
)
