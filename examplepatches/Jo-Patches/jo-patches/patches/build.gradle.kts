group = "app.memorizepi"

patches {
    about {
        name = "Jo's Patches"
        description = "Patches for Android apps: remove ads, cross-promotion, tracking and Pro unlock"
        source = "https://gitlab.com/JoPatches/jo-patches"
        author = "JoPatches"
        contact = ""
        website = ""
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    // Needed to compile the bundle integration test (RunBundleTest.kt).
    // morhe-patcher declares these as runtime-only, so they resolve for
    // execution but not for compilation.
    compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core-jvm:1.10.2")
    compileOnly("com.github.MorpheApp.smali:smali:ac700e1942")
}

tasks {
    // Test runners and the patch-list generator are build tooling, not part of
    // the shipped bundle. Keeping them out of the .mpp avoids shipping classes
    // that depend on compile-only libraries (coroutines, smali, gson).
    named<Jar>("jar") {
        exclude("app/memorizepi/patches/pi/testutil/**")
        exclude("util/**")
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    register<JavaExec>("runBundleTest") {
        description = "Runs the built patch bundle against the original base APK (integration test)"

        dependsOn(build)

        workingDir = projectDir
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("app.memorizepi.patches.pi.testutil.RunBundleTestKt")
        // Optional: -PpatchOnly="Remove cross-promotion ..." to run a subset.
        providers.gradleProperty("patchOnly").orNull?.let {
            systemProperty("morphe.patch.only", it)
        }
        // Optional: -PapkFile=C:\path\to\base.apk or the original XAPK.
        providers.gradleProperty("apkFile").orNull?.let {
            systemProperty("morphe.patch.apkFile", it)
        }
    }

    register<JavaExec>("patchMergedApp") {
        description = "Patches the merged standalone APK (all XAPK splits combined) for direct install"

        dependsOn(build)

        workingDir = projectDir
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("app.memorizepi.patches.pi.testutil.RunBundleTestKt")
        systemProperties(
            "morphe.patch.apkFile" to "../../tools/memorize-pi-11.01-merged.apk",
            "morphe.patch.outputDir" to "../../tools/patched",
        )
    }

    register<JavaExec>("runBundleTestMaterialCapsule") {
        description = "Runs the built patch bundle against the original Material Capsule base APK"

        dependsOn(build)

        workingDir = projectDir
        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("app.memorizepi.patches.pi.testutil.RunBundleTestKt")
        systemProperties(
            "morphe.patch.apkFile" to "../../input/material-capsule/xapk-extract/com.pryshedko.mtisland.apk",
            "morphe.patch.outputDir" to "../../input/material-capsule/patched",
        )
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
