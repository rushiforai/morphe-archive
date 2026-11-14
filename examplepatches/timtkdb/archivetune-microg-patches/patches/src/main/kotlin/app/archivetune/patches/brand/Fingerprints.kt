package app.archivetune.patches.brand

import app.morphe.patcher.Fingerprint

/**
 * core's YouTube.booleanValue(JsonObject, String): Boolean? , the helper behind
 * `renderer.booleanValue("hasChannel") ?: true` in parseAccountChannel() and accountDataSyncId().
 * Checked against the real 15.1.0 APK: `public static`, 3 registers (2 parameters + 1 free local), and both
 * "hasChannel" checks (inside R8-merged lambdas with unstable class names) call this one method.
 */
internal object JsonBooleanValueFingerprint : Fingerprint(
    definingClass = "Lmoe/rukamori/archivetune/innertube/YouTube;",
    name = "booleanValue",
    parameters = listOf("Lkotlinx/serialization/json/JsonObject;", "Ljava/lang/String;"),
    returnType = "Ljava/lang/Boolean;",
)
