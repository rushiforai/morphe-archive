rootProject.name = "gmaps-patches"

pluginManagement {
    // Plugin 1.3.3 reads these credentials eagerly while applying its settings.
    // Fail before plugin application with the documented setup instead of its
    // null-provider IllegalArgumentException. Never use placeholder credentials.
    val githubUser = providers.gradleProperty("gpr.user")
        .orElse(providers.environmentVariable("GITHUB_ACTOR"))
        .orNull
    val githubToken = providers.gradleProperty("gpr.key")
        .orElse(providers.environmentVariable("GITHUB_TOKEN"))
        .orNull
    if (githubUser.isNullOrBlank() || githubToken.isNullOrBlank()) {
        throw GradleException(
            "Morphe requires GitHub Packages credentials. Set gpr.user and gpr.key " +
                "in GRADLE_USER_HOME/gradle.properties using a classic PAT with read:packages. " +
                "See docs/build-setup.md. Do not use dummy credentials or --offline as an authentication fix.",
        )
    }
    repositories {
        mavenLocal()
        gradlePluginPortal()
        google()
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = githubUser
                password = githubToken
            }
        }
        // Obtain baksmali/smali from source builds - https://github.com/iBotPeaches/smali
        // Remove when official smali releases come out again.
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "1.3.3"
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
// It is a multi-module project, so each artifact maps to a specific subproject.
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
