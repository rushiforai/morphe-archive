import java.util.Properties
import java.util.zip.ZipFile

group = "software.santodan.patches"

patches {
    about {
        name = "Santodan Patches"
        description = "Independent Morphe patches for Car Scanner, MEO, Monet, NuvioTV, Reddit, Pillo, and Peafowl"
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

tasks.named<org.gradle.api.tasks.compile.JavaCompile>("compileTestJava") {
    source(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioLocalWriteContinuation.java"))
    source(file("../extensions/nuvio-apk-updates/src/main/java/software/santodan/extension/nuvioupdate/UpdateProgress.java"))
}
tasks.register<JavaExec>("verifyNuvioUpdateProgressRuntime") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioUpdateProgressRuntime")
}
tasks.register<JavaExec>("verifyNuvioUpdateUiRuntime") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioUpdateUiRuntime")
    args(file("../extensions/nuvio-apk-updates/src/main/java/software/santodan/extension/nuvioupdate/UpdateInstall.java").absolutePath,
        file("${layout.buildDirectory.get()}/verification/update-ui-runtime").absolutePath)
}

tasks.register<JavaExec>("verifyMonet") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyMonet")
    args(file("../../OriginalApps/monet-1.1.0.apk").absolutePath,
        layout.buildDirectory.file("verification/monet/evaluator.dex").get().asFile.absolutePath)
}

tasks.register<JavaExec>("verifyMonetBundle") {
    dependsOn("testClasses", "buildAndroid")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyMonetBundleKt")
    maxHeapSize = "3g"
    args(file("../../OriginalApps/monet-1.1.0.apk").absolutePath,
        layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile.absolutePath,
        layout.buildDirectory.dir("verification/monet/bundle").get().asFile.absolutePath)
}

tasks.register<JavaExec>("verifyMonetApk") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyMonetApk")
    args(file("../../OriginalApps/monet-1.1.0.apk").absolutePath,
        file(providers.gradleProperty("monetApk").getOrElse("../../Apps/Monet/monet-1.1.0-premium-experimental-unsigned.apk")).absolutePath)
}

val patchVersionSource = layout.buildDirectory.dir("generated/sources/patchVersion")
val generatePatchVersion by tasks.registering {
    inputs.property("bundleVersion", project.version.toString())
    outputs.dir(patchVersionSource)
    doLast {
        val version = project.version.toString()
        check(version.matches(Regex("[0-9A-Za-z.-]+")))
        patchVersionSource.get().file("santodan/patches/PatchBundleVersion.java").asFile.apply {
            parentFile.mkdirs()
            writeText("package santodan.patches; public final class PatchBundleVersion { public static final String VERSION = \"$version\"; private PatchBundleVersion() {} }\n")
        }
    }
}
sourceSets["main"].java.srcDir(patchVersionSource)
tasks.named("compileJava") { dependsOn(generatePatchVersion) }
tasks.named("compileKotlin") { dependsOn(generatePatchVersion) }
tasks.named("sourcesJar") { dependsOn(generatePatchVersion) }
tasks.named("javadoc") { dependsOn(generatePatchVersion) }

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

val nuvioNativeProperties = Properties().apply {
    rootProject.file("contracts/nuvio/native.properties").inputStream().use { load(it) }
}
val nuvioOriginal = file("../../OriginalApps/${nuvioNativeProperties.getProperty("ORIGINAL_APK")}")
val nuvioTargetVersion = nuvioNativeProperties.getProperty("VERSION")

tasks.register<JavaExec>("reportNuvioUpdate") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.ReportNuvioUpdate")
    maxHeapSize = "3g"
    args(nuvioOriginal.absolutePath,
        file(providers.gradleProperty("nuvioCandidateApk").getOrElse(nuvioOriginal.absolutePath)).absolutePath,
        layout.buildDirectory.file("reports/nuvio-update.md").get().asFile.absolutePath)
}

tasks.register("verifyNuvioLatest") {
    group = "verification"
    description = "Verify the currently reviewed Nuvio contract, runtime features and packaged patch combinations."
    dependsOn("verifyNuvioMaintenance", "verifyNuvioBeta8", "verifyNuvioBeta8Launcher", "verifyNuvioBeta8Player",
        "verifyNuvioCurrentStream", "verifyNuvioPreferredAddon", "verifyNuvioPlaybackButtons", "verifyNuvioIntroDb", "verifyNuvioApkUpdates", "verifyNuvioUpdateInstaller",
        "verifyNuvioUpdateFlow", "verifyNuvioUpdateProgressRuntime", "verifyNuvioUpdateUiRuntime",
        "verifyNuvioBeta8DateStyleRuntime", "verifyNuvioBeta8SettingsMenuRuntime", "verifyNuvioBeta8TrackingDialogs",
        "verifyNuvioCurrentStreamRuntime", "verifyNuvioPreferredAddonRuntime", "verifyNuvioPlaybackButtonsRuntime",
        "verifyNuvioIntroDbRuntime", "verifyNuvioStreamPreloadRuntime", "verifyNuvioProviderRefreshRuntime", "verifyNuvioPlaybackOverlayRuntime", "verifyNuvioSyncBannerRuntime",
        "verifyNuvioSettingsStoreRuntime", "verifyNuvioWatchedSnapshotRuntime", "verifyNuvioPlayerStability",
        "verifyNuvioNextEpisodeCooldown", "verifyNuvioBeta8Bundle")
}

