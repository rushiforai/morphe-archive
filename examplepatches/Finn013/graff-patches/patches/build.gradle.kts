group = "app.finni"

patches {
    about {
        name = "Graff patches"
        description = "Graff: a cleaned-up Telegraph Plus (p2021) - no ads, no trackers, no forced updates, own branding"
        source = "git@github.com:Finn013/graff-patches.git"
        author = "Finni"
        contact = "https://github.com/Finn013/graff-patches/issues"
        website = "https://github.com/Finn013/graff-patches"
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
