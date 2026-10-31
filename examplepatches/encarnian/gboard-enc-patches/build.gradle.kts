plugins {
    kotlin("jvm") version "2.0.21"
}

group = "dev.custom.gboardpatches"
version = "1.0.0"

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
