package com.dowjames.patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

/**
 * Numeric config value getter: com.waze.config.c.a()Ljava/lang/Long;
 *
 * This is the accessor used to read numeric config values such as the
 * Android Auto heads-up (police/enforcement) alert distance.
 */
object NumericConfigGetterFingerprint : Fingerprint(
    definingClass = "Lcom/waze/config/c;",
    name = "a",
    returnType = "Ljava/lang/Long;",
    filters = listOf(
        methodCall(
            definingClass = "Lcom/waze/config/h;",
            name = "a",
        )
    )
)
