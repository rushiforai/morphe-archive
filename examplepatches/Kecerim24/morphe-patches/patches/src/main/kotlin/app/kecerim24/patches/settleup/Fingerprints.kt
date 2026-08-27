package app.kecerim24.patches.settleup

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.instanceOf
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val IS_PREMIUM_CLASS =
    "Lio/stepuplabs/settleup/feature/premium/domain/ObserveIsPremiumUseCase\$IsPremium;"

/**
 * Constructor of the data class that carries the whole premium state:
 *
 * ```
 * class IsPremium(
 *     val premiumFeatures: Map<PremiumFeature, Boolean>,
 *     val showAds: Boolean,
 *     val groupId: String,
 *     val groupColor: GroupColor,
 *     val groupName: String,
 * )
 * ```
 *
 * Built in `ObserveIsPremiumUseCase`, which resolves `showAds` to false when an individual
 * subscription is active, when the group has valid group premium, or when the legacy
 * `LEGACY_NO_ADS_PURCHASE` preference is set.
 */
internal object IsPremiumConstructorFingerprint : Fingerprint(
    definingClass = IS_PREMIUM_CLASS,
    name = "<init>",
    // The GroupColor parameter is declared as a bare object type in case it gets obfuscated.
    parameters = listOf("Ljava/util/Map;", "Z", "Ljava/lang/String;", "L", "Ljava/lang/String;")
)

/**
 * `BeforeAdActivity.start(originActivity, groupId, groupColor, groupName)`, the single entry
 * point to the screen that plays a rewarded ad. R8 moves this companion method into an
 * unrelated class, so it is matched on its parameters, its string literals and the
 * `startActivity` call rather than on the class name.
 */
internal object BeforeAdActivityStartFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(
        "Landroid/app/Activity;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;"
    ),
    filters = listOf(
        // Kotlin null checks on the named parameters.
        string("originActivity"),
        string("groupId"),
        string("groupName"),
        // Intent extras.
        string("GROUP_ID"),
        string("GROUP_COLOR"),
        string("GROUP_NAME"),
        methodCall(
            definingClass = "Landroid/app/Activity;",
            name = "startActivity"
        )
    )
)

/**
 * `Plan.isPremiumForFeature(feature)` in the legacy MVP screens:
 *
 * ```
 * fun Plan.isPremiumForFeature(feature: SuperuserPremiumFeature) =
 *     this is PremiumPlan || (this is BasicPlan && superuserPremiumFeature == feature)
 * ```
 *
 * Every pre-Compose screen (groups, permissions, transactions, exchange rates, ...) gates
 * its premium features through this one function.
 */
internal object IsPremiumForFeatureFingerprint : Fingerprint(
    definingClass = "Lio/stepuplabs/settleup/util/extensions/ModelExtensionsKt;",
    name = "isPremiumForFeature",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    filters = listOf(
        instanceOf("/PremiumPlan;"),
        instanceOf("/BasicPlan;")
    )
)

/**
 * `TransactionViewModel.isPremium(feature)` in the Compose transaction screen. Returns true
 * when [IsPremiumConstructorFingerprint]'s `premiumFeatures` map holds true for the feature,
 * and otherwise falls through to code that opens the premium upsell sheet.
 */
internal object TransactionViewModelIsPremiumFingerprint : Fingerprint(
    definingClass = "Lio/stepuplabs/settleup/feature/transaction/presentation/TransactionViewModel;",
    name = "isPremium",
    returnType = "Z",
    filters = listOf(
        fieldAccess(
            definingClass = IS_PREMIUM_CLASS,
            name = "premiumFeatures",
            type = "Ljava/util/Map;",
            opcode = Opcode.IGET_OBJECT
        ),
        methodCall(
            definingClass = "Ljava/util/Map;",
            name = "get"
        )
    )
)
