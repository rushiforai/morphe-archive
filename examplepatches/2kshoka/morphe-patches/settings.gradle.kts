rootProject.name = "soundcloud-morphe-patches"

pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        maven {
            name = "CodebergMorphe"
            url = uri("https://codeberg.org/api/packages/JohninNL/maven")
            content { includeGroupByRegex("app\\.morphe(\\..*)?") }
        }
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "2.1.0-dev.1"
}

// The upstream settings plugin eagerly adds its GitHub registry. Replace it before
// project dependency resolution; this mirror is public and needs no GitHub token.
dependencyResolutionManagement {
    repositories.filterIsInstance<org.gradle.api.artifacts.repositories.MavenArtifactRepository>()
        .filter { it.url.host == "maven.pkg.github.com" && it.url.path.equals("/MorpheApp/registry", ignoreCase = true) }
        .forEach { repositories.remove(it) }
    repositories.exclusiveContent {
        forRepository {
            repositories.maven {
                name = "CodebergMorphe"
                url = uri("https://codeberg.org/api/packages/JohninNL/maven")
            }
        }
        filter { includeGroupByRegex("app\\.morphe(\\..*)?") }
    }
}

