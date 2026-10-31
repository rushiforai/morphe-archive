// Stand-alone build for eppy's UI tests: renders the extension's views on the JVM with
// Paparazzi (layoutlib) and checks their geometry. Kept separate from the patch build so the
// Morphe Gradle plugin and Paparazzi never share a classpath.
// Run: ./gradlew -p ui-tests recordPaparazziDebug   (images in ui-tests/src/test/snapshots)
pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        mavenCentral()
    }
}

dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "eppy-ui-tests"
