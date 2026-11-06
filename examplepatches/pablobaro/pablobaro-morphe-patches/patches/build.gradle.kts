group = "app.pablobaro"

patches {
    about {
        name = "Pablobaro Morphe patches"
        description = "Spotify patches for use with Morphe"
        source = "git@github.com:pablobaro/pablobaro-morphe-patches.git"
        author = "pablobaro"
        contact = "https://github.com/pablobaro/pablobaro-morphe-patches"
        website = "https://github.com/pablobaro/pablobaro-morphe-patches"
        license = "GNU GPLv3"
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
