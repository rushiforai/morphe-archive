// Copyright (C) 2026 lavinhoque33
// Licensed under the GNU General Public License v3.0.
// Written by lavinhoque33, 2026-11-16
extension {
    name = "extensions/music-legacy-theme.mpe"
}

android {
    namespace = "app.morphe.extension.music.legacy"
    compileSdk = 35

    defaultConfig {
        minSdk = 21
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    coreLibraryDesugaring(libs.desugar.jdk.libs)
    testImplementation("junit:junit:4.13.2")
}
