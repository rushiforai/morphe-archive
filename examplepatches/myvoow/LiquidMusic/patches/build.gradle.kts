group = "app.liquidmusic"

patches {
    about {
        name = "LiquidMusic Patches"
        description = "Liquid Glass for Apple Music on Android"
        source = "git@github.com:myvoow/LiquidMusic.git"
        author = "myvoow"
        contact = "https://github.com/myvoow/LiquidMusic/issues"
        website = "https://github.com/myvoow/LiquidMusic"
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