dependencies {
    compileOnly(project(":nuvio-contracts"))
    testImplementation(project(":nuvio-contracts"))
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
    testImplementation("org.json:json:20240303")
    testImplementation(libs.gson)
    testCompileOnly(files(androidTestJar))
}

tasks.register<JavaExec>("verifyNuvioMaintenance") {
    dependsOn("testClasses", "processResources")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioMaintenance")
    maxHeapSize = "2g"
    args(nuvioOriginal.absolutePath,
        layout.buildDirectory.file("resources/main/extensions/nuvio-settings-menu.mpe").get().asFile.absolutePath,
        layout.buildDirectory.file("verification/nuvio-native-bridges.dex").get().asFile.absolutePath)
}

tasks.register<JavaExec>("verifyNuvioCurrentStream") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioCurrentStream")
    maxHeapSize = "2g"
    args(nuvioOriginal.absolutePath,
        file("${layout.buildDirectory.get()}/verification/nuvio-current-stream.dex").absolutePath)
}

tasks.register<JavaExec>("verifyNuvioPreferredAddon") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioPreferredAddon")
    maxHeapSize = "2g"
    args(nuvioOriginal.absolutePath,
        file("${layout.buildDirectory.get()}/verification/nuvio-preferred-addon.dex").absolutePath)
    if (providers.gradleProperty("discoverPreferredAddon").isPresent) args("discover")
}

tasks.register<JavaExec>("verifyNuvioPreferredAddonRuntime") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioPreferredAddonRuntime")
    args(file("../extensions/nuvio-preferred-addon/src/main/java/software/santodan/extension/nuviopreferred/NuvioPreferredAddon.java").absolutePath,
        file("${layout.buildDirectory.get()}/verification").absolutePath)
}

tasks.register<JavaExec>("verifyNuvioPreferredAddonApk") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioPlaybackApkKt")
    maxHeapSize = "3g"
    args(nuvioOriginal.absolutePath,
        file(providers.gradleProperty("nuvioPreferredApk").getOrElse("../../Apps/NuvioTV/NuvioTV-1.1.0-beta.8-binge-group-priority-signed.apk")).absolutePath,
        file(androidSdkDirectory.get()).absolutePath,
        file("${layout.buildDirectory.get()}/verification/nuvio-preferred-addon-apk").absolutePath,
        "Lsoftware/santodan/extension/nuviopreferred/NuvioPreferredAddon;", "15")
}

tasks.register<JavaExec>("verifyNuvioCurrentStreamRuntime") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioCurrentStreamRuntime")
    args(file("../extensions/nuvio-current-stream/src/main/java/software/santodan/extension/nuviocurrentstream/NuvioCurrentStream.java").absolutePath,
        file("${layout.buildDirectory.get()}/verification").absolutePath)
}

kotlin.sourceSets.named("test") {
    kotlin.srcDir("../extensions/nuvio-stream-preload/src/main/java")
}

sourceSets["test"].java.srcDir("../extensions/pillo-weight-import/src/main/java")
sourceSets["test"].java.srcDir("../extensions/pillo-local-backup/src/main/java")
sourceSets["test"].java.srcDir("../extensions/pillo-weight-summary/src/main/java")
tasks.named<org.gradle.api.tasks.compile.JavaCompile>("compileTestJava") {
    source(file("../extensions/nuvio-introdb/src/main/java/software/santodan/extension/nuviointro/Submission.java"))
    source(file("../extensions/nuvio-introdb/src/main/java/software/santodan/extension/nuviointro/IntroDbClient.java"))
    source(file("../extensions/nuvio-introdb/src/main/java/software/santodan/extension/nuviointro/SegmentCapture.java"))
    source(file("../extensions/nuvio-playback-buttons/src/main/java/software/santodan/extension/nuviobuttons/ButtonLayout.java"))
}

tasks.register<JavaExec>("verifyNuvioIntroDb") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioIntroDb")
    maxHeapSize = "2g"
    args(nuvioOriginal.absolutePath,
        file("${layout.buildDirectory.get()}/verification/nuvio-introdb.dex").absolutePath)
}

