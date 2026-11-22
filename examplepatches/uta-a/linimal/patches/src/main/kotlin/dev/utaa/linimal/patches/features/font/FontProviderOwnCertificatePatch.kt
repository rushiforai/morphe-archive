package dev.utaa.linimal.patches.features.font

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.utaa.linimal.patches.features.chat.chatListHeaderButtonsPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.BOOLEAN
import dev.utaa.linimal.patches.util.INT
import dev.utaa.linimal.patches.util.OBJECT
import dev.utaa.linimal.patches.util.STRING
import dev.utaa.linimal.patches.util.VOID
import dev.utaa.linimal.patches.util.exceptionHandlerAddresses
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex

private const val PACKAGE_MANAGER = "Landroid/content/pm/PackageManager;"
private const val PROVIDER_INFO = "Landroid/content/pm/ProviderInfo;"
private const val RESOURCES = "Landroid/content/res/Resources;"
private const val TRACE = "Landroid/os/Trace;"
private const val HOOKS_TYPE = "Ldev/utaa/linimal/extension/features/font/FontProviderHooks;"
private const val TRUSTS_OWN_PROVIDER_HOOK = "$HOOKS_TYPE->trustsOwnProvider($PROVIDER_INFO)$BOOLEAN"
private const val ORIGINAL_CHECK_LABEL = "linimal_font_provider_original_check"

/**
 * androidx の `FontProvider.getProvider(PackageManager, FontRequest, Resources)`。provider を解決し、
 * その package の署名を `FontRequest` の証明書と比べて `ProviderInfo` を返します。`FontRequest` は
 * 難読化されるため、型は問いません。3 つの文字列がそろうのはこのメソッドだけです。
 */
private val fontProviderFingerprint = Fingerprint(
    returnType = PROVIDER_INFO,
    parameters = listOf(PACKAGE_MANAGER, "L", RESOURCES),
    strings = listOf(
        "Found content provider ",
        "No package found for authority: ",
        "FontProvider.getProvider",
    ),
)

/**
 * 照合の hook は、公式フォントの復旧と手持ちのフォントの両方が使います。どちらの機能も、この hook が
 * 入ったことを自分の patch ID で確かめられるよう、同じ結果を 2 つの ID に記録します。
 */
internal val FONT_PROVIDER_CERTIFICATE_PATCH_IDS = listOf(
    PatchId.FONT_PROVIDER_OWN_CERTIFICATE,
    PatchId.CUSTOM_FONT_PROVIDER_CERTIFICATE,
)

internal data class FontProviderInjection(
    val insertionIndex: Int,
    val providerRegister: Int,
    val resultRegister: Int,
)

/**
 * 再署名した LINE で、LINE 自身のフォント provider（`.premiumfont` と `.fonts`）の署名照合を通します。
 * ADR 0005 の範囲に限り、条件の判定は extension の hook に任せます。設定 OFF・未初期化・例外のときは
 * 元の照合へ進みます。ほかの provider の照合、`fonts_certs`、PackageManager の署名情報は変えません。
 */
val fontProviderOwnCertificatePatch = bytecodePatch(
    name = "Own font provider certificate",
    description = "LINE 自身のフォント provider に限り、再署名後の署名でもフォントを読み込めるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(chatListHeaderButtonsPatch)

    execute {
        val matches = fontProviderFingerprint.matchAllOrNull().orEmpty()
        if (matches.size != 1) {
            recordFeatureStatus(
                FONT_PROVIDER_CERTIFICATE_PATCH_IDS,
                expectedTargetCount = 1,
                actualTargetCount = matches.size,
                reason = "FontProviderNotUnique",
            )
            return@execute
        }

        val method = matches.single().method
        val implementation = method.implementation
        val injection = implementation?.let {
            fontProviderInjection(it.instructions.toList(), exceptionHandlerAddresses(it))
        }
        if (injection == null) {
            recordUnsafeFeatureStatus(
                FONT_PROVIDER_CERTIFICATE_PATCH_IDS,
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "FontProviderShapeMismatch",
            )
            return@execute
        }

        // 結果の register は、挿入位置の命令が直後に上書きするため、ここで使っても後の値と重なりません。
        // 元の成功時の経路と同じく、return の前に Trace の section を閉じます。
        val provider = injection.providerRegister
        val result = injection.resultRegister
        method.addInstructionsWithLabels(
            injection.insertionIndex,
            """
                invoke-static/range { v$provider .. v$provider }, $TRUSTS_OWN_PROVIDER_HOOK
                move-result v$result
                if-eqz v$result, :$ORIGINAL_CHECK_LABEL
                invoke-static {}, $TRACE->endSection()V
                return-object v$provider
            """.trimIndent(),
            ExternalLabel(ORIGINAL_CHECK_LABEL, method.getInstruction(injection.insertionIndex)),
        )
        recordFeatureStatus(
            FONT_PROVIDER_CERTIFICATE_PATCH_IDS,
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "FontProviderOwnCertificateGuarded",
        )
    }
}

