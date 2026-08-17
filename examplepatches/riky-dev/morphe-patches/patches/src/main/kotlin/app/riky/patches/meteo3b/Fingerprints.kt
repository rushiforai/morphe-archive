package app.riky.patches.meteo3b

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object EvaluateProviderFingerprint : Fingerprint(
    definingClass = "Lcom/Meteosolutions/Meteo3b/manager/adv/BannerManager;",
    name = "evaluateProvider",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Lcom/Meteosolutions/Meteo3b/manager/adv/BannerManager\$BANNER_TYPE;")
)

internal object EvaluateFallbackFingerprint : Fingerprint(
    definingClass = "Lcom/Meteosolutions/Meteo3b/manager/adv/BannerManager;",
    name = "evaluateFallback",
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "Ljava/lang/String;",
    parameters = listOf()
)

internal object IsPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/Meteosolutions/Meteo3b/data/models/User;",
    name = "isPremium",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf()
)

internal object IsConsentlessPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/Meteosolutions/Meteo3b/data/models/User;",
    name = "isConsentlessPremium",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf()
)