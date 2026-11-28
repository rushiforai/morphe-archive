plugins { id("com.android.library") }
android {
    namespace = "app.yydarlinker.captionshared"
    compileSdk = 35
    defaultConfig { minSdk = 28 }
    compileOptions { sourceCompatibility = JavaVersion.VERSION_17; targetCompatibility = JavaVersion.VERSION_17 }
    testOptions { unitTests.isReturnDefaultValues = true; unitTests.isIncludeAndroidResources = true }
}
dependencies {
    api(project(":caption-contracts"))
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.json:json:20240303")
    testImplementation("com.squareup.okhttp3:mockwebserver:4.12.0")
    testImplementation("org.robolectric:robolectric:4.14.1")
}
tasks.withType<org.gradle.api.tasks.testing.Test>().configureEach { maxHeapSize = "2g" }
