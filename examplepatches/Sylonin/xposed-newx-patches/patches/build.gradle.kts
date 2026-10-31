group = "app.xposed"

patches {
    about {
        name = "X-Posed Patches for NewX"
        description = "X-Posed account location badges for the Compose-based X (NewX)"
        source = "https://github.com/Sylonin/xposed-newx-patches"
        author = "Sylonin. Based on AetherMagee's xposed-patches and X-Posed by Alexander Hagenah"
        contact = "na"
        website = "https://github.com/Sylonin/xposed-newx-patches"
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
