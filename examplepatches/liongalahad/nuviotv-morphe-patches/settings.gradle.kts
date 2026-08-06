rootProject.name = "nuviotv-morphe-patches"

pluginManagement {
    System.getenv("MORPHE_GRADLE_PLUGIN_SRC")?.let { localPlugin ->
        if (file(localPlugin).isDirectory) includeBuild(localPlugin)
    }
    repositories {
        gradlePluginPortal()
        google()
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
                password = providers.gradleProperty("gpr.key").orNull
                    ?: System.getenv("MORPHE_PACKAGES_TOKEN")
                    ?: System.getenv("GITHUB_TOKEN")
            }
        }
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "1.3.3"
}

System.getenv("MORPHE_PATCHER_SRC")?.let { localPatcher ->
    if (file(localPatcher).isDirectory) {
        includeBuild(localPatcher) {
            dependencySubstitution {
                substitute(module("app.morphe:morphe-patcher")).using(project(":"))
            }
        }
    }
}
