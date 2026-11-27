rootProject.name = "reddit-download-media-patch"

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
    id("app.morphe.patches") version "2.1.1"
}

settings {
    extensions {
        defaultNamespace = "dev.jkcarino.extension"

        proguardFiles(
            rootProject
                .projectDir
                .resolve("extensions/proguard-rules.pro")
                .toString()
        )
    }
}
