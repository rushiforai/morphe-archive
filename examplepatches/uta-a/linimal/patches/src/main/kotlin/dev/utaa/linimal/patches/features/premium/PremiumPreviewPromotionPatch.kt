package dev.utaa.linimal.patches.features.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.patchStatusCollector
import dev.utaa.linimal.patches.status.recordUnappliedFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.OBJECT
import dev.utaa.linimal.patches.util.STRING
import dev.utaa.linimal.patches.util.VOID
import dev.utaa.linimal.patches.util.exceptionHandlerAddresses
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex

private const val PREVIEW_HOOKS = "Ldev/utaa/linimal/extension/features/PremiumPreviewPromotionHooks;"
private const val PREVIEW_BANNER_HOOK = "$PREVIEW_HOOKS->previewBanner(${OBJECT}Z)$OBJECT"
private const val PROMOTION_MENU_ITEM_HOOK = "$PREVIEW_HOOKS->promotionMenuItem($OBJECT)$OBJECT"
private const val ENUM = "Ljava/lang/Enum;"

/** スクロールプレビュー画面の Activity。画面本体の composable はその内部 callback 型を引数に取ります。 */
internal const val CHAT_HISTORY_PREVIEW_ACTIVITY_PREFIX =
    "Lcom/linecorp/line/chat/ui/impl/preview/ChatHistoryPreviewActivity\$"

/** プレビュー上部・下部に出るバナー model の data class が `toString()` に残す marker。 */
internal const val PREVIEW_BANNER_MARKER = "PreviewBanner(badgeRes="

/** バナーのタップ先 field。この field 名の marker で、同じ model の別 field と取り違えないことを確かめます。 */
internal const val PREVIEW_BANNER_DESTINATION_MARKER = ", chipDestination="

/** プレビューのメニューに出る Premium 誘導行の model が `toString()` に残す marker。 */
internal const val PREVIEW_PROMOTION_MENU_ITEM_MARKER = "ChatPreviewPromotionMenuItem(withGreenDot="

/** バナーのタップ先を表す enum のうち、Premium へ誘導しない値。 */
internal const val NO_DESTINATION = "NONE"

/** Premium 特典の画面へ誘導する値。enum の定数名は難読化されず残ります。 */
internal val PREMIUM_DESTINATIONS = setOf("LYP_BENEFIT_HOME", "LYP_BENEFIT_STATUS")

/** 書き換える画面本体の composable は 1 件だけです。 */
internal const val PREMIUM_PREVIEW_PROMOTION_TARGET_COUNT = 1

/**
 * 注入コードが使う作業 register の数（v0〜v3）。
 *
 * <p>method の入口では、引数以外の register はまだ何も書かれていません。ART の verifier は未定義の
 * register の読み出しを拒否するため、元のコードはどの経路でもこれらを書いてから読みます。したがって
 * 入口で書き込んでも、元のコードが使う値は壊れません。</p>
 */
internal const val PREMIUM_PREVIEW_SCRATCH_REGISTER_COUNT = 4

/** `move-object/from16` の書き込み先と `check-cast` は 8bit の register しか取れません。 */
private const val MAX_EIGHT_BIT_REGISTER = 255

private val previewBannerModelFingerprint = Fingerprint(
    name = "toString",
    returnType = STRING,
    parameters = emptyList(),
    strings = listOf(PREVIEW_BANNER_MARKER, PREVIEW_BANNER_DESTINATION_MARKER),
)

private val previewPromotionMenuItemModelFingerprint = Fingerprint(
    name = "toString",
    returnType = STRING,
    parameters = emptyList(),
    strings = listOf(PREVIEW_PROMOTION_MENU_ITEM_MARKER),
)

/**
 * バナー model と Premium 誘導行 model の両方を引数に取る、プレビュー画面の static composable。
 * 画面本体のほか、縦横の配置ごとの子 composable も同じ 2 つの型を受け取るため、ここでは候補を集めるだけで、
 * 呼び出し関係から最上位の 1 件に絞ります。
 */
private fun previewScreenCandidateFingerprint(bannerType: String, menuItemType: String) = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = VOID,
    custom = { method, _ ->
        isPreviewScreenSignature(method.parameterTypes.map { it.toString() }, bannerType, menuItemType)
    },
)