tasks.register<JavaExec>("verifyNuvioIntroDbRuntime") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioIntroDbRuntimeKt")
    args(file("../extensions/nuvio-introdb/src/main/java/software/santodan/extension/nuviointro").absolutePath,
        file("${layout.buildDirectory.get()}/verification").absolutePath)
}

tasks.register<JavaExec>("verifyNuvioIntroDbApk") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioPlaybackApkKt")
    maxHeapSize = "3g"
    args(nuvioOriginal.absolutePath,
        file(providers.gradleProperty("nuvioIntroDbApk").getOrElse("../../Apps/NuvioTV/NuvioTV-1.1.0-beta.8-introdb-timer-signed.apk")).absolutePath,
        file(androidSdkDirectory.get()).absolutePath,
        file("${layout.buildDirectory.get()}/verification/nuvio-introdb-apk").absolutePath,
        "Lsoftware/santodan/extension/nuviointro/NuvioIntroDb;", "5")
}

tasks.register<JavaExec>("verifyNuvioPlaybackButtons") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioPlaybackButtons")
    maxHeapSize = "2g"
    args(nuvioOriginal.absolutePath,
        file("${layout.buildDirectory.get()}/verification/nuvio-playback-buttons.dex").absolutePath)
}

tasks.register<JavaExec>("verifyNuvioPlaybackButtonsRuntime") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioPlaybackButtonsRuntimeKt")
    args(file("../extensions/nuvio-playback-buttons/src/main/java/software/santodan/extension/nuviobuttons").absolutePath,
        file("${layout.buildDirectory.get()}/verification").absolutePath)
}

tasks.register<JavaExec>("verifyNuvioPlaybackApk") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioPlaybackApkKt")
    maxHeapSize = "3g"
    args(nuvioOriginal.absolutePath,
        file(providers.gradleProperty("nuvioPlaybackApk").getOrElse("../../Apps/NuvioTV/NuvioTV-1.1.0-beta.7-playback-buttons-unsigned.apk")).absolutePath,
        file(androidSdkDirectory.get()).absolutePath,
        file("${layout.buildDirectory.get()}/verification/nuvio-playback-apk").absolutePath)
    if (providers.gradleProperty("nuvioRequireStability").getOrElse("false").toBoolean())
        args("Lsoftware/santodan/extension/nuviobuttons/NuvioPlaybackButtons;", "17", "true")
}

