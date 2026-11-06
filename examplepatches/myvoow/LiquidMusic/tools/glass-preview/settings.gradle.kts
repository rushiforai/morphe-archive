/*
 * Renders Liquid Glass on a stand-in for Apple Music's layout, on the JVM: Robolectric runs the
 * real Android rendering pipeline (hwui), so no phone and no Apple Music APK are needed.
 *
 *   ./gradlew -p tools/glass-preview testDebugUnitTest
 *
 * Writes the images to build/preview. Needs an Android SDK (ANDROID_HOME or local.properties).
 */
pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "glass-preview"

// Backdrop by Kyant, as the extension uses it.
include(":libs:backdrop", ":libs:backdrop-catalog")
project(":libs").projectDir = file("../../libs")
project(":libs:backdrop").projectDir = file("../../libs/backdrop")
project(":libs:backdrop-catalog").projectDir = file("../../libs/backdrop-catalog")
