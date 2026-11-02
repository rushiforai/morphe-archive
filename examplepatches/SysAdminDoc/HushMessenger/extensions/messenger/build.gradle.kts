import org.gradle.api.tasks.testing.Test
import org.gradle.jvm.toolchain.JavaLanguageVersion
import org.gradle.jvm.toolchain.JavaToolchainService

extension {
    name = "extensions/messenger.mpe"
}

android {
    namespace = "app.hushmessenger.extension"
    defaultConfig {
        minSdk = 28
        targetSdk = 36
        versionCode = 233
        versionName = project.version.toString()
        testInstrumentationRunner = "app.hushmessenger.extension.BuildTransportProbe"
    }
    buildFeatures { buildConfig = true }
    testOptions { unitTests.isIncludeAndroidResources = true }
    lint { abortOnError = true }
}

// Compile-only copies of the Messenger classes the call recorder talks to. Messenger ships the real ones, so these stay
// off the extension's runtime classpath and out of its dex.
val messengerStubClasses = tasks.register<JavaCompile>("compileMessengerStubs") {
    source(layout.projectDirectory.dir("src/stubs/java"))
    classpath = files()
    destinationDirectory.set(layout.buildDirectory.dir("messengerStubs/classes"))
    options.release.set(11)
}
val messengerStubs = tasks.register<Jar>("messengerStubsJar") {
    from(messengerStubClasses)
    archiveFileName.set("messenger-stubs.jar")
    destinationDirectory.set(layout.buildDirectory.dir("messengerStubs"))
}

dependencies {
    compileOnly(files(messengerStubs))
    testImplementation(files(messengerStubs))
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.17")
}

dependencyLocking { lockAllConfigurations() }

// Robolectric and the Android test tooling bring Bouncy Castle 1.85 and 1.79 into the test graphs.
// See gradle/libs.versions.toml for the advisories and why 1.86.
val safeBouncyCastleVersion = libs.versions.bouncycastle.get()
configurations.configureEach {
    resolutionStrategy.eachDependency {
        if (requested.group == "org.bouncycastle") useVersion(safeBouncyCastleVersion)
    }
}

// Robolectric runs Android 9 and 10's AssetFileDescriptor streams on the host java.io classes, so the
// test JVM decides whether a declared slice starts at its offset. JetBrains Runtime 25.0.2 (Android
// Studio's, often JAVA_HOME) reports a RandomAccessFile descriptor on Windows as a non-regular file;
// FileInputStream.skip then reads through the subclass before its slice length is set and moves
// nothing, so the API 28/29 slice restores read the provider's prefix. Pin the test JVM.
val testLauncher = extensions.getByType<JavaToolchainService>().launcherFor {
    languageVersion.set(JavaLanguageVersion.of(21))
}

tasks.withType<Test>().configureEach {
    javaLauncher.set(testLauncher)
    // Robolectric's API 36 file-descriptor bridge needs this JDK 21 export.
    jvmArgs("--add-exports=java.base/jdk.internal.access=ALL-UNNAMED")
    // One worker holds a Robolectric sandbox per SDK (28, 36, and 30 with native graphics for the font tests).
    // Gradle's 512 MB default filled up with all three, and the worker then spun in GC at exit instead of ending.
    maxHeapSize = "1g"
}
