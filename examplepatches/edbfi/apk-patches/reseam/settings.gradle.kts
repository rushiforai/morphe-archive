// SPDX-License-Identifier: AGPL-3.0-or-later

pluginManagement {
    repositories {
        mavenCentral()
        gradlePluginPortal()
        maven("https://git.reseam.app/api/packages/reseam/maven") {
            mavenContent { includeGroupAndSubgroups("app.reseam") }
        }
    }
}

plugins {
    id("app.reseam.workspace") version "1.0.1"
}

rootProject.name = "edbfi-patches"
