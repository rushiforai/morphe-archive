group = "app.template"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "Force TV Patches"
        description = "Morphe patches that make apps treat any device as an Android TV"
        source = "https://github.com/kabukabu-a11y/force-tv-patches"
        author = "kabukabu"
        contact = "na"
        website = "https://github.com/kabukabu-a11y/force-tv-patches"
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
