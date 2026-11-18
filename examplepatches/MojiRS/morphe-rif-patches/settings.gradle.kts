rootProject.name = "morphe-rif-patches"

pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
                password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
            }
        }
        maven { url = uri("https://jitpack.io") }
    }
}

// Plugin 2.1.1 for bundle signing (2026-11-17); morphe-patcher stays at Patcheddit's 2.0.0 (see
// gradle/libs.versions.toml), so every Manager that runs Patcheddit can run this bundle.
plugins {
    id("app.morphe.patches") version "2.1.1"
}
