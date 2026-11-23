// SPDX-License-Identifier: GPL-3.0-only
package dev.ryuya.xvideo60

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByStrings
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val FRAME_RATE_FLAG = "android_video_transcode_target_frame_rate"
private const val MAX_FRAME_RATE = 60
private const val X_PACKAGE = "com.twitter.android"
private const val VIDEO_ENCODER_PACKAGE = "Lcom/twitter/media/transcode/video/"

private val verifiedVersions = mapOf(
    "11.0.0-release.0" to "311000000",
    "11.10.0-release.0" to "311100000",
    "11.20.0-release.0" to "311200000",
    "11.30.0-release.0" to "311300000",
    "11.40.0-release.0" to "311400000",
    "11.69.0-release.0" to "311690000",
    "11.70.0-release.0" to "311700000",
    "11.77.0-release.0" to "311770000",
    "11.81.0-release.0" to "311810000",
    "11.99.0-release.1" to "311990001",
    "12.2.0-release.0" to "312020000",
    "12.7.1-release.0" to "312071000",
    "12.11.0-release.0" to "312110000",
    "12.17.0-release.0" to "312170000",
    "12.19.1-release.0" to "312191000",
)

val videoUploadFrameRatePatch = patch(
    name = "X video upload up to 60 FPS",
    description = "Keeps up to 60 source frames per second when the legacy X video encoder transcodes a video.",
    default = false,
) {
    compatibleWith(
        Compatibility(
            packageName = X_PACKAGE,
            name = "X (Twitter)",
            apkFileType = ApkFileType.APKM,
            targets = verifiedVersions.keys.map { AppTarget(version = it) },
        ),
    )

    execute {
        val version = packageMetadata.versionName.orEmpty()
        val versionCode = packageMetadata.versionCode.orEmpty()
        if (packageMetadata.packageName != X_PACKAGE || verifiedVersions[version] != versionCode) {
            throw PatchException("This patch requires a verified original X APK. Found $version ($versionCode).")
        }

        val candidates = classDefByStrings(FRAME_RATE_FLAG)
            .filter { it.type.startsWith(VIDEO_ENCODER_PACKAGE) }
            .flatMap { cls -> cls.methods.filter { it.name == "<init>" && it.hasFrameRateFlag() } }
        val constructor = candidates.singleOrNull()
            ?: throw PatchException("Expected one legacy X video encoder constructor, found ${candidates.size}.")

        val method = mutableClassDefBy(constructor.definingClass).methods.single {
            it.name == constructor.name && it.parameterTypes == constructor.parameterTypes
        }
        val implementation = method.implementation
            ?: throw PatchException("The legacy X video encoder constructor has no bytecode.")
        val cap = findFrameRateCap(implementation, method.definingClass)
            ?: throw PatchException("The legacy X encoder's frame-rate logic differs from the supported versions.")

        // Keep the original config lookup as the input metadata fallback. Use the new limit for
        // both the encoder's target rate and the decision to skip decoded frames.
        implementation.replaceInstruction(
            cap.compareIndex,
            BuilderInstruction22t(Opcode.IF_LE, cap.compare.registerA, cap.limitRegister, cap.compare.target),
        )
        implementation.replaceInstruction(
            cap.minIndex,
            BuilderInstruction21s(Opcode.CONST_16, cap.limitRegister, MAX_FRAME_RATE),
        )
        implementation.addInstruction(
            cap.minIndex + 1,
            BuilderInstruction35c(
                Opcode.INVOKE_STATIC, 2, cap.min.registerC, cap.limitRegister, 0, 0, 0, cap.min.reference,
            ),
        )
    }
}

private fun Method.hasFrameRateFlag() =
    implementation?.instructions?.any { it.isFrameRateFlag() } == true

private fun Instruction.isFrameRateFlag() =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string == FRAME_RATE_FLAG

private data class FrameRateCap(
    val minIndex: Int,
    val min: BuilderInstruction35c,
    val compareIndex: Int,
    val compare: BuilderInstruction22t,
    val limitRegister: Int,
)

