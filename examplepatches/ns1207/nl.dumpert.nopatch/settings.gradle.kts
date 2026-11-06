rootProject.name = "morphe-patches-template"

pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        mavenCentral()

        // GitHub Packages requires credentials (even for reading many packages)
        maven {
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
    id("app.morphe.patches") version "1.3.4"
}
