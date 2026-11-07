package id.ikuradachi.patches.crunchyroll.pip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object PipConfigFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        string("PipConfigImpl(_isEnabled="),
    ),
)

object PictureInPictureManagerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        string("SecurityException registering pipActionReceiver: "),
        string("IllegalArgumentException registering pipActionReceiver: "),
    ),
)

object PictureInPictureIsEnabledFingerprint : Fingerprint(
    classFingerprint = PictureInPictureManagerFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    name = "isEnabled",
    parameters = emptyList(),
    returnType = "Z",
    filters = listOf(
        methodCall(name = "getHasPremiumBenefit", returnType = "Z"),
        opcode(Opcode.MOVE_RESULT, InstructionLocation.MatchAfterImmediately()),
        opcode(Opcode.RETURN, InstructionLocation.MatchAfterImmediately()),
    ),
)
