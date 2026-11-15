group = "app.drbushytop"

patches {
    about {
        name = "DrBushyTop Relay Patches"
        description = "Patches for Relay for Reddit, made to be used alongside Patcheddit"
        source = "git@github.com:DrBushyTop/relay-morphe-patches.git"
        author = "DrBushyTop"
        contact = "https://github.com/DrBushyTop/relay-morphe-patches/issues"
        website = "https://github.com/DrBushyTop/relay-morphe-patches"
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
