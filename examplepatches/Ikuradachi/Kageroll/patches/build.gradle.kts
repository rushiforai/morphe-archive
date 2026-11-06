group = "io.github.ikuradachi.kageroll"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "Kageroll"
        description = "Patches for the Crunchyroll Android app, for use with Morphe."
        source = "git@github.com:Ikuradachi/Kageroll.git"
        author = "Ikuradachi"
        contact = "https://github.com/Ikuradachi/Kageroll/issues"
        website = "https://github.com/Ikuradachi/Kageroll"
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
