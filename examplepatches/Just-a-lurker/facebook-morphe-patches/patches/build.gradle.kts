group = "app.fbpatches"

patches {
    about {
        name = "Facebook Morphe Patches"
        description = "Ad-removal and tablet dark mode patches for Facebook"
        source = "https://github.com/Just-a-lurker/facebook-morphe-patches.git"
        author = "Facebook Morphe Patches contributors"
        contact = "https://github.com/Just-a-lurker/facebook-morphe-patches/issues"
        website = "https://github.com/Just-a-lurker/facebook-morphe-patches"
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
