rootProject.name = "smartlauncher-morphe-patches"

pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
                password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
            }
        }
        maven { url = uri("https://jitpack.io") }
    }
}

// The app.morphe.patches settings plugin auto-registers the :patches and
// :extensions:* subprojects by convention (directory layout), and wires in
// the app.morphe:morphe-patcher / smali dependencies from the version
// catalog aliases "morphe-patcher" / "smali". Do not add manual include()
// calls for those - the plugin owns that.
plugins {
    id("app.morphe.patches") version "1.3.4"
}
