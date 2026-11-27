group = "app.tvpatches"

patches {
    about {
        name = "Birdy Patches"
        description = "Birdy: unofficial patches for YouTube on Android TV, compatible with Morphe. MicroG-RE support, ad blocking, SponsorBlock with skip/prompt options, settings inside the app, player customization."
        source = "git@github.com:BIRDY141/Birdy-Patches.git"
        author = "BIRDY141"
        contact = "https://github.com/BIRDY141/Birdy-Patches/issues"
        website = "https://github.com/BIRDY141/Birdy-Patches"
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
