group = "app.serajr.patches"

patches {
    about {
        name = "X (Twitter) Patches"
        description = "X (Twitter) Morphe Patches"
        source = "git@github.com:serajr/x-twitter-patches.git"
        author = "serajr"
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
