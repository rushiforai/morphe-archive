extension { name = "extensions/soundcloud.mpe" }

android {
    namespace = "nl.johninnl.soundcloud"
    defaultConfig { minSdk = 32 }
}

dependencies {
    // Compile-only stub of the app's TrackMenuItem (see stubs/src). It must stay compileOnly:
    // the real class lives in the patched APK and must never be packaged into the extension.
    compileOnly(files("stubs/soundcloud-app-stubs.jar"))
    compileOnly("org.jetbrains.kotlin:kotlin-stdlib:2.2.10")
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.jetbrains.kotlin:kotlin-stdlib:2.2.10")
}

configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
    .configureEach { exclude(group = "org.jetbrains.kotlin") }
