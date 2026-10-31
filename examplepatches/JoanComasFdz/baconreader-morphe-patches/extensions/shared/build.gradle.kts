// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

// Bundles the Morphe extensions library (Utils, Logger, settings) as extensions/shared.mpe,
// which sharedExtensionPatch from morphe-patches-library loads.
extension {
    name = "extensions/shared.mpe"
}

android {
    namespace = "io.github.joancomasfdz.extension.shared"

    defaultConfig {
        minSdk = 23
    }
}

dependencies {
    implementation(libs.morphe.extensions.library)
}
