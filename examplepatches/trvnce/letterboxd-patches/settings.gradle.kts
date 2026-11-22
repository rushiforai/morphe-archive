rootProject.name = "letterboxd-patches"

pluginManagement {
    repositories {
        mavenLocal()
        gradlePluginPortal()
        // El portal de plugins ya no sirve de espejo de Maven Central (kotlin-stdlib, etc.).
        mavenCentral()
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
    id("app.morphe.patches") version "2.1.0"
}
