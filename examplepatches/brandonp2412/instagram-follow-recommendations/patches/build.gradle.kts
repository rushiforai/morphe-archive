group = "app.brandonp2412"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "Instagram Follow Recommendations"
        description = "Hide suggested accounts to follow"
        source = "https://github.com/brandonp2412/instagram-follow-recommendations"
        author = "Brandon Dick"
        contact = "https://github.com/brandonp2412"
        website = "https://github.com/brandonp2412/instagram-follow-recommendations"
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
