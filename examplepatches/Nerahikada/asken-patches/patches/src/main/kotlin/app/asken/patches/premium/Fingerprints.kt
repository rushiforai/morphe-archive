package app.asken.patches.premium

import app.morphe.patcher.Fingerprint

// Pinned to the sole X7.d.a(String) method by name: behaviour-only matching (ArrayList build/isEmpty) was ambiguous app-wide. The obfuscated name is version-specific, so this is validated for 9.8.0 (other targets are isExperimental).
object PremiumStatusParserFingerprint : Fingerprint(
    definingClass = "LX7/d;",
    name = "a",
    returnType = "L",
    parameters = listOf("Ljava/lang/String;")
)

// NutritionalRankingResponse.getEnable_full_nut_ranking(): the server ships the full ranking WITH real values to free accounts; this single client-trusted flag is the only gate (read solely in NutritionalRankingResponseKt.translate), so forcing it to 1 reveals the already-downloaded values. Class/method names are un-obfuscated (Gson data model).
object NutritionRankingFullFlagFingerprint : Fingerprint(
    definingClass = "Lcom/askendiet/asken/infrastructure/datasource/remote/response/advice/NutritionalRankingResponse;",
    name = "getEnable_full_nut_ranking",
    returnType = "I",
    parameters = listOf()
)
