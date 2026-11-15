rootProject.name = "morphe-patches-MovieLab"

pluginManagement {
    repositories {
        mavenLocal()
        gradlePluginPortal()
        google()
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user").getOrElse(System.getenv("GITHUB_ACTOR"))
                password = providers.gradleProperty("gpr.key").getOrElse(System.getenv("GITHUB_TOKEN"))
            }
        }
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "2.1.0-dev.1"
}

// Include morphe-patcher as composite build if it exists locally
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

// Include morphe-patches-library as composite build if it exists locally
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
