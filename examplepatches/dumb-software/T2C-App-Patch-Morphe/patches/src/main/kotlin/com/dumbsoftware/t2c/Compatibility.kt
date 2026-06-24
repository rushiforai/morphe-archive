package com.dumbsoftware.t2c

import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.AppTarget

val COMPATIBILITY_T2C = Compatibility(
    name = "T2C",
    packageName = "fr.t2c.t2c",
    targets = listOf(
        AppTarget("3.2.0")
    )
)