package com.dumbsoftware.t2c.tracking

import app.morphe.patcher.patch.rawResourcePatch
import com.dumbsoftware.t2c.COMPATIBILITY_T2C
import com.dumbsoftware.t2c.util.updateEnvVariables

@Suppress("unused")
val removeUmamiPatch = rawResourcePatch(
    name = "Remove Umami tracking",
    description = "Disables Umami tracking safely by modifying existing environment values."
) {
    compatibleWith(COMPATIBILITY_T2C)

    execute {
        updateEnvVariables(
            fileNames = listOf(".env.prod", ".env.dev"),
            updates = mapOf(
                "UMAMI_ENDPOINT" to "http://127.0.0.1",
                "UMAMI_WEBSITE" to "",
                "UMAMI_HOSTNAME" to "127.0.0.1"
            )
        )
    }
}