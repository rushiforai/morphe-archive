group = "app.xperia"

patches {
    about {
        name = "alalloush Xperia 1 V camera patches"
        description = "Runs the Sony Xperia 1 VI camera app (jp.co.sony.mc.cameraapp) on the Xperia 1 V, and re-signs Photo Pro to install alongside it"
        source = "git@github.com:alalloush/xperia-1v-camera-patches.git"
        author = "alalloush"
        contact = "na"
        website = "https://github.com/alalloush/xperia-1v-camera-patches"
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
