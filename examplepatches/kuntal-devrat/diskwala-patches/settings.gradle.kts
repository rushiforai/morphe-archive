rootProject.name = "morphe-diskwala"

pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        // Mirror of MorpheApp registry artifacts (app.morphe + smali), auth-free via raw.githubusercontent.
        maven { url = uri("https://raw.githubusercontent.com/kuntal-devrat/registry/main") }
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "1.3.4"
}

include(":patches")
