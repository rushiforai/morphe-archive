package dev.utaa.linimal.patches.features.googleauth

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.utaa.linimal.patches.features.push.isOriginalCertificateSha1
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnappliedFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus

private const val PICKER_HOOKS = "Ldev/utaa/linimal/extension/features/googleauth/GoogleAuthRoutingHooks;"
private const val INTENT = "Landroid/content/Intent;"
private const val ACCOUNT = "Landroid/accounts/Account;"
private const val STRING_TYPE = "Ljava/lang/String;"
internal const val GMS_CHOOSE_ACCOUNT = "com.google.android.gms.common.account.CHOOSE_ACCOUNT"

/** バックアップのアカウント選択の Intent を作る処理。drive.appdata の scope と選択画面の action を持ちます。 */
private val accountPickerIntentFingerprint = Fingerprint(
    returnType = INTENT,
    strings = listOf("https://www.googleapis.com/auth/drive.appdata", GMS_CHOOSE_ACCOUNT),
    custom = { method, _ -> method.parameterTypes.firstOrNull() == "Landroid/content/Context;" &&
        !AccessFlags.STATIC.isSet(method.accessFlags) },
)

/** Drive の資格情報で、アカウント名から端末本体の `com.google` アカウントを探して保持する setter。 */
private val selectedAccountFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(STRING_TYPE),
    strings = listOf("com.google"),
    custom = { method, _ -> !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "getAccountsByType"
        } == true },
)

/**
 * バックアップのアカウント選択も MicroG-RE で行うようにします（ADR 0003 の 2026-11-03 の変更）。
 * token は MicroG-RE が名前で探すため、端末本体の Google アカウントで選ぶと、MicroG-RE に同じアカウントが無いときに失敗します。
 * 設定 OFF、MicroG-RE が未導入、例外時は hook が元の値を返します。
 */
val googleAccountPickerRoutingPatch = bytecodePatch(
    name = "MicroG-RE でバックアップのアカウントを選ぶ",
    description = "トークのバックアップで選ぶ Google アカウントを、実行時設定で MicroG-RE のアカウントにできるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) PatchAvailability.REQUIRED else PatchAvailability.UNAVAILABLE
    }
    dependsOn(googleSignInRoutingPatch)

    execute {
        val ids = listOf(PatchId.GOOGLE_AUTH_ACCOUNT_PICKER_ROUTING)
        if (!isOriginalCertificateSha1(Constants.LINE_ORIGINAL_CERTIFICATE_SHA1)) {
            patchStatusCollector.record(googleAuthNotConfiguredRecord(PatchId.GOOGLE_AUTH_ACCOUNT_PICKER_ROUTING))
            return@execute
        }
        val pickers = accountPickerIntentFingerprint.matchAllOrNull().orEmpty()
        val selectors = selectedAccountFingerprint.matchAllOrNull().orEmpty()
        if (pickers.size != 1 || selectors.size != 1) {
            recordUnappliedFeatureStatus(ids, 2, pickers.size + selectors.size, "GoogleAccountPickerTargetsNotUnique")
            return@execute
        }
        val picker = pickers.single()
        val selector = selectors.single()
        val pickerReturns = pickerReturnRegisters(picker.originalMethod)
        val fields = selectedAccountFields(selector.originalMethod)
        val selectorThis = (selector.originalMethod.implementation?.registerCount ?: 0) - 2
        if (pickerReturns == null || fields == null || selectorThis < 1 || selectorThis + 1 > 15) {
            recordUnsafeFeatureStatus(ids, 2, 2, "GoogleAccountPickerShapeMismatch")
            return@execute
        }

        // 後ろの return から順に、返す Intent を hook に通します。
        for ((index, register) in pickerReturns.sortedByDescending { it.first }) {
            picker.method.addInstructions(index, """
                invoke-static/range { v$register .. v$register }, $PICKER_HOOKS->chooseAccountIntent($INTENT)$INTENT
                move-result-object v$register
            """.trimIndent())
        }
        // v0 は先頭ではまだ使われていません。this と名前の register は 4 bit に収まることを確かめています。
        val (accountField, nameField) = fields
        selector.method.addInstructionsWithLabels(0, """
            invoke-static { p0, p1 }, $PICKER_HOOKS->selectedAccount(Ljava/lang/Object;$STRING_TYPE)$ACCOUNT
            move-result-object v0
            if-eqz v0, :keep
            iput-object v0, p0, $accountField
            iput-object p1, p0, $nameField
            return-void
            :keep
            nop
        """.trimIndent())
        recordFeatureStatus(ids, 2, 2, "GoogleAccountPickerRoutingGuarded")
    }
}

/** Intent を返す `return-object` の位置と register。 */
internal fun pickerReturnRegisters(method: Method): List<Pair<Int, Int>>? {
    val body = method.implementation?.instructions?.toList() ?: return null
    val returns = body.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        .map { it.index to (it.value as OneRegisterInstruction).registerA }
    return returns.takeIf { it.isNotEmpty() }
}

/** setter が this に保存する Account と String の field。それぞれ 1 つずつであることを確かめます。 */
internal fun selectedAccountFields(method: Method): Pair<String, String>? {
    val stored = method.implementation?.instructions?.filter { it.opcode == Opcode.IPUT_OBJECT }
        ?.mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
        ?.filter { it.definingClass == method.definingClass }?.distinct()?.toList() ?: return null
    val account = stored.singleOrNull { it.type == ACCOUNT } ?: return null
    val name = stored.singleOrNull { it.type == STRING_TYPE } ?: return null
    fun smali(field: FieldReference) = "${field.definingClass}->${field.name}:${field.type}"
    return smali(account) to smali(name)
}
