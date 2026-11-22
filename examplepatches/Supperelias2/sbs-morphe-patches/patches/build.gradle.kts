group = "dev.supperelias2.sbs"

patches {
    about {
        name = "Supperelias2 SBS Patches"
        description = "SBS ad removal with an in-app Morphe menu and optional experimental playback settings."
        source = "https://github.com/Supperelias2/sbs-morphe-patches"
        author = "Supperelias2"
        contact = "https://github.com/Supperelias2/sbs-morphe-patches/issues"
        website = "https://github.com/Supperelias2/sbs-morphe-patches"
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
