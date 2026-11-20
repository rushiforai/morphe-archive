rootProject.name = "signal-patch"

pluginManagement {
    repositories {
        mavenLocal()
        gradlePluginPortal()
        google()
        // Morphe artifacts on GitHub Packages.
        // ~/.gradle/gradle.properties : gpr.user + gpr.key (read:packages)
        // or GITHUB_ACTOR / GITHUB_TOKEN
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
    id("app.morphe.patches") version "2.0.0"
}

settings {
    extensions {
        defaultNamespace = "app.modprod.extension"
    }
}
