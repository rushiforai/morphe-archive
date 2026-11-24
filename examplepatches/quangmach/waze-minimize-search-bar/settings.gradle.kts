rootProject.name = "morphe-patches-template"

pluginManagement {
    if (file("../morphe-patches-gradle-plugin").exists()) {
        includeBuild("../morphe-patches-gradle-plugin")
    }
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

if (file("../morphe-patcher-reference").exists()) {
    includeBuild("../morphe-patcher-reference") {
        dependencySubstitution {
            substitute(module("app.morphe:morphe-patcher")).using(project(":"))
        }
    }
}
