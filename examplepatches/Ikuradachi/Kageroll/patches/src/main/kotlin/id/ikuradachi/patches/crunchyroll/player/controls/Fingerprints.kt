package id.ikuradachi.patches.crunchyroll.player.controls

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object ControlsVisibilityViewModelConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("L", "L", "L"),
    filters = listOf(
        string("playerConfiguration"),
        string("castStateProvider"),
    ),
)

object ControlsAutoHideTimerFingerprint : Fingerprint(
    classFingerprint = ControlsVisibilityViewModelConstructorFingerprint,
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(
        literal(20000L),
        literal(5000L),
        literal(4000L),
    ),
)
