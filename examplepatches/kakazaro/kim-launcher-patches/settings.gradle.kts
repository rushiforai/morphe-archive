rootProject.name = "kim-launcher-patches"

pluginManagement {
    // The Morphe settings plugin needs GitHub Packages credentials. See docs/build-setup.md.
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
        // smali/baksmali source builds used by morphe-patcher.
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "2.0.0"
}

settings {
    extensions {
        defaultNamespace = "app.morphe.extension"

        // Must resolve to an absolute path, otherwise extensions in subfolders cannot find it.
        proguardFiles(rootProject.projectDir.resolve("extensions/proguard-rules.pro").toString())
    }
}