/**
 * スクロールプレビュー画面で LINE Premium（LYP）へ誘導する UI だけを、実行時設定で表示しないようにします。
 *
 * <h2>対象</h2>
 * <ul>
 *   <li>プレビューのバナーのうち、タップ先が Premium 特典の画面であるもの（非会員向けの
 *   「未読のまま過去のトークを確認可能」など）。タップ先のない「画面をスクロールできます」の案内は残します。</li>
 *   <li>プレビューのメニューにある Premium 誘導行（「スクロールプレビュー」）。</li>
 * </ul>
 *
 * <h2>方法</h2>
 * <p>画面本体の composable の入口で、バナー model と誘導行 model の引数だけを hook に通し、抑制時は
 * null に差し替えます。どちらの引数も元から nullable で、LINE 自身も条件を満たさないときは null を渡します。
 * 子 composable と再 composition 用の lambda は差し替え後の引数を受け取るため、表示は一貫します。</p>
 *
 * <p>プレビューをスクロールできるかどうかの判定、資格判定、課金・購読 API、通信は変更しません。
 * Premium の機能を解放することもありません。</p>
 */
val premiumPreviewPromotionPatch = bytecodePatch(
    name = "Premium prompt in scroll preview",
    description = "スクロールプレビュー画面にある LINE Premium の案内を、実行時設定で非表示にできるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    // 機能パッチは単一の直列チェーンを成し、この patch の後段に previewScrollPatch が続きます。
    dependsOn(premiumSettingsRowPatch)

    execute {
        val bannerTypes = previewBannerModelFingerprint.matchAllOrNull().orEmpty()
            .map { it.originalClassDef.type }
            .toSet()
        val menuItemTypes = previewPromotionMenuItemModelFingerprint.matchAllOrNull().orEmpty()
            .map { it.originalClassDef.type }
            .toSet()
        if (bannerTypes.size != 1 || menuItemTypes.size != 1) {
            recordUnapplied(minOf(bannerTypes.size, menuItemTypes.size), "PremiumPreviewModelNotUnique")
            return@execute
        }
        val bannerType = bannerTypes.single()
        val menuItemType = menuItemTypes.single()

        val destinationField = chipDestinationField(classDefByOrNull(bannerType)) { type -> classDefByOrNull(type) }
        if (destinationField == null) {
            recordUnapplied(0, "PremiumPreviewDestinationFieldNotUnique")
            return@execute
        }

        val candidates = previewScreenCandidateFingerprint(bannerType, menuItemType).matchAllOrNull().orEmpty()
        val roots = previewScreenRoots(candidates.map { it.originalMethod })
        if (roots.size != PREMIUM_PREVIEW_PROMOTION_TARGET_COUNT) {
            recordUnapplied(roots.size, "PremiumPreviewScreenNotUnique")
            return@execute
        }
        val rootKey = methodKey(roots.single())
        val match = candidates.single { methodKey(it.originalMethod) == rootKey }

        val original = match.originalMethod
        val implementation = original.implementation
        val injection = implementation?.let {
            premiumPreviewPromotionInjection(
                parameterTypes = original.parameterTypes.map { type -> type.toString() },
                registerCount = it.registerCount,
                bannerType = bannerType,
                menuItemType = menuItemType,
            )
        }
        if (
            implementation == null ||
            injection == null ||
            isDivertedInjectionIndex(
                implementation.instructions.toList(),
                0,
                exceptionHandlerAddresses(implementation),
            )
        ) {
            // 対象は一意でも、入口の shape が想定と違う場合は何も変更しません。
            recordUnsafeFeatureStatus(
                listOf(PatchId.PREMIUM_PREVIEW_PROMOTION),
                expectedTargetCount = PREMIUM_PREVIEW_PROMOTION_TARGET_COUNT,
                actualTargetCount = PREMIUM_PREVIEW_PROMOTION_TARGET_COUNT,
                reason = "PremiumPreviewEntryShapeMismatch",
            )
            return@execute
        }

        val destination = "${destinationField.definingClass}->${destinationField.name}:${destinationField.type}"
        val noDestination = "${destinationField.type}->$NO_DESTINATION:${destinationField.type}"
        // v0: 誘導するかどうか、v1: 差し替える model、v2/v3: タップ先の比較。
        match.method.addInstructionsWithLabels(
            0,
            """
                move-object/from16 v1, v${injection.bannerRegister}
                const/4 v0, 0x0
                if-eqz v1, :linimalBannerReady
                iget-object v2, v1, $destination
                sget-object v3, $noDestination
                if-eq v2, v3, :linimalBannerReady
                const/4 v0, 0x1
                :linimalBannerReady
                invoke-static { v1, v0 }, $PREVIEW_BANNER_HOOK
                move-result-object v1
                check-cast v1, $bannerType
                move-object/from16 v${injection.bannerRegister}, v1
                move-object/from16 v1, v${injection.menuItemRegister}
                invoke-static { v1 }, $PROMOTION_MENU_ITEM_HOOK
                move-result-object v1
                check-cast v1, $menuItemType
                move-object/from16 v${injection.menuItemRegister}, v1
            """.trimIndent(),
        )

        patchStatusCollector.record(
            patchId = PatchId.PREMIUM_PREVIEW_PROMOTION,
            expectedTargetCount = PREMIUM_PREVIEW_PROMOTION_TARGET_COUNT,
            actualTargetCount = PREMIUM_PREVIEW_PROMOTION_TARGET_COUNT,
            reason = "PremiumPreviewPromotionGuarded",
        )
    }
}

