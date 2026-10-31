rootProject.name = "morphe-patches-template"

pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user").orNull?.takeIf { it.isNotBlank() }
                    ?: System.getenv("GPR_USER")?.takeIf { it.isNotBlank() }
                    ?: System.getenv("GITHUB_ACTOR")
                password = providers.gradleProperty("gpr.key").orNull?.takeIf { it.isNotBlank() }
                    ?: System.getenv("GPR_KEY")?.takeIf { it.isNotBlank() }
                    ?: System.getenv("GITHUB_TOKEN")
            }
        }
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "2.0.0"
}
