// SPDX-License-Identifier: AGPL-3.0-or-later
// Compile-only stand-ins for the app's classes the extension calls.
plugins {
    id("com.android.library")
}

android {
    namespace = "app.edbfi.extension.syncforreddit.stub"
    compileSdk = 34
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}
