rootProject.name = "feurstagram-patches"

pluginManagement {
    // The patcher plugin comes from GitHub Packages (below), which needs a token even to read.
    // build.sh fills GITHUB_TOKEN from the GitHub CLI; otherwise set it yourself, or put
    // gpr.user/gpr.key in ~/.gradle/gradle.properties.
    val githubToken = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
    if (githubToken.isNullOrBlank()) {
        throw GradleException(
            "No GitHub token: set GITHUB_TOKEN (a token with read:packages) or gpr.key in " +
                "~/.gradle/gradle.properties. The Morphe patcher plugin is fetched from GitHub Packages.",
        )
    }
    repositories {
        gradlePluginPortal()
        google()
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
                password = githubToken
            }
        }
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "1.3.2"
}
