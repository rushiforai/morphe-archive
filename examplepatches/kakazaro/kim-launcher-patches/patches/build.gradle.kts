group = "app.morphe"

patches {
    about {
        name = "Kim Launcher Patches"
        description = "Morphe patches for Kim Launcher (com.kimkim) on BYD DiLink head units"
        source = "https://github.com/kakazaro/kim-launcher-patches"
        author = "kakazaro"
        contact = "https://github.com/kakazaro/kim-launcher-patches/issues"
        website = "https://github.com/kakazaro/kim-launcher-patches"
        license = "GNU General Public License v3.0"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs = listOf("-Xcontext-parameters")
    }
}

// Entitlement JSON baked into AlwaysFreePlanPatch. Set KIM_PLAN_JSON in the environment or in the
// root .env (git-ignored); falls back to the free plan.
val defaultPlanJson = """{"plan":"free","status":"disabled","expiresAt":0,"paidUntil":0}"""
val planJson = providers.environmentVariable("KIM_PLAN_JSON").orElse(
    providers.fileContents(rootProject.layout.projectDirectory.file(".env")).asText.map { env ->
        env.lines().firstOrNull { it.startsWith("KIM_PLAN_JSON=") }
            ?.substringAfter("=")?.trim()?.removeSurrounding("'") ?: defaultPlanJson
    },
).orElse(defaultPlanJson)

val generatePlanJson by tasks.registering {
    val out = layout.buildDirectory.dir("generated/planJson")
    val json = planJson
    inputs.property("planJson", json)
    outputs.dir(out)
    doLast {
        val escaped = json.get().replace("\\", "\\\\").replace("\"", "\\\"").replace("$", "\$")
        out.get().file("app/morphe/patches/kim/PlanJson.kt").asFile.apply {
            parentFile.mkdirs()
            writeText("package app.morphe.patches.kim\n\ninternal const val FREE_PLAN_JSON = \"$escaped\"\n")
        }
    }
}
kotlin.sourceSets["main"].kotlin.srcDir(generatePlanJson)
