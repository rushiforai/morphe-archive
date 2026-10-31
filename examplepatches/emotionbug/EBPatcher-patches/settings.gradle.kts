pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            content { includeGroupByRegex("app\\.morphe(\\..*)?") }
            credentials {
                username = providers.gradleProperty("gpr.user").orElse(providers.environmentVariable("GITHUB_ACTOR")).orNull
                password = providers.gradleProperty("gpr.key").orElse(providers.environmentVariable("GITHUB_TOKEN")).orNull
            }
        }
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "2.0.0"
    id("org.gradle.toolchains.foojay-resolver-convention") version "1.0.0"
}

rootProject.name = "EBPatcher-patches"

settings {
    extensions {
        defaultNamespace = "app.morphe.extension"
        proguardFiles(rootProject.projectDir.resolve("extensions/proguard-rules.pro").toString())
    }
}

// Resolve the pinned published dependencies, never artifacts from a local SDK build.
dependencyResolutionManagement {
    repositories.removeIf { it.name == "MavenLocal" }
    repositories.withType<org.gradle.api.artifacts.repositories.MavenArtifactRepository>().configureEach {
        if (url.host == "maven.pkg.github.com") {
            content { includeGroupByRegex("app\\.morphe(\\..*)?") }
        }
    }
}

include(":patches:stub", ":runtime", ":summary-engine")
