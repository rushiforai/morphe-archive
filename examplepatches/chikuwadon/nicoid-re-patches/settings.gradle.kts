rootProject.name = "nicoid-re-patches"

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

buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        // Latest stable Android Gradle plugin compatible with Gradle 9.9.2.
        classpath("com.android.tools.build:gradle:9.5.1")

        // Security updates for AGP / Morphe buildscript transitive dependencies.
        // Constrain resolved versions instead of adding unused buildscript APIs.
        // Keep Bouncy Castle provider, PKIX and utility modules aligned.
        constraints {
            classpath("org.bouncycastle:bcprov-jdk18on:1.87")
            classpath("org.bouncycastle:bcpkix-jdk18on:1.87")
            classpath("org.bouncycastle:bcutil-jdk18on:1.87")
            classpath("com.google.guava:guava:33.8.0-jre")
            classpath("org.apache.commons:commons-lang3:3.22.0")
            classpath("org.apache.httpcomponents:httpclient:4.5.14")
            classpath("org.bitbucket.b_c:jose4j:0.9.7")
            classpath("org.jdom:jdom2:2.0.6.1")
        }
    }
}

plugins {
    id("app.morphe.patches") version "2.1.2"
}

// Apply dependency security upgrades to all project and plugin classpaths,
// not only the settings script and the :patches project. The Gradle graph
// submission resolves extension and tooling configurations independently.
val securityBuildDeps = mapOf(
    "org.bouncycastle:bcprov-jdk18on" to "1.87",
    "org.bouncycastle:bcpkix-jdk18on" to "1.87",
    "org.bouncycastle:bcutil-jdk18on" to "1.87",
    "com.google.guava:guava" to "33.8.0-jre",
    "org.apache.commons:commons-lang3" to "3.22.0",
    "org.apache.httpcomponents:httpclient" to "4.5.14",
    "org.bitbucket.b_c:jose4j" to "0.9.7",
    "org.jdom:jdom2" to "2.0.6.1"
)
gradle.beforeProject {
    val targets = securityBuildDeps
    configurations.configureEach {
        resolutionStrategy.eachDependency {
            targets["${requested.group}:${requested.name}"]?.let { useVersion(it) }
        }
    }
    buildscript.configurations.configureEach {
        resolutionStrategy.eachDependency {
            targets["${requested.group}:${requested.name}"]?.let { useVersion(it) }
        }
    }
}
