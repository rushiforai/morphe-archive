import org.gradle.api.tasks.testing.Test

extension {
    name = "extensions/messenger.mpe"
}

android {
    namespace = "app.hushmessenger.extension"
    defaultConfig {
        minSdk = 28
        targetSdk = 36
        versionCode = 210
        versionName = project.version.toString()
        testInstrumentationRunner = "app.hushmessenger.extension.BuildTransportProbe"
    }
    buildFeatures { buildConfig = true }
    testOptions { unitTests.isIncludeAndroidResources = true }
    lint { abortOnError = true }
}

dependencies {
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

tasks.withType<Test>().configureEach {
    // Robolectric's API 36 file-descriptor bridge needs this JDK 21 export.
    jvmArgs("--add-exports=java.base/jdk.internal.access=ALL-UNNAMED")
}
