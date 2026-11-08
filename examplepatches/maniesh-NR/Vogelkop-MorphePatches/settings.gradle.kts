rootProject.name = "morphe-patches-opera"

pluginManagement {
    repositories {
        // Local builds without a GitHub token: publish MorpheApp/morphe-patcher and
        // MorpheApp/morphe-patches-gradle-plugin to the local Maven repository first.
        mavenLocal()
        maven("https://maven.aliyun.com/repository/public")
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
                password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
            }
        }
        gradlePluginPortal()
        google()
        maven { url = uri("https://jitpack.io") }
    }
}

// PREFER_SETTINGS so the dependency repositories below are used uniformly
// (the Aliyun mirror first — Maven Central rate-limits some networks).
// The Morphe settings plugin has already registered mavenCentral() et al;
// clear that list and re-register our own ordering.
dependencyResolutionManagement {
    repositoriesMode = RepositoriesMode.PREFER_SETTINGS
    repositories.clear()
    repositories {
        mavenLocal()
        maven("https://maven.aliyun.com/repository/public")
        maven("https://maven.aliyun.com/repository/google")
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
