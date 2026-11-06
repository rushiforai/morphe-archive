group = "app.xiondigital"

patches {
    about {
        name = "XiONDiGiTaL Patches"
        description = "Patches for Tandem (net.tandem)"
        source = "git@github.com:XiONDiGiTaL/MorphePatches.git"
        author = "XiONDiGiTaL"
        contact = "https://xiondigital.net"
        website = "https://xiondigital.net"
        license = "TBD"
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
