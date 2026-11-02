group = "arpit.morphe"

patches {
    about {
        name = "Beyonder Morphe Patches"
        description = "Patches for apps I like"
        source = "https://github.com/callMeBeyonder/morphe-patches"
        author = "beyonder"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    // Provided at runtime by morphe-patcher; used for the binary AndroidManifest.xml edit.
    compileOnly(libs.arsc.lib)

    // Common patch utilities (extension hook, installer spoof, signature spoof, ...).
    implementation(libs.morphe.patches.library)
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
