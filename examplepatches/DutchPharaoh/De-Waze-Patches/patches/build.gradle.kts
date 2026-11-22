group = "app.dewaze"

patches {
    about {
        name = "De-Waze Patches"
        description = "Morphe patches that add features to Waze"
        source = "git@github.com:DutchPharaoh/De-Waze-Patches.git"
        author = "Karim"
        contact = "na"
        website = "https://github.com/DutchPharaoh/De-Waze-Patches"
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
