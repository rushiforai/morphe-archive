extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "com.github.wzse.extension"
}

dependencies {
    compileOnly("com.google.guava:guava:33.5.0-jre")
    compileOnly("androidx.media3:media3-common:1.4.1")
    compileOnly("com.google.android.exoplayer:exoplayer-core:2.19.1")
    compileOnly("com.android.volley:volley:1.2.1")
}
