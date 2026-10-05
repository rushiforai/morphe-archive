rootProject.name = "piko-ig-lite"

buildCache {
    local {
        isEnabled = !System.getenv().containsKey("CI")
    }
}

pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user").getOrElse(System.getenv("GITHUB_ACTOR"))
                password = providers.gradleProperty("gpr.key").getOrElse(System.getenv("GITHUB_TOKEN"))
            }
        }
    }
}

plugins {
    id("app.morphe.patches") version "1.3.3"
}

dependencyResolutionManagement {
    repositories {
        maven {
            name = "BytecodeGitHubPackages"
            url = uri("https://maven.pkg.github.com/crimera/morphe-bytecode")
            credentials {
                username = providers.gradleProperty("gpr.user").getOrElse(System.getenv("GITHUB_ACTOR") ?: "")
                password = providers.gradleProperty("gpr.key").getOrElse(System.getenv("GITHUB_TOKEN") ?: "")
            }
        }
        maven {
            name = "PikoGitHubPackages"
            url = uri("https://maven.pkg.github.com/crimera/piko-patches-library")
            credentials {
                username = providers.gradleProperty("gpr.user").getOrElse(System.getenv("GITHUB_ACTOR") ?: "")
                password = providers.gradleProperty("gpr.key").getOrElse(System.getenv("GITHUB_TOKEN") ?: "")
            }
        }
    }
}

settings {
    extensions {
        defaultNamespace = "app.morphe.extension"

        // Must resolve to an absolute path (not relative),
        // otherwise the extensions in subfolders will fail to find the proguard config.
        proguardFiles(rootProject.projectDir.resolve("extensions/proguard-rules.pro").toString())
    }
}

// Shared patch infrastructure lives in its own repository and is consumed as
// app.crimera:piko-patches-library (patch side) and app.crimera:piko-extension-library (in-app
// code) from GitHub Packages. A sibling checkout substitutes the published artifacts so library
// changes can be tested without publishing first.
val pikoLibraryBuild =
    listOf("../piko-patches-library", "piko-patches-library-lib")
        .map { rootDir.resolve(it) }
        .firstOrNull { it.resolve("settings.gradle.kts").exists() }
if (pikoLibraryBuild != null) {
    includeBuild(pikoLibraryBuild) {
        dependencySubstitution {
            substitute(module("app.crimera:piko-patches-library")).using(project(":"))
            substitute(module("app.crimera:piko-extension-library")).using(project(":extension"))
        }
    }
}

// Typed bytecode emission lives in its own repository and is consumed as crimera:morphe-bytecode
// from GitHub Packages. A sibling checkout substitutes that artifact the same way.
val bytecodeBuild =
    listOf("../morphe-bytecode", "morphe-bytecode-lib")
        .map { rootDir.resolve(it) }
        .firstOrNull { it.resolve("settings.gradle.kts").exists() }
if (bytecodeBuild != null) {
    includeBuild(bytecodeBuild)
}
