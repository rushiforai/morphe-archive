// Standalone build of the single-apk Compose probe.
//
// It lives outside the repo's root build on purpose: the root applies the Morphe patches
// plugin (only needed to patch the engine), while this module only has to produce dex files
// that are injected into the engine APK.  Build with the repo wrapper:
//     ./gradlew.bat -p single-apk/compose-probe assembleDebug
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

rootProject.name = "compose-probe"
