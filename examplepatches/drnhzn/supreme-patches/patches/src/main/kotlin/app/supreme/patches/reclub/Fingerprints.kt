package app.supreme.patches.reclub

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object EntitlementInfoIsActiveFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfo;",
    name = "isActive",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "this",
            name = "isActive",
            type = "Z",
        ),
        opcode(Opcode.RETURN, MatchAfterImmediately()),
    ),
)

object EntitlementInfoMapFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/hybridcommon/mappers/EntitlementInfoMapperKt;",
    name = "map",
    returnType = "Ljava/util/Map;",
    parameters = listOf("Lcom/revenuecat/purchases/EntitlementInfo;"),
    filters = listOf(
        string("identifier"),
        string("isActive"),
        string("willRenew"),
    ),
)

object EntitlementInfosMapFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/hybridcommon/mappers/EntitlementInfosMapperKt;",
    name = "map",
    returnType = "Ljava/util/Map;",
    parameters = listOf("Lcom/revenuecat/purchases/EntitlementInfos;"),
    filters = listOf(
        string("all"),
        string("active"),
        string("verification"),
    ),
)

object CustomerInfoMapFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/hybridcommon/mappers/CustomerInfoMapperKt;",
    name = "map",
    returnType = "Ljava/util/Map;",
    parameters = listOf("Lcom/revenuecat/purchases/CustomerInfo;"),
    filters = listOf(
        string("entitlements"),
        string("activeSubscriptions"),
        string("originalAppUserId"),
    ),
)

object OkHttpClientBuilderFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/modules/network/OkHttpClientProvider;",
    name = "createClientBuilder",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Lokhttp3/OkHttpClient\$Builder;",
    parameters = emptyList(),
)

/** Factory-return path in {@code createClient()}. */
object OkHttpCreateClientFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/modules/network/OkHttpClientProvider;",
    name = "createClient",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Lokhttp3/OkHttpClient;",
    parameters = emptyList(),
)

/** Factory-return path in {@code createClient(Context)}. */
object OkHttpCreateClientContextFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/modules/network/OkHttpClientProvider;",
    name = "createClient",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Lokhttp3/OkHttpClient;",
    parameters = listOf("Landroid/content/Context;"),
)
