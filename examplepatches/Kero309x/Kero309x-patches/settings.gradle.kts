pluginManagement {
    repositories {
        mavenLocal()
        gradlePluginPortal()
        google()
        maven {
            name = "MorpheRegistry"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user").orNull
                    ?: providers.environmentVariable("GITHUB_ACTOR").orNull
                password = providers.gradleProperty("gpr.key").orNull
                    ?: providers.environmentVariable("GITHUB_TOKEN").orNull
            }
        }
    }
}

plugins {
    // Framework build plugin. This is a public build contract of the Morphe
    // ecosystem; no patch source is taken from it.
    id("app.morphe.patches") version "2.1.0"
}

rootProject.name = "Kero309xPatches"

include(":patches")
