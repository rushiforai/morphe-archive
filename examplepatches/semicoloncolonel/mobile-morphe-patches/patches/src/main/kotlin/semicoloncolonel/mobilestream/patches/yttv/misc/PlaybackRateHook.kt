package semicoloncolonel.mobilestream.patches.yttv.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

// ─────────────────────────────────────────────────────────────────────────────
// Playback rate hook, shared by "Set playback speed" and "Press and hold to
// speed up".
//
// YouTube TV sets the playback speed through one Java method on its player
// facade (10.46.0: anti.r(float, PlayerConfigModel)). It is the same "speed
// limiter" method the YouTube patches use: it moves itself onto the player
// thread (posting a "setPlaybackRate" runnable), clamps the rate to 0.25x-4x or
// the range in the player config, and applies it through the player's own
// pipeline. The app calls it each time a new video loads.
//
// Calling the native PlaybackController.setPlaybackRate directly is accepted but
// ignored by the player, so that route is not used.
//
// At the start of the method:
//   YttvPlaybackSpeed.onSetRate(this, config)   remembers the player and config
//   rate = YttvPlaybackSpeed.filterRate(rate)   applies the chosen default speed
// and YttvPlaybackSpeed.callSetRate() is filled in to call the method directly,
// so the hold gesture changes speed the same way the app does.
// ─────────────────────────────────────────────────────────────────────────────

private const val PLAYER_CONFIG = "Lcom/google/android/libraries/youtube/innertube/model/media/PlayerConfigModel;"
internal const val PLAYBACK_SPEED = "Lsemicoloncolonel/mobilestream/extension/yttv/YttvPlaybackSpeed;"

private const val QUARTER = 0x3e800000L // 0.25f
private const val FOUR = 0x40800000L // 4.0f

internal object SetPlaybackRateFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("F", PLAYER_CONFIG),
    strings = listOf("setPlaybackRate"),
    custom = { method, _ ->
        val literals = method.implementation?.instructions
            ?.filter { it.opcode == Opcode.CONST_HIGH16 || it.opcode == Opcode.CONST }
            ?.mapNotNull { (it as? com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction)?.narrowLiteral?.toLong()?.and(0xffffffffL) }
            .orEmpty()
        QUARTER in literals && FOUR in literals
    },
)

internal object CallSetRateFingerprint : Fingerprint(
    definingClass = PLAYBACK_SPEED,
    name = "callSetRate",
    parameters = listOf("Ljava/lang/Object;", "F", "Ljava/lang/Object;"),
    returnType = "V",
)

internal object HoldRateFingerprint : Fingerprint(
    definingClass = PLAYBACK_SPEED,
    name = "holdRate",
    parameters = listOf(),
    returnType = "F",
)

internal object DefaultRateFingerprint : Fingerprint(
    definingClass = PLAYBACK_SPEED,
    name = "defaultRate",
    parameters = listOf(),
    returnType = "F",
)

/** Overwrites a float getter in YttvPlaybackSpeed to return the chosen speed. */
internal fun BytecodePatchContext.setSpeedValue(getter: Fingerprint, speed: Float) {
    val bits = java.lang.Float.floatToRawIntBits(speed).toLong() and 0xffffffffL
    getter.method.addInstructions(
        0,
        """
            const v0, 0x${bits.toString(16)}
            return v0
        """.trimIndent(),
    )
}

internal val playbackRateHookPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        val setRate = SetPlaybackRateFingerprint.method
        val playerType = setRate.definingClass
        val setRateRef = "$playerType->${setRate.name}(F$PLAYER_CONFIG)V"

        // p0 = player, p1 = rate, p2 = player config.
        setRate.addInstructions(
            0,
            """
                invoke-static { p0, p2 }, $PLAYBACK_SPEED->onSetRate(Ljava/lang/Object;Ljava/lang/Object;)V
                invoke-static { p1 }, $PLAYBACK_SPEED->filterRate(F)F
                move-result p1
            """.trimIndent(),
        )

        // callSetRate(Object player, float rate, Object config) -> player.setRate(rate, config)
        CallSetRateFingerprint.method.addInstructions(
            0,
            """
                check-cast p0, $playerType
                check-cast p2, $PLAYER_CONFIG
                invoke-virtual { p0, p1, p2 }, $setRateRef
                return-void
            """.trimIndent(),
        )
    }
}
