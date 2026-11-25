group = "dev.materialtidal"

patches {
    about {
        name = "MaterialTidal Patches"
        description = "Material 3 Expressive redesign and UX patches for TIDAL."
        source = "https://github.com/ninocss/MaterialTidal.git"
        author = "ninocss"
        contact = "na"
        website = "https://github.com/ninocss/MaterialTidal"
        license = "GPLv3"
    }
}

dependencies {
    testImplementation(libs.kotlinx.coroutines.core)
    testImplementation(libs.gson)
}

tasks.register<JavaExec>("generatePatchesList") {
    group = "distribution"
    description = "Generates root patches-list.json from the compiled .mpp patch bundle"
    dependsOn("buildAndroid", "testClasses")

    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("dev.materialtidal.util.PatchListGeneratorKt")

    val jarTask = tasks.named<org.gradle.jvm.tasks.Jar>("jar")
    args(
        jarTask.get().archiveFile.get().asFile.absolutePath,
        rootProject.file("patches-list.json").absolutePath,
        project.version.toString(),
    )
}

tasks.register<JavaExec>("verifyPatchTidal") {
    group = "verification"
    description = "End-to-end verification of MaterialTidal patches against tidal.apkm"
    dependsOn("buildAndroid", "testClasses")

    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("dev.materialtidal.verify.VerifyPatchTidalKt")

    val jarTask = tasks.named<org.gradle.jvm.tasks.Jar>("jar")
    args(
        rootProject.file("tidal.apkm").absolutePath,
        jarTask.get().archiveFile.get().asFile.absolutePath,
        layout.buildDirectory.dir("tmp/verify").get().asFile.absolutePath,
    )
    jvmArgs("-Xmx4g")
}

tasks.register<JavaExec>("verifyLinnProtocol") {
    group = "verification"
    description = "Unit and loopback tests for Linn OpenHome protocol & DASH-FLAC remuxer"
    dependsOn(":extensions:tidal:compileReleaseJavaWithJavac", "testClasses")

    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("dev.materialtidal.linn.VerifyLinnProtocolKt")

    args(
        rootProject.file("extensions/tidal/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes").absolutePath,
    )
}

tasks.register<JavaExec>("verifyPatchSettings") {
    group = "verification"
    description = "Unit tests for in-app PatchSettingsPrefs runtime overrides, config defaults, and reset behavior"
    dependsOn(":extensions:tidal:compileReleaseJavaWithJavac", "testClasses")

    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("dev.materialtidal.settings.VerifyPatchSettingsKt")

    args(
        rootProject.file("extensions/tidal/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes").absolutePath,
    )
}

tasks.register<JavaExec>("verifySyllableLyrics") {
    group = "verification"
    description = "Unit tests for syllable-synced TTML/JSON parsers, provider matcher, and playback clock"
    dependsOn(":extensions:tidal:compileReleaseJavaWithJavac", "testClasses")

    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("dev.materialtidal.lyrics.VerifySyllableLyricsKt")

    args(
        rootProject.file("extensions/tidal/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes").absolutePath,
    )
}

tasks.register<JavaExec>("verifyCrossfade") {
    group = "verification"
    description = "Unit tests for Crossfade audio fade curves, strength shaping, ReplayGain scaling, and gapless album state"
    dependsOn(":extensions:tidal:compileReleaseJavaWithJavac", "testClasses")

    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("dev.materialtidal.crossfade.VerifyCrossfadeKt")

    args(
        rootProject.file("extensions/tidal/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes").absolutePath,
    )
}

tasks.register<JavaExec>("verifyTabletPlayerLayout") {
    group = "verification"
    description = "Unit tests for responsive Tablet/Desktop player layout solver and stream spec formatting"
    dependsOn(":extensions:tidal:compileReleaseJavaWithJavac", "testClasses")

    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("dev.materialtidal.player.VerifyTabletPlayerLayoutKt")

    args(
        rootProject.file("extensions/tidal/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes").absolutePath,
    )
}

tasks.register<JavaExec>("verifyWaveformSeekbar") {
    group = "verification"
    description = "Unit tests for Waveform Seekbar PCM analyzer, normalization, quantization, placeholder determinism, and live audio buffer safety"
    dependsOn(":extensions:tidal:compileReleaseJavaWithJavac", "testClasses")

    classpath = sourceSets["test"].runtimeClasspath
    mainClass.set("dev.materialtidal.waveform.VerifyWaveformSeekbarKt")

    args(
        rootProject.file("extensions/tidal/build/intermediates/javac/release/compileReleaseJavaWithJavac/classes").absolutePath,
    )
}