/** 0 件は TARGET_NOT_FOUND、見つかったうえで適用しなかった場合は ERROR として残します。 */
private fun recordUnapplied(matchCount: Int, reason: String) {
    recordUnappliedFeatureStatus(
        listOf(PatchId.PREMIUM_PREVIEW_PROMOTION),
        expectedTargetCount = PREMIUM_PREVIEW_PROMOTION_TARGET_COUNT,
        matchCount = matchCount,
        reason = reason,
    )
}

/** バナー model と誘導行 model をそれぞれ 1 つずつ取り、プレビュー Activity の型も受け取る composable。 */
internal fun isPreviewScreenSignature(
    parameterTypes: List<String>,
    bannerType: String,
    menuItemType: String,
): Boolean = parameterTypes.count { it == bannerType } == 1 &&
    parameterTypes.count { it == menuItemType } == 1 &&
    parameterTypes.any { it.startsWith(CHAT_HISTORY_PREVIEW_ACTIVITY_PREFIX) }

/**
 * 候補のうち、ほかの候補から呼ばれないものだけを返します。画面本体は縦横の子 composable を呼ぶため、
 * 最上位の 1 件を書き換えれば子にも差し替え後の値が渡ります。自分自身の呼び出しは数えません。
 */
internal fun previewScreenRoots(candidates: List<Method>): List<Method> {
    val calledByOthers = candidates.flatMap { candidate ->
        val self = methodKey(candidate)
        invokedMethodKeys(candidate).filter { it != self }
    }.toSet()
    return candidates.filter { methodKey(it) !in calledByOthers }
}

/**
 * バナー model の field のうち、タップ先を表す enum の field。enum は「誘導しない」値と Premium 特典への
 * 値をすべて持つものに限ります。1 件に絞れなければ null を返し、何も注入しません。
 */
internal fun chipDestinationField(
    bannerClass: ClassDef?,
    classLookup: (String) -> ClassDef?,
): FieldReference? = bannerClass?.instanceFields
    ?.filter { field -> isChipDestinationEnum(classLookup(field.type)) }
    ?.singleOrNull()

internal fun isChipDestinationEnum(classDef: ClassDef?): Boolean {
    if (classDef == null || classDef.superclass != ENUM) {
        return false
    }
    val constants = classDef.staticFields
        .filter { field -> field.type == classDef.type && AccessFlags.ENUM.isSet(field.accessFlags) }
        .map { it.name }
        .toSet()
    return NO_DESTINATION in constants && constants.containsAll(PREMIUM_DESTINATIONS)
}

internal data class PremiumPreviewPromotionInjection(
    val bannerRegister: Int,
    val menuItemRegister: Int,
)

/**
 * static method の引数 register を求めます。引数は末尾の register を占め、long / double は 2 つ使います。
 * 作業 register が足りない場合や、8bit に収まらない場合は null を返します。
 */
internal fun premiumPreviewPromotionInjection(
    parameterTypes: List<String>,
    registerCount: Int,
    bannerType: String,
    menuItemType: String,
): PremiumPreviewPromotionInjection? {
    if (parameterTypes.count { it == bannerType } != 1 || parameterTypes.count { it == menuItemType } != 1) {
        return null
    }
    val sizes = parameterTypes.map { if (it == "J" || it == "D") 2 else 1 }
    val firstParameterRegister = registerCount - sizes.sum()
    if (firstParameterRegister < PREMIUM_PREVIEW_SCRATCH_REGISTER_COUNT) {
        return null
    }
    fun registerOf(index: Int) = firstParameterRegister + sizes.take(index).sum()

    val bannerRegister = registerOf(parameterTypes.indexOf(bannerType))
    val menuItemRegister = registerOf(parameterTypes.indexOf(menuItemType))
    if (bannerRegister > MAX_EIGHT_BIT_REGISTER || menuItemRegister > MAX_EIGHT_BIT_REGISTER) {
        return null
    }
    return PremiumPreviewPromotionInjection(bannerRegister, menuItemRegister)
}

private fun methodKey(method: Method): String =
    methodKey(method.definingClass, method.name, method.parameterTypes.map { it.toString() }, method.returnType)

private fun methodKey(definingClass: String, name: String, parameters: List<String>, returnType: String) =
    "$definingClass->$name(${parameters.joinToString("")})$returnType"

private fun invokedMethodKeys(method: Method): List<String> =
    method.implementation?.instructions?.toList().orEmpty().mapNotNull { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@mapNotNull null
        methodKey(
            reference.definingClass,
            reference.name,
            reference.parameterTypes.map { it.toString() },
            reference.returnType,
        )
    }
