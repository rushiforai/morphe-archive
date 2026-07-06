package app.morphe.patches.eksi.ad

import app.morphe.patcher.Fingerprint

internal object AdUnitIfNeededFingerprint : Fingerprint(
    definingClass = "Lcom/eksiteknoloji/eksisozluk/entities/ads/AdUnitType${'$'}Companion;",
    name = "getAdUnitIfNeeded",
    returnType = "Ljava/lang/String;",
    parameters = listOf(
        "I",
        "Lcom/eksiteknoloji/eksisozluk/entities/ads/AdUnitType;",
    ),
)

internal object AdViewLoaderFingerprint : Fingerprint(
    definingClass = "L_/wo;",
    name = "b",
    returnType = "L_/ci;",
    parameters = listOf("Ljava/lang/String;"),
)

internal object StartupAdLoaderFingerprint : Fingerprint(
    definingClass = "L_/wo;",
    name = "e",
    returnType = "V",
    parameters = listOf(),
)

internal object InitializeAdsOperationsFingerprint : Fingerprint(
    definingClass = "Lcom/eksiteknoloji/eksisozluk/BaseApplication;",
    name = "initializeAdsOperations",
    returnType = "V",
    parameters = listOf(),
)
