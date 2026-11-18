group = "app.template"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "Brother Fast Preview Patches"
        description = "Aggressive experimental SNMP snapshot for Brother print preview"
        source = "https://github.com/pholcroft/brother-morphe-patches"
        author = "pholcroft"
        contact = "na"
        website = "https://github.com/pholcroft/brother-morphe-patches"
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
        args(project.version.toString())
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
