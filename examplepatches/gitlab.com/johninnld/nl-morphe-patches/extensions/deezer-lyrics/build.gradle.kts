extension { name = "extensions/deezer-lyrics.mpe" }
android {
    namespace = "nl.johninnl.deezer.lyrics"
    defaultConfig {
        minSdk = 26
        buildConfigField("String", "PATCH_VERSION", "\"${rootProject.version}\"")
    }
    buildFeatures { buildConfig = true }
    buildTypes.getByName("release") { isMinifyEnabled = false }
}
dependencies {
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.json:json:20250517")
}
configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
    .configureEach { exclude(group = "org.jetbrains.kotlin") }
