group = "app.discord"

patches {
    about {
        name = "Discord Patches"
        description = "Hides the quest promo banner and gift button in Discord, pinned to the built-in bundle"
        source = "local"
        author = "jrddu"
        contact = "https://github.com/jrddupont"
        website = "https://github.com/jrddupont/discord-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    // dexlib2 for the bytecode patch; provided at patch runtime by the host.
    compileOnly(libs.smali.dexlib2)
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
