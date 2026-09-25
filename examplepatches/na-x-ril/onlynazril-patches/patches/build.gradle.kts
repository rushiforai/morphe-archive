group = "app.onlynazril"

patches {
    about {
        name = "onlynazril Patches"
        description = "Personal patch collection for apps I use: labels on names, and the details apps leave out."
        source = "https://github.com/na-x-ril/onlynazril-patches"
        author = "na-x-ril"
        contact = "na"
        website = "https://github.com/na-x-ril"
        // GPLv3 is required: the vendored files under app/morphe and the patches
        // template this project grew from are GPLv3, with the terms in NOTICE.
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
