group = "app.blelle"

patches {
    about {
        name = "Blelle's Patches"
        description = "Ad-free patch for TimeTree: Shared Calendar"
        source = "git@github.com:Blelle/Blelle-s-Patches.git"
        author = "Blelle"
        contact = "inertiablack@proton.me"
        website = "https://github.com/Blelle/Blelle-s-Patches"
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
