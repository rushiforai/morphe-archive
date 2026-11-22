package dev.utaa.linimal.patches.features.font

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnappliedFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.BOOLEAN
import dev.utaa.linimal.patches.util.BOXED_BOOLEAN
import dev.utaa.linimal.patches.util.OBJECT
import dev.utaa.linimal.patches.util.STRING
import dev.utaa.linimal.patches.util.VOID
import dev.utaa.linimal.patches.util.exceptionHandlerAddresses
import dev.utaa.linimal.patches.util.instructionAddress
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex
import dev.utaa.linimal.patches.util.isSafeInjectionIndex

private const val THEME_TASK_NAME = "RegisterPremiumFontThemeApplierTask"
private const val APPLICATION = "Landroid/app/Application;"
private const val LIFECYCLE_CALLBACKS = "Landroid/app/Application\$ActivityLifecycleCallbacks;"
private const val URI = "Landroid/net/Uri;"
private const val PARCEL_FILE_DESCRIPTOR = "Landroid/os/ParcelFileDescriptor;"
private const val PREMIUM_FONT_PROVIDER = "Lcom/linecorp/line/premiumfont/provider/PremiumFontProvider;"
private const val HOOKS_TYPE = "Ldev/utaa/linimal/extension/features/font/CustomFontHooks;"
private const val THEME_HOOK = "$HOOKS_TYPE->shouldApplyPremiumFontTheme($BOOLEAN)$BOOLEAN"
private const val OPEN_FILE_HOOK = "$HOOKS_TYPE->openSelectedFont($URI)$PARCEL_FILE_DESCRIPTOR"
private const val OPEN_FILE_ORIGINAL_LABEL = "linimal_custom_font_open_original"

/**
 * 起動時の初期化タスク `RegisterPremiumFontThemeApplierTask` の名前を返すメソッド。
 * タスクの本体は、このクラスの内側にある coroutine の `invokeSuspend` です。
 */
private val themeTaskNameFingerprint = Fingerprint(
    returnType = STRING,
    parameters = emptyList(),
    strings = listOf(THEME_TASK_NAME),
)

/** 難読化されていない `PremiumFontProvider.openFile(Uri, String)`。 */
private val premiumFontOpenFileFingerprint = Fingerprint(
    returnType = PARCEL_FILE_DESCRIPTOR,
    parameters = listOf(URI, STRING),
    custom = { method, classDef -> classDef.type == PREMIUM_FONT_PROVIDER && method.name == "openFile" },
)

internal data class ThemeGateInjection(val insertionIndex: Int, val resultRegister: Int)

internal data class OpenFileInjection(val uriRegister: Int, val resultRegister: Int)

/**
 * 取り込んだフォントを、LINE の公式フォント設定と同じ経路で当てます（issue #30）。
 *
 * - 起動時タスクの「テーマを当てるか」の判定結果を hook に通し、取り込んだフォントがあるときは当てさせる
 * - `PremiumFontProvider.openFile` の先頭で、選択中のフォント（ID `-1`）の要求にだけ取り込んだファイルを返す
 *
 * provider の署名照合は [fontProviderOwnCertificatePatch] が通します。公式の選択値と契約の判定は変えません。
 */
val customFontPatch = bytecodePatch(
    name = "Custom font",
    description = "取り込んだフォントファイルを、実行時設定で LINE の画面の文字に使えるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(fontProviderOwnCertificatePatch)

    execute {
        patchThemeGate()
        patchOpenFile()
    }
}

private fun BytecodePatchContext.patchThemeGate() {
    val ids = listOf(PatchId.CUSTOM_FONT_THEME)
    val nameMatches = themeTaskNameFingerprint.matchAllOrNull().orEmpty()
    if (nameMatches.size != 1) {
        recordUnappliedFeatureStatus(ids, 1, nameMatches.size, "CustomFontThemeTaskNotUnique")
        return
    }
    val taskType = nameMatches.single().originalClassDef.type
    val prefix = taskType.removeSuffix(";") + "$"

    val candidates = mutableListOf<Pair<ClassDef, Method>>()
    classDefForEach { classDef ->
        if (!classDef.type.startsWith(prefix)) {
            return@classDefForEach
        }
        classDef.methods.filter(::isInvokeSuspend).forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            if (instructions.any(::isRegisterLifecycleCallbacks)) {
                candidates += classDef to method
            }
        }
    }
    val candidate = candidates.singleOrNull()
    if (candidate == null) {
        recordUnappliedFeatureStatus(ids, 1, candidates.size, "CustomFontThemeCoroutineNotUnique")
        return
    }

    val (classDef, original) = candidate
    val implementation = original.implementation
    val injection = implementation?.let {
        themeGateInjection(it.instructions.toList(), exceptionHandlerAddresses(it))
    }
    val method = mutableClassDefByOrNull(classDef.type)?.methods?.singleOrNull {
        it.name == original.name && it.parameterTypes == original.parameterTypes && it.returnType == original.returnType
    }
    if (injection == null || method == null) {
        recordUnsafeFeatureStatus(ids, 1, 1, "CustomFontThemeShapeMismatch")
        return
    }

    // 判定結果の register をそのまま hook に通します。hook は元の値か true を返すため、型は boolean のままです。
    val result = injection.resultRegister
    method.addInstructions(
        injection.insertionIndex,
        """
            invoke-static/range { v$result .. v$result }, $THEME_HOOK
            move-result v$result
        """.trimIndent(),
    )
    recordFeatureStatus(ids, 1, 1, "CustomFontThemeGuarded")
}

