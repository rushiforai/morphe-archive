group = "app.twoeno"

patches {
    about {
        name = "2eno Patches"
        description = "Ad blocking and anti-tracking patches for Spotify, Kleinanzeigen, Untappd and InterPals"
        source = "git@github.com:2eno/2eno-patches.git"
        author = "2eno"
        contact = "https://github.com/2eno/2eno-patches/issues"
        website = "https://github.com/2eno/2eno-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    // Shared bytecode helpers, bundled into the patches file.
    implementation(libs.morphe.patches.library)

    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
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
