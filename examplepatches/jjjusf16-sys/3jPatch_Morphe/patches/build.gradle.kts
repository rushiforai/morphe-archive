group = "app.jjjusf16"

patches {
    about {
        name = "3jPatch_Morphe"
        description = "Version-locked Android patches for Morphe"
        source = "https://github.com/jjjusf16-sys/3jPatch_Morphe.git"
        author = "jjjusf16-sys"
        contact = "https://github.com/jjjusf16-sys"
        website = "https://github.com/jjjusf16-sys/3jPatch_Morphe"
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
