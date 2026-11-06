
group = "io.github.crispinoh"

patches {
    about {
        name = "Crispin-Oh Tablet Spoof Patches"
        description = "Patches that spoof the device as a Galaxy Tab S10 Ultra (Wi-Fi)"
        source = "git@github.com:Crispin-Oh/tablet-spoof-patches.git"
        author = "Crispin-Oh"
        contact = "na"
        website = "https://github.com/Crispin-Oh/tablet-spoof-patches"

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
