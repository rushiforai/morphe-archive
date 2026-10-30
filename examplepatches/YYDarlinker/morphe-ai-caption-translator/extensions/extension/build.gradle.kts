extension { name = "extensions/extension.mpe" }
android {
    namespace = "app.yydarlinker.extension"
    buildFeatures { buildConfig = true }
    defaultConfig {
        minSdk = 28
        buildConfigField("String", "CAPTION_PATCH_VERSION", "\"${rootProject.version}\"")
        buildConfigField("String", "CAPTION_BUILD_ID", "\"${providers.gradleProperty("captionBuildId").getOrElse("n39-core-separation-wip")}\"")
    }
    sourceSets.getByName("main").java.srcDirs("../../presentation/src/main/java", "../../ui/src/main/java", "../../infrastructure/src/main/java", "../../application-host/src/main/java")
    sourceSets.getByName("debug").res.srcDir("../../patches/src/main/resources/captionlocales")
    sourceSets.getByName("debug").res.srcDir("src/test/res")
    testOptions { unitTests.isReturnDefaultValues = true; unitTests.isIncludeAndroidResources = true }
}
dependencies {
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
    // -Pgolden.write=<file> writes a proposal for review; the golden test then deliberately fails.
    providers.gradleProperty("golden.write").orNull?.let { systemProperty("golden.write", it) }
    systemProperty("n39.root", rootProject.projectDir.absolutePath)
    if (gradle.startParameter.isOffline) {
        systemProperty("robolectric.offline", "true")
        systemProperty("robolectric.dependency.dir", rootProject.file("work/toolchain/robolectric").absolutePath)
    }
}
