rootProject.name = "affine-no-gms-patches"

val localPatcher = file(".build-deps/morphe-patcher")
if (localPatcher.exists()) {
    includeBuild(localPatcher) {
        dependencySubstitution {
            substitute(module("app.morphe:morphe-patcher")).using(project(":"))
        }
    }
}

pluginManagement {
    includeBuild(".build-deps/morphe-patches-gradle-plugin")

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
    id("app.morphe.patches") version "1.3.4"
}