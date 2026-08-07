plugins {
    `kotlin-dsl`
    kotlin("plugin.serialization") version "2.2.21"
}

repositories {
    mavenCentral()
}

dependencies {
    implementation("gg.jte:jte:3.2.4")
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.11.0")
}