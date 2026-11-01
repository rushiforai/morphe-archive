group = "app.myspoti.patches"

patches {
    about {
        name = "MySpoti Morphe Patches"
        description = "Community patches for MySpoti: Spotify branding, offline audio export, embedded metadata and lyrics, playlist/album manifests, native Downloads restore, and offline storage migration."
        source = "https://github.com/amit-0i/myspoti-morphe-patches"
        author = "MySpoti Morphe Patches contributors"
        contact = "https://github.com/amit-0i/myspoti-morphe-patches/issues"
        website = "https://github.com/amit-0i/myspoti-morphe-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
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
