rootProject.name = "ytafterglow-morphe-patches"

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

plugins {
    // Plugin 2.1.0 with morphe-patcher 2.1.0 (gradle/libs.versions.toml) stamps
    // Patcher-Version 2.1.0, so the bundle loads in Morphe Desktop 1.20+ and
    // Manager builds that ship patcher 2.1.0, and in every newer host.
    id("app.morphe.patches") version "2.1.0"
}
