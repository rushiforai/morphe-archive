import org.gradle.api.artifacts.repositories.MavenArtifactRepository

rootProject.name = "hushgram"

pluginManagement {
    val allowLocalPlugins = providers.gradleProperty("allowMavenLocal")
        .map(String::toBoolean)
        .getOrElse(false)
    repositories {
        // Local plugin artifacts are useful while developing the plugin, but they must never
        // silently override the reviewed repositories used for a release build.
        if (allowLocalPlugins) mavenLocal()
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
        // baksmali and smali come from a source build, resolved as com.github.MorpheApp.smali
        // rather than from Maven Central. The comment used to name iBotPeaches/smali, which the
        // build stopped using when the patches plugin switched forks at 1.3.2.
        //
        // google/smali 3.0.10 shipped officially on 2026-08-20, so "until official releases come
        // out again" is no longer the reason to keep this. The reason is that the pin has to be
        // whatever the patcher was built against: two copies of dexlib2 on the R8 classpath fail
        // buildAndroid with "Classpath type already present".
        maven { url = uri("https://jitpack.io") }
    }
}

// app.morphe:morphe-patches-gradle-plugin 1.3.4 brings kotlin-gradle-plugin 2.4.10 as a
// runtimeElements dependency, and 2.4.10 is inside CVE-2026-53914 (GHSA-r937-wjx7-w2jp), a
// deserialisation flaw in the Kotlin build cache. 2.4.20 is the first release outside it.
// Nothing in this tree requests a Kotlin plugin by id, so pluginManagement's eachPlugin has
// nothing to rewrite: the version has to be forced on the settings classpath itself. Take this
// out when the plugin moves past 2.4.20 on its own; gradle/verification-metadata.xml is what
// says which version actually resolved. It does not reach :patches:patcherProvidedClasspath,
// where the patcher's own kotlin-stdlib and kotlin-reflect stay at 2.4.10.
//
// The same classpath brings Bouncy Castle 1.79, by way of the patcher's 1.77 pin and the
// Android build tools' own 1.79 request: 1.77 is inside all six advisories (CVE-2025-8916
// 1.44 to 1.78, CVE-2026-5588 1.67 to 1.83, CVE-2025-14813, CVE-2026-0636 fixed in 1.84,
// CVE-2026-8763, CVE-2026-13506 fixed in 1.85) and 1.79 is inside all but CVE-2025-8916.
// :patches and :extensions:instagram each force their own graphs to
// the reviewed release, but neither reaches this one: a force on a project configuration cannot
// touch the classpath the plugins themselves resolve on, and that classpath is where the
// signing code actually runs. 1.86 is spelled out here rather than read from
// gradle/libs.versions.toml because the version catalog does not exist yet at this point in the
// build; the catalog pins the same value and says why it is that one. Move both together.
buildscript {
    configurations.all {
        resolutionStrategy.eachDependency {
            if (requested.group == "org.jetbrains.kotlin") {
                useVersion("2.4.20")
            }
            if (requested.group == "org.bouncycastle") {
                useVersion("1.86")
            }
            if (requested.group == "com.google.guava" && requested.name == "guava") {
                // The settings graph resolved 33.5.0-jre on 2026-10-01. Project overrides do
                // not reach it. Match the reviewed catalog pin (GHSA-xxph-c9ww-hj94).
                useVersion("33.7.2-jre")
            }
            // AGP's settings classpath: fixed in jose4j 0.9.6 and JDOM 2.0.6.1.
            // https://github.com/advisories/GHSA-3677-xxcr-wjqv
            // https://github.com/advisories/GHSA-2363-cqg2-863c
            if (requested.group == "org.bitbucket.b_c" && requested.name == "jose4j") {
                useVersion("0.9.7")
            }
            if (requested.group == "org.jdom" && requested.name == "jdom2") {
                useVersion("2.0.6.1")
            }
            // Settings plugins bring Commons Compress, which requested affected Lang 3.16.0.
            // https://www.openwall.com/lists/oss-security/2025/07/11/1
            if (requested.group == "org.apache.commons" && requested.name == "commons-lang3") {
                useVersion("3.20.0")
            }
        }
    }
}

val allowMavenLocal = providers.gradleProperty("allowMavenLocal")
    .map(String::toBoolean)
    .getOrElse(false)

plugins {
    id("app.morphe.patches") version "1.3.4"
}

settings {
    extensions {
        defaultNamespace = "app.hushgram.extension"

        // Must resolve to an absolute path (not relative),
        // otherwise the extensions in subfolders will fail to find the proguard config.
        proguardFiles(rootProject.projectDir.resolve("extensions/proguard-rules.pro").toString())
    }
}

if (!allowMavenLocal) {
    val localMavenUrl = file(System.getProperty("user.home"))
        .resolve(".m2/repository")
        .toURI()
        .toString()
        .removeSuffix("/")
    val localRepositories = dependencyResolutionManagement.repositories.filter { repository ->
        repository is MavenArtifactRepository
                && repository.url.toString().removeSuffix("/") == localMavenUrl
    }
    localRepositories.forEach { repository ->
        dependencyResolutionManagement.repositories.remove(repository)
    }
}

include(":patches:stub")
