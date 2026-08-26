group = "app.azk.stremio"

patches {
    about {
        name = "AZK Stremio AniSkip"
        description = "AniSkip intro, outro and recap controls for Stremio Android"
        source = "https://github.com/AzukiSensei/aniskip-stremio"
        author = "AZK"
        contact = "https://github.com/AzukiSensei/aniskip-stremio/issues"
        website = "https://github.com/AzukiSensei/aniskip-stremio"
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
