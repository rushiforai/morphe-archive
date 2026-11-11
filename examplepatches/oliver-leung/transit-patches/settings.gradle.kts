rootProject.name = "transit-patches"

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
    dependencies {
        constraints {
            classpath("com.google.guava:guava:33.7.2-jre")
            classpath("org.apache.commons:commons-lang3:3.18.0")
            classpath("org.bitbucket.b_c:jose4j:0.9.6")
            classpath("org.bouncycastle:bcpkix-jdk18on:1.85")
            classpath("org.bouncycastle:bcprov-jdk18on:1.85")
            classpath("org.bouncycastle:bcutil-jdk18on:1.85")
            classpath("org.jdom:jdom2:2.0.6.1")
        }
    }
}

plugins {
    id("app.morphe.patches") version "2.1.0"
}
