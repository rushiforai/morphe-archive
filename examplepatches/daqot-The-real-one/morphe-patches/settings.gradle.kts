rootProject.name = "morphe-patches-template"

pluginManagement {
    val githubPackagesUser = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
    val githubPackagesToken = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")

    repositories {
        gradlePluginPortal()
        google()
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = githubPackagesUser
                    ?: throw GradleException("Set gpr.user and gpr.key in your user-level Gradle properties to access the Morphe plugin.")
                password = githubPackagesToken
                    ?: throw GradleException("Set gpr.user and gpr.key in your user-level Gradle properties to access the Morphe plugin.")
            }
        }
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "2.1.0"
}

settings {
    extensions {
        defaultNamespace = "app.template.extension"
    }
}
