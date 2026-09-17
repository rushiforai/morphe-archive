group = "app.patches.tg"

// Owner/repo slug, used for the bundle metadata and the "Add to Morphe" source link.
val repoSlug = providers.gradleProperty("repoSlug").orElse("OWNER/telegram-patches")

patches {
    about {
        name = "Telegram Patches"
        description = "Morphe patch set for the official Telegram Android app: premium unlock without a " +
            "subscription, download/upload speed boost, banned-channel access, media saving, screenshots, " +
            "no sponsored content, secret media and a Delete Account dialog."
        source = "https://github.com/${repoSlug.get()}"
        author = "Abhi (@AbhiTheModder), @Zylern_OP, @rezaAa1177, Nekogram, Cherrygram; Morphe port"
        contact = "https://github.com/${repoSlug.get()}/issues"
        website = "https://github.com/${repoSlug.get()}"
        license = "GPLv3"
    }
}

dependencies {
    // Needed only to compile/run the development verification harness (not bundled: patcherProvided
    // is excluded from the .mpp by the Morphe Patches Gradle plugin).
    "patcherProvided"("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
}

/**
 * Development-only task: writes the module runtime classpath to build/verify-classpath.txt so the
 * verification harness can be launched with a standalone JVM (avoids sharing heap with the daemon).
 */
tasks.register("writeVerifyClasspath") {
    description = "Writes the runtime classpath for launching the verification harness standalone."
    group = "verification"
    dependsOn(tasks.named("classes"))

    val classpath = sourceSets["main"].runtimeClasspath
    val outputFile = layout.buildDirectory.file("verify-classpath.txt")
    outputs.file(outputFile)

    doLast {
        outputFile.get().asFile.writeText(classpath.asPath)
    }
}

/**
 * Development-only task: applies the freshly built patch bundle to a real APK and reports, per
 * patch, whether its fingerprints resolved against that APK.
 */
tasks.register<JavaExec>("verifyPatches") {
    description = "Applies the built .mpp to a real Telegram APK and reports per-patch fingerprint resolution."
    group = "verification"

    dependsOn(tasks.named("jar"))

    classpath = sourceSets["main"].runtimeClasspath
    mainClass.set("app.patches.tg.VerifyMainKt")
    maxHeapSize = "5g"

    val apkProperty = providers.gradleProperty("verifyApk")
    val outProperty = providers.gradleProperty("verifyOut")
    val includeDisabledProperty = providers.gradleProperty("verifyIncludeDisabled")

    doFirst {
        val archive = tasks.named<Jar>("jar").get().archiveFile.get().asFile
        args = listOf(
            apkProperty.getOrElse("/root/tgfinal/telegram_official.apk"),
            outProperty.getOrElse(layout.buildDirectory.dir("verify").get().asFile.absolutePath),
            archive.absolutePath,
            includeDisabledProperty.getOrElse("true"),
        )
    }
}

/**
 * Release metadata for Morphe sources: writes `patches-list.json` + `patches-bundle.json` into the
 * repository root, exactly like public Morphe patch sources do.
 */
tasks.register<JavaExec>("generatePatchesList") {
    description = "Writes patches-list.json and patches-bundle.json for the built bundle."
    group = "build"

    dependsOn(tasks.named("jar"))

    classpath = sourceSets["main"].runtimeClasspath
    mainClass.set("app.patches.tg.PatchListGeneratorKt")

    val archive = tasks.named<Jar>("jar").flatMap { it.archiveFile }
    val repoSlug = providers.gradleProperty("repoSlug").orElse("OWNER/telegram-patches")
    val outputRoot = rootProject.layout.projectDirectory.asFile
    val changelog = rootProject.layout.projectDirectory.file("CHANGELOG.md").asFile

    doFirst {
        args = listOf(
            archive.get().asFile.absolutePath,
            project.version.toString(),
            outputRoot.absolutePath,
            "https://github.com/${repoSlug.get()}/releases/download/v${project.version}",
            changelog.absolutePath,
        )
    }
}

/**
 * Development-only classes must not ship inside the patch bundle. The Gradle tasks that use them
 * (`verifyPatches`, `generatePatchesList`) run from the module runtime classpath, so excluding them
 * from the jar is safe.
 */
tasks.named<Jar>("jar") {
    exclude("app/patches/tg/VerifyMainKt*.class")
    exclude("app/patches/tg/PatchListGeneratorKt*.class")

    // Ship the changelog inside the bundle so the .mpp is self-describing even before the source
    // repository is published. (Morphe Manager reads version/changelog from patches-bundle.json in
    // the source repo; this is the offline fallback.)
    from(rootProject.layout.projectDirectory.file("CHANGELOG.md"))
    manifest {
        attributes(
            "Patches-Count" to "20",
            "Changelog" to "CHANGELOG.md",
        )
    }
}
