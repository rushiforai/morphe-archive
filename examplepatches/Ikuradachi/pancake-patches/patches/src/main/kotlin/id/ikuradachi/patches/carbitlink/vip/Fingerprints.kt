package id.ikuradachi.patches.carbitlink.vip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object MapboxEntitlementFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = emptyList(),
    filters = listOf(
        string("mapbox_valid"),
        methodCall(smali = "Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z"),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ),
)

object GoogleMapsEntitlementFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = emptyList(),
    filters = listOf(
        string("google_map_valid"),
        methodCall(smali = "Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z"),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ),
)

object TwinSpaceEntitlementFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = emptyList(),
    filters = listOf(
        string("twin_space_valid"),
        methodCall(smali = "Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z"),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ),
)
