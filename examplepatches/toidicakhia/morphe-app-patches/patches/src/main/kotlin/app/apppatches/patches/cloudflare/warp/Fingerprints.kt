package app.apppatches.patches.cloudflare.warp

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

val AccountDataConstructorFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/cloudflare/app/data/warpapi/WarpPlusState;",
        "Ljava/lang/Long;",
        "Ljava/lang/Long;",
        "Lorg/threeten/bp/LocalDateTime;",
        "Ljava/lang/Integer;",
        "Ljava/lang/String;",
        "Lcom/cloudflare/app/data/warpapi/Managed;",
        "Lcom/cloudflare/app/data/warpapi/AccountRole;"
    ),
    custom = { _, classDef ->
        classDef.type == "Lcom/cloudflare/app/data/warpapi/AccountData;"
    }
)

val AnalyticsServiceDispatchFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Lcom/cloudflare/app/domain/analytics/AnalyticsService;",
        "Landroid/os/Bundle;"
    ),
    custom = { _, classDef ->
        classDef.type == "Lcom/cloudflare/app/domain/analytics/AnalyticsService;"
    }
)

val WarpCertificatePinnerCheckFingerprint = Fingerprint(
    definingClass = "Lokhttp3/CertificatePinner;",
    name = "check",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/List;"),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)
