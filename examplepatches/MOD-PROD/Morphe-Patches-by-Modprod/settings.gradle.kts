rootProject.name = "tizentube-mod-patches"

pluginManagement {
    repositories {
        mavenLocal()
        gradlePluginPortal()
        google()
        // Morphe artifacts (patcher, Gradle plugin, patches library) are published on GitHub Packages.
        // Any GitHub account works: set gpr.user / gpr.key in ~/.gradle/gradle.properties
        // (gpr.key = a classic token with the read:packages scope), or GITHUB_ACTOR / GITHUB_TOKEN.
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
                password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
            }
        }
        // smali is built from source and served by JitPack.
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "2.0.0"
}

settings {
    extensions {
        // Default namespace of the extension modules under extensions/.
        defaultNamespace = "app.gonzo.extension"
    }
}
