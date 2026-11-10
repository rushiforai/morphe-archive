group = "app.unison"

patches {
    about {
        name = "Unison Patches"
        description = "Patches that let Unison talk to Deezer (add to playlist, tighter control)"
        source = "https://github.com/LuckyTheCookie/unison-morphe-patches"
        author = "Lulu"
        contact = "na"
        website = "https://github.com/LuckyTheCookie/unison"
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