tasks.named<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>("compileTestKotlin") {
    source(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioMergePolicy.java"))
    source(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioStartupGate.java"))
    source(file("../extensions/nuvio-playback-buttons/src/main/java/software/santodan/extension/nuviobuttons/ButtonLayout.java"))
    source(file("../extensions/nuvio-launcher-channels/src/main/java/software/santodan/extension/nuviolauncher/LauncherModels.kt"))
    source(file("../extensions/nuvio-launcher-channels/src/main/java/software/santodan/extension/nuviolauncher/LauncherDates.kt"))
    source(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioProviderRefresh.kt"))
    source(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioMergeWork.kt"))
    source(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioLocalOverlay.kt"))
    source(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioPlaybackJournal.kt"))
    source(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioLocalWriteContinuation.java"))
    source(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioSourceContinuation.java"))
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
    source(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioMergePolicy.java"))
    source(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioSourceContinuation.java"))
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
    source(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioStartupGate.java"))
    source(file("../extensions/nuvio-remaining-episodes/src/main/java/software/santodan/extension/nuvioremaining/NuvioEpisodeCounts.java"))
}

tasks {
    register<JavaExec>("verifyFirstDescendantVisibility") {
        dependsOn("testClasses", "buildAndroid")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyFirstDescendantVisibilityKt")
        maxHeapSize = "2g"
        args(file("../../OriginalApps/The-First-Descendant-Companion_1.1.5.apks").absolutePath,
            file("${layout.buildDirectory.get()}/libs/patches-${project.version}.mpp").absolutePath,
            file("${layout.buildDirectory.get()}/verification/first-descendant-visibility").absolutePath,
            rootProject.file("..").absolutePath)
    }
    register<JavaExec>("verifyFirstDescendantDiagnostics") {
        dependsOn("testClasses", "buildAndroid")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyFirstDescendantDiagnosticsKt")
        maxHeapSize = "2g"
        args(file("../../OriginalApps/The-First-Descendant-Companion_1.1.5.apks").absolutePath,
            file("${layout.buildDirectory.get()}/libs/patches-${project.version}.mpp").absolutePath,
            file("${layout.buildDirectory.get()}/verification/first-descendant-diagnostics").absolutePath)
    }
    register<JavaExec>("verifyFirstDescendantBundle") {
        dependsOn("testClasses", "buildAndroid")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyFirstDescendantBundleKt")
        maxHeapSize = "2g"
        args(file("../../OriginalApps/The-First-Descendant-Companion_1.1.5.apks").absolutePath,
            file("${layout.buildDirectory.get()}/libs/patches-${project.version}.mpp").absolutePath,
            file("${layout.buildDirectory.get()}/verification/first-descendant-bundle").absolutePath)
    }
    register<JavaExec>("verifyCarScannerManaged") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyCarScannerManaged")
        maxHeapSize = "1g"
        args(file("../../OriginalApps/Car-Scanner-ELM-OBD2_2.1.50.apk").absolutePath)
    }
    register<JavaExec>("verifyCarScannerManagedBundle") {
        dependsOn("testClasses", "buildAndroid")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyCarScannerManagedBundleKt")
        maxHeapSize = "2g"
        args(file("../../OriginalApps/Car-Scanner-ELM-OBD2_2.1.50.apk").absolutePath,
            file("${layout.buildDirectory.get()}/libs/patches-${project.version}.mpp").absolutePath,
            file("${layout.buildDirectory.get()}/verification/carscanner-managed-bundle").absolutePath)
    }
    register<JavaExec>("verifyCarScanner221") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyCarScanner221")
        maxHeapSize = "1g"
        args(file("../../OriginalApps/Car_Scanner-2.2.21.apk").absolutePath)
    }
    register<JavaExec>("verifyCarScanner221Bundle") {
        dependsOn("testClasses", "buildAndroid")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyCarScanner221BundleKt")
        maxHeapSize = "2g"
        args(file("../../OriginalApps/Car_Scanner-2.2.21.apk").absolutePath,
            file("${layout.buildDirectory.get()}/libs/patches-${project.version}.mpp").absolutePath,
            file("${layout.buildDirectory.get()}/verification/carscanner-221-bundle").absolutePath)
    }
    register<JavaExec>("verifyNuvioLauncherUi") {
        dependsOn("testClasses", ":extensions:nuvio-launcher-channels:compileReleaseKotlin", ":extensions:nuvio-launcher-channels:compileReleaseJavaWithJavac")
        classpath = sourceSets["test"].runtimeClasspath + files(
            project(":extensions:nuvio-launcher-channels").layout.buildDirectory.dir("intermediates/built_in_kotlinc/release/compileReleaseKotlin/classes"),
            project(":extensions:nuvio-launcher-channels").layout.buildDirectory.dir("intermediates/javac/release/compileReleaseJavaWithJavac/classes"))
        mainClass.set("santodan.patches.VerifyNuvioLauncherUi")
        args(file("${layout.buildDirectory.get()}/verification/launcher-ui").absolutePath)
    }
    register<JavaExec>("verifyNuvioLauncherDates") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioLauncherDatesKt")
    }
    register<JavaExec>("verifyNuvioLauncherPublisher") {
        dependsOn("testClasses", ":extensions:nuvio-launcher-channels:compileReleaseKotlin", ":extensions:nuvio-launcher-channels:compileReleaseJavaWithJavac")
        classpath = sourceSets["test"].runtimeClasspath + files(
            project(":extensions:nuvio-launcher-channels").layout.buildDirectory.dir("intermediates/built_in_kotlinc/release/compileReleaseKotlin/classes"),
            project(":extensions:nuvio-launcher-channels").layout.buildDirectory.dir("intermediates/javac/release/compileReleaseJavaWithJavac/classes"))
        mainClass.set("santodan.patches.VerifyNuvioLauncherPublisher")
        args(file("${layout.buildDirectory.get()}/verification/launcher-publisher").absolutePath)
    }
    register<JavaExec>("verifyNuvioLauncherBundle") {
        dependsOn("testClasses", "buildAndroid")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioLauncherBundleKt")
        maxHeapSize = "4g"
        args(file("../../OriginalApps/NuvioTV-1.1.0-beta6.apk").absolutePath,
            file("${layout.buildDirectory.get()}/libs/patches-${project.version}.mpp").absolutePath,
            file("${layout.buildDirectory.get()}/verification/nuvio-launcher-bundle").absolutePath)
    }
    register<JavaExec>("verifyNuvioLauncherChannels") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioBeta6LauncherKt")
        args(file("../../.inspect-nuvio-beta6").absolutePath)
    }
    register<JavaExec>("verifyNuvioDateLabelStyleRuntime") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioBeta6DateStyleRuntime")
        doFirst { file("${layout.buildDirectory.get()}/verification").mkdirs() }
        args(file("../extensions/nuvio-settings-menu/src/main/java/software/santodan/extension/nuviomenu").absolutePath,
            file("${layout.buildDirectory.get()}/verification").absolutePath)
    }
    register<JavaExec>("verifyNuvioRemainingSyncRuntime") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioRemainingSyncRuntime")
        doFirst { file("${layout.buildDirectory.get()}/verification").mkdirs() }
        args(file("../extensions/nuvio-remaining-episodes/src/main/java/software/santodan/extension/nuvioremaining").absolutePath,
            file("${layout.buildDirectory.get()}/verification").absolutePath)
    }
    register<JavaExec>("verifyNuvioSyncBannerRuntime") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioSyncBannerRuntimeKt")
        args(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioSyncBanner.java").absolutePath,
            file("${layout.buildDirectory.get()}/verification/native-sync-banner").absolutePath)
    }
    register<JavaExec>("verifyNuvioProviderRefreshRuntime") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioProviderRefreshRuntimeKt")
    }
    register<JavaExec>("verifyNuvioPlaybackOverlayRuntime") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioPlaybackOverlayRuntimeKt")
    }
    register<JavaExec>("verifyNuvioWatchedSnapshotRuntime") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioWatchedSnapshotRuntimeKt")
        args(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioWatchedSnapshot.java").absolutePath,
            file("${layout.buildDirectory.get()}/verification").absolutePath)
    }
    register<JavaExec>("verifyNuvioTrackingDialogs") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioTrackingDialogs")
        doFirst { file("${layout.buildDirectory.get()}/verification").mkdirs() }
        args(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioTrackingDialogs.java").absolutePath,
            file("${layout.buildDirectory.get()}/verification").absolutePath)
    }
    register<JavaExec>("verifyPillo627Runtime") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath.filter { it.name != "android.jar" } + files(androidTestJar)
        mainClass.set("santodan.patches.VerifyPillo627Runtime")
        doFirst { file("${layout.buildDirectory.get()}/verification").mkdirs() }
        args(file("${layout.buildDirectory.get()}/verification").absolutePath)
    }
    register<JavaExec>("verifyPillo627Bundle") {
        dependsOn("testClasses", "buildAndroid")
        classpath = sourceSets["test"].runtimeClasspath + files(androidTestJar)
        mainClass.set("santodan.patches.VerifyPillo627BundleKt")
        maxHeapSize = "4g"
        args(file("../../.inspect-pillo-627-play/base.apk").absolutePath,
            file("${layout.buildDirectory.get()}/libs/patches-${project.version}.mpp").absolutePath,
            file("${layout.buildDirectory.get()}/verification/pillo-627").absolutePath)
    }
    register<JavaExec>("verifyPilloProgressWeightBundle") {
        dependsOn("testClasses", "buildAndroid")
        classpath = sourceSets["test"].runtimeClasspath + files(androidTestJar)
        mainClass.set("santodan.patches.VerifyPilloProgressWeightBundleKt")
        maxHeapSize = "4g"
        args(file("../../.inspect-pillo-620/xyz.rtrvr.pillo.apk").absolutePath,
            file("${layout.buildDirectory.get()}/libs/patches-${project.version}.mpp").absolutePath,
            file("${layout.buildDirectory.get()}/verification/pillo-progress-weight").absolutePath)
    }
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
    register<JavaExec>("verifyNuvioNextEpisodePreload") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioNextEpisodePreloadKt")
    }
    register<JavaExec>("verifyNuvioNextEpisodeCooldown") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioNextEpisodeCooldownKt")
    }
    register<JavaExec>("verifyNuvioPlayerStability") {
        dependsOn("testClasses")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioPlayerStability")
        args(nuvioOriginal.absolutePath, file("${layout.buildDirectory.get()}/verification/nuvio-player-stability.dex").absolutePath)
    }
    register<JavaExec>("verifyNuvioNextEpisodeBundle") {
        dependsOn("testClasses", "buildAndroid")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("santodan.patches.VerifyNuvioBeta6BundleKt")
        maxHeapSize = "4g"
        args(file("../../OriginalApps/NuvioTV-1.1.0-beta6.apk").absolutePath,
            file("${layout.buildDirectory.get()}/libs/patches-${project.version}.mpp").absolutePath,
            file("${layout.buildDirectory.get()}/verification/nuvio-next-episode-bundle").absolutePath)
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

    register<JavaExec>("verifyRedditPostBatch") {
        dependsOn("testClasses", ":extensions:reddit-filter:compileReleaseJavaWithJavac")
        classpath = sourceSets["test"].runtimeClasspath + files(androidTestJar,
            project(":extensions:reddit-filter").layout.buildDirectory.dir(
                "intermediates/javac/release/compileReleaseJavaWithJavac/classes"))
        mainClass.set("santodan.patches.VerifyRedditPostBatch")
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

        dependsOn(build, "buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList", "verifyAndroidBundle")
    }
}

