rootProject.name = "brave-patches"

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
        mavenCentral()
    }
}

plugins {
    id("app.morphe.patches") version "2.1.1"
}

settings {
    extensions {
        defaultNamespace = "dev.brave.extension"

        proguardFiles(
            rootProject
                .projectDir
                .resolve("extensions/proguard-rules.pro")
                .toString()
        )
    }
}
