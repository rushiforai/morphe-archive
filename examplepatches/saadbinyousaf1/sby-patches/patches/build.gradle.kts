group = "dev.sby.patches"

patches {
    about {
        name = "Sby Patches"
        description = "foodpanda patches for Morphe"
        source = "git@github.com:saadbinyousaf1/sby-patches.git"
        author = "Saad Bin Yousaf"
        contact = "https://saadbinyousaf.dev"
        website = "https://saadbinyousaf.dev"
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
