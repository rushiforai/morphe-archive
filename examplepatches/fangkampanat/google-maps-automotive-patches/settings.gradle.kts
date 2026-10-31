rootProject.name = "maps-automotive-patches"

pluginManagement {
    // The Morphe plugin reads these credentials eagerly while applying its settings.
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
    id("app.morphe.patches") version "2.0.0"
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

// No composite builds: the sibling ../morphe-patcher and ../morphe-patches-library checkouts stay
// on 1.5.2/1.4.1 for phone Maps. This project uses the published patcher/library 2.0.1 artifacts
// (plugin 2.0.0) from GitHub Packages.