// buildAndroid adds DEX to the JVM archive in place. A later jar/build task can
// replace that archive, so validate after both metadata generation and dexing.
tasks.register("verifyAndroidBundle") {
    group = "verification"
    description = "Reject release bundles without root-level Android DEX entries."
    dependsOn("generatePatchesList")
    doLast {
        val bundle = tasks.named<org.gradle.jvm.tasks.Jar>("jar").get().archiveFile.get().asFile
        ZipFile(bundle).use { zip ->
            val dexEntries = zip.entries().asSequence()
                .filter { !it.isDirectory && it.name.matches(Regex("classes([2-9][0-9]*|1[0-9]+)?\\.dex")) }
                .toList()
            check(dexEntries.any { it.name == "classes.dex" }) {
                "Patch bundle is missing root classes.dex: $bundle"
            }
            dexEntries.forEach { entry ->
                val header = zip.getInputStream(entry).use { it.readNBytes(8) }
                check(entry.size >= 112 && header.size == 8 &&
                    header.copyOfRange(0, 4).contentEquals(byteArrayOf(100, 101, 120, 10)) &&
                    header[7] == 0.toByte()) {
                    "Invalid DEX entry ${entry.name} in $bundle"
                }
            }
            logger.lifecycle("Verified {} Android DEX entries in {}", dexEntries.size, bundle)
        }
    }
}

