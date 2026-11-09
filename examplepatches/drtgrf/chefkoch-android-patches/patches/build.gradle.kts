group = "com.github.drtgrf.chefkochpatches"

patches {
    about {
        name = "Chefkoch Patches"
        description = "Unofficial Morphe patches for the Chefkoch Android app"
        source = "https://github.com/drtgrf/chefkoch-android-patches"
        author = "drtgrf"
        contact = "https://github.com/drtgrf"
        website = "https://github.com/drtgrf/chefkoch-android-patches"
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
