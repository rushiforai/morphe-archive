rootProject.name = "morphe-patches"

pluginManagement {
    // Developer fallback when the published settings plugin is unavailable.
    file("build/local-deps/morphe-patches-gradle-plugin").takeIf { it.isDirectory }?.let {
        includeBuild(it)
    }
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
    id("app.morphe.patches") version "2.1.0"
    id("org.gradle.toolchains.foojay-resolver-convention") version "1.0.0"
}

settings {
    extensions {
        defaultNamespace = "app.morphe.extension"

        // Must resolve to an absolute path (not relative),
        // otherwise the extensions in subfolders will fail to find the proguard config.
        proguardFiles(rootProject.projectDir.resolve("extensions/proguard-rules.pro").toString())
    }
}

include(":patches:stub")

// Include morphe-patcher as composite builds if they exist locally
mapOf(
    "morphe-patcher" to "app.morphe:morphe-patcher",
).forEach { (libraryPath, libraryName) ->
    val libDir = file("../$libraryPath").takeIf { it.isDirectory }
        ?: file("build/local-deps/$libraryPath")
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
(
    file("../morphe-patches-library").takeIf { it.isDirectory }
        ?: file("build/local-deps/morphe-patches-library")
).let { libDir ->
    if (libDir.exists()) {
        includeBuild(libDir) {
            dependencySubstitution {
                substitute(module("app.morphe:morphe-patches-library")).using(project(":patch-library"))
                substitute(module("app.morphe:morphe-extensions-library")).using(project(":extension-library"))
            }
        }
    }
}
