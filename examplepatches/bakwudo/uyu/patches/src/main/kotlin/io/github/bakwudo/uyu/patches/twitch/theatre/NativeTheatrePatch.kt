package io.github.bakwudo.uyu.patches.twitch.theatre

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Opens live channels in the native theatre instead of the React Native one. uyu's hooks for
 * channel points (and later chat and the player) are in the native theatre. The home feed
 * stays React Native; a tap on a stream is handed off to the native theatre, as Twitch does
 * when its Ultralight experiment is off.
 */
internal val nativeTheatrePatch = bytecodePatch {
    execute {
        RNTheatreRouteDecisionFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, $ROUTE_DECISION_CLASS->RefuseUltralightOff:$ROUTE_DECISION_CLASS
                return-object v0
            """,
        )
    }
}
