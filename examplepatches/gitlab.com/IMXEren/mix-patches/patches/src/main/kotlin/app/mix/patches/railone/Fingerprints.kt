package app.mix.patches.railone

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionFilter
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

const val MAIN_ACTIVITY_CLASS_TYPE = "aikyam/MainActivity;"

internal open class FlutterMethodChannelFingerprint(
    filters: List<InstructionFilter>? = null
) : Fingerprint(
    definingClass = MAIN_ACTIVITY_CLASS_TYPE,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf(
        MAIN_ACTIVITY_CLASS_TYPE,
        "L",
        "L",
    ),
    returnType = "V",
    strings = listOf(
        "isSignatureValid",
    ),
    filters = filters
)

internal object IsSignatureValidFingerprint : FlutterMethodChannelFingerprint(
    filters = listOf(
        string("isSignatureValid"),
        opcode(Opcode.IF_EQZ),
    )
)

internal object IsUsbDebuggingEnabledFingerprint : FlutterMethodChannelFingerprint(
    filters = listOf(
        string("isUsbDebuggingEnable"),
        opcode(Opcode.IF_EQZ),
    )
)

internal object IsWifiDebuggingEnabledFingerprint : FlutterMethodChannelFingerprint(
    filters = listOf(
        string("isWifiDebuggingEnable"),
        opcode(Opcode.IF_EQZ),
    )
)

internal object IsDeveloperOptionsEnabledFingerprint : FlutterMethodChannelFingerprint(
    filters = listOf(
        string("isDeveloperOptionsEnabled"),
        opcode(Opcode.IF_EQZ),
    )
)

internal object NativeCheckFingerprint1 : Fingerprint(
    definingClass = "NativeInteractor;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL, AccessFlags.DECLARED_SYNCHRONIZED),
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
    ),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        methodCall(
            definingClass = "this",
            parameters = listOf(
                "Landroid/content/Context;",
                "Ljava/lang/String;",
            ),
            returnType = "Ljava/lang/Object;",
            opcode = Opcode.INVOKE_DIRECT,
        )
    ),
)

internal object NativeCheckFingerprint2 : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(
        "Z",
    ),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "NativeInteractor;",
            name = "sessionVerifyV2",
            parameters = emptyList(),
            returnType = "Ljava/lang/String;",
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, InstructionLocation.MatchAfterImmediately()),
        string("failed", InstructionLocation.MatchAfterImmediately()),
    ),
)

internal object VulCheckFingerprint1 : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf(
        "L",
        "L",
    ),
    returnType = "V",
    custom = { method, classDef ->
        method.parameterTypes.size == 2 &&
                method.parameterTypes[1] == classDef.type
    },
    filters = listOf(
        string($$"$response"),
        string("this$0"),
        methodCall(
            name = "getVulnerabilityCode",
            parameters = emptyList(),
            returnType = "Ljava/lang/Integer;",
        ),
    ),
)

internal object VulCheckFingerprint2 : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf(
        "L",
        "L",
    ),
    returnType = "V",
    custom = { method, classDef ->
        method.parameterTypes.size == 2 &&
                method.parameterTypes[0] == classDef.type
    },
    filters = listOf(
        string("this$0"),
        string($$"$response", InstructionLocation.MatchAfterWithin(2)),
        methodCall(
            name = "getVulnerabilityCode",
            parameters = emptyList(),
            returnType = "Ljava/lang/Integer;",
            location = InstructionLocation.MatchAfterWithin(2),
        ),
    ),
)
