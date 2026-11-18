group = "io.github.henr1klmb"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "henr1klmb-patches"
        description = "Custom patches for multiple Apps"
        source = "git@github.com:henr1klmb/henr1k-patches.git"
        author = "henr1klmb"
        contact = "na"
        website = "https://github.com/henr1klmb/henr1k-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    compileOnly("com.google.android:android:4.1.1.4")
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
