extension { name = "extensions/spotify.mpe" }

android {
    namespace = "nl.johninnl.spotify"
    defaultConfig { minSdk = 24 }
}

dependencies {
    testImplementation("junit:junit:4.13.2")
}

configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
    .configureEach { exclude(group = "org.jetbrains.kotlin") }
