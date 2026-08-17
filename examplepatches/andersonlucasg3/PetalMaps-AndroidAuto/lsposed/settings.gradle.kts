// Standalone Gradle build for the LSPosed module.
// Intentionally NOT included in the root settings.gradle.kts: the root build
// applies the app.morphe.patches plugin, which conflicts with a plain
// Android application build. Build this project via the root Gradle wrapper:
//   cd lsposed && ../gradlew.bat -p . assembleRelease

pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("com.android.application") version "9.1.0" apply false
    id("com.android.library") version "9.1.0" apply false
}

dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "petalmaps-hiddenapi"

include(":app")
include(":xposed-api")
