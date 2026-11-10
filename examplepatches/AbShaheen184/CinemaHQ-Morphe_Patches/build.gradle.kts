plugins {
    kotlin("jvm")
}
// Root build configuration for morphe-patches-template
dependencies {
    implementation(kotlin("stdlib-jdk8"))
}
repositories {
    mavenCentral()
}
kotlin {
    jvmToolchain(8)
}