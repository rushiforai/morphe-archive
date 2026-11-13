group = "app.morphe.arcore"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "Morphe ARCore experiment patches"
        description = "Experimental Morphe patch for Google Play Services for AR (com.google.ar.core) on unsupported devices. UNVERIFIED."
        source = "local experiment, not published"
        author = "Le experiment"
        contact = "na"
        website = "na"
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
