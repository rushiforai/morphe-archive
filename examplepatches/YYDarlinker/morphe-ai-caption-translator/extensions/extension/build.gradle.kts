extension { name = "extensions/extension.mpe" }
android {
    namespace = "app.yydarlinker.extension"
    buildFeatures { buildConfig = true }
    defaultConfig {
        minSdk = 28
        buildConfigField("String", "CAPTION_PATCH_VERSION", "\"${rootProject.version}\"")
        buildConfigField("String", "CAPTION_BUILD_ID", "\"${providers.gradleProperty("captionBuildId").getOrElse("local-development")}\"")
    }
    sourceSets.getByName("debug").res.srcDir("../../patches/src/main/resources/captionlocales")
    sourceSets.getByName("debug").res.srcDir("src/test/res")
    testOptions { unitTests.isReturnDefaultValues = true; unitTests.isIncludeAndroidResources = true }
}
dependencies {
    compileOnly("androidx.annotation:annotation-jvm:1.8.1")
    implementation(project(":caption-contracts"))
    implementation(project(":translation-core"))
    implementation(project(":caption-shared"))
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.json:json:20240303")
    testImplementation("com.squareup.okhttp3:mockwebserver:4.12.0")
    testImplementation("org.robolectric:robolectric:4.14.1")
}
tasks.withType<org.gradle.api.tasks.testing.Test>().configureEach {
    maxHeapSize = "2g"
    systemProperty("caption.project.root", rootProject.projectDir.absolutePath)
    if (gradle.startParameter.isOffline) {
        systemProperty("robolectric.offline", "true")
        systemProperty("robolectric.dependency.dir", rootProject.file("work/toolchain/robolectric").absolutePath)
    }
}
