group = "app.travianpatch"

patches {
    about {
        name = "Travian Notifier Patches"
        description = "Adds build/troop queue completion notifications to Travian: Legends."
        source = "https://github.com/Amitaisela/travian-morphe-patches"
        author = "Mentat"
        contact = "na"
        website = "https://github.com/Amitaisela/travian-morphe-patches"
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
