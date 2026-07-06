package com.dumbsoftware.t2c.features

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.stringOption
import com.dumbsoftware.t2c.COMPATIBILITY_T2C

@Suppress("unused")
val forceEnvironmentPatch = rawResourcePatch(
    name = "Force environment",
    description = "Replaces the production environment variables with the developer or local ones."
) {
    compatibleWith(COMPATIBILITY_T2C)

    val environment by stringOption(
        key = "environment",
        title = "Environment",
        description = "Select the environment to force.",
        default = "dev",
        values = mapOf("Developer" to "dev", "Local" to "local")
    )

    execute {
        val prodEnv = get("assets/flutter_assets/.env.prod") ?: return@execute
        val targetEnvFile = if (environment == "local") ".env.local" else ".env.dev"
        val newEnv = get("assets/flutter_assets/$targetEnvFile") ?: return@execute

        prodEnv.writeText(newEnv.readText())
    }
}
