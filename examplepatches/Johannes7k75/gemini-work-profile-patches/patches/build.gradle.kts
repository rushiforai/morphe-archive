group = "app.gwp"

patches {
    about {
        name = "Gemini Work Profile Patches"
        description = "Run the Gemini app inside Android work profiles (Shelter, Island, Secure Folder) with microG"
        source = "git@github.com:Johannes7k75/gemini-work-profile-patches.git"
        author = "Johannes7k75"
        contact = "na"
        website = "https://github.com/Johannes7k75/gemini-work-profile-patches"
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
