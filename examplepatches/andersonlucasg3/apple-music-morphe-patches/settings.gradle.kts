rootProject.name = "applemusic-dilink-patches"

pluginManagement {
    repositories {
        // The Morphe patches Gradle plugin (app.morphe.patches) is already installed
        // in ~/.m2, so resolve it locally before hitting the network.
        mavenLocal()
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

settings {
    extensions {
        defaultNamespace = "app.morphe.extension.applemusic"
    }
}

// Standalone Android TV client that talks to the patched Apple Music engine
// through the framework MediaBrowser/MediaController API.
include(":tv-app")
