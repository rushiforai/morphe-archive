group = "app.adish.patches"

patches {
    about {
        name = "Morphe Patches"
        description = "Morphe patches for Android apps (Jain Panchang and more)"
        source = "https://github.com/adish08/morphe-patches"
        author = "Adish"
        contact = "https://github.com/adish08/morphe-patches/issues"
        website = "https://github.com/adish08/morphe-patches"
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