tasks.register<JavaExec>("verifyNuvioBeta6") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioBeta6")
    maxHeapSize = "2g"
    args("1.1.0-beta.6", file("../../.inspect-nuvio-beta6").absolutePath,
        file("${layout.buildDirectory.get()}/verification/nuvio-beta6.dex").absolutePath)
}

sourceSets["test"].java.srcDir("../extensions/nuvio-stream-preload/src/main/java")
tasks.register<JavaExec>("verifyNuvioBeta6Bundle") {
    dependsOn("testClasses", "buildAndroid")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioBeta6BundleKt")
    maxHeapSize = "3g"
    args(file("../../OriginalApps/NuvioTV-1.1.0-beta6.apk").absolutePath,
        file("${layout.buildDirectory.get()}/libs/patches-${project.version}.mpp").absolutePath,
        file("${layout.buildDirectory.get()}/verification/nuvio-beta6-bundle").absolutePath,
        file(androidSdkDirectory.get()).absolutePath)
}

tasks.register<JavaExec>("verifyNuvioBeta6DateStyleRuntime") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioBeta6DateStyleRuntime")
    args(file("../extensions/nuvio-settings-menu/src/main/java/software/santodan/extension/nuviomenu").absolutePath,
        file("${layout.buildDirectory.get()}/verification").absolutePath)
}
tasks.register<JavaExec>("verifyNuvioBeta6Launcher") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioBeta6LauncherKt")
    args(file("../../.inspect-nuvio-beta6").absolutePath)
}

tasks.register<JavaExec>("verifyNuvioBeta6Player") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioBeta6PlayerKt")
    args(file("${layout.buildDirectory.get()}/verification").absolutePath)
}


tasks.register<JavaExec>("verifyNuvioBeta7") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioBeta7")
    maxHeapSize = "2g"
    args("1.1.0-beta.7", file("../../.inspect-nuvio-beta7").absolutePath,
        file("${layout.buildDirectory.get()}/verification/nuvio-beta7.dex").absolutePath)
}


tasks.register<JavaExec>("verifyNuvioBeta7Bundle") {
    dependsOn("testClasses", "buildAndroid")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioBeta7BundleKt")
    maxHeapSize = "3g"
    args(file("../../OriginalApps/NuvioTV-1.1.0-beta7.apk").absolutePath,
        file("${layout.buildDirectory.get()}/libs/patches-${project.version}.mpp").absolutePath,
        file("${layout.buildDirectory.get()}/verification/nuvio-beta7-bundle").absolutePath,
        file(androidSdkDirectory.get()).absolutePath)
}

tasks.register<JavaExec>("verifyNuvioBeta7Launcher") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioBeta7LauncherKt")
    args(file("../../.inspect-nuvio-beta7").absolutePath)
}

tasks.register<JavaExec>("verifyNuvioBeta7Player") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioBeta7PlayerKt")
    args(file("${layout.buildDirectory.get()}/verification").absolutePath)
}

// Historical bundle verifiers remain disabled; use the beta.7 bundle verifier.
kotlin.sourceSets.named("test") {
    kotlin.exclude("**/VerifyNuvioBeta6Bundle.kt")
}
for (taskName in listOf("verifyNuvioBeta6Bundle", "verifyNuvioNextEpisodeBundle")) {
    tasks.named(taskName) { enabled = false }
}

tasks.register<JavaExec>("verifyNuvioBeta7DateStyleRuntime") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioBeta7DateStyleRuntime")
    args(file("../extensions/nuvio-settings-menu/src/main/java/software/santodan/extension/nuviomenu").absolutePath,
        file("${layout.buildDirectory.get()}/verification").absolutePath)
}


tasks.register<JavaExec>("verifyNuvioBeta7TrackingDialogs") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioBeta7TrackingDialogs")
    args(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioTrackingDialogs.java").absolutePath,
        file("${layout.buildDirectory.get()}/verification").absolutePath)
}

