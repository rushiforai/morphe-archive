group = "dev.dyno0311"

patches {
    // This name is what shows up as the patch source in Morphe Manager.
    // Keep it clearly distinct from "Morphe" itself and from other bundles.
    about {
        name = "Dyno Patches"
        description = "Personal Android patches, compatible with Morphe."
        source = "https://github.com/Dyno0311/dyno-patches.git"
        author = "Dyno0311"
        contact = "https://github.com/Dyno0311/dyno-patches/issues"
        website = "https://github.com/Dyno0311/dyno-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")
// Runtime classpath for the local validation harness; keeps the patcher out of the bundle.
val patchValidatorClasspath = configurations.create("patchValidatorClasspath")

dependencies {
    compileOnly(libs.gson)
    compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
    patchListGeneratorClasspath(libs.gson)
    patchValidatorClasspath(libs.morphe.patcher)
}

tasks {
    register<JavaExec>("verifyBundle") {
        description = "Load a built bundle through the patch loader and assert its patches are visible"
        classpath = sourceSets["main"].output + patchValidatorClasspath
        mainClass.set("util.VerifyBundleKt")
        args = (project.findProperty("bundleArgs") as String?)?.split(" ") ?: emptyList()
    }

    register<JavaExec>("validateCamScanner") {
        description = "Apply the bundle's patches to an APK with validation enabled"
        dependsOn(build)
        classpath = sourceSets["main"].output + patchValidatorClasspath
        mainClass.set("util.ValidatePatchesKt")
        maxHeapSize = "2g"
        systemProperty("patches", project.findProperty("patches") ?: "")
        args = (project.findProperty("apkArgs") as String?)?.split(" ") ?: emptyList()
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
