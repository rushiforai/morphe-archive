rootProject.name = "morphe-patches-template"

pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user").orNull
                password = providers.gradleProperty("gpr.key").orNull
            }
        }
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "1.3.3"
}
