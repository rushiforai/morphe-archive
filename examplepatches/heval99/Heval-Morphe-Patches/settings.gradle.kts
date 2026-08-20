rootProject.name = "morphe-patches"

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

plugins {
    id("app.morphe.patches") version "1.3.3"
}

// The FotMob extension depends on a plain Android library module for shared
// extension code (app.template.extension.shared). Extension bundle modules
// directly under extensions/ (extensions/extension, extensions/shared,
// extensions/fotmob) are auto-discovered by the app.morphe.patches plugin,
// but this nested library submodule needs to be included explicitly.
include(":extensions:shared:library")
