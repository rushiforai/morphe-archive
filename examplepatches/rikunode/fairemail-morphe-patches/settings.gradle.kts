rootProject.name = "fairemail-morphe-patches"
pluginManagement {
    includeBuild("build-logic/morphe-patches-gradle-plugin")
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
        maven {
            name = "MorpheGradlePlugin"
            url = uri("https://maven.pkg.github.com/MorpheApp/morphe-patches-gradle-plugin")
            credentials {
                username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
                password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
            }
        }
        maven { url = uri("https://jitpack.io") }
    }
}
plugins { id("app.morphe.patches") version "1.3.3" }

includeBuild("build-logic/morphe-patcher")
