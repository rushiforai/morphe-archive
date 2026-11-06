import java.util.zip.ZipFile
import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream
import java.util.zip.ZipInputStream

plugins {
    id("com.android.library")
    id("org.jetbrains.kotlin.android")
}

android {
    namespace = "com.openbubbles.wear.bridge"
    compileSdk = 35
    defaultConfig { minSdk = 32 }
    buildTypes { release { isMinifyEnabled = false } }
    testOptions { unitTests.isIncludeAndroidResources = true }
    sourceSets.getByName("main").res.setSrcDirs(emptyList<String>())
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlinOptions { jvmTarget = "17" }
}

dependencies {
    implementation(project(":protocol"))
    implementation("com.google.android.gms:play-services-wearable:19.0.0")
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.14.1")
}

// Resolve against the pinned host rather than replacing its runtime dependencies.
val stockClasses = rootProject.file("work/openbubbles-classes-v52.jar")
val embeddedJar = layout.buildDirectory.file("embedded/embedded-bridge.jar")
tasks.register("exportEmbeddedPayload") {
    dependsOn("bundleReleaseAar", ":protocol:jar")
    inputs.file(stockClasses)
    inputs.file(rootProject.file("scripts/prepare-embedded.py"))
    inputs.files(configurations.named("releaseRuntimeClasspath"))
    inputs.file(layout.buildDirectory.file("outputs/aar/bridge-release.aar"))
    outputs.file(embeddedJar)
    doLast {
        val sdk = System.getenv("ANDROID_HOME") ?: System.getenv("ANDROID_SDK_ROOT")
            ?: error("Set ANDROID_HOME")
        val output = embeddedJar.get().asFile.apply { parentFile.mkdirs() }
        val protocolJar = project(":protocol").tasks.named<Jar>("jar").get().archiveFile.get().asFile
        val command = mutableListOf("python", rootProject.file("scripts/prepare-embedded.py").absolutePath,
            "--host", stockClasses.absolutePath, "--android", File(sdk, "platforms/android-35/android.jar").absolutePath,
            "--bridge", layout.buildDirectory.file("outputs/aar/bridge-release.aar").get().asFile.absolutePath,
            "--protocol", protocolJar.absolutePath, "--output", output.absolutePath)
        configurations.getByName("releaseRuntimeClasspath").files.sortedBy { it.name }.forEach {
            command.addAll(listOf("--dependency", it.absolutePath))
        }
        val process = ProcessBuilder(command).redirectErrorStream(true).start()
        val report = process.inputStream.bufferedReader().use { it.readText() }
        check(process.waitFor() == 0) { "Embedded dependency/linkage verification failed:\n" + report }
        logger.lifecycle(report.trim())
    }
}
