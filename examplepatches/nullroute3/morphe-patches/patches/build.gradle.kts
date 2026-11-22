group = "app.nullroute3"

patches {
    about {
        name = "nullroute3"
        description = "Morphe patches by nullroute3"
        source = "https://github.com/nullroute3/morphe-patches"
        author = "nullroute3"
        contact = "https://github.com/nullroute3/morphe-patches/issues"
        website = "https://github.com/nullroute3/morphe-patches"
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
