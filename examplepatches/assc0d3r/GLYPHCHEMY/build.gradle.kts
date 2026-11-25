plugins {
    kotlin("jvm") version "2.0.21"
}

group = "dev.custom.gboardpatches"
// Single source of truth: build.sh and the release workflow both read
// gradle.properties, so the Gradle version must come from there too.
version = providers.gradleProperty("version").get()

repositories {
    mavenCentral()
    google()
}

dependencies {
    compileOnly(fileTree("libs") { include("*.jar") })
}

kotlin {
    compilerOptions {
        freeCompilerArgs.addAll(
            "-Xcontext-receivers",
            "-Xskip-metadata-version-check"
        )
    }
}

tasks.jar {
    archiveFileName.set("gboard-backspace-haptics.jar")
    destinationDirectory.set(layout.projectDirectory.dir("dist"))
}
