package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PHOTO_ORIGINAL_NAME = "CHAT_PHOTO_ORIGINAL"
private const val PHOTO_HD_NAME = "CHAT_PHOTO_HD"
private const val PHOTO_QUALITY_ORIGINAL_NAME = "ORIGINAL"

/**
 * The native quality resolver downgrades ORIGINAL to HD when Zalo's entitlement/configuration
 * checks fail. Its existing picker and upload pipeline already support ORIGINAL, so the patch
 * unlocks both sides natively: the two static entitlement predicates called by this resolver
 * (feature enabled / subscription active, shared with the picker gate) are forced to true, and the
 * HD fallback is replaced with ORIGINAL. This keeps the native quality choices and avoids the
 * file-attachment path.
 */
private object NativePhotoQualityFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("I", "L", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "J", "Z"),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, name = PHOTO_ORIGINAL_NAME),
        methodCall(opcode = Opcode.INVOKE_STATIC, returnType = "Z", parameters = emptyList()),
        fieldAccess(opcode = Opcode.SGET_OBJECT),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, returnType = "Ljava/lang/Object;"),
        methodCall(opcode = Opcode.INVOKE_STATIC, returnType = "Z", parameters = emptyList()),
        fieldAccess(opcode = Opcode.SGET_OBJECT, name = PHOTO_HD_NAME),
    ),
)

@Suppress("unused")
val sendPhotoAsFilePatch = bytecodePatch(
    name = "Send photos in original quality",
    description = "Unlocks Zalo's native original-photo quality option and selects it by default while preserving its normal quality picker.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(AppTarget(version = "26.11.01")),
    ))

    dependsOn(nativeSignaturePatch)

    execute {
        check(NativePhotoQualityFingerprint.matchAll(1..1).size == 1)
        val method = NativePhotoQualityFingerprint.method
        val instructions = method.implementation!!.instructions.toList()
        fun fieldNameAt(index: Int): String? =
            (instructions[index] as? ReferenceInstruction)?.takeIf { it.opcode == Opcode.SGET_OBJECT }
                ?.reference?.let { (it as? FieldReference)?.name }
        val hdIndex = instructions.indices.indexOfFirst { fieldNameAt(it) == PHOTO_HD_NAME }
        check(hdIndex > 0) { "Native original-photo fallback was not found" }
        val originalIndex = instructions.take(hdIndex).indices.indexOfFirst { fieldNameAt(it) == PHOTO_ORIGINAL_NAME }
        check(originalIndex >= 0) { "Native original-photo enum was not found before the fallback" }
        val originalRef = (instructions[originalIndex] as ReferenceInstruction).reference as FieldReference
        val register = (instructions[hdIndex] as OneRegisterInstruction).registerA

        // The two no-arg static boolean predicates evaluated before the fallback are the
        // entitlement gates; the picker UI and MediaItem flags consult the same methods.
        val gates = instructions.subList(originalIndex, hdIndex)
            .filter { it.opcode == Opcode.INVOKE_STATIC }
            .mapNotNull { (it as ReferenceInstruction).reference as? MethodReference }
            .filter { it.returnType == "Z" && it.parameterTypes.isEmpty() }
            .distinct()
        check(gates.size == 2) { "Expected 2 entitlement predicates but found ${gates.size}" }
        gates.forEach { gate ->
            mutableClassDefBy(gate.definingClass).methods
                .single { it.name == gate.name && it.parameterTypes.isEmpty() && it.returnType == "Z" }
                .addInstructions(0, "const/4 v0, 0x1\n return v0")
        }

        // The picker's default quality resolver (static ()I on the same class) is consumed per chat
        // thread on first open and cached, so the user can still change it afterwards. Make it
        // default to ORIGINAL instead of the remembered/HD value.
        val gateClass = mutableClassDefBy(gates.first().definingClass)
        fun originalRefs(method: com.android.tools.smali.dexlib2.iface.Method) =
            method.implementation?.instructions?.count { instruction ->
                (instruction as? ReferenceInstruction)?.reference.let { ref ->
                    ref is FieldReference && ref.name == PHOTO_QUALITY_ORIGINAL_NAME
                }
            } ?: 0
        // The default resolver references ORIGINAL in its clamp branches, more than the
        // saved-selection reader does.
        val candidates = gateClass.methods
            .filter {
                it.parameterTypes.isEmpty() && it.returnType == "I" &&
                    it.accessFlags and AccessFlags.STATIC.value != 0
            }
            .sortedByDescending { originalRefs(it) }
        check(candidates.size >= 2 && originalRefs(candidates[0]) > originalRefs(candidates[1])) {
            "Default photo quality resolver was not uniquely identified"
        }
        val defaultQuality = candidates.first()
        val defaultInstructions = defaultQuality.implementation!!.instructions.toList()
        val enumIndex = defaultInstructions.indexOfFirst {
            it.opcode == Opcode.SGET_OBJECT &&
                ((it as ReferenceInstruction).reference as? FieldReference)?.name == PHOTO_QUALITY_ORIGINAL_NAME
        }
        val enumRef = (defaultInstructions[enumIndex] as ReferenceInstruction).reference as FieldReference
        val valueRef = (defaultInstructions.drop(enumIndex + 1).first { it.opcode == Opcode.IGET } as ReferenceInstruction).reference as FieldReference
        defaultQuality.addInstructions(
            0,
            """
                sget-object v0, ${enumRef.definingClass}->${enumRef.name}:${enumRef.type}
                iget v0, v0, ${valueRef.definingClass}->${valueRef.name}:${valueRef.type}
                return v0
            """,
        )

        method.replaceInstruction(
            hdIndex,
            "sget-object v$register, ${originalRef.definingClass}->${originalRef.name}:${originalRef.type}",
        )
    }
}
