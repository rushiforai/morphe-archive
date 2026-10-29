group = "app.apppatches"

patches {
    about {
        name = "App Patches"
        description = "Patches for Android apps, for use with Morphe."
        source = "https://github.com/toidicakhia/morphe-app-patches"
        author = "toidicakhia"
        contact = "https://github.com/toidicakhia/morphe-app-patches/issues"
        website = "https://github.com/toidicakhia/morphe-app-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    implementation(libs.morphe.patches.library)
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
