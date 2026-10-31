group = "io.github.hyperstown"

patches {
    about {
        name = "Maps patches"
        description = "Run Google Maps without Google Play services, using MicroG-RE"
        source = "https://github.com/hyperstown/maps-patches"
        author = "hyperstown"
        contact = "https://github.com/hyperstown/maps-patches/issues"
        website = "https://github.com/hyperstown/maps-patches"
        license = "GNU General Public License v3.0, with additional GPL section 7 requirements"
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
