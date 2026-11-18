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

// The Morphe patches plugin 2.1.1 brings kotlin-gradle-plugin 2.4.21, outside CVE-2026-53914
// (GHSA-r937-wjx7-w2jp, unsafe deserialization in the Kotlin build cache); 1.3.4 brought 2.4.10,
// inside it. Gradle 9.9.1 embeds kotlin-stdlib and kotlin-reflect 2.4.21 too, but the Android build
// tools still ask for older stdlib-jdk7/jdk8, so every org.jetbrains.kotlin request is held to the
// plugin's 2.4.21. The same classpath carries Bouncy Castle 1.77 (the patcher's pin and the plugin's
// own bundle signer) and 1.79 (the Android build tools'), both inside CVE-2026-5588, CVE-2025-14813,
// CVE-2026-0636, CVE-2026-8763 and CVE-2026-13506, and 1.77 also inside CVE-2025-8916. 1.86 is
// outside all six and publishes bcprov, bcpkix and bcutil. Signing runs on this classpath, and a
// force inside a project can't reach it, so it's set here. Keep 1.86 in step with
// gradle/libs.versions.toml, which the version catalog can't supply this early in the build. Move
// the Kotlin line with the plugin's kotlin-gradle-plugin; gradle/verification-metadata.xml says
// which version actually resolved.
buildscript {
    configurations.all {
        resolutionStrategy.eachDependency {
            if (requested.group == "org.jetbrains.kotlin") useVersion("2.4.21")
            if (requested.group == "org.bouncycastle") useVersion("1.86")
            // 9.4.1 replaces the old UTP/Netty device-test transport with Android Test Engine.
            if (requested.group == "com.android.application" &&
                requested.name == "com.android.application.gradle.plugin"
            ) useVersion("9.4.1")
        }
    }
}

plugins {
    id("app.morphe.patches") version "2.1.1"
}

settings {
    extensions {
        defaultNamespace = "app.hushmessenger.extension"
        proguardFiles(rootDir.resolve("extensions/proguard-rules.pro").absolutePath)
    }
}
