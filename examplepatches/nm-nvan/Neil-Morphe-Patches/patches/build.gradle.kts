group = "com.nmnvan"

patches {
    about {
        name = "Neil Morphe Patches"
        description = "Neil's personal patches for apps, for use with Morphe"
        source = "git@github.com:nm-nvan/Neil-Morphe-Patches.git"
        author = "Neil (nm-nvan)"
        contact = "https://github.com/nm-nvan/Neil-Morphe-Patches/issues"
        website = "https://github.com/nm-nvan/Neil-Morphe-Patches"
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
