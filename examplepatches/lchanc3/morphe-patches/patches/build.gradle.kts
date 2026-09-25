group = "app.lchanc3"

patches {
    about {
        name = "lchanc3"
        description = "Personal quality-of-life patches"
        source = "git@github.com:lchanc3/morphe-patches.git"
        author = "lchanc3"
        contact = "na"
        website = "https://github.com/lchanc3/morphe-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    // Patcher.invoke() returns a Flow, so verifyAgainstApk needs coroutines to
    // compile against. The patcher already brings it in at runtime.
    compileOnly(libs.kotlinx.coroutines.core)
}

tasks {
    register<JavaExec>("verifyAgainstApk") {
        description = "Apply the built bundle to a JPTT APK, so a patch that stopped " +
            "matching fails here instead of in Morphe Manager"

        // buildAndroid rather than build: it writes classes.dex into the jar in
        // place, so a later build sees the jar changed and rebuilds it without
        // one -- a bundle that works here and shows no patches on a phone.
        dependsOn("buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.VerifyAgainstApkKt")

        // -Papk=<path>, then $JPTT_APK, then any APK left in the project root.
        // The APK is not in the repository, which is why this is never wired into
        // `build`: not having one must not break an ordinary build. A relative
        // path is taken from the repository root, not from patches/, where the
        // task runs.
        val apk = ((findProperty("apk") as String?) ?: System.getenv("JPTT_APK"))
            ?.let { rootDir.resolve(it).absolutePath }
            ?: rootDir.listFiles { file -> file.extension == "apk" }
                ?.sortedBy { it.name }
                ?.firstOrNull()
                ?.absolutePath

        args = listOf(
            apk ?: "",
            layout.buildDirectory.dir("verify").get().asFile.absolutePath,
        )
    }

    register<JavaExec>("generatePatchesList") {
        description = "Regenerate patches-list.json from the built bundle"

        dependsOn("buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }
}
