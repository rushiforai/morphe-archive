rootProject.name = "morphe-diskwala"

pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        // Mirror of MorpheApp registry artifacts (app.morphe + smali), auth-free via raw.githubusercontent.
        maven { url = uri("https://raw.githubusercontent.com/kuntal-devrat/registry/main") }
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "1.3.4"
}

dependencyResolutionManagement {
    repositories {
        // Mirror of the Morphe registry artifacts, auth-free via raw.githubusercontent.
        maven { url = uri("https://raw.githubusercontent.com/kuntal-devrat/registry/main") }
        mavenLocal()
        mavenCentral()
        google()
        maven { url = uri("https://jitpack.io") }
    }
}

// The Morphe plugin adds GitHub Packages as an authenticated registry. Public
// raw.githubusercontent mirror above serves the same artifacts without
// credentials, so remove the authenticated repository to avoid 401 failures.
gradle.settingsEvaluated {
    dependencyResolutionManagement.repositories.removeAll {
        it is org.gradle.api.artifacts.repositories.MavenArtifactRepository &&
            it.url.toString().contains("maven.pkg.github.com")
    }
}

include(":patches")
