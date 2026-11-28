group = "me.toidicakhia"

patches {
    about {
        name = "toidicakhia's patches"
        description = "Patches for Android apps, for use with Morphe."
        source = "https://github.com/toidicakhia/morphe-app-patches"
        author = "toidicakhia"
        contact = "https://github.com/toidicakhia/morphe-app-patches/issues"
        website = "https://github.com/toidicakhia/morphe-app-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    implementation(libs.morphe.patches.library)
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        // Must not depend on "build": re-running "jar" here overwrites the patches file
        // after "buildAndroid" has merged classes.dex into it.
        dependsOn(classes)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }
}
