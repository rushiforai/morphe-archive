group = "app.morphe"

patches {
    about {
        name = "heltonricardo patches"
        description = "Patches for apps I use. Waze: hide route street name balloons."
        source = "https://github.com/heltonricardo/morphe-patches.git"
        author = "heltonricardo"
        contact = "https://github.com/heltonricardo"
        website = "https://github.com/heltonricardo/morphe-patches"
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
