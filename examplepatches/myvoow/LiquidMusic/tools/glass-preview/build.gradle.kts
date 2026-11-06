plugins {
    id("com.android.library") version "9.5.0"
    id("com.android.kotlin.multiplatform.library") version "9.5.0" apply false
    id("org.jetbrains.kotlin.multiplatform") version "2.4.21" apply false
    alias(libs.plugins.kotlin.compose)
}

android {
    namespace = "app.liquidmusic.preview"
    // Compose 1.12, which Backdrop is built on, needs compileSdk 37.
    compileSdk = 37
    defaultConfig {
        minSdk = 31
    }
    // The extension is compiled as is, from the patch sources (or from another copy of them,
    // with -PextensionSources=<dir>, to compare versions).
    sourceSets["main"].java.directories.add(
        providers.gradleProperty("extensionSources").orNull
            ?: rootDir.resolve("../../extensions/liquidglass/src/main/java").canonicalPath
    )
    providers.gradleProperty("extensionKotlinSources").orNull.let { kotlinSources ->
        if (kotlinSources != "none") {
            sourceSets["main"].kotlin.directories.add(
                kotlinSources ?: rootDir.resolve("../../extensions/liquidglass/src/main/kotlin").canonicalPath
            )
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    testOptions {
        unitTests {
            isIncludeAndroidResources = true
            all {
                // Draw with HardwareRenderer, so RenderNode, RenderEffect and AGSL really run.
                it.systemProperty("robolectric.pixelCopyRenderMode", "hardware")
                it.systemProperty("preview.out", layout.buildDirectory.dir("preview").get().asFile.absolutePath)
                // Coroutine delays (the long press timeout) on the main looper, whose clock the
                // tests advance, rather than on a timer thread.
                it.systemProperty("kotlinx.coroutines.main.delay", "true")
                // Optional Maven mirror for the Android framework jars Robolectric downloads.
                providers.gradleProperty("robolectricRepo").orNull?.let { repo ->
                    it.systemProperty("robolectric.dependency.repo.url", repo)
                    it.systemProperty("robolectric.dependency.repo.id", "preview-mirror")
                }
                it.maxHeapSize = "3g"
                // Compose keeps its main dispatcher for the life of the JVM, bound to the
                // first test's Choreographer: one JVM per test class (see PreviewScene).
                it.forkEvery = 1
            }
        }
    }
}

repositories {
    google()
    mavenCentral()
}

dependencies {
    implementation(project(":libs:backdrop-catalog"))
    implementation(libs.kyant.shapes)
    implementation(libs.androidx.compose.foundation)
    implementation(libs.androidx.compose.ui)
    implementation(libs.androidx.lifecycle.runtime)
    implementation(libs.androidx.savedstate)
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.17")
}
