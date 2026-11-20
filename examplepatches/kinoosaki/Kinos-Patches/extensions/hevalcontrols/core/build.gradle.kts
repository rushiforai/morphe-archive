// Heval Controls core: the settings engine, registry codec and crash-guard logic. A plain Android
// library nested under the hevalcontrols extension project (same rule as extensions/smartwod/stub:
// the settings plugin includes it but does not turn it into an extension). The extension bundles it
// with `implementation`; per-app extensions may use it with `compileOnly`.
//
// Kept framework-light: Android types sit behind small seams (Store, CrashGuard.Records,
// CrashGuard.ExitHistory) so the logic runs in plain JVM unit tests:
//   .\gradlew :extensions:hevalcontrols:core:testDebugUnitTest
plugins {
    id("com.android.library")
}

android {
    namespace = "app.template.extension.hevalcontrols"
    compileSdk = 36

    defaultConfig {
        minSdk = 23
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    // No resources (an .mpe cannot carry any), so no R class is merged into target apps.
    androidResources {
        enable = false
    }

    testOptions {
        // Android calls in code under test answer defaults instead of throwing "not mocked".
        unitTests.isReturnDefaultValues = true
    }
}

dependencies {
    testImplementation(libs.junit)
}

// Pure Java, like every extension: keep kotlin-stdlib out of the dex merged into target apps.
configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}
