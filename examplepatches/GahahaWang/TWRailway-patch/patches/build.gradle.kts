group = "app.twrailway"

patches {
    about {
        name = "TWRailway Patches"
        description = "Morphe patches for 火車時刻表 (com.tsumii.trainschedule)"
        source = "git@github.com:GahahaWang/TWRailway-patch.git"
        author = "GahahaWang"
        contact = "na"
        website = "https://github.com/GahahaWang/TWRailway-patch"
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
