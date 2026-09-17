/*
 * The Morphe Patches Gradle plugin and `app.morphe:morphe-patcher` are published to GitHub Packages
 * (maven.pkg.github.com/MorpheApp/registry), which requires credentials with `packages:read`.
 *
 * This repository therefore vendors both upstreams (fetched by `tools/vendor-upstream.sh` from the
 * public GitHub source archives) and wires them in as composite builds, so the build is
 * reproducible without any secret token — locally and in CI.
 */
pluginManagement {
    // Build the Gradle plugin from the vendored upstream source.
    includeBuild("vendor/morphe-patches-gradle-plugin-1.3.3")

    repositories {
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
    id("app.morphe.patches") version "1.3.3"
}

rootProject.name = "telegram-patches"

// Substitute the published patcher with the vendored upstream source build.
includeBuild("vendor/morphe-patcher-1.8.0") {
    dependencySubstitution {
        substitute(module("app.morphe:morphe-patcher")).using(project(":"))
    }
}
