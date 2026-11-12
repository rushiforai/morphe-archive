package dev.utaa.linimal.patches.features.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import dev.utaa.linimal.patches.settings.settingsEntryPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.PatchStatus
import dev.utaa.linimal.patches.status.PatchStatusRecord
import dev.utaa.linimal.patches.status.patchStatusCollector

private const val FRAGMENT_MANAGER = "Landroidx/fragment/app/r0;"
private const val DIALOG_FRAGMENT = "Landroidx/fragment/app/DialogFragment;"
private const val POPUP_DIALOG_FRAGMENT = "Lcom/linecorp/com/lds/ui/popup/LdsPopupDialogFragment;"
private const val PREMIUM_HOOKS =
    "Ldev/utaa/linimal/extension/features/PremiumHooks;->shouldSuppressUnsendPromotion()Z"

/**
 * 送信取消の Premium 案内ダイアログを、難読化名ではなく引数 Bundle のキーと
 * LINE の popup dialog 基底クラスで特定します。
 */
private val unsendPromotionDialogFingerprint = Fingerprint(
    strings = listOf("ARGUMENT_UTS_PARAM"),
    custom = { _, classDef -> classDef.superclass == POPUP_DIALOG_FRAGMENT },
)

/**
 * 表示だけを行う短いメソッドを対象にします。資格判定、課金 API、通信は含まれません。
 */
internal val unsendPromotionShowFingerprint = Fingerprint(
    classFingerprint = unsendPromotionDialogFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(FRAGMENT_MANAGER),
    filters = listOf(
        methodCall(
            "$DIALOG_FRAGMENT->show(${FRAGMENT_MANAGER}Ljava/lang/String;)V",
            Opcode.INVOKE_SUPER,
        ),
    ),
)

/**
 * 送信取消の Premium 案内表示だけを、実行時設定で抑制します。
 * 呼び出し元の資格判定と通信経路は変更しません。
 */
val premiumUnsendPromotionPatch = bytecodePatch(
    name = "Premium prompt on unsend",
    description = "送信取消時に出る LINE Premium の案内を、実行時設定で非表示にできるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(settingsEntryPatch)

    execute {
        val matches = runCatching { unsendPromotionShowFingerprint.matchAllOrNull() }.getOrNull().orEmpty()
        if (matches.size != 1) {
            // 任意機能のため、対象が一意でない場合は変更せず状態だけを記録します。
            recordUnappliedStatus(matches.size, "PremiumUnsendTargetNotUnique")
            return@execute
        }

        val method = matches.single().method
        val implementation = method.implementation
        // static ではないため、引数は parameterTypes に this を加えた数を占有します。
        val freeRegisters = (implementation?.registerCount ?: 0) - (method.parameterTypes.size + 1)
        if (implementation == null || freeRegisters < 1) {
            recordUnappliedStatus(1, "PremiumUnsendRegisterUnavailable")
            return@execute
        }

        method.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $PREMIUM_HOOKS
                move-result v0
                if-eqz v0, :show
                return-void
                :show
                nop
            """.trimIndent(),
        )

        patchStatusCollector.record(
            patchId = PatchId.PREMIUM_UNSEND,
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "PremiumUnsendPromotionGuarded",
        )
    }
}

/** 変更しなかった対象を、設定側が有効と誤認しない状態として残します。 */
private fun recordUnappliedStatus(matchCount: Int, reason: String) {
    patchStatusCollector.record(premiumUnsendUnappliedRecord(matchCount, reason))
}

/**
 * 一意性エラーでも実際の一致数を保持し、runtime parser と同じ count 契約に従います。
 *
 * <p>parser は `actualTargetCount == expectedTargetCount` を OK としか認めないため、対象が
 * 1 件見つかったうえで適用できなかった場合に TARGET_NOT_FOUND を記録すると report 全体が
 * 拒否され、Linimal の全機能が使えなくなります。0 件のときだけ TARGET_NOT_FOUND とします。</p>
 */
internal fun premiumUnsendUnappliedRecord(matchCount: Int, reason: String) = PatchStatusRecord(
    patchId = PatchId.PREMIUM_UNSEND,
    status = if (matchCount == 0) PatchStatus.TARGET_NOT_FOUND else PatchStatus.ERROR,
    expectedTargetCount = 1,
    actualTargetCount = matchCount,
    reason = reason,
)
