// SPDX-License-Identifier: AGPL-3.0-or-later
rootProject.name = "apk-patches"

pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        maven {
            // ReVanced publishes its Gradle plugin and patcher here; reading needs a token with read:packages.
            name = "githubPackages"
            url = uri("https://maven.pkg.github.com/revanced/registry")
            credentials(PasswordCredentials::class)
        }
    }
}

plugins {
    id("app.revanced.patches") version "1.0.0-dev.11"
    id("org.gradle.toolchains.foojay-resolver-convention") version "1.0.0"
}

settings {
    extensions {
        defaultNamespace = "app.edbfi.extension"
        // R8 keeps the extension classes the patches call only with these rules; the plugin needs an absolute path.
        proguardFiles(rootDir.resolve("extensions/proguard-rules.pro").absolutePath)
    }
}
