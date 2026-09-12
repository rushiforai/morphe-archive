// A minimal standalone runner: applies a Morphe .mpp patches file to an APK and produces a
// signed, installable APK. Morphe Patcher itself only produces the raw pieces (patched dex
// files, a compiled resources.apk, other resource files) — assembling and signing the final
// APK is normally done by a patch manager (morphe-manager/morphe-desktop), neither of which is
// checked out in this workspace, so this is a small purpose-built substitute for that one step.
plugins {
    id("org.jetbrains.kotlin.jvm")
    application
}

repositories {
    mavenLocal()
    mavenCentral()
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

dependencies {
    implementation("app.morphe:morphe-patcher:1.13.0")
    implementation("com.android.tools.build:apkzlib:9.1.1")
    implementation("com.android.tools.build:apksig:9.4.0")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
    implementation("com.google.guava:guava:33.5.0-jre")
}

application {
    mainClass.set("app.fdroidbackends.apply.MainKt")
}
