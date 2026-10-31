rootProject.name = "morphe-ytvr-patches"

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

plugins {
    // 2.1.0-dev.1: the settings-plugin model (the plugin applies PatchesPlugin to the `patches`
    // subproject and ExtensionPlugin (AGP) to every `extensions/` dir carrying a build file -- of
    // which this repo has none, so our javac+d8 extension pipeline in patches/build.gradle.kts
    // keeps owning the extension dex). This is the version the official bundle builds with; the
    // v2.0.0 tag was never published to the registry. Its only extra is opt-in bundle signing:
    // buildAndroid signs only when MORPHE_SIGNING_KEY (or a root morphe-signing.key) exists, and
    // passes the bundle through unsigned otherwise -- which is also fine, hosts do not require a
    // signature yet (docs/INTERNALS.md, "The patcher 2.x alignment").
    id("app.morphe.patches") version "2.1.0-dev.1"
}

// Include morphe-patcher as a composite build when a clone sits next to this repo AND its
// version matches the catalog -- the official bundle's own pattern, tightened: the patcher and
// the smali jar are a versioned PAIR (the catalog's smali pin is the compiled-against patcher's
// own), and a sibling at a different patcher version substitutes 2.1.0 classes over the 2.0.0
// pair, a mismatch that only bites at R8 (or later, silently). Version-matched substitution
// keeps CI and local builds on the same pair; a mismatched sibling resolves from the registry
// instead (needs read:packages on the GitHub token) with a loud note.
val catalogPatcherVersion = file("gradle/libs.versions.toml").readText()
    .lineSequence()
    .firstOrNull { it.trim().startsWith("morphe-patcher =") }
    ?.substringAfter("= \"")?.substringBefore("\"")
val siblingProps = java.util.Properties()
file("../morphe-patcher/gradle.properties").takeIf { it.exists() }?.inputStream()?.use {
    siblingProps.load(it)
}
val siblingVersion = siblingProps.getProperty("version")
if (siblingVersion != null && siblingVersion != catalogPatcherVersion) {
    println(
        "WARNING: ../morphe-patcher is v$siblingVersion but the catalog pins " +
            "morphe-patcher $catalogPatcherVersion -- NOT substituting (the smali pin pairs " +
            "with $catalogPatcherVersion); resolving from the registry. " +
            "Check out v$catalogPatcherVersion in the sibling to use it."
    )
}
if (siblingVersion != null && siblingVersion == catalogPatcherVersion) {
    includeBuild("../morphe-patcher") {
        dependencySubstitution {
            substitute(module("app.morphe:morphe-patcher")).using(project(":"))
        }
    }
}
