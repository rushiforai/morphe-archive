/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

rootProject.name = "loki-patches"

pluginManagement {
    repositories {
        // The Morphe build plugin is served from GitHub Packages and needs a token with
        // read:packages. CI supplies it through the environment; locally it is read from
        // gradle.properties (gpr.user / gpr.key), so no token has to be exported by hand.
        maven {
            name = "MorpheRegistry"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
                password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
            }
        }

        // Where the plugin's own dependencies come from.
        gradlePluginPortal()
        google()
        maven("https://jitpack.io")
    }
}

plugins {
    // Pinned here, and declared once more in gradle/libs.versions.toml so that dependabot
    // can offer updates for it.
    id("app.morphe.patches") version "1.3.4"
}
