rootProject.name = "MorpheTeamsPatch"

pluginManagement {
    repositories {
        mavenLocal()
        gradlePluginPortal()
        google()
        maven { url = uri("https://jitpack.io") }
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = System.getenv("GITHUB_ACTOR") ?: "unused"
                password = System.getenv("GITHUB_TOKEN") ?: "unused"
            }
        }
    }
}

plugins {
    id("app.morphe.patches") version "1.3.4"
}

// The plugin's settings { patchesProjectPath = ... } block has no effect:
// SettingsPlugin.apply() calls settings.include(":$patchesProjectPath") eagerly,
// before any later configuration in this script can run. So the patches
// subproject must actually be named "patches" (the plugin's hardcoded default).