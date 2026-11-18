package io.github.jordanwoodson.patches.kick.ads

import app.morphe.patcher.Fingerprint
import io.github.jordanwoodson.patches.kick.player.PLAYER_VIEW

// Kick's own Kotlin player view keeps its name and its methods' names.

internal const val AD_EVENT = "Lcom/kick/mobile/playerv3/datazoom/MediaTailorAdEventPayload;"

/**
 * The lambda the player view gives its Datazoom monitor for MediaTailor ad events (adStart, adProgress, adEnd), which
 * hands each one to React Native.
 */
internal object MediaTailorAdEventFingerprint : Fingerprint(
    definingClass = PLAYER_VIEW, returnType = "Lkotlin/Unit;", parameters = listOf(PLAYER_VIEW, AD_EVENT),
)
