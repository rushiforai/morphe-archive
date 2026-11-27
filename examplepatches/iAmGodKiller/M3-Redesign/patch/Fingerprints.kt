package app.morphe.patches.music.layout.miniplayer.m3navigation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

internal object M3MiniPlayerConstructorFingerprint : Fingerprint(
    name = "<init>",
    filters = listOf(
        resourceLiteral(ResourceType.ID, "mini_player_play_pause_replay_button"),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            name = "findViewById",
            location = MatchAfterWithin(12)
        ),
        string("sharedToggleMenuItemMutations")
    )
)

internal object M3WatchWhileLayoutOnMeasureFingerprint : Fingerprint(
    definingClass = "WatchWhileLayout;",
    name = "onMeasure",
    returnType = "V",
    parameters = listOf("I", "I"),
    filters = listOf(
        string("visiblePivotBarHeight is 0"),
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            returnType = "V",
            parameters = listOf("Landroid/view/View;", "I", "I")
        )
    )
)

internal object M3FloatingMiniplayerFeatureFlagFingerprint : Fingerprint(
    filters = listOf(
        literal(45823962L)
    )
)
