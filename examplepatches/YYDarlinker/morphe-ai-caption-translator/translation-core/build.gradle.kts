plugins { id("com.android.library") }
android {
    namespace = "app.yydarlinker.translationcore"
    compileSdk = 35
    defaultConfig { minSdk = 28 }
    compileOptions { sourceCompatibility = JavaVersion.VERSION_17; targetCompatibility = JavaVersion.VERSION_17 }
    testOptions { unitTests.isReturnDefaultValues = true; unitTests.isIncludeAndroidResources = true }
}
dependencies {
    api(project(":caption-shared"))
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.json:json:20240303")
    testImplementation("com.squareup.okhttp3:mockwebserver:4.12.0")
    testImplementation("org.robolectric:robolectric:4.14.1")
}
tasks.withType<org.gradle.api.tasks.testing.Test>().configureEach {
    maxHeapSize = "2g"
    systemProperty("caption.workspace", rootProject.projectDir.absolutePath)
    if (gradle.startParameter.isOffline) {
        systemProperty("robolectric.offline", "true")
        systemProperty("robolectric.dependency.dir", rootProject.file("work/toolchain/robolectric").absolutePath)
    }
}
if (providers.gradleProperty("translation.live").getOrElse("false") == "true") {
    android.sourceSets.getByName("test").java.srcDir("src/liveTest/java")
    tasks.withType<org.gradle.api.tasks.testing.Test>().configureEach {
        systemProperty("live.output",providers.gradleProperty("live.output").getOrElse(rootProject.file("validation/live-translation.json").absolutePath))
        for(name in listOf("live.maxRequests","live.maxTokens","live.elapsedSeconds")) {
            systemProperty(name,providers.gradleProperty(name).getOrElse("0"))
        }
    }
} else {
    tasks.withType<org.gradle.api.tasks.testing.Test>().configureEach { exclude("**/PinnedCoreLiveTest.class") }
}
