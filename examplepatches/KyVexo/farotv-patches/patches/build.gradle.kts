group = "app.tvpatches"

patches {
    about {
        name = "FaroTV Patches"
        description = "FaroTV: unofficial patches for YouTube on Android TV, compatible with Morphe. MicroG-RE support, ad blocking, settings inside the app, player customization."
        source = "git@github.com:KyVexo/farotv-patches.git"
        author = "KyVexo"
        contact = "https://github.com/KyVexo/farotv-patches/issues"
        website = "https://github.com/KyVexo/farotv-patches"
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
