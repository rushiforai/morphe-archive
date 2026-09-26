group = "app.template"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "MightyMich's Patches"
        description = "Patches for apps I like"
        source = "git@github.com:mich111discord/Mightymichs-Patches.git"
        author = "MightyMich"
        contact = "https://mightymich.web1337.net/discord?from=morphe-app"
        website = "https://mightymich.web1337.net/en/morphe-patches"
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
