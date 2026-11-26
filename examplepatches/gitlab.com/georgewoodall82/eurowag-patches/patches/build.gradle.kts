import java.util.zip.ZipFile

group = "app.eurowag"

patches {
    about {
        name = "Eurowag Navi Premium Patches"
        description = "Community patches for Eurowag Navi / Eurowag Navigation - Truck GPS (com.roadlords.android): unlock the Premium subscription and the complete truck feature set"
        source = "git@gitlab.com:georgewoodall82/eurowag-patches.git"
        author = "georgewoodall82"
        contact = "na"
        website = "https://gitlab.com/georgewoodall82/eurowag-patches"
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

/**
 * Builds the Android-ready bundle and checks it really contains compiled
 * patch code. `jar` and `buildAndroid` both write the same .mpp file; `jar`
 * (and therefore `build` / `test`) overwrites the Android output and leaves
 * no classes.dex, which Morphe Manager then shows as "0 patches".
 *
 * Always finish a release with this task, and don't run build/test afterwards.
 */
dependencies {
    testImplementation(kotlin("test"))
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
}

tasks.withType<Test>().configureEach {
    maxHeapSize = "6g"
    systemProperty(
        "eurowag.apk",
        providers.gradleProperty("eurowagApk")
            .getOrElse("/tmp/eurowag/xapk/com.roadlords.android.apk"),
    )
    testLogging {
        events("passed", "failed", "skipped")
        showStandardStreams = true
        exceptionFormat = org.gradle.api.tasks.testing.logging.TestExceptionFormat.FULL
    }
}

tasks.register("packageBundle") {
    description = "Builds the Android-ready .mpp and verifies it contains classes.dex"
    group = "build"

    dependsOn("buildAndroid")

    doLast {
        val mpp = layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile
        check(mpp.isFile) { "Bundle not found: $mpp" }

        ZipFile(mpp).use { zip ->
            checkNotNull(zip.getEntry("classes.dex")) {
                "${mpp.name} has no classes.dex; Morphe Manager would show 0 patches. " +
                    "Re-run :patches:packageBundle and do not run build/test afterwards."
            }
        }

        println("Android-ready bundle: ${mpp.name} (${mpp.length()} bytes)")
    }
}
