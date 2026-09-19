extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "com.travianpatch.notifier"
}

dependencies {
    // These classes already exist in the target app's own dex files
    // (bundled OkHttp/androidx.core/WorkManager 2.7.0) — compileOnly so we
    // link against their API without re-bundling the implementation into
    // our extension.
    compileOnly("com.squareup.okhttp3:okhttp:4.12.0")
    compileOnly("androidx.core:core:1.10.1")
    compileOnly("androidx.work:work-runtime:2.7.0")
}