// Historical fixtures remain on disk; the active verification targets beta7 only.
sourceSets["test"].java.exclude("**/VerifyNuvioBeta6*.java")
kotlin.sourceSets.named("test") { kotlin.exclude("**/VerifyNuvioBeta6*.kt") }
for (taskName in listOf("verifyNuvioBeta6", "verifyNuvioBeta6Launcher", "verifyNuvioBeta6Player", "verifyNuvioBeta6DateStyleRuntime")) {
    tasks.named(taskName) { enabled = false }
}


tasks.register<JavaExec>("verifyNuvioBeta7SettingsMenuRuntime") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioBeta7SettingsMenuRuntime")
    args(file("../extensions/nuvio-settings-menu/src/main/java/software/santodan/extension/nuviomenu/NuvioSettingsMenu.java").absolutePath,
        file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioSourceContinuation.java").absolutePath,
        file("${layout.buildDirectory.get()}/verification/beta7-menu-runtime").absolutePath)
}

tasks.register<JavaExec>("verifyNuvioApkUpdates") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioApkUpdates")
    args(nuvioOriginal.absolutePath, file("${layout.buildDirectory.get()}/verification/nuvio-apk-updates.dex").absolutePath)
    providers.gradleProperty("nuvioUpdatesApk").orNull?.let { args(file(it).absolutePath) }
}

tasks.register<JavaExec>("verifyNuvioUpdateInstaller") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioUpdateInstaller")
    args(nuvioOriginal.absolutePath, file("${layout.buildDirectory.get()}/verification/update-installer").absolutePath)
    providers.gradleProperty("nuvioUpdatesApk").orNull?.let { args(file(it).absolutePath) }
}

tasks.register<JavaExec>("verifyMorpheDesktopImport") {
    dependsOn("testClasses", "buildAndroid")
    description = "Load the MPP using only the exact Desktop fat JAR as the patcher runtime."
    classpath = files(sourceSets["test"].output.classesDirs,
        providers.gradleProperty("morpheDesktopJar").getOrElse("../../morphe-desktop-1.19.0-all.jar"))
    mainClass.set("santodan.patches.VerifyMorpheDesktopImport")
    args(file("${layout.buildDirectory.get()}/libs/patches-${project.version}.mpp").absolutePath)
}

tasks.register<JavaExec>("verifyNuvioUpdateFlow") {
    dependsOn("testClasses", "buildAndroid")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioUpdateFlow")
    args(nuvioOriginal.absolutePath, file("${layout.buildDirectory.get()}/verification/update-flow.dex").absolutePath,
        file("${layout.buildDirectory.get()}/libs/patches-${project.version}.mpp").absolutePath)
}

tasks.register<JavaExec>("verifyNuvioBeta8") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioBeta8")
    maxHeapSize = "2g"
    args(nuvioTargetVersion, file("../../.inspect-nuvio-beta8").absolutePath,
        file("${layout.buildDirectory.get()}/verification/nuvio-beta8.dex").absolutePath)
}


tasks.register<JavaExec>("verifyNuvioBeta8Bundle") {
    dependsOn("testClasses", "buildAndroid")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioBeta8BundleKt")
    maxHeapSize = "3g"
    args(nuvioOriginal.absolutePath,
        file("${layout.buildDirectory.get()}/libs/patches-${project.version}.mpp").absolutePath,
        file("${layout.buildDirectory.get()}/verification/nuvio-beta8-bundle").absolutePath,
        file(androidSdkDirectory.get()).absolutePath)
}

tasks.register<JavaExec>("verifyNuvioBeta8Launcher") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioBeta8LauncherKt")
    args(file("../../.inspect-nuvio-beta8").absolutePath)
}

tasks.register<JavaExec>("verifyNuvioBeta8Player") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioBeta8PlayerKt")
    args(file("${layout.buildDirectory.get()}/verification").absolutePath)
}

tasks.register<JavaExec>("verifyNuvioBeta8DateStyleRuntime") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioBeta8DateStyleRuntime")
    args(file("../extensions/nuvio-settings-menu/src/main/java/software/santodan/extension/nuviomenu").absolutePath,
        file("${layout.buildDirectory.get()}/verification").absolutePath)
}


tasks.register<JavaExec>("verifyNuvioBeta8TrackingDialogs") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioBeta8TrackingDialogs")
    args(file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioTrackingDialogs.java").absolutePath,
        file("${layout.buildDirectory.get()}/verification").absolutePath)
}

tasks.register<JavaExec>("verifyNuvioBeta8SettingsMenuRuntime") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyNuvioBeta8SettingsMenuRuntime")
    args(file("../extensions/nuvio-settings-menu/src/main/java/software/santodan/extension/nuviomenu/NuvioSettingsMenu.java").absolutePath,
        file("../extensions/nuvio-merged-progress/src/main/java/software/santodan/extension/nuviomerged/NuvioSourceContinuation.java").absolutePath,
        file("${layout.buildDirectory.get()}/verification/beta8-menu-runtime").absolutePath)
}

