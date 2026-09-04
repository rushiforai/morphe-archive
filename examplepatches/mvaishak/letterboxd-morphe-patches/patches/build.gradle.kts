group = "app.mvaishak"

patches {
    about {
        name = "mvaishak Letterboxd Patches"
        description = "Personal patches for the Letterboxd Android app"
        source = "git@github.com:mvaishak/letterboxd-morphe-patches.git"
        author = "mvaishak"
        contact = "na"
        website = "https://github.com/mvaishak/letterboxd-morphe-patches"
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
