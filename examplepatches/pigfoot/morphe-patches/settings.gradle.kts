rootProject.name = "morphe-patches"

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
    id("app.morphe.patches") version providers.environmentVariable("MORPHE_PLUGIN_VERSION").get()
}

// The resolver discovers a fresh stable version for every CI job; no source pin.
dependencyResolutionManagement {
    versionCatalogs {
        create("libs") {
            version("morphe-patcher", providers.environmentVariable("MORPHE_PATCHER_VERSION").get())
        }
    }
}
