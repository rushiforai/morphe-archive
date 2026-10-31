import com.android.build.api.dsl.ApplicationExtension

// Separate DEX extension: packaged only when the opt-in TV360 player patch
// requests extendWith("extensions/tv360-media3.mpe").
extension {
    name = "extensions/tv360-media3.mpe"
}

dependencies {
    val media3Version = "1.11.1"
    implementation("androidx.media3:media3-exoplayer:$media3Version")
    implementation("androidx.media3:media3-exoplayer-hls:$media3Version")
    implementation("androidx.media3:media3-exoplayer-dash:$media3Version")
}

configure<ApplicationExtension> {
    namespace = "app.morphe.extension.tv360"
    compileSdk = 36
    defaultConfig { minSdk = 26 }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}
