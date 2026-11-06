group = "io.github.ikuradachi.kagecarbit"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "Kagecarbit"
        description = "Patches for the CarbitLink Android app, for use with Morphe."
        source = "git@github.com:Ikuradachi/Kagecarbit.git"
        author = "Ikuradachi"
        contact = "https://github.com/Ikuradachi/Kagecarbit/issues"
        website = "https://github.com/Ikuradachi/Kagecarbit"
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
