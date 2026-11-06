group = "com.tds.meowdoku.patches"

patches {
    about {
        name = "tds Meowdoku Patches"
        description = "Patches for Meowdoku"
        source = "git@github.com:TheDefaultState/meowdoku-patches.git"
        author = "tds"
        contact = "na"
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
