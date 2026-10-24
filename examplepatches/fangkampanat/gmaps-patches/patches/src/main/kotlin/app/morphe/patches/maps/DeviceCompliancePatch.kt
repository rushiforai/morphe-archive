package app.morphe.patches.maps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import java.util.logging.Logger

private const val UNCERTIFIED_DEVICE_ACTIVITY =
    "Lcom/google/android/gms/gmscompliance/ui/UncertifiedDeviceActivity;"
private val verdictNames = listOf("ENFORCE", "DO_NOT_ENFORCE", "NOT_SET", "UNKNOWN")

private fun List<Instruction>.branchTarget(index: Int): Int {
    val offset = take(index).sumOf { it.codeUnits } + (this[index] as OffsetInstruction).codeOffset
    var position = 0
    forEachIndexed { i, instruction -> if (position == offset) return i; position += instruction.codeUnits }
    throw PatchException("Invalid compliance branch target: index=$index; code offset=$offset")
}

/**
 * Maps asks GmsCore for a device-compliance verdict. An ENFORCE verdict for a device that
 * Google does not certify opens UncertifiedDeviceActivity and finishes Maps (issue #11).
 * Treat every verdict as not enforced, as upstream YouTube does for a failed check
 * (MorpheApp/morphe-patches#2977). Metrics and the compliance request are unchanged.
 */
internal fun BytecodePatchContext.patchDeviceComplianceCheck() {
    if (classDefByOrNull(UNCERTIFIED_DEVICE_ACTIVITY) == null) {
        Logger.getLogger("app.morphe.patches.maps.DeviceCompliancePatch")
            .info("Device compliance: $UNCERTIFIED_DEVICE_ACTIVITY absent; nothing to suppress")
        return
    }
    val listener = uniqueMapsHook(Fingerprint(
        returnType = "V",
        parameters = listOf("Ljava/lang/Object;"),
        // Fingerprint strings match by contains, first entry first: DO_NOT_ENFORCE before ENFORCE.
        strings = listOf("DO_NOT_ENFORCE", "ENFORCE", "NOT_SET", "UNKNOWN", "https://www.google.com/maps", "com.android.chrome"),
        custom = { method, _ -> !AccessFlags.STATIC.isSet(method.accessFlags) },
    ), "GMS compliance verdict listener")!!
    val code = listener.implementation!!.instructions.toList()
    fun fail(reason: String): Nothing = throw PatchException(
        "Unrecognized GMS compliance layout: $reason; listener=$listener",
    )

    // The verdict class is the one whose toString names all four verdicts.
    val predicateAt = code.indices.filter { index ->
        code[index].opcode == Opcode.INVOKE_VIRTUAL && code[index].getReference<MethodReference>()?.let { call ->
            call.returnType == "Z" && call.parameterTypes.isEmpty() &&
                classDefByOrNull(call.definingClass)?.methods?.singleOrNull {
                    it.name == "toString" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
                }?.implementation?.instructions?.mapNotNull { instruction ->
                    instruction.getReference<StringReference>()?.string
                }?.containsAll(verdictNames) == true
        } == true
    }.singleOrNull() ?: fail("missing unique verdict predicate call")
    val predicate = code[predicateAt].getReference<MethodReference>()!!
    val verdict = classDefBy(predicate.definingClass)
    val stateField = verdict.fields.filter {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == "I"
    }.singleOrNull() ?: fail("verdict needs exactly one instance int field")

    // Predicate: return state == 1.
    val predicateMethod = verdict.methods.single {
        it.name == predicate.name && it.returnType == "Z" && it.parameterTypes.isEmpty()
    }
    val body = predicateMethod.implementation?.instructions?.toList() ?: fail("abstract verdict predicate")
    if (!AccessFlags.PUBLIC.isSet(predicateMethod.accessFlags) || AccessFlags.STATIC.isSet(predicateMethod.accessFlags) ||
        body.map { it.opcode } != listOf(
            Opcode.IGET, Opcode.CONST_4, Opcode.IF_NE, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN,
        ) ||
        body[0].getReference<FieldReference>()?.let { it.definingClass == verdict.type && it.name == stateField.name } != true ||
        (body[1] as NarrowLiteralInstruction).narrowLiteral != 1 ||
        (body[4] as NarrowLiteralInstruction).narrowLiteral != 0 ||
        (body[2] as TwoRegisterInstruction).let {
            it.registerA != (body[0] as TwoRegisterInstruction).registerA ||
                it.registerB != (body[1] as OneRegisterInstruction).registerA
        } || body.branchTarget(2) != 4 ||
        (body[3] as OneRegisterInstruction).registerA != (body[1] as OneRegisterInstruction).registerA
    ) fail("verdict predicate is not state == 1: ${body.map { it.opcode }}")

    // The predicate result alone gates the launch: false returns before any activity work.
    val receiver = (code[predicateAt] as? FiveRegisterInstruction)?.registerC ?: fail("verdict predicate call shape")
    val result = code.getOrNull(predicateAt + 1)
    val gate = code.getOrNull(predicateAt + 2)
    if (result?.opcode != Opcode.MOVE_RESULT || gate?.opcode != Opcode.IF_EQZ ||
        (gate as OneRegisterInstruction).registerA != (result as OneRegisterInstruction).registerA ||
        code[code.branchTarget(predicateAt + 2)].opcode != Opcode.RETURN_VOID ||
        code.take(predicateAt).none {
            it.opcode == Opcode.CHECK_CAST && (it as OneRegisterInstruction).registerA == receiver &&
                it.getReference<TypeReference>()?.type == verdict.type
        }
    ) fail("verdict predicate does not gate the listener")

    // Every UncertifiedDeviceActivity intent is built after that gate.
    val launches = code.indices.filter { index ->
        code[index].opcode == Opcode.INVOKE_STATIC && code[index].getReference<MethodReference>()?.let { call ->
            call.returnType == "Landroid/content/Intent;" && call.parameterTypes.map { it.toString() } ==
                listOf("Landroid/content/Context;", "Ljava/lang/String;", "Landroid/content/Intent;") &&
                classDefByOrNull(call.definingClass)?.methods?.singleOrNull {
                    it.name == call.name && it.returnType == call.returnType && it.parameterTypes == call.parameterTypes
                }?.implementation?.instructions?.any {
                    it.opcode == Opcode.CONST_CLASS && it.getReference<TypeReference>()?.type == UNCERTIFIED_DEVICE_ACTIVITY
                } == true
        } == true
    }
    if (launches.isEmpty() || launches.any { it <= predicateAt + 2 }) {
        fail("UncertifiedDeviceActivity launch is not behind the verdict gate: $launches")
    }

    // The predicate already writes this local register; reuse it for the constant result.
    // Do not call patch-library returnEarly(): the bundle does not package non-inline helpers.
    val falseRegister = (body[1] as OneRegisterInstruction).registerA
    mutableClassDefBy(verdict.type).methods.single {
        it.name == predicateMethod.name && it.returnType == "Z" && it.parameterTypes.isEmpty()
    }.addInstructions(
        0,
        """
            const/4 v$falseRegister, 0x0
            return v$falseRegister
        """.trimIndent(),
    )
    Logger.getLogger("app.morphe.patches.maps.DeviceCompliancePatch").info(
        "Device compliance: listener=$listener; verdict=${verdict.type}->${predicate.name}()Z returns false; " +
            "launches=${launches.size}",
    )
}
