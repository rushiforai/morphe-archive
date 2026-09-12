/*
 * Copyright 2026 BlueIT contributors
 */
package app.morphe.patches.tiktok.interaction.seen

import app.morphe.patcher.Fingerprint

internal object PlayerProgressFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "J", "J"),
    custom = { method, classDef ->
        method.name == "onPlayProgressChange" &&
            classDef.endsWith("/PlayerController;")
    },
)
