extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.yydarlinker.extension"
    buildFeatures { buildConfig = true }
    defaultConfig {
        buildConfigField("String", "CAPTION_PATCH_VERSION", "\"${rootProject.version}\"")
    }
}


dependencies {
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.json:json:20240303")
}
android { testOptions { unitTests.isReturnDefaultValues = true } }

dependencies { testImplementation("com.squareup.okhttp3:mockwebserver:4.12.0") }

dependencies { testImplementation("org.robolectric:robolectric:4.14.1") }

// Test-only resource installation lets Robolectric exercise the same locale XML shipped to YouTube.
android { sourceSets.getByName("debug").res.srcDir("../../patches/src/main/resources/captionlocales")
    sourceSets.getByName("debug").res.srcDir("src/test/res") }

android { testOptions { unitTests.isIncludeAndroidResources = true } }

// Evidence-producing regression tests must also run from a clean CI checkout.
// Local watchdog runners can supply the same explicit output property.
tasks.withType<org.gradle.api.tasks.testing.Test>().configureEach {
    maxHeapSize = "2g"
    val evidenceDirectory = providers.gradleProperty("scheduler.output").orNull
        ?.let { rootProject.file(it) }
        ?: rootProject.layout.buildDirectory.dir("test-evidence").get().asFile
    systemProperty("scheduler.output", evidenceDirectory.absolutePath)
    doFirst { evidenceDirectory.mkdirs() }
}
