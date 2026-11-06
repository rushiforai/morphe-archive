rootProject.name = "proteus-patches"

pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                // Building locally: put your GitHub username + PAT (read:packages) in
                // gradle.properties as gpr.user / gpr.key.
                username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
                password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
            }
        }
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    // The Morphe patches plugin. It auto-includes the `patches` and
    // `extensions/extension` modules and provides the `buildAndroid` task
    // that produces patches-*.mpp (Proteus Patches bundle).
    // Forked lineage: Doom's Morphe Patches recipe.
    id("app.morphe.patches") version "1.3.3"
}
