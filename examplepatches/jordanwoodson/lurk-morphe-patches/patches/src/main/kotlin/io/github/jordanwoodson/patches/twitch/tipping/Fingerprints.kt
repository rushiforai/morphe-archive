package io.github.jordanwoodson.patches.twitch.tipping

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

internal object OneChatStateFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    filters = listOf(string("State(isVisible="), string(", isBitsButtonVisible="), string(", isOneTapEnabled=")),
)

// The classic chat input's configuration: its Bits picker button (party popper next to Emotes) and
// the Bits selector tray both follow isBitsPickerVisible, separately from the chat toolbar state.
internal object MessageInputConfigFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    strings = listOf("ConfigureMessageInput(isMessageInputEnabled=", ", isBitsPickerVisible="),
)

// The buttons at the right of the chat header, beside the extensions (Follow, Subscribe, Gift A Sub, Get
// Bits, Upgrade sub). Twitch picks them from this state: Get Bits, or a Bits icon, only while
// isBitsButtonEnabled is set; Subscribe and Gift A Sub from subscriptionState; Upgrade from
// canShowUpgradeButton. Hide subscription upsells filters the last two through the same fingerprint.
internal object ChatHeaderButtonsStateFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    strings = listOf("ButtonsEligibilityState(followState=", ", isBitsButtonEnabled="),
)

internal object ChatToolbarStateFingerprint : Fingerprint(
    name = "toString", returnType = "Ljava/lang/String;", parameters = emptyList(),
    filters = listOf(string("State(channelInfo="), string(", isBitsButtonVisible="), string(", isBitsSpendingTrayVisibleBasedOnInput=")),
)
