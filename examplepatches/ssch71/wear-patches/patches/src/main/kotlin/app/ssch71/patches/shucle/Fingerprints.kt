/*
 * Copyright (C) 2026 ssch71
 */
package app.ssch71.patches.shucle

import app.morphe.patcher.Fingerprint

object ShucleMainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/hyundai/airlab/shucle/presenter/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
