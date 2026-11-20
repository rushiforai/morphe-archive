package id.ikuradachi.patches.crunchyroll.player.seek

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object TapToSeekViewModelGetterFingerprint : Fingerprint(
    definingClass = "Lcom/crunchyroll/player/presentation/playerview/PlayerGesturesLayout;",
    name = "getTapToSeekViewModel",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    parameters = emptyList(),
)

fun createTapToSeekDeltaFingerprint(tapToSeekViewModelType: String) = Fingerprint(
    definingClass = tapToSeekViewModelType,
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(
        literal(10),
        opcode(Opcode.INT_TO_LONG, InstructionLocation.MatchAfterImmediately()),
        opcode(Opcode.ADD_LONG_2ADDR, InstructionLocation.MatchAfterImmediately()),
    ),
)

object ExoplayerInitSeekIncrementFingerprint : Fingerprint(
    name = "init",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(
        string("loadErrorHandlingPolicy"),
        newInstance("Landroidx/media3/exoplayer/ExoPlayer\$b;"),
        literal(10000L),
        fieldAccess(
            opcode = Opcode.IPUT_WIDE,
            definingClass = "Landroidx/media3/exoplayer/ExoPlayer\$b;",
            type = "J",
            location = InstructionLocation.MatchAfterImmediately(),
        ),
        fieldAccess(
            opcode = Opcode.IPUT_WIDE,
            definingClass = "Landroidx/media3/exoplayer/ExoPlayer\$b;",
            type = "J",
        ),
    ),
)
