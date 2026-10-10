import java.util.Properties

group = "software.santodan.patches"

patches {
    about {
        name = "Santodan Patches"
        description = "Independent Morphe patches for MEO, NuvioTV, Reddit, Pillo, and Peafowl"
        source = "https://github.com/Santodan/santodan-patches"
        author = "Santodan"
        contact = "https://github.com/Santodan"
        website = "https://morphe.software/add-source?github=Santodan/santodan-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

// Match Android's SDK lookup on developer machines and GitHub-hosted runners.
// JVM verification sources reference Android types but must not bundle SDK stubs.
val androidSdkDirectory = providers.provider {
    val sdkProperties = Properties()
    rootProject.file("local.properties").takeIf { it.isFile }?.inputStream()?.use {
        sdkProperties.load(it)
    }
    sdkProperties.getProperty("sdk.dir")
        ?: providers.environmentVariable("ANDROID_HOME")
            .orElse(providers.environmentVariable("ANDROID_SDK_ROOT")).orNull
        ?: throw GradleException("Android SDK not found: set sdk.dir in local.properties or ANDROID_HOME / ANDROID_SDK_ROOT")
}
val androidTestJar = androidSdkDirectory.map { file("$it/platforms/android-36/android.jar") }

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
    testImplementation("org.json:json:20240303")
    testCompileOnly(files(androidTestJar))
}

kotlin.sourceSets.named("test") {
    kotlin.srcDir("../extensions/nuvio-stream-preload/src/main/java")
}

sourceSets["test"].java.srcDir("../extensions/pillo-weight-import/src/main/java")
sourceSets["test"].java.srcDir("../extensions/pillo-local-backup/src/main/java")
sourceSets["test"].java.srcDir("../extensions/pillo-weight-summary/src/main/java")

// The Morphe patch runtime targets Java 11. Pin Java sources explicitly so
// local builds remain reproducible even when Gradle runs on a newer JDK.
tasks.withType<org.gradle.api.tasks.compile.JavaCompile>().configureEach {
    options.release.set(11)
}

// The Java files under src/test are command-line DEX verification programs,
// not JUnit tests. Compile them, but do not fail because no test engine finds
// annotated test methods.
tasks.withType<org.gradle.api.tasks.testing.Test>().configureEach {
    failOnNoDiscoveredTests.set(false)
}

// Exercise the exact Android runtime accessor table against original app DEX files.
tasks.named<org.gradle.api.tasks.compile.JavaCompile>("compileTestJava") {
    source(file("../extensions/nuvio-remaining-episodes/src/main/java/software/santodan/extension/nuvioremaining/NuvioBadgeComposition.java"))
    source(file("../extensions/nuvio-airing-series/src/main/java/software/santodan/extension/nuvioairing/NuvioBadgeComposition.java"))
    source(file("../extensions/nuvio-movie-release-dates/src/main/java/software/santodan/extension/nuviomovierelease/MovieReleaseDate.java"))
    source(file("../extensions/nuvio-movie-release-dates/src/main/java/software/santodan/extension/nuviomovierelease/NuvioBadgeComposition.java"))
    source(file("../extensions/nuvio-finale-dates/src/main/java/software/santodan/extension/nuviofinale/NuvioBadgeComposition.java"))
    source(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioProviderLayout.java"))
    source(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioWatchedHistory.java"))
    source(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioBadgeDelta.java"))
    source(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioProviderBadge.java"))
    source(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioSettingsStoreResolver.java"))
    source(file("../extensions/nuvio-remaining-episodes/src/main/java/software/santodan/extension/nuvioremaining/NuvioEpisodeCounts.java"))
}

tasks {
    register<JavaExec>("verifyPilloWeightSummaryBundle") {
        dependsOn("testClasses", "buildAndroid")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyPilloWeightSummaryBundleKt")
        maxHeapSize = "4g"
        args(file("../../.inspect-pillo-620/xyz.rtrvr.pillo.apk").absolutePath,
            file("${layout.buildDirectory.get()}/libs/patches-${project.version}.mpp").absolutePath,
            file("${layout.buildDirectory.get()}/verification/pillo-summary-bundle").absolutePath,
            file("../../Apps/Pillo/Pillo-0.6.20-patches-1.46.0.apk").absolutePath)
    }
    register<JavaExec>("verifyPilloLocalArchive") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyPilloLocalArchive")
        args(file("${layout.buildDirectory.get()}/verification").absolutePath)
    }
    register<JavaExec>("verifyPilloLocalBackup") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyPilloLocalBackup")
        args(file("../../.inspect-pillo-620").absolutePath,
            file("${layout.buildDirectory.get()}/verification/pillo-local-backup.dex").absolutePath)
    }
    register<JavaExec>("verifyPilloLocalBackupBundle") {
        dependsOn("testClasses", "buildAndroid")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyPilloLocalBackupBundleKt")
        maxHeapSize = "4g"
        args(file("../../.inspect-pillo-620/xyz.rtrvr.pillo.apk").absolutePath,
            file("${layout.buildDirectory.get()}/libs/patches-${project.version}.mpp").absolutePath,
            file("${layout.buildDirectory.get()}/verification/pillo-local-bundle").absolutePath)
    }

    register<JavaExec>("verifyPilloWeightImportBundle") {
        dependsOn("testClasses", "buildAndroid")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyPilloWeightImportBundleKt")
        maxHeapSize = "4g"
        args(file("../../.inspect-pillo-620/xyz.rtrvr.pillo.apk").absolutePath,
            file("${layout.buildDirectory.get()}/libs/patches-${project.version}.mpp").absolutePath,
            file("${layout.buildDirectory.get()}/verification/pillo-import-bundle").absolutePath)
    }

    register<JavaExec>("verifyPilloWeightImport") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyPilloWeightImport")
        args(file("../../.inspect-pillo-620").absolutePath,
            file("${layout.buildDirectory.get()}/verification/pillo-weight-import.dex").absolutePath)
    }

    register<JavaExec>("verifyPilloWeightImportRuntime") {
        dependsOn("testClasses")
        // Android's org.json classes are JVM stubs; use the real JSON library first.
        classpath = sourceSets["test"].runtimeClasspath.filter { it.name != "android.jar" } +
            files(androidTestJar)
        mainClass.set("santodan.patches.VerifyPilloWeightImportRuntimeKt")
        providers.gradleProperty("weightBackup").orNull?.let { args(it) }
    }
    register<JavaExec>("verifyNuvioProviderBadge") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioProviderBadge")
    }
    register<JavaExec>("verifyNuvioMovieReleaseRuntime") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioMovieReleaseRuntime")
        args(file("../extensions/nuvio-movie-release-dates/src/main/java/software/santodan/extension/nuviomovierelease").absolutePath, file("${layout.buildDirectory.get()}/verification/movie-release-runtime").absolutePath)
    }
    register<JavaExec>("verifyNuvioMovieReleaseDates") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioMovieReleaseDates")
    }
    register<JavaExec>("verifyNuvioStreamPreload") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioStreamPreloadKt")
    }
    register<JavaExec>("verifyNuvioStreamPreloadRuntime") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioStreamPreloadRuntimeKt")
    }
    register<JavaExec>("verifyNuvioBadgeComposition") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioBadgeComposition")
    }

    register<JavaExec>("verifyNuvioBadgeDelta") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioBadgeDelta")
    }

    register<JavaExec>("verifyNuvioWatchedHistory") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioWatchedHistory")
    }

    register<JavaExec>("verifyNuvioRemainingCounts") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioRemainingCounts")
    }

    register<JavaExec>("verifyNuvioSettingsStoreRuntime") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioSettingsStoreRuntime")
    }

    register<JavaExec>("verifyNuvioSettingsMenuRuntime") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioSettingsMenuRuntime")
        args(file("../extensions/nuvio-settings-menu/src/main/java/software/santodan/extension/nuviomenu/NuvioSettingsMenu.java").absolutePath,
            file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioSourceContinuation.java").absolutePath,
            file("${layout.buildDirectory.get()}/verification/settings-menu-runtime").absolutePath)
    }

    register<JavaExec>("verifyNuvioBeta2") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioLayout")
        args("1.1.0-beta.2", file("../../.inspect-nuvio-beta2").absolutePath,
            file("${layout.buildDirectory.get()}/verification/nuvio-beta2.dex").absolutePath)
    }

    register<JavaExec>("verifyNuvioBeta4") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioLayout")
        args("1.1.0-beta.4", file("../../.inspect-nuvio-beta4").absolutePath,
            file("${layout.buildDirectory.get()}/verification/nuvio-beta4.dex").absolutePath)
    }

    register<JavaExec>("verifyNuvioBeta5") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioLayout")
        args("1.1.0-beta.5", file("../../.inspect-nuvio-beta5").absolutePath,
            file("${layout.buildDirectory.get()}/verification/nuvio-beta5.dex").absolutePath)
    }

    register<JavaExec>("verifyRedditContentFilter") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyRedditContentFilter")
        args(fileTree("../../.inspect-reddit") { include("classes*.dex") }.files.sorted().map { it.absolutePath })
    }

    register<JavaExec>("verifyRedditGuestMode") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyRedditGuestMode")
        args(fileTree("../../.inspect-reddit") { include("classes*.dex") }.files.sorted().map { it.absolutePath })
    }

    register<JavaExec>("verifyPilloPatch") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyPilloPatch")
        val input = file("../../.inspect-pillo-620/classes15.dex")
        args(input.absolutePath, file("${layout.buildDirectory.get()}/verification/pillo-classes15.dex").absolutePath)
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
