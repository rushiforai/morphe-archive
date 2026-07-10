extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.xhehab.extension"
    lint {
        abortOnError = false
        checkReleaseBuilds = false
    }
}

dependencies {
    // Present in MyoAdapt at runtime; needed only to compile the Interceptor.
    compileOnly("com.squareup.okhttp3:okhttp:4.12.0")
}
