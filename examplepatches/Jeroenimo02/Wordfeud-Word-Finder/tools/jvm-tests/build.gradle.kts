// Standalone JVM test build. Compiles the pure-Java extension code and its unit tests
// without the Android SDK or the Morphe Gradle plugin (used where those are unavailable).
// Run: gradle -p tools/jvm-tests test
plugins {
    java
}

tasks.withType<JavaCompile>().configureEach {
    options.release.set(17)
}

apply(from = "../../gradle/wordlist-manifest.gradle.kts")

tasks.named("compileJava") { dependsOn("generateWordListManifest") }

repositories {
    mavenCentral()
}

// Sources that need Android (android.*) and cannot compile on the plain JVM.
// Keep this list explicit and short; add files here when a class starts using android.*.
// Find candidates with: grep -rl '^import android\.' extensions/extension/src/main/java
// Pure helpers used by these views (Theme, OverlayFormat) stay on the JVM and are unit-tested.
val androidOnly = listOf(
    "app/wordfeudwordfinder/extension/ui/Fonts.java",
    "app/wordfeudwordfinder/extension/ui/TileDrawable.java",
    "app/wordfeudwordfinder/extension/ui/BoardPreviewView.java",
    "app/wordfeudwordfinder/extension/ui/MoveListAdapter.java",
    "app/wordfeudwordfinder/extension/ui/OverlayController.java",
    "app/wordfeudwordfinder/extension/ui/Widgets.java",
    "app/wordfeudwordfinder/extension/ui/ErrorPanel.java",
    "app/wordfeudwordfinder/extension/ui/DownloadProgress.java",
    "app/wordfeudwordfinder/extension/ui/ScreenSampler.java",
    "app/wordfeudwordfinder/extension/play/FlutterBridge.java",
    "app/wordfeudwordfinder/extension/ads/MainThread.java",
)

sourceSets {
    main {
        java {
            srcDir("../../extensions/extension/src/main/java")
            // BuildInfo is generated in the real build; this is a fixed "dev" stand-in.
            srcDir("src/buildinfo/java")
            srcDir(layout.buildDirectory.dir("generated/source/wordlists"))
            exclude(androidOnly)
        }
    }
    test {
        java.srcDir("../../extensions/extension/src/test/java")
        resources.srcDir("../../extensions/extension/src/test/resources")
    }
}

dependencies {
    // Android provides org.json at runtime (android.jar); on the JVM it must be on the main classpath too.
    compileOnly("org.json:json:20240303")
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.json:json:20240303")
}

tasks.test {
    useJUnit()
    testLogging { events("passed", "failed", "skipped"); showStandardStreams = false }
}
