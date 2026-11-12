group = "app.tvpatches"

patches {
    about {
        name = "FaroTV Patches"
        description = "FaroTV: unofficial patches for YouTube on Android TV, compatible with Morphe. MicroG-RE support, ad blocking, settings inside the app, player customization."
        source = "git@github.com:jair1c/farotv-patches.git"
        author = "jair1c"
        contact = "https://github.com/jair1c/farotv-patches/issues"
        website = "https://github.com/jair1c/farotv-patches"
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
