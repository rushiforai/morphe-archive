package id.ikuradachi.patches.crunchyroll.ui.feed

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object HomeFeedInteractorConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("L", "L"),
    filters = listOf(
        string("homeFeedGateway"),
        string("arcVisibilityProvider"),
    ),
)

object HomeFeedArcInjectFingerprint : Fingerprint(
    classFingerprint = HomeFeedInteractorConstructorFingerprint,
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/util/List;", "L"),
    filters = listOf(
        string("call to 'resume' before 'invoke' with coroutine"),
        opcode(Opcode.NEW_INSTANCE),
        methodCall(
            definingClass = "Ljava/util/ArrayList;",
            name = "add",
            parameters = listOf("I", "Ljava/lang/Object;"),
            returnType = "V",
        ),
    ),
)

fun createFeedItemClassFingerprint(toStringPrefix: String) = Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(
        string(toStringPrefix),
    ),
)

fun createHomeFeedItemVisibilityFilterFingerprint(feedItemType: String) = Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf(feedItemType),
    filters = listOf(
        opcode(Opcode.INSTANCE_OF),
        methodCall(name = "isEmpty", returnType = "Z"),
        opcode(Opcode.INSTANCE_OF),
        methodCall(name = "isEmpty", returnType = "Z"),
    ),
)

object GoPremiumButtonViewFingerprint : Fingerprint(
    definingClass = "Lcom/ellation/crunchyroll/ui/button/GoPremiumButtonViewKt;",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("L", "L", "L", "L", "I", "I"),
    filters = listOf(
        string("onButtonClick"),
    ),
)

object PromotionalFabProviderConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("L", "L", "L"),
    filters = listOf(
        string("authenticatedUrlProvider"),
    ),
)

object PromotionalFabRenderFingerprint : Fingerprint(
    classFingerprint = PromotionalFabProviderConstructorFingerprint,
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("L", "L", "I"),
    filters = listOf(
        string("modifier"),
    ),
)

object ArcFabConfigProviderFingerprint : Fingerprint(
    returnType = "L",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
    filters = listOf(
        string("cr_arc"),
    ),
)

fun createArcFabRenderFingerprint(arcConfigProviderType: String) = Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("L", "L", "I"),
    filters = listOf(
        string("modifier"),
        methodCall(definingClass = arcConfigProviderType, parameters = emptyList()),
    ),
)

object SeriesPromoErrorEmitterFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/Exception;"),
    filters = listOf(
        string("Error loading series promo for "),
    ),
)

object SeriesPromoLoadFingerprint : Fingerprint(
    classFingerprint = SeriesPromoErrorEmitterFingerprint,
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("L", "Ljava/lang/String;", "L", "L"),
    filters = listOf(
        string("call to 'resume' before 'invoke' with coroutine"),
    ),
)

object SeriesPromoConfigClinitFingerprint : Fingerprint(
    name = "<clinit>",
    returnType = "V",
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    parameters = emptyList(),
    filters = listOf(
        string("com.ellation.crunchyroll.features.configs.SeriesGetTicketsPromoConfigImpl"),
    ),
)

object SeriesPromoConfigDeserializeFingerprint : Fingerprint(
    classFingerprint = SeriesPromoConfigClinitFingerprint,
    name = "deserialize",
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("L"),
    filters = listOf(
        opcode(Opcode.NEW_INSTANCE),
    ),
)

fun createSeriesPromoConfigIsEnabledFingerprint(configType: String) = Fingerprint(
    definingClass = configType,
    name = "isEnabled",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
)
