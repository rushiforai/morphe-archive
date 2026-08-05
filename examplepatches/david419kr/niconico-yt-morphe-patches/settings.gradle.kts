rootProject.name = "niconico-yt-android-patches"

pluginManagement {
    val localPlugin = settingsDir.parentFile.resolve("morphe-patches-gradle-plugin")
    if (localPlugin.isDirectory) {
        includeBuild(localPlugin.absolutePath)
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
    id("app.morphe.patches") version "1.3.3"
}

val localPatcher = file("../morphe-patcher")
if (localPatcher.isDirectory) {
    includeBuild(localPatcher) {
        dependencySubstitution {
            substitute(module("app.morphe:morphe-patcher")).using(project(":"))
        }
    }
}
