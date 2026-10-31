group = "app.starkist"

patches {
    about {
        name = "Star's Patches"
        description = "Personal Morphe patches"
        source = "git@github.com:Starkist124/stars-morphe-patch.git"
        author = "Starkist124"
        contact = "https://github.com/Starkist124"
        website = "https://github.com/Starkist124/stars-morphe-patch"
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
