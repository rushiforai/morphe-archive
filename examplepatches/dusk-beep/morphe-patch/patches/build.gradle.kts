group = "app.focusguard"

patches {
    about {
        name = "Focus Guard Patches"
        description = "Small, targeted patches that add friction to disabling selected focus tools."
        source = "https://github.com/dusk-beep/morphe-patch"
        author = "Focus Guard contributors"
        contact = "Open an issue in the repository"
        website = "https://github.com/dusk-beep/morphe-patch"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    implementation(libs.morphe.patchesLib)
    
    // Add gson to the custom classpath for the generator task
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    // This registers the task that generates patches-list.json
    register<JavaExec>("generatePatchesList") {
        description = "Generate patches-list.json metadata file"
        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }
}
