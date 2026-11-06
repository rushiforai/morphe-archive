import org.gradle.api.initialization.resolve.RepositoriesMode

// Standalone build: `companion/` is deliberately not included by the root settings.gradle.kts,
// so the Morphe patch build is unaffected by anything in here.
pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.name = "tandem-study"
include(":app")
