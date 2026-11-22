group = "app.yanmus"

patches {
    about {
        name = "yanmus"
        description = "Morphe patches for Yandex Music: no AppMetrica, AppsFlyer and Firebase telemetry"
        source = "git@github.com:murikbmx/yanmus.git"
        author = "murikbmx"
        contact = "https://github.com/murikbmx/yanmus/issues"
        website = "https://github.com/murikbmx/yanmus"
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
