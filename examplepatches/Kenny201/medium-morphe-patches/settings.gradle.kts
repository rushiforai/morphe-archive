rootProject.name = "medium-morphe-patches"

pluginManagement {
    if (file("../morphe-patches-gradle-plugin").exists()) {
        includeBuild("../morphe-patches-gradle-plugin")
    }
    repositories {
        gradlePluginPortal()
        google()
        mavenCentral()
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

if (file("../morphe-patcher").exists()) {
    includeBuild("../morphe-patcher")
}

plugins {
    id("app.morphe.patches") version "2.1.0"
}
