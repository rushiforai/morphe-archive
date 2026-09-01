group = "app.morphe.patches.oraimohealth"

patches {
    about {
        name = "Oraimo Health Offline Patches"
        description = "Offline sanitization and privacy patches for Oraimo Health app"
        source = "https://github.com/benzophury/oraimo-health-morphe-patches.git"
        author = "benzophury"
        contact = "na"
        website = "https://github.com/benzophury/oraimo-health-morphe-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    testImplementation(libs.kotlin.test)
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
