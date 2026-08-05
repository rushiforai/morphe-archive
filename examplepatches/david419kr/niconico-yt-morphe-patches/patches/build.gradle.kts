group = "io.github.david419kr.niconicoyt"

patches {
    about {
        name = "Niconico YT Comments Patches"
        description = "Niconico-style scrolling live-chat overlays for the Android YouTube app"
        source = "https://github.com/david419kr/niconico-yt-android-patches"
        author = "david419kr"
        contact = "https://github.com/david419kr"
        website = "https://github.com/david419kr/niconico-yt"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
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
