group = "app.haukist.smartnews"

patches {
    about {
        name = "SmartNews Patches"
        description = "Morphe patches for SmartNews to remove ads and trackers"
        source = "git@github.com:haukist/morphe-patches-smartnews.git"
        author = "haukist"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    testImplementation(kotlin("test"))
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
}

tasks {
    test {
        useJUnitPlatform()
        systemProperty("smartnews.sentryDiagnostics", providers.gradleProperty("sentryDiagnostics").getOrElse("false"))
        dependsOn(jar)
        testLogging {
            events("PASSED", "SKIPPED", "FAILED", "STANDARD_OUT", "STANDARD_ERROR")
            showStandardStreams = true
        }
    }

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
