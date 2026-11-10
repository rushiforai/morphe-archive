rootProject.name = "galaxyxr-steamlink-patches"

pluginManagement {
    System.getenv("MORPHE_GRADLE_PLUGIN_SOURCE")?.let { includeBuild(it) }
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
    id("app.morphe.patches") version "1.3.4"
}

System.getenv("MORPHE_PATCHER_SOURCE")?.let { includeBuild(it) }

// Keep compiler output separate from the retained fixtures/tools in external build/.
val externalBuildRoot = settingsDir.resolve("../builds/galaxyxr-steamlink-patches").canonicalFile
gradle.beforeProject {
    val projectOutput = if (path == ":") "root" else path.removePrefix(":").replace(':', '/')
    layout.buildDirectory.set(externalBuildRoot.resolve("gradle/$projectOutput"))
}
