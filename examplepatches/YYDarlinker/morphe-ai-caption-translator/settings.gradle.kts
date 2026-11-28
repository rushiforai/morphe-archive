rootProject.name = "anchored-ai-captions"

pluginManagement {
    repositories {
        mavenLocal()
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
    id("app.morphe.patches") version "2.1.2"
}

include(":caption-contracts", ":caption-shared", ":translation-core")


settings {
    extensions {
        // Shrinks the extension: unused library code (Kotlin standard library) is dropped.
        proguardFiles(rootProject.projectDir.resolve("extensions/proguard-rules.pro").toString())
    }
}
