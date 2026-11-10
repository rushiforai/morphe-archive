group = "io.github.bryceaspringfield"

patches {
    about {
        name = "bryceaspringfield's Morphe patches"
        description = "Reddit Keyword Filter (hides Reddit posts and comments by keyword, community, account, flair, post type, score, and number of comments, with Fix search media taps, Morphe branding, and Say subreddits) and YouTube Extras (channel-scoped filters, video length and category filters, auto feedback, and fixes). Select it together with Morphe Patches."
        source = "https://github.com/bryceaspringfield/morphe"
        author = "bryceaspringfield"
        contact = "https://github.com/bryceaspringfield/morphe/issues"
        website = "https://morphe.software/add-source?github=bryceaspringfield/morphe"
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
