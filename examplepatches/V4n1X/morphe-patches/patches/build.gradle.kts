group = "app.v4n1x"

patches {
    about {
        name = "V4n1X Patches"
        description = "Patches for SoundCloud and Parcello"
        source = "https://github.com/V4n1X/morphe-patches.git"
        author = "V4n1X"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    implementation(libs.morphe.patches.library)

    // Required due to smali, or build fails. Can be removed once smali is bumped.
    implementation(libs.guava)

    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)

    // Already used by Morphe Patcher; needed to collect its patch results in tests.
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
}

tasks {
    val testParcelloAds = register<JavaExec>("testParcelloAds") {
        group = "verification"
        description = "Checks Parcello ad removal; optionally applies it to -PparcelloApk=<APK path>."
        dependsOn(testClasses, buildAndroid)
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("app.v4n1x.patches.parcello.ads.ParcelloAdsTestKt")
        workingDir = rootProject.projectDir
        maxHeapSize = "2g"
        systemProperty("parcelloPatchBundle", jar.get().archiveFile.get().asFile.absolutePath)
        providers.gradleProperty("parcelloApk").orNull?.let { args(it) }
    }

    val testSoundCloudPremium = register<JavaExec>("testSoundCloudPremium") {
        group = "verification"
        description = "Checks SoundCloud feature branches; optionally patches -PsoundcloudApk=<APK/APKM path>."
        dependsOn(testClasses, buildAndroid)
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("app.v4n1x.patches.soundcloud.premium.SoundCloudPremiumTestKt")
        workingDir = rootProject.projectDir
        maxHeapSize = "2g"
        systemProperty("soundcloudPatchBundle", jar.get().archiveFile.get().asFile.absolutePath)
        providers.gradleProperty("soundcloudApk").orNull?.let { args(it) }
    }

    val testSoundCloudCompatibility = register<JavaExec>("testSoundCloudCompatibility") {
        group = "verification"
        description = "Verifies all SoundCloud patches against -PsoundcloudApk=<APK/APKM path>."
        dependsOn(testClasses, buildAndroid)
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("app.v4n1x.patches.soundcloud.SoundCloudCompatibilityTestKt")
        workingDir = rootProject.projectDir
        maxHeapSize = "2g"
        systemProperty("soundcloudPatchBundle", jar.get().archiveFile.get().asFile.absolutePath)
        providers.gradleProperty("soundcloudApk").orNull?.let { args(it) }
        args(providers.gradleProperty("soundcloudPatchSelection").getOrElse("all"))
        onlyIf { providers.gradleProperty("soundcloudApk").isPresent }
    }

    test {
        // Run our standalone checks even when no JUnit framework is configured.
        dependsOn(testParcelloAds, testSoundCloudPremium, testSoundCloudCompatibility)
        failOnNoDiscoveredTests = false
    }

    check {
        dependsOn(testParcelloAds, testSoundCloudPremium, testSoundCloudCompatibility)
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build, buildAndroid)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
        args(jar.get().archiveFile.get().asFile.absolutePath)
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
