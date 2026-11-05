rootProject.name = "waze-patches"

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
    id("app.morphe.patches") version "2.1.0"
}

// No extension module: the in-app "Forsigh Settings" menu was removed before release, so the bundle
// ships patches only. Its sources, plus the Waze stubs they needed, are kept in ../parked/ - outside
// the build, so they are neither compiled nor packaged. If a runtime-toggle screen is ever built, the
// right surface is Waze's own boolean-config toggle section, not a custom row.
