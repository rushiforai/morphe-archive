group = "app.jagjordi"

patches {
    about {
        name = "jagjordi Patches"
        description = "Flightradar24 Business unlock with open data for the server withheld fields, a CalTopo Desktop tier unlock and a DNS over HTTPS bypass"
        source = "https://github.com/jagjordi/morphe-patches"
        author = "jagjordi"
        contact = "https://github.com/jagjordi"
        website = "https://github.com/jagjordi/morphe-patches"
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
