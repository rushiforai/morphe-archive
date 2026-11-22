group = "app.rimixyz"

patches {
    about {
        name = "rimixyz Morphe Patches"
        description = "All-in-one personal Morphe patches — Made in Brazil. 100% AI-crafted, tested before release."
        source = "https://github.com/rimixyz/morphe-patches.git"
        author = "rimixyz"
        contact = "https://github.com/rimixyz/morphe-patches/issues"
        website = "https://github.com/rimixyz/morphe-patches"
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
