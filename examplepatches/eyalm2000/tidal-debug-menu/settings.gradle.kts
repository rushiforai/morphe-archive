rootProject.name = "tidal-debug-menu"

pluginManagement {
    val isMorphe = providers.gradleProperty("morphe").map { it.toBoolean() }.getOrElse(false)
    val githubUser = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
    val githubToken = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")

    repositories {
        mavenLocal()
        gradlePluginPortal()
        google()
        maven {
            name = if (isMorphe) "MorphePackages" else "ReVancedPackages"
            url = if (isMorphe) uri("https://maven.pkg.github.com/MorpheApp/registry") else uri("https://maven.pkg.github.com/revanced/registry")
            credentials {
                username = githubUser
                password = githubToken
            }
        }
        maven { url = uri("https://jitpack.io") }
        mavenCentral()
    }
}

plugins {
    if (providers.gradleProperty("morphe").map { it.toBoolean() }.getOrElse(false)) {
        val githubUser = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
        val githubToken = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
        if (githubUser.isNullOrBlank() || githubToken.isNullOrBlank()) {
            throw GradleException(
                "Morphe mode requires GitHub Packages credentials. " +
                    "Set gpr.user/gpr.key in gradle.properties or GITHUB_ACTOR/GITHUB_TOKEN in environment."
            )
        }
        id("app.morphe.patches") version "1.2.0"
    } else {
        id("app.revanced.patches") version "1.0.0-dev.5"
    }
}

include(":shared-core")

val isMorpheMode = providers.gradleProperty("morphe").map { it.toBoolean() }.getOrElse(false)
project(":patches").projectDir = if (isMorpheMode) file("morphe-patches") else file("revanced-patches")