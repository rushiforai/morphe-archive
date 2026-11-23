group = "app.zonghome"

patches {
    about {
        name = "MyZong"
        description = "Customization patches for My Zong 5.19.19.112"
        source = "https://github.com/FarhanZafarr-9/myzong-patches"
        author = "FarhanZafarr-9"
        contact = "https://github.com/FarhanZafarr-9/myzong-patches/issues"
        website = "https://github.com/FarhanZafarr-9/myzong-patches"
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

