rootProject.name = "pixelcamera-patches"

pluginManagement {
    repositories {
        mavenLocal()
        gradlePluginPortal()
        google()
        // The Morphe Patcher artifacts are published to GitHub Packages, which
        // ALWAYS requires authentication - even for public packages.
        // Provide credentials with either:
        //   * ~/.gradle/gradle.properties -> gpr.user=<github username>
        //                                    gpr.key=<PAT with read:packages>
        //   * environment -> GITHUB_ACTOR / GITHUB_TOKEN
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/MorpheApp/registry")
            credentials {
                username = providers.gradleProperty("gpr.user").orNull ?: System.getenv("GITHUB_ACTOR")
                password = providers.gradleProperty("gpr.key").orNull ?: System.getenv("GITHUB_TOKEN")
            }
        }
        // baksmali/smali source builds - https://github.com/iBotPeaches/smali
        maven { url = uri("https://jitpack.io") }
    }
}

plugins {
    id("app.morphe.patches") version "1.3.3"
}

// The `app.morphe.patches` settings plugin discovers `patches/` and every
// `extensions/<name>/` module automatically; they are not `include`d by hand.
settings {
    extensions {
        defaultNamespace = "app.morphe.extension"

        // Must be an absolute path, otherwise extensions in subfolders cannot
        // find the ProGuard configuration.
        proguardFiles(rootProject.projectDir.resolve("extensions/proguard-rules.pro").toString())
    }
}

// Use a locally checked out morphe-patcher when one is present next to this
// repository. Useful when debugging patcher-side behaviour.
mapOf(
    "morphe-patcher" to "app.morphe:morphe-patcher",
).forEach { (libraryPath, libraryName) ->
    val libDir = file("../$libraryPath")
    if (libDir.exists()) {
        includeBuild(libDir) {
            dependencySubstitution {
                substitute(module(libraryName)).using(project(":"))
            }
        }
    }
}
