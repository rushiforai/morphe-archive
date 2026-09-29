rootProject.name = "uyu"

pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            // Locally, scripts/gradlew.ps1 fills GITHUB_ACTOR / GITHUB_TOKEN from the GitHub CLI
            // (`gh auth token`, needs the read:packages scope). In CI the workflow provides them.
            credentials {
                username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
                password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
            }
        }
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "1.3.4"
}

settings {
    extensions {
        // Keep extension classes out of the namespaces used by other Twitch bundles
        // (e.g. app.morphe.extension.twitch), so bundles can be combined without class clashes.
        defaultNamespace = "io.github.bakwudo.uyu.extension"

        // Must be an absolute path, otherwise extensions in subfolders fail to find it.
        proguardFiles(rootProject.projectDir.resolve("extensions/proguard-rules.pro").toString())
    }
}
