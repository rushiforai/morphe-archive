group = "app.template"

patches {
    about {
        name = "TikTok Lite Patches"
        description = "Morphe patches for TikTok Lite"
        source = "https://github.com/kurageno8156-lgtm/tiktok-lite-patches"
        author = "kurageno8156-lgtm"
        contact = "https://github.com/kurageno8156-lgtm/tiktok-lite-patches/issues"
        website = "https://github.com/kurageno8156-lgtm/tiktok-lite-patches"
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
