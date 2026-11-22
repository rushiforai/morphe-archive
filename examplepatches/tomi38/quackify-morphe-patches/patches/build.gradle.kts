group = "app.quackify.patches"

patches {
    about {
        name = "Quackify Morphe Patches"
        description = "Community patches for Quackify: Spotify branding (app name and icons)."
        source = "https://github.com/23fpsz/Quackify"
        author = "Quackify Morphe Patches contributors"
        contact = "https://github.com/23fpsz/Quackify/issues"
        website = "https://github.com/23fpsz/Quackify"
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
}
