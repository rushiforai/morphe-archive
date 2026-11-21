import app.morphe.patches.gradle.SettingsExtension

rootProject.name = "F4T"

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

// R8 keeps the extension DEX small; debug bundles skip it so stack traces stay readable.
val noMinify = providers.gradleProperty("noMinify").orNull == "true"

configure<SettingsExtension> {
    extensions {
        if (!noMinify) {
            proguardFiles("proguard-rules.pro")
        }
    }
}

