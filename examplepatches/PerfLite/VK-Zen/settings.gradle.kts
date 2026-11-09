rootProject.name = "morphe-patches-vk"

pluginManagement {
    val gprUser = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
    val gprKey = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
    repositories {
        mavenLocal()
        gradlePluginPortal()
        google()
        maven { url = uri("https://jitpack.io") }
        if (gprUser != null && gprKey != null) {
            maven {
                name = "GitHubPackages"
                url = uri("https://maven.pkg.github.com/MorpheApp/registry")
                credentials {
                    username = gprUser
                    password = gprKey
                }
            }
        }
    }
}

plugins {
    id("app.morphe.patches") version "2.1.0-dev.1"
}

settings {
    extensions {
        defaultNamespace = "app.morphe.extension"

        proguardFiles(rootProject.projectDir.resolve("extensions/proguard-rules.pro").toString())
    }
}

include(":patches:stub")
include(":extensions:shared:library")
include(":extensions:vk")

// Include morphe-patcher as composite builds if they exist locally
mapOf(
    "morphe-patcher" to "app.morphe:morphe-patcher",
).forEach { (libraryPath, libraryName) ->
    val libDir = file("../$libraryPath")
    if (libDir.exists()) {
        includeBuild(libDir) {
            dependencySubstitution {
                substitute(module(libraryName)).using(project(":"))
            }
        }
    }
}

// Include morphe-patches-library as composite build if it exists locally.
file("../morphe-patches-library").let { libDir ->
    if (libDir.exists()) {
        includeBuild(libDir) {
            dependencySubstitution {
                substitute(module("app.morphe:morphe-patches-library")).using(project(":patch-library"))
                substitute(module("app.morphe:morphe-extensions-library")).using(project(":extension-library"))
            }
        }
    }
}