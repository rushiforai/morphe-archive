// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

// Compile-only stand-ins for BaconReader classes that the extension calls.
plugins {
    alias(libs.plugins.android.library)
}

android {
    namespace = "io.github.joancomasfdz.extension.baconreader.stub"
    compileSdk = 36

    defaultConfig {
        minSdk = 23
    }
}
