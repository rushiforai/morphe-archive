group = "app.mahirsn"

patches {
    about {
        name = "mahirsn patches"
        description = "Add-on for Morphe Patches: YouTube watch history and resume positions on your own server. Requires Morphe official patches."
        source = "git@github.com:mahirsn/mahirsn-patches.git"
        author = "mahirsn"
        contact = "mahirsn@mahirsn.net"
        website = "https://github.com/mahirsn/mahirsn-patches"
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
