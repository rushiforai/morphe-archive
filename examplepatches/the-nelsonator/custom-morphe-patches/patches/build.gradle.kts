group = "app.nelsonator"

patches {
    about {
        name = "Nelsonator Patches"
        description = "Custom Morphe patches"
        source = "git@github.com:the-nelsonator/custom-morphe-patches.git"
        author = "the-nelsonator"
        contact = "https://github.com/the-nelsonator/custom-morphe-patches/issues"
        website = "https://github.com/the-nelsonator/custom-morphe-patches"
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
