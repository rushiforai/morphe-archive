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
    // 2.1.1: the version the official bundle (morphe-patches v2.3.0) builds with. It applies
    // PatchesPlugin to the `patches` subproject; no `extensions/` dir here carries a build
    // file, so our javac+d8 pipeline in patches/build.gradle.kts keeps owning the extension
    // dex. Bundle signing stays opt-in (MORPHE_SIGNING_KEY or a root morphe-signing.key).
    id("app.morphe.patches") version "2.1.1"
}

// Include morphe-patcher as a composite build when a clone sits next to this repo AND its
// version matches the catalog -- the official bundle's own pattern, tightened: the patcher and
// the smali jar are a versioned PAIR (the catalog's smali pin is the official bundle's own),
// and a sibling at a different patcher version substitutes 2.5.0 classes over the 2.4.0
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
