rootProject.name = "jam-patches"

pluginManagement {
    includeBuild("morphe-patches-gradle-plugin")
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
    id("app.morphe.patches") version "1.3.4"
}

settings {
    extensions {
        defaultNamespace = "app.morphe.extension"
        proguardFiles(rootProject.projectDir.resolve("extensions/proguard-rules.pro").toString())
    }
}

include(":patches:stub")

dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.PREFER_SETTINGS)
    repositories {
        google()
        mavenCentral()
        maven("https://www.jitpack.io") {
            content { includeGroupByRegex("com\\.github\\.MorpheApp.*") }
        }
        maven("https://maven.pkg.github.com/MorpheApp/registry") {
            credentials {
                username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
                password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
            }
        }
    }
}

mapOf("morphe-patcher" to "app.morphe:morphe-patcher").forEach { (path, module) ->
    val dir = file(path)
    if (dir.exists()) includeBuild(dir) {
        dependencySubstitution { substitute(module(module)).using(project(":")) }
    }
}

file("morphe-patches-library").let { dir ->
    if (dir.exists()) includeBuild(dir) {
        dependencySubstitution {
            substitute(module("app.morphe:morphe-patches-library")).using(project(":patch-library"))
            substitute(module("app.morphe:morphe-extensions-library")).using(project(":extension-library"))
        }
    }
}


