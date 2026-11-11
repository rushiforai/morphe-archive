rootProject.name = "nicoid-re-patches"

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

buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        // Use the AGP release with Gradle 10 compatibility fixes on Morphe's plugin classpath.
        classpath("com.android.tools.build:gradle:9.5.0")
    }
}

plugins {
    id("app.morphe.patches") version "1.3.4"
}

