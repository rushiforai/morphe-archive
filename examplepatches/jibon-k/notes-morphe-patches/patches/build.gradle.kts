group = "dev.jibon"

patches {
    about {
        name = "Jibon's Notes patches"
        description = "Runs Samsung Notes on non-Samsung Android (tested: Redmi Pad 2, crDroid GSI)"
        source = "git@github.com:jibon-k/notes-morphe-patches.git"
        author = "Jibon Krishna Joy"
        contact = "https://github.com/jibon-k"
        website = "na"
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
