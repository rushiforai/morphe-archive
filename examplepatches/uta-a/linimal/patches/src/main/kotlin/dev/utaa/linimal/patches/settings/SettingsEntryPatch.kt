package dev.utaa.linimal.patches.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.patchStatusCollector

private const val SETTINGS_CATEGORY_SUPER = "Lec5/f2;"
private const val LIST_TYPE = "Ljava/util/List;"
private const val LIST_BUILDER = "Lws8/p;->F([Ljava/lang/Object;)Ljava/util/List;"
private const val APPEND_ENTRY_METHOD =
    "Ldev/utaa/linimal/extension/settings/SettingsEntryHooks;->appendEntry(Ljava/util/List;)Ljava/util/List;"

/**
 * 設定一覧を組み立てる static initializer を、難読化名ではなく初期化内に残る
 * 関数参照名の並びと、リスト生成の呼び出しで特定します。
 */
internal val mainSettingsListFingerprint = Fingerprint(
    name = "<clinit>",
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("createLypPremiumItemDescription"),
        string("getSettingsPremiumSubscriptionStatus"),
        string("shouldShowCustomAppIconSettings"),
        string("openIapPurchaseHistory"),
        methodCall(LIST_BUILDER, Opcode.INVOKE_STATIC),
    ),
    custom = { _, classDef -> classDef.superclass == SETTINGS_CATEGORY_SUPER },
)

/**
 * 設定項目モデルの constructor を、名前ではなく引数の形状だけで特定します。
 * runtime 側の reflection も同じ形状を前提にするため、ここで一意性を検証します。
 */
internal val settingsItemConstructorFingerprint = Fingerprint(
    name = "<init>",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        "I",
        "Lnt8/p;",
        "Lnt8/p;",
        "Ljava/lang/Integer;",
        "Lnt8/p;",
        "Lnt8/p;",
        "Lmi8/e;",
        "Lnt8/l;",
        "Lnt8/l;",
        "Lec5/g1;",
        "Lnt8/p;",
        "Z",
    ),
)

/** LINE の既存項目を差し替えず、Linimal の設定項目を 1 件だけ追加します。 */
val settingsEntryPatch = bytecodePatch(
    name = "Linimal 設定の追加",
    description = "LINE の設定画面へ Linimal の設定項目を追加します。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(linimalSettingsResourcePatch)

    execute {
        val listMatches = mainSettingsListFingerprint.matchAllOrNull().orEmpty()
        val constructorMatches = settingsItemConstructorFingerprint.matchAllOrNull().orEmpty()
        val actualTargetCount = listMatches.size + constructorMatches.size
        if (listMatches.size != 1 || constructorMatches.size != 1) {
            settingsFailure(
                "SettingsFingerprintMismatch",
                actualTargetCount,
                "list=${listMatches.size}, constructor=${constructorMatches.size}",
            )
        }

        val match = listMatches.single()
        val method = match.method
        val listBuilderIndex = match.instructionMatches[4].index
        val moveResult = method.getInstruction<OneRegisterInstruction>(listBuilderIndex + 1)
        val storeField = method.getInstruction<ReferenceInstruction>(listBuilderIndex + 2)
        val listField = storeField.reference as? FieldReference
        val resultRegister = moveResult.registerA

        // 生成したリストを static field へ保存する直前の 3 命令が想定どおりの場合だけ変更します。
        if (
            moveResult.opcode != Opcode.MOVE_RESULT_OBJECT ||
            storeField.opcode != Opcode.SPUT_OBJECT ||
            listField?.type != LIST_TYPE ||
            listField.definingClass != match.originalClassDef.type ||
            resultRegister > 15
        ) {
            settingsFailure("SettingsListInstructionShapeMismatch", actualTargetCount, "list tail")
        }

        // 元のリストは変更せず、追加済みのリストで同じ register を置き換えます。
        // static field への保存自体は LINE 側の命令のまま残ります。
        method.addInstructions(
            listBuilderIndex + 2,
            """
                invoke-static { v$resultRegister }, $APPEND_ENTRY_METHOD
                move-result-object v$resultRegister
            """.trimIndent(),
        )

        patchStatusCollector.record(
            patchId = PatchId.SETTINGS_ENTRY,
            expectedTargetCount = 2,
            actualTargetCount = 2,
            reason = "SettingsEntryAppended",
        )
    }
}

/** 設定画面へ到達できない build を出荷しないため、設定入口の失敗は必須失敗として扱います。 */
private fun settingsFailure(reason: String, actualTargetCount: Int, detail: String): Nothing {
    patchStatusCollector.record(
        patchId = PatchId.SETTINGS_ENTRY,
        expectedTargetCount = 2,
        actualTargetCount = actualTargetCount,
        reason = reason,
    )
    throw PatchException("Linimal Settings entry target is not uniquely matched ($detail).")
}
