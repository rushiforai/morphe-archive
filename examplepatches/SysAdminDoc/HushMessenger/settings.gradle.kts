rootProject.name = "hushmessenger"

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

// The Morphe patches plugin 1.3.4 brings kotlin-gradle-plugin 2.4.10, which is inside
// CVE-2026-53914 (GHSA-r937-wjx7-w2jp, unsafe deserialization in the Kotlin build cache); 2.4.20
// is the first release outside it. The same classpath carries Bouncy Castle 1.77 (the patcher's
// pin) and 1.79 (the Android build tools'), both inside CVE-2026-5588, CVE-2025-14813,
// CVE-2026-0636, CVE-2026-8763 and CVE-2026-13506, and 1.77 also inside CVE-2025-8916. 1.86 is
// outside all six and publishes bcprov, bcpkix and bcutil. Signing runs on this classpath, and a
// force inside a project can't reach it, so it's set here. Keep 1.86 in step with
// gradle/libs.versions.toml, which the version catalog can't supply this early in the build.
// Drop the Kotlin line once the plugin moves past 2.4.20 on its own.
buildscript {
    configurations.all {
        resolutionStrategy.eachDependency {
            if (requested.group == "org.jetbrains.kotlin") useVersion("2.4.20")
            if (requested.group == "org.bouncycastle") useVersion("1.86")
        }
    }
}

plugins {
    id("app.morphe.patches") version "1.3.4"
}

settings {
    extensions {
        defaultNamespace = "app.hushmessenger.extension"
        proguardFiles(rootDir.resolve("extensions/proguard-rules.pro").absolutePath)
    }
}
