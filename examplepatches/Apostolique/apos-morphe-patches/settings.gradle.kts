rootProject.name = "apos-morphe-patches"

pluginManagement {
    repositories {
        mavenLocal()
        gradlePluginPortal()
        google()
        // The Morphe patcher and plugin are published to GitHub Packages, which
        // requires a token with the `read:packages` scope even for public
        // artifacts. See README.md.
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user").getOrElse(System.getenv("GITHUB_ACTOR"))
                password = providers.gradleProperty("gpr.key").getOrElse(System.getenv("GITHUB_TOKEN"))
            }
        }
        maven { url = uri("https://jitpack.io") }
    }
}

dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "1.3.2-dev.1"
}

// The plugin includes `patches` and every extensions/*/build.gradle.kts it
// finds, so a second app is a directory rather than a line here.
