group = "app.syncup"

patches {
    about {
        name = "Sync Up"
        description = "Morphe patches for Sync for Reddit"
        source = "git@github.com:RashKash103/sync-up.git"
        author = "RashKash103"
        contact = "https://github.com/RashKash103/sync-up/issues"
        website = "https://github.com/RashKash103/sync-up"
        license = "GPLv3, with additional conditions under Section 7 inherited from Patcheddit and Morphe: " +
                "attribution and project name restrictions. See the LICENSE and NOTICE files."
    }
}

// Separate configuration so gson is available at runtime for the generatePatchesList task
// but is never bundled into the patched APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    // Used by the patch list generator, which runs on the host rather than on a device.
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    implementation(libs.morphe.patches.library)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
