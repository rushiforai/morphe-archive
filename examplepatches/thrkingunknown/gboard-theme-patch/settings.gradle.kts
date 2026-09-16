rootProject.name = "gboard-amoled-themes"

// The release workflow fetches these exact tagged sources before Gradle evaluates
// this file. Keeping both parts of the Morphe toolchain local makes builds work
// without a GitHub Packages token and pins the API used to produce the .mpp.
pluginManagement {
    val localMorphePlugin = rootDir.resolve("morphe-deps/morphe-patches-gradle-plugin")
    if (localMorphePlugin.isDirectory) {
        includeBuild(localMorphePlugin)
    }

    repositories {
        // The Morphe settings-plugin marker and patcher runtime are published here.
        // Gradle Portal and JitPack do not mirror them.
        maven {
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = System.getenv("GITHUB_ACTOR") ?: "x-access-token"
                password = System.getenv("GITHUB_TOKEN") ?: ""
            }
        }
        gradlePluginPortal()
        google()
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "1.3.4"
}

val localMorphePatcher = rootDir.resolve("morphe-deps/morphe-patcher")
if (localMorphePatcher.isDirectory) {
    includeBuild(localMorphePatcher) {
        dependencySubstitution {
            substitute(module("app.morphe:morphe-patcher")).using(project(":"))
        }
    }
}
