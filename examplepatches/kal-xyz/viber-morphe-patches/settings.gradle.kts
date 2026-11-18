rootProject.name = "viber-morphe-patches"

pluginManagement {
    repositories {
        mavenLocal()
        gradlePluginPortal()
        google()
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user")
                    .getOrElse(System.getenv("GITHUB_ACTOR") ?: "kal-xyz")
                password = providers.gradleProperty("gpr.key")
                    .getOrElse(System.getenv("PAT") ?: System.getenv("GITHUB_TOKEN") ?: "")
            }
        }
        maven { url = uri("https://jitpack.io") }
        mavenCentral()
    }
}

plugins {
    id("app.morphe.patches") version "1.3.4"
    id("org.jetbrains.kotlin.jvm") version "1.9.23" apply false
}

include(":patches")
include(":extensions:viber")