/**
 * 照合メソッドの中で、package 名の一致を確かめた直後の位置を探します。次の並びを求めます。
 *
 * ```
 * invoke-virtual {pm, authority, flags}, PackageManager->resolveContentProvider(String, I)ProviderInfo
 * move-result-object P
 * if-eqz P, :not_found
 * iget-object X, P, ProviderInfo->packageName
 * invoke-virtual {X, requested}, String->equals(Object)Z
 * move-result B
 * if-eqz B, :wrong_package
 * iget-object D, P, ProviderInfo->packageName   // ここに挿入する
 * ```
 *
 * 挿入位置の命令が D を上書きするので、hook の結果は D に受けます。D と P が同じ、挿入位置が分岐先や
 * 例外 handler の先頭、`resolveContentProvider` が 1 か所でない、`Trace.beginSection` がその前にない、
 * のいずれかに当たるときは null を返します。
 */
internal fun fontProviderInjection(
    instructions: List<Instruction>,
    handlerAddresses: Set<Int> = emptySet(),
): FontProviderInjection? {
    val resolveIndices = instructions.indices.filter { index ->
        isMethodCall(
            instructions[index],
            Opcode.INVOKE_VIRTUAL,
            PACKAGE_MANAGER,
            "resolveContentProvider",
            listOf(STRING, INT),
            PROVIDER_INFO,
        )
    }
    val resolve = resolveIndices.singleOrNull() ?: return null
    val beginsTrace = (0 until resolve).any { index ->
        isMethodCall(instructions[index], Opcode.INVOKE_STATIC, TRACE, "beginSection", listOf(STRING), VOID)
    }
    if (!beginsTrace) {
        return null
    }

    val provider = registerOf(instructions.getOrNull(resolve + 1), Opcode.MOVE_RESULT_OBJECT) ?: return null
    if (registerOf(instructions.getOrNull(resolve + 2), Opcode.IF_EQZ) != provider) {
        return null
    }
    val packageName = packageNameRead(instructions.getOrNull(resolve + 3), provider) ?: return null
    val equals = instructions.getOrNull(resolve + 4) as? FiveRegisterInstruction
    if (
        equals == null ||
        !isMethodCall(equals, Opcode.INVOKE_VIRTUAL, STRING, "equals", listOf(OBJECT), BOOLEAN) ||
        equals.registerCount != 2 ||
        equals.registerC != packageName
    ) {
        return null
    }
    val matched = registerOf(instructions.getOrNull(resolve + 5), Opcode.MOVE_RESULT) ?: return null
    if (registerOf(instructions.getOrNull(resolve + 6), Opcode.IF_EQZ) != matched) {
        return null
    }

    val insertionIndex = resolve + 7
    val result = packageNameRead(instructions.getOrNull(insertionIndex), provider) ?: return null
    if (result == provider || isDivertedInjectionIndex(instructions, insertionIndex, handlerAddresses)) {
        return null
    }
    return FontProviderInjection(insertionIndex, provider, result)
}

/** [instruction] が `iget-object D, provider, ProviderInfo->packageName` なら D を返します。 */
private fun packageNameRead(instruction: Instruction?, provider: Int): Int? {
    if (instruction?.opcode != Opcode.IGET_OBJECT) {
        return null
    }
    val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference ?: return null
    val registers = instruction as? TwoRegisterInstruction ?: return null
    if (
        field.definingClass != PROVIDER_INFO ||
        field.name != "packageName" ||
        field.type != STRING ||
        registers.registerB != provider
    ) {
        return null
    }
    return registers.registerA
}

private fun registerOf(instruction: Instruction?, opcode: Opcode): Int? =
    if (instruction?.opcode == opcode) (instruction as? OneRegisterInstruction)?.registerA else null

private fun isMethodCall(
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
