import org.gradle.api.artifacts.repositories.MavenArtifactRepository

rootProject.name = "vix-patches"

pluginManagement {
    val allowLocalPlugins = providers.gradleProperty("allowMavenLocal")
        .map(String::toBoolean)
        .getOrElse(false)
    val gprUser = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
    val gprKey = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")

    repositories {
        if (allowLocalPlugins) mavenLocal()
        gradlePluginPortal()
        google()
        mavenCentral()
        if (!gprUser.isNullOrBlank() && !gprKey.isNullOrBlank()) {
            maven {
                name = "GitHubPackages"
                url = uri("https://maven.pkg.github.com/MorpheApp/registry")
                credentials {
                    username = gprUser
                    password = gprKey
                }
            }
        }
        maven { url = uri("https://jitpack.io") }
    }
}

buildscript {
    configurations.all {
        resolutionStrategy.eachDependency {
            if (requested.group == "org.jetbrains.kotlin") {
                useVersion("2.4.21")
            }
            if (requested.group == "org.bouncycastle") {
                useVersion("1.86")
            }
            if (requested.group == "com.google.guava" && requested.name == "guava") {
                useVersion("33.8.0-jre")
            }
        }
    }
}

val allowMavenLocal = providers.gradleProperty("allowMavenLocal")
    .map(String::toBoolean)
    .getOrElse(false)

plugins {
    id("app.morphe.patches") version "2.1.1"
}

if (allowMavenLocal) {
    dependencyResolutionManagement {
        repositories {
            mavenLocal()
        }
    }
} else {
    val localMavenUrl = file(System.getProperty("user.home"))
        .resolve(".m2/repository")
        .toURI()
        .toString()
        .removeSuffix("/")
    val localRepositories = dependencyResolutionManagement.repositories.filter { repository ->
        repository is MavenArtifactRepository &&
            repository.url.toString().removeSuffix("/") == localMavenUrl
    }
    localRepositories.forEach { repository ->
        dependencyResolutionManagement.repositories.remove(repository)
    }
}
