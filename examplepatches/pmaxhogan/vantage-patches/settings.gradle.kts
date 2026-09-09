rootProject.name = "vantage-patches"

buildCache {
    local {
        isEnabled = !System.getenv().containsKey("CI")
    }
}

pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user").getOrElse(System.getenv("GITHUB_ACTOR"))
                password = providers.gradleProperty("gpr.key").getOrElse(System.getenv("GITHUB_TOKEN"))
            }
        }
    }
}

plugins {
    id("app.morphe.patches") version "1.3.3"
}

// Vantage-only extension namespace. It MUST NOT be app.morphe.extension.*: this
// bundle is stacked as a SECOND --patches bundle on top of the anddea bundle,
// which already ships app.morphe.extension.{shared,music} classes into the same
// APK. A shared prefix would mean two bundles merging classes with identical
// names into one dex.
settings {
    extensions {
        defaultNamespace = "app.vantage.extension"

        // Must be absolute, otherwise extension modules in subfolders cannot
        // find the proguard config (same caveat as piko's settings file).
        proguardFiles(rootProject.projectDir.resolve("extensions/proguard-rules.pro").toString())
    }
}
