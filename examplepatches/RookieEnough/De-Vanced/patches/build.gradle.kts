group = "app.morphe"

patches {
    about {
        name = "De-Vanced Patches"
        description = "ReVanced patches, ported for Morphe."
        source = "https://github.com/RookieEnough/De-ReVanced"
        author = "De-Vanced"
        contact = "na"
        website = "https://github.com/RookieEnough/De-ReVanced"
        license = "GNU General Public License v3.0"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    // Android API stubs defined here.
    compileOnly(project(":patches:stub"))
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
