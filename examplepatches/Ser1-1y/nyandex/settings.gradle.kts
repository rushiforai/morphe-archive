rootProject.name = "nyandex"

pluginManagement {
    // Optional: build against local checkouts of the Morphe projects instead of the published
    // artifacts (GitHub Packages needs a token). Point MORPHE_SOURCE_DIR at a directory that
    // contains morphe-patches-gradle-plugin, morphe-patcher and morphe-patches-library.
    val morpheSource: String? = System.getenv("MORPHE_SOURCE_DIR")
    if (morpheSource != null && File("$morpheSource/morphe-patches-gradle-plugin").exists()) {
        includeBuild("$morpheSource/morphe-patches-gradle-plugin")
    }

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

plugins {
    id("app.morphe.patches") version "2.1.1"
}

System.getenv("MORPHE_SOURCE_DIR")?.let { dir ->
    file("$dir/morphe-patcher").takeIf { it.exists() }?.let { patcher ->
        includeBuild(patcher) {
            dependencySubstitution {
                substitute(module("app.morphe:morphe-patcher")).using(project(":"))
            }
        }
    }
    file("$dir/morphe-patches-library").takeIf { it.exists() }?.let { library ->
        includeBuild(library) {
            dependencySubstitution {
                substitute(module("app.morphe:morphe-patches-library")).using(project(":patch-library"))
                substitute(module("app.morphe:morphe-extensions-library")).using(project(":extension-library"))
            }
        }
    }
}

settings {
    extensions {
        defaultNamespace = "app.nyandex.extension"

        // Must be an absolute path, otherwise extensions in subfolders do not find it.
        // Setting a ProGuard file enables R8, which strips unused library code from each extension.
        proguardFiles(rootProject.projectDir.resolve("extensions/proguard-rules.pro").toString())
    }
}