private fun BytecodePatchContext.patchOpenFile() {
    val ids = listOf(PatchId.CUSTOM_FONT_FILE)
    val matches = premiumFontOpenFileFingerprint.matchAllOrNull().orEmpty()
    if (matches.size != 1) {
        recordUnappliedFeatureStatus(ids, 1, matches.size, "CustomFontOpenFileNotUnique")
        return
    }
    val method = matches.single().method
    val implementation = method.implementation
    val injection = openFileInjection(
        isStatic = AccessFlags.STATIC.isSet(method.accessFlags),
        registerCount = implementation?.registerCount ?: 0,
        parameterCount = method.parameterTypes.size,
    )
    if (injection == null || !isSafeInjectionIndex(implementation, 0)) {
        recordUnsafeFeatureStatus(ids, 1, 1, "CustomFontOpenFileShapeMismatch")
        return
    }

    // 先頭では引数以外の register は未使用です。hook の結果はその 1 つ目に受けます。
    val uri = injection.uriRegister
    val result = injection.resultRegister
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { v$uri .. v$uri }, $OPEN_FILE_HOOK
            move-result-object v$result
            if-eqz v$result, :$OPEN_FILE_ORIGINAL_LABEL
            return-object v$result
        """.trimIndent(),
        ExternalLabel(OPEN_FILE_ORIGINAL_LABEL, method.getInstruction(0)),
    )
    recordFeatureStatus(ids, 1, 1, "CustomFontOpenFileGuarded")
}

private fun isInvokeSuspend(method: Method): Boolean =
    method.name == "invokeSuspend" &&
        method.parameterTypes.map(CharSequence::toString) == listOf(OBJECT) &&
        method.returnType == OBJECT

private fun isRegisterLifecycleCallbacks(instruction: Instruction): Boolean =
    isCall(instruction, Opcode.INVOKE_VIRTUAL, APPLICATION, "registerActivityLifecycleCallbacks", listOf(LIFECYCLE_CALLBACKS), VOID)

/**
 * テーマを当てるかの分岐を探します。次の並びがちょうど 1 つあり、`if-eqz` が飛ばない側（結果が true の側）に
 * `Application.registerActivityLifecycleCallbacks` があることを求めます。
 *
 * ```
 * invoke-virtual {b}, Boolean->booleanValue()Z
 * move-result R
 * if-eqz R, :skip        // ここに挿入する
 * ...registerActivityLifecycleCallbacks...
 * :skip
 * ```
 *
 * 挿入位置の `if-eqz` が分岐先や例外 handler の先頭のときは null を返します。
 */
internal fun themeGateInjection(
    instructions: List<Instruction>,
    handlerAddresses: Set<Int> = emptySet(),
): ThemeGateInjection? {
    val candidates = instructions.indices.mapNotNull { index ->
        if (!isCall(instructions[index], Opcode.INVOKE_VIRTUAL, BOXED_BOOLEAN, "booleanValue", emptyList(), BOOLEAN)) {
            return@mapNotNull null
        }
        val result = registerOf(instructions.getOrNull(index + 1), Opcode.MOVE_RESULT) ?: return@mapNotNull null
        val branch = instructions.getOrNull(index + 2)
        if (registerOf(branch, Opcode.IF_EQZ) != result) {
            return@mapNotNull null
        }
        val skipAddress = instructionAddress(instructions, index + 2) + (branch as OffsetInstruction).codeOffset
        val skipIndex = instructions.indices.firstOrNull { instructionAddress(instructions, it) == skipAddress }
            ?: return@mapNotNull null
        if (skipIndex <= index + 3) {
            return@mapNotNull null
        }
        val registers = (index + 3 until skipIndex).any { isRegisterLifecycleCallbacks(instructions[it]) }
        if (!registers) null else ThemeGateInjection(index + 2, result)
    }
    val injection = candidates.singleOrNull() ?: return null
    if (isDivertedInjectionIndex(instructions, injection.insertionIndex, handlerAddresses)) {
        return null
    }
    return injection
}

/**
 * `openFile(Uri, String)` の先頭で使える register を求めます。インスタンスメソッドで、引数（this を含む）の
 * ほかに register が 1 つ以上あることを求めます。メソッドの先頭では引数以外の register は未初期化で、
 * 元の命令は読む前に必ず書くため、1 つ目を hook の結果に使えます。
 */
internal fun openFileInjection(isStatic: Boolean, registerCount: Int, parameterCount: Int): OpenFileInjection? {
    if (isStatic || parameterCount != 2) {
        return null
    }
    val parameterRegisters = parameterCount + 1
    val firstParameter = registerCount - parameterRegisters
    if (firstParameter < 1) {
        return null
    }
    return OpenFileInjection(uriRegister = firstParameter + 1, resultRegister = 0)
}

private fun registerOf(instruction: Instruction?, opcode: Opcode): Int? =
    if (instruction?.opcode == opcode) (instruction as? OneRegisterInstruction)?.registerA else null

private fun isCall(
    instruction: Instruction,
    opcode: Opcode,
    definingClass: String,
    name: String,
    parameters: List<String>,
    returnType: String,
): Boolean {
    if (instruction.opcode != opcode) {
        return false
    }
    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return reference.definingClass == definingClass &&
        reference.name == name &&
        reference.parameterTypes.map(CharSequence::toString) == parameters &&
        reference.returnType == returnType
}
