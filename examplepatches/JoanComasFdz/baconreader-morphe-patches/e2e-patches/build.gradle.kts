// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

import app.morphe.patches.gradle.PatchesExtension
import app.morphe.patches.gradle.PatchesPlugin
import org.jetbrains.kotlin.gradle.dsl.KotlinJvmProjectExtension

// The e2e tests' patches, in an .mpp of their own: the release publishes only patches/build/libs/patches-*.mpp.
apply<PatchesPlugin>()

group = "io.github.joancomasfdz"

configure<PatchesExtension> {
    about {
        name = "JoanComasFdz BaconReader E2E Patches"
        description = "Test only: patches for BaconReader's end-to-end tests, never released"
        source = "git@github.com:JoanComasFdz/baconreader-morphe-patches.git"
        author = "Joan Comas"
        contact = "https://github.com/JoanComasFdz/baconreader-morphe-patches/issues"
        website = "https://github.com/JoanComasFdz/baconreader-morphe-patches"
        license = "GPLv3"
    }
}

// The plugin bundles every extension into the .mpp it builds; these patches add no code to the app.
configurations["extensionsDependencyScope"].dependencies.clear()

// The compatibility constants, shared with the main patches rather than copied.
configure<KotlinJvmProjectExtension> {
    sourceSets["main"].kotlin.srcDir("../patches/src/main/kotlin/io/github/joancomasfdz/patches/shared")
}

dependencies {
    "implementation"(libs.morphe.patches.library)
}
