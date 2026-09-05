group = "app.mvaishak"

patches {
    about {
        name = "mvaishak Letterboxd Patches"
        description = "Personal patches for the Letterboxd Android app"
        source = "git@github.com:mvaishak/letterboxd-morphe-patches.git"
        author = "V"
        contact = "na"
        website = "https://github.com/mvaishak/letterboxd-morphe-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")
val overlayCheckClasspath = configurations.create("overlayCheckClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    // Compiles standalone runtime resource-overlay .arsc tables for the theme patch.
    // Provided by the Morphe patcher runtime, so compileOnly (same as piko).
    compileOnly("com.github.REAndroid:ARSCLib:a28c6fb2a7")
    overlayCheckClasspath("com.github.REAndroid:ARSCLib:a28c6fb2a7")
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    register<JavaExec>("checkOverlay") {
        description = "Runs the theme overlay encoder against the decoded app, off-device."
        dependsOn("compileKotlin")
        classpath = sourceSets["main"].runtimeClasspath + overlayCheckClasspath
        mainClass.set("util.OverlayCheckKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
