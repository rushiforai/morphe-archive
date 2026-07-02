package com.dumbsoftware.t2c.features

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.stringOption
import com.dumbsoftware.t2c.COMPATIBILITY_T2C
import com.dumbsoftware.t2c.util.updateEnvVariables

@Suppress("unused")
val customEndpointPatch = rawResourcePatch(
    name = "Change API endpoint",
    description = "Points the app to a custom backend server by modifying environment variables."
) {
    compatibleWith(COMPATIBILITY_T2C)

    val customUrl by stringOption(
        key = "api_url",
        title = "API URL",
        description = "Enter the base URL for the API (e.g., https://api.t2c.fr)",
        default = "https://api.t2c.fr"
    )

    execute {
        updateEnvVariables(
            fileNames = listOf(".env.prod"),
            updates = mapOf("API_URL" to (customUrl ?: "https://api.t2c.fr"))
        )
    }
}