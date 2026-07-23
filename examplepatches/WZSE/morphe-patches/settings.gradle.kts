rootProject.name = "morphe-patches"

pluginManagement {
    // Local composite build of the Morphe Patches Gradle plugin so the build
    // works without a GitHubPackages token. The plugin repo is cloned at
    // ../morphe-patches-gradle-plugin (version 1.3.2).
    // TODO: remove this includeBuild and restore the GitHubPackages plugin once a
    // published 1.3.3-dev.2 (or stable) is available.
    includeBuild("../../morphe-patches-gradle-plugin")

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
        // Obtain baksmali/smali from source builds - https://github.com/iBotPeaches/smali
        // Remove when official smali releases come out again.
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    // Pinned to the locally-cloned plugin version (1.3.2) instead of 1.3.3-dev.2,
    // because 1.3.3-dev.2 is only on GitHubPackages (token required).
    // TODO: restore "1.3.3-dev.2" when building against a published plugin.
    id("app.morphe.patches") version "1.3.2"
}

settings {
    extensions {
        // Set to null so the plugin does not include the `extensions/` modules.
        // Our ZEE5 privacy patches are pure bytecode edits and require no extension
        // dex, so this avoids the Android SDK / R8 requirement during bundling.
        // TODO: remove (restore default "extensions") if extension-based patches are added.
        projectsPath = null

        defaultNamespace = "app.morphe.extension"
    }
}

include(":patches:stub")

// Include morphe-patcher as composite builds if they exist locally.
// NOTE: path is ../../ because this settings file lives in
// .../android/z5tv/morphe-patches, while the clone is at .../android/morphe-patcher.
mapOf(
    "morphe-patcher" to "app.morphe:morphe-patcher",
).forEach { (libraryPath, libraryName) ->
    val libDir = file("../../$libraryPath")
    if (libDir.exists()) {
        includeBuild(libDir) {
            dependencySubstitution {
                substitute(module(libraryName)).using(project(":"))
            }
        }
    }
}

// Include morphe-patches-library as composite build if it exists locally.
// It is a multi-module project, so each artifact maps to a specific subproject.
file("../../morphe-patches-library").let { libDir ->
    if (libDir.exists()) {
        includeBuild(libDir) {
            dependencySubstitution {
                substitute(module("app.morphe:morphe-patches-library")).using(project(":patch-library"))
                substitute(module("app.morphe:morphe-extensions-library")).using(project(":extension-library"))
            }
        }
    }
}
