// SPDX-License-Identifier: AGPL-3.0-or-later
rootProject.name = "apk-patches-morphe"

pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        maven {
            // Morphe publishes its Gradle plugin and patcher here; reading needs a token with read:packages.
            name = "githubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials(PasswordCredentials::class)
        }
    }
}

plugins {
    id("app.morphe.patches") version "2.1.1"
    id("org.gradle.toolchains.foojay-resolver-convention") version "1.0.0"
}

// The plugin adds the same GitHub Packages repository for the patcher, reading gpr.user and gpr.key (or GITHUB_ACTOR
// and GITHUB_TOKEN). Point it at the properties the ReVanced build reads instead, so one pair serves both.
dependencyResolutionManagement {
    repositories.withType<MavenArtifactRepository>().configureEach {
        if (url.host == "maven.pkg.github.com") {
            credentials {
                username = providers.gradleProperty("githubPackagesUsername").orNull
                password = providers.gradleProperty("githubPackagesPassword").orNull
            }
        }
    }
}

settings {
    extensions {
        defaultNamespace = "app.edbfi.extension"
        // R8 keeps the extension classes the patches call only with these rules; the plugin needs an absolute path.
        proguardFiles(rootDir.resolve("extensions/proguard-rules.pro").absolutePath)
    }
}
