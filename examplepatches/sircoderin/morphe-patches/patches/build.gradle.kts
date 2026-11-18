group = "app.sircoderin"

patches {
        about {
        name = "sircoderin Patches"
        description = "Small UX fixes for apps I use"
        source = "git@github.com:sircoderin/morphe-patches.git"
        author = "sircoderin"
        contact = "https://github.com/sircoderin/morphe-patches/issues"
        website = "https://github.com/sircoderin/morphe-patches"
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