private fun findFrameRateCap(implementation: MutableMethodImplementation, owner: String): FrameRateCap? {
    val instructions = implementation.instructions
    val flag = instructions.indices.filter { instructions[it].isFrameRateFlag() }.singleOrNull() ?: return null
    if (flag + 16 >= instructions.size) return null
    val flagRegister = (instructions[flag] as? OneRegisterInstruction)?.registerA ?: return null
    val default = instructions[flag + 1] as? OneRegisterInstruction ?: return null
    val configCall = instructions[flag + 2] as? BuilderInstruction35c ?: return null
    val config = configCall.reference as? MethodReference ?: return null
    if ((default as? NarrowLiteralInstruction)?.narrowLiteral != 30 ||
        configCall.opcode != Opcode.INVOKE_VIRTUAL || configCall.registerCount != 3 ||
        configCall.registerD != flagRegister || configCall.registerE != default.registerA ||
        !config.definingClass.startsWith("Lcom/twitter/util/config/") ||
        config.parameterTypes != listOf("Ljava/lang/String;", "I") || config.returnType != "I"
    ) return null

    val fallback = instructions[flag + 3].resultRegister() ?: return null
    val rateRead = instructions[flag + 4] as? BuilderInstruction35c ?: return null
    val secondRateRead = instructions[flag + 14] as? BuilderInstruction35c ?: return null
    val source = instructions[flag + 5].resultRegister() ?: return null
    if (!rateRead.isSourceRateRead(fallback) || !secondRateRead.isSourceRateRead(fallback) ||
        rateRead.registerC != secondRateRead.registerC || rateRead.reference != secondRateRead.reference
    ) return null

    val minIndex = flag + 11
    val min = instructions[minIndex] as? BuilderInstruction35c ?: return null
    if (min.opcode != Opcode.INVOKE_STATIC || min.registerCount != 2 ||
        min.registerC != source || min.registerD != fallback ||
        min.reference.toString() != "Ljava/lang/Math;->min(II)I"
    ) return null
    val storedRate = instructions[minIndex + 1].resultRegister() ?: return null
    val store = instructions[minIndex + 2] as? TwoRegisterInstruction ?: return null
    val field = (store as? ReferenceInstruction)?.reference as? FieldReference ?: return null
    if (store.opcode != Opcode.IPUT || store.registerA != storedRate || field.definingClass != owner ||
        field.type != "I"
    ) return null

    val compareIndex = flag + 16
    val compare = instructions[compareIndex] as? BuilderInstruction22t ?: return null
    if (compare.opcode != Opcode.IF_LE || compare.registerA != instructions[compareIndex - 1].resultRegister() ||
        compare.registerB != fallback
    ) return null

    // The default register is reused by the assertion before Math.min. Some older constructors
    // also read it from failure branches reached during encoder setup, before this cap is set.
    val assertion = instructions[minIndex - 1] as? BuilderInstruction35c ?: return null
    val limitRegister = default.registerA
    if (assertion.opcode != Opcode.INVOKE_STATIC || assertion.registerCount != 1 ||
        (assertion.reference as? MethodReference)?.parameterTypes != listOf("Z") ||
        assertion.registerC != limitRegister || limitRegister == fallback || limitRegister == source ||
        !implementation.canReuseRegisterUntilReturn(minIndex, limitRegister)
    ) return null

    return FrameRateCap(minIndex, min, compareIndex, compare, limitRegister)
}

private fun MutableMethodImplementation.canReuseRegisterUntilReturn(start: Int, register: Int): Boolean {
    val end = (start until instructions.size).firstOrNull { instructions[it].opcode == Opcode.RETURN_VOID }
        ?: return false
    val path = start..end
    val firstAddress = instructions[start].location.codeAddress
    val lastAddress = instructions[end].location.codeAddress

    if (path.any { instructions[it].usesRegister(register) } ||
        tryBlocks.any { it.startCodeAddress <= lastAddress && it.startCodeAddress + it.codeUnitCount > firstAddress }
    ) return false

    return instructions.filterIsInstance<BuilderOffsetInstruction>().none { branch ->
        val target = branch.target.location.index
        if (branch.location.index in path) target !in path else target in (start + 1)..end
    }
}

private fun BuilderInstruction35c.isSourceRateRead(fallback: Int): Boolean {
    val ref = reference as? MethodReference ?: return false
    return opcode == Opcode.INVOKE_STATIC && registerCount == 2 && registerD == fallback &&
        ref.definingClass.startsWith("Lcom/twitter/media/transcode/") &&
        ref.parameterTypes == listOf("Landroid/media/MediaFormat;", "I") && ref.returnType == "I"
}

private fun Instruction.resultRegister() =
    (this as? OneRegisterInstruction)?.takeIf { opcode == Opcode.MOVE_RESULT }?.registerA

private fun Instruction.usesRegister(register: Int): Boolean = when (this) {
    is FiveRegisterInstruction ->
        listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount).contains(register)
    is RegisterRangeInstruction -> register in startRegister until startRegister + registerCount
    is ThreeRegisterInstruction -> register == registerA || register == registerB || register == registerC
    is TwoRegisterInstruction -> register == registerA || register == registerB
    is OneRegisterInstruction -> register == registerA
    else -> false
}
