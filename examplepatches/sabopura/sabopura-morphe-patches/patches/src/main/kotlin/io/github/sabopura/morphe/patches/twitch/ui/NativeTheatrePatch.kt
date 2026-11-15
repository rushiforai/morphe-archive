package io.github.sabopura.morphe.patches.twitch.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.ClassDef
import io.github.sabopura.morphe.patches.twitch.Constants.TWITCH_SUPPORTED
import java.util.logging.Logger

private const val DECISION_KT = "Ltv/twitch/android/feature/discovery/feed/rn/theatre/RNTheatreRouteDecisionKt;"
private const val DECISION = "Ltv/twitch/android/feature/discovery/feed/rn/theatre/RNTheatreRouteDecision;"

/**
 * Opens live streams in Twitch's native player screen instead of the React Native one that
 * Twitch 31.x tests ("Ultralight"). The player button, danmaku, chat tools and the ad cover only
 * exist in the native screen. The home feed stays as it is; a tap on a stream is handed to the
 * native screen, as Twitch does when the experiment is off. (Technique from bakwudo/uyu.)
 *
 * Twitch 30.7.2 has no React Native player screen, so there is nothing to change there.
 */
internal val nativeTheatrePatch = bytecodePatch(
    description = "Opens live streams in the native player screen.",
) {
    compatibleWith(TWITCH_SUPPORTED)

    execute {
        val owner = mutableClassDefByOrNull(DECISION_KT)
        if (owner == null) {
            if (classDefByOrNull(DECISION) != null) throw PatchException("Native player: route decision moved")
            Logger.getLogger("SabopuraTwitch.Theatre").info("No React Native player screen in this version")
            return@execute
        }
        val refusal = ultralightRefusal(classDefBy(DECISION))
        val decide = owner.methods.singleOrNull { it.name == "rnTheatreRouteDecision" && it.returnType == DECISION }
            ?: throw PatchException("Native player: rnTheatreRouteDecision is gone")
        decide.addInstructions(0, """
            sget-object v0, $DECISION->$refusal:$DECISION
            return-object v0
        """)
    }
}

/**
 * The decision Twitch returns when the Ultralight screen is not used: `RefuseUltralightOff` up to
 * 31.8.0, `RefuseUltralightUnsupported` from 31.9.0. Twitch's callers only compare the decision with
 * `Route`, so this refusal sends the stream to the native screen.
 */
internal fun ultralightRefusal(decision: ClassDef): String =
    decision.fields.filter { it.type == DECISION && it.name.startsWith("RefuseUltralight") }
        .map { it.name }.singleOrNull()
        ?: throw PatchException("Native player: no single RefuseUltralight* decision")
