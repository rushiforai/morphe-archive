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

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
}

kotlin.sourceSets.named("test") {
    kotlin.srcDir("../extensions/nuvio-stream-preload/src/main/java")
}

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
    source(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioSettingsStoreResolver.java"))
    source(file("../extensions/nuvio-remaining-episodes/src/main/java/software/santodan/extension/nuvioremaining/NuvioEpisodeCounts.java"))
}

tasks {
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
