plugins {
    id("com.android.library")
}

// Only JVM signatures of the pinned app and patch-injected accessors. Not runtime code.
android {
    namespace = "io.github.pengusto.stubs.kvaesitso"
    compileSdk = 36
    defaultConfig { minSdk = 23 }
}

dependencies {
    compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.11.0")
    compileOnly("androidx.compose.runtime:runtime:1.13.0-alpha01")
}
