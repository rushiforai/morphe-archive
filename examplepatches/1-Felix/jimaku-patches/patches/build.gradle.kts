group = "app.jimaku"

patches {
    about {
        name = "Jimaku"
        description = "Jimaku subtitles over the YouTube player. Apply together with Morphe's YouTube patches."
        source = "git@github.com:1-Felix/jimaku-patches.git"
        author = "Felix Keller"
        contact = "contact@jimaku.app"
        website = "https://www.jimaku.app"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    testImplementation(libs.junit)
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
