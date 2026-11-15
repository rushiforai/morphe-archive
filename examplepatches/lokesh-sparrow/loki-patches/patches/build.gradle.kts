/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

group = "app.loki"

private val REPO = "https://github.com/lokesh-sparrow/loki-patches"

patches {
    about {
        name = "Loki Patches"
        description = "LinkedIn, Splitwise, Truecaller and Doc Scanner patches, plus patches that work on any app, for use with Morphe"
        source = REPO
        author = "Lokesh Sparrow"
        contact = "na"
        website = REPO
        license = "GPLv3"
    }
}

// Gson is needed by the patch list generator when it runs, but must not end up inside the bundle.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    // Writes ../patches-list.json from the bundle that was just built.
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
