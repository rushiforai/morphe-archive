package com.dumbsoftware.t2c.tracking

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.stringOption
import com.dumbsoftware.t2c.COMPATIBILITY_T2C
import com.dumbsoftware.t2c.util.updateEnvVariables

@Suppress("unused")
val customUmamiEndpointPatch = rawResourcePatch(
    name = "Custom Umami endpoint",
    description = "Points the app to a custom Umami analytics server."
) {
    compatibleWith(COMPATIBILITY_T2C)

    val customEndpoint by stringOption(
        key = "umami_endpoint",
        title = "Umami Endpoint",
        description = "Enter the base URL for Umami (e.g., https://analytics.t2c.fr/api/send)",
        default = "https://analytics.t2c.fr/api/send"
    )

    val customWebsite by stringOption(
        key = "umami_website",
        title = "Umami Website ID",
        description = "Enter your Umami Website ID",
        default = ""
    )

    execute {
        updateEnvVariables(
            fileNames = listOf(".env.prod", ".env.dev"),
            updates = mapOf(
                "UMAMI_ENDPOINT" to (customEndpoint ?: ""),
                "UMAMI_WEBSITE" to (customWebsite ?: "")
            )
        )
    }
}