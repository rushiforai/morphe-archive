group = "io.github.bryceaspringfield"

patches {
    about {
        name = "Reddit Keyword Filter"
        description = "Hides Reddit feed posts by keywords, communities, or accounts. Select it together with Morphe Patches."
        source = "https://github.com/bryceaspringfield/morphe-reddit-keyword-filter"
        author = "bryceaspringfield"
        contact = "https://github.com/bryceaspringfield/morphe-reddit-keyword-filter/issues"
        website = "https://morphe.software/add-source?github=bryceaspringfield/morphe-reddit-keyword-filter"
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
