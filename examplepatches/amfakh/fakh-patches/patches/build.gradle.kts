group = "app.fakh"

patches {
    about {
        name = "Fakh Patches"
        description = "Material You, ad and tracker removal, and premium unlocks for Android apps."
        source = "git@github.com:amfakh/fakh-patches.git"
        author = "amfakh"
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
    // GPLv3 Section 7b requires the NOTICE text to ship with binaries, not only the source.
    named<Jar>("jar") {
        from(rootProject.files("NOTICE", "LICENSE")) {
            into("META-INF")
        }
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn("buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }
}
