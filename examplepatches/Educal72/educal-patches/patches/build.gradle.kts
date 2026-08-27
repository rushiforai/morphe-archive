group = "app.template"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "Educal Patches"
        description = "Patches for apps I use which patches didn't already exist."
        source = "https://github.com/Educal72/educal-patches"
        author = "Educal"
        contact = "educal72@libraserver.site"
        website = "libraserver.site"
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
