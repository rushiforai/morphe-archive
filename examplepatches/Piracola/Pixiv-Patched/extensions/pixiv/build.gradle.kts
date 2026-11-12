extension {
    name = "extensions/pixiv.mpe"
}

android {
    namespace = "app.morphe.extension.pixiv"
}

dependencies {
    // Only for the search ranking interceptor: the interface is provided by the app at runtime.
    compileOnly("com.squareup.okhttp3:okhttp:4.12.0")
}
