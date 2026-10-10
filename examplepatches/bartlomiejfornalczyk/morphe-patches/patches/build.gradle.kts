group = "com.bartlomiejfornalczyk.patches"

patches {
    about {
        name = "Maps&Music patches"
        description = "Custom patches for Google Maps and YouTube Music"
        source = "https://github.com/bartlomiejfornalczyk/morphe-patches.git"
        author = "Bartlomiej Fornalczyk"
        contact = "na"
        website = "https://github.com/bartlomiejfornalczyk/morphe-patches"
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
