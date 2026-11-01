rootProject.name = "sarvo-patches"

pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("MORPHE_GPR_USER") ?: System.getenv("GITHUB_ACTOR")
                password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("MORPHE_GPR_KEY") ?: System.getenv("GITHUB_TOKEN")
            }
        }
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "2.1.0-dev.1"
}

dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
        maven {
            name = "MorphePatchesLibrary"
            url = uri("https://maven.pkg.github.com/MorpheApp/morphe-patches-library")
            credentials {
                username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("MORPHE_GPR_USER") ?: System.getenv("GITHUB_ACTOR")
                password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("MORPHE_GPR_KEY") ?: System.getenv("GITHUB_TOKEN")
            }
        }
    }
}
