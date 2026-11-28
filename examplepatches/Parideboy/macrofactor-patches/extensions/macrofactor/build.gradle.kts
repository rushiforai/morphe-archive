extension {
    name = "extensions/macrofactor.mpe"
}

android {
    namespace = "arpit.morphe.extension.macrofactor"
    compileSdk = 36

    defaultConfig {
        minSdk = 26
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    // Classes are provided at runtime by shared.mpe.
    compileOnly(libs.morphe.extensions.library)

    // Plain JVM tests for the JSON rewriting: Android's org.json is not usable off-device.
    testImplementation(libs.junit.jupiter)
    testImplementation(libs.json)
    testRuntimeOnly(libs.junit.platform.launcher)
}

tasks.withType<Test>().configureEach {
    useJUnitPlatform()
}
