rootProject.name = "shikify"

pluginManagement {
    // Optional source build: avoids GitHub Packages authentication.
    providers.gradleProperty("morphePluginSource").orNull?.let { includeBuild(it) }
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
    id("app.morphe.patches") version "2.1.0"
}

providers.gradleProperty("morphePatcherSource").orNull?.let { source ->
    includeBuild(source) {
        dependencySubstitution {
            substitute(module("app.morphe:morphe-patcher")).using(project(":"))
        }
    }
    // SettingsPlugin registers this authenticated registry unconditionally.
    // All Morphe artifacts are supplied by the included source builds here.
    dependencyResolutionManagement.repositories.removeIf {
        it is org.gradle.api.artifacts.repositories.MavenArtifactRepository &&
            it.url.host == "maven.pkg.github.com"
    }
}

settings {
    extensions {
        defaultNamespace = "app.shiki.boost.extension"
        proguardFiles(rootDir.resolve("extensions/proguard-rules.pro").absolutePath)
    }
}
