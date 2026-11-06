rootProject.name = "liquidmusic-patches"

pluginManagement {
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
    id("app.morphe.patches") version "2.1.0"
}

settings {
    extensions {
        // Shrinks the extension dex to its own classes. Without it, the Kotlin standard library
        // that the Android plugin adds by default ends up in the .mpe and is merged into the
        // patched app, next to the app's own (R8-shrunk) copy.
        //
        // Must resolve to an absolute path, otherwise extensions in subfolders do not find it.
        proguardFiles(rootProject.projectDir.resolve("extensions/proguard-rules.pro").toString())
    }
}

// Backdrop by Kyant (AndroidLiquidGlass), copied unchanged, bundled into the extension.
// Outside extensions/: the Morphe plugin turns every project in there into an extension.
include(":libs:backdrop", ":libs:backdrop-catalog")
