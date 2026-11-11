group = "app.GoldRift"

patches {
    about {
        name = "GoldRift's Patches"
        description = "Patches for apps I like"
        source = "git@github.com:GoldRift/morphe-patches.git"
        author = "GoldRift"
        contact = "https://github.com/GoldRift/morphe-patches/issues"
        website = "https://github.com/GoldRift/morphe-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    // Morphe's shared patches, bundled into this .mpp (extension DEX included).
    implementation(libs.morphe.patches.library)
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