tasks.register("verifyMonetCatalogRuntime") {
    dependsOn("verifyMonetCatalog110Runtime")
}

tasks.register("verifyMonetCatalog") {
    dependsOn("verifyMonetCatalog110")
}

tasks.register("verifyMonetCatalogBundle") {
    dependsOn("verifyMonetCatalog110Bundle")
}

tasks.register("verifyMonetCatalogApk") {
    dependsOn("verifyMonetCatalog110Apk")
}

tasks.register<JavaExec>("verifyMonetCatalog110") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyMonetCatalog110")
    args(file("../../OriginalApps/monet-1.1.0.apk").absolutePath,
        layout.buildDirectory.file("verification/monet/catalog-110-hooks.dex").get().asFile.absolutePath)
}

tasks.register<JavaExec>("verifyMonetCatalog110Runtime") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyMonetCatalog110Runtime")
    args(file("../extensions/monet-catalog-channels/src/main/java/software/santodan/extension/monetchannels/MonetCatalogChannels.java").absolutePath,
        layout.buildDirectory.dir("verification/monet/catalog-110-runtime").get().asFile.absolutePath,
        file("src/test/fixtures/monet-catalog-110/Fixture.java").absolutePath)
}

tasks.register<JavaExec>("verifyMonetCatalog110Bundle") {
    dependsOn("testClasses","buildAndroid")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyMonetCatalog110BundleKt")
    maxHeapSize = "3g"
    args(file("../../OriginalApps/monet-1.1.0.apk").absolutePath,
        layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile.absolutePath,
        layout.buildDirectory.dir("verification/monet/catalog-110-bundle").get().asFile.absolutePath)
}

tasks.register<JavaExec>("verifyMonetCatalog110Apk") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyMonetCatalog110Apk")
    args(file("../../OriginalApps/monet-1.1.0.apk").absolutePath,
        file(providers.gradleProperty("monetCatalog110Apk").getOrElse("../../Apps/Monet/monet-1.1.0-catalog-rows-unsigned.apk")).absolutePath,
        providers.gradleProperty("monetCatalog110Cards").getOrElse("false"),
        providers.gradleProperty("monetCatalog110Premium").getOrElse("false"))
}

// Unversioned entry points follow the latest workspace target; historical verifier
// sources/fixtures are retained without extending their old-version contracts.
tasks.register("verifyMonetDisplayedCardsRuntime") {
    dependsOn("verifyMonetDisplayedCards110Runtime")
}

tasks.register<JavaExec>("verifyMonetDisplayedCards110Runtime") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyMonetDisplayedCardsRuntime")
    args(file("src/test/fixtures/monet-cards-110").absolutePath,
        file("../extensions/monet-displayed-cards/src/main/java").absolutePath,
        layout.buildDirectory.dir("verification/monet/displayed-cards-110-runtime").get().asFile.absolutePath)
}

tasks.register<JavaExec>("verifyMonetDisplayedCards110") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyMonetDisplayedCards110")
    args(file("../../OriginalApps/monet-1.1.0.apk").absolutePath,
        layout.buildDirectory.file("verification/monet/displayed-cards-110-hooks.dex").get().asFile.absolutePath)
}

tasks.register<JavaExec>("verifyMonetDisplayedCards110Bundle") {
    dependsOn("testClasses", "buildAndroid")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyMonetDisplayedCards110BundleKt")
    maxHeapSize = "3g"
    args(file("../../OriginalApps/monet-1.1.0.apk").absolutePath,
        layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile.absolutePath,
        layout.buildDirectory.dir("verification/monet/displayed-cards-110-bundle").get().asFile.absolutePath)
}

tasks.register<JavaExec>("verifyMonetDisplayedCards110Apk") {
    dependsOn("testClasses")
    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("santodan.patches.VerifyMonetDisplayedCards110Apk")
    args(file("../../OriginalApps/monet-1.1.0.apk").absolutePath,
        file(providers.gradleProperty("monetCards110Apk").getOrElse("../../Apps/Monet/monet-1.1.0-displayed-cards-unsigned.apk")).absolutePath,
        providers.gradleProperty("monetCards110Premium").getOrElse("false"))
}

tasks.register("verifyMonetDisplayedCards") {
    dependsOn("verifyMonetDisplayedCards110")
}

tasks.register("verifyMonetDisplayedCardsBundle") {
    dependsOn("verifyMonetDisplayedCards110Bundle")
}

tasks.register("verifyMonetDisplayedCardsApk") {
    dependsOn("verifyMonetDisplayedCards110Apk")
}
