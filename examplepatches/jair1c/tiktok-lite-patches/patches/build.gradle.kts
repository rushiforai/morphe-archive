group = "app.tvpatches"

patches {
    about {
        name = "TikTok Lite Patches"
        description = "Unofficial patches for TikTok Lite, compatible with Morphe."
        source = "git@github.com:jair1c/tiktok-lite-patches.git"
        author = "jair1c"
        contact = "https://github.com/jair1c/tiktok-lite-patches/issues"
        website = "https://github.com/jair1c/tiktok-lite-patches"
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

