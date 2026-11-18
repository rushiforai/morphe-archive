// SPDX-License-Identifier: AGPL-3.0-or-later
// Compile-only stand-ins for the app's classes the extension calls, for classes R8 left their names.
plugins {
    id("com.android.library")
}

android {
    namespace = "app.edbfi.extension.rifisfun.stub"
    compileSdk = 34
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}
