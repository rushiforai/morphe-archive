extension { name = "extensions/deezer-queue.mpe" }
android {
    namespace = "nl.johninnl.deezer.queue"
    defaultConfig { minSdk = 26 }
}
dependencies {
    compileOnly("androidx.media:media:1.6.0")
    testImplementation("junit:junit:4.13.2")
}

// Runtime is Java-only; do not export an unrelated Kotlin standard library into Deezer.
configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
    .configureEach { exclude(group = "org.jetbrains.kotlin") }
