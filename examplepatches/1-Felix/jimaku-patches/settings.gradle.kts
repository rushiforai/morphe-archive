rootProject.name = "jimaku-patches"

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
    id("app.morphe.patches") version "2.1.2"
}

settings {
    extensions {
        defaultNamespace = "app.jimaku.extension"

        // Must be an absolute path, or the extension projects don't find it.
        proguardFiles(settingsDir.resolve("extensions/proguard-rules.pro").toString())
    }
}

// Signatures of the Morphe Patches classes the extension calls; compile only, never shipped.
include(":stub")
