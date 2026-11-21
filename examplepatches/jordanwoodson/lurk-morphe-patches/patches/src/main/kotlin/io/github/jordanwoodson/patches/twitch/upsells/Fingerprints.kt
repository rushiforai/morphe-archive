package io.github.jordanwoodson.patches.twitch.upsells

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.resource.ResourceType

internal object SubscribeStateFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    filters = listOf(string("Subscribe(buttonStyle=")),
)
internal object GiftStateFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    filters = listOf(string("GiftASub(isEnabled="), string(", buttonStyle=")),
)
internal object TurboSignupFingerprint : Fingerprint(
    definingClass = "Ltv/twitch/android/feature/viewer/landing/ViewerLandingActivity;",
    returnType = "V", parameters = emptyList(),
    filters = listOf(string("afterSignup"), string("turboSignupUpsellExperiment")),
)
internal object TurboAppStartActionFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    filters = listOf(string("TurboAppStartUpsell")),
)

internal object AccountSubscriptionsSectionFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "subscriptions"),
        resourceLiteral(ResourceType.STRING, "drops_page_title"),
        resourceLiteral(ResourceType.STRING, "viewer_account_menu_turbo"),
        resourceLiteral(ResourceType.STRING, "viewer_account_menu_turbo_upsell"),
    ),
)

/** Visible(buttons, onNotificationSettingSelected): the Follow / notifications / Gift a Sub / Subscribe row under the stream title. */
internal object StreamInfoButtonsStateFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    filters = listOf(string("Visible(buttons="), string(", onNotificationSettingSelected=")),
)

/** Visible(ingressType): Twitch offers Turbo ("Try Ad-Free", "Go Ad-Free"). */
internal object TurboIngressVisibleFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    filters = listOf(string("Visible(ingressType=")),
)

/** UserProfile(model, channelId, canSubscribe, isSubscribed, canUpgradeSub, ...): another channel's page header. */
internal object ChannelPageStateFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    filters = listOf(string("UserProfile(model="), string(", canSubscribe=")),
)
