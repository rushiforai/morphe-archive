extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.navhi.extension"
}

repositories {
    google()
    mavenCentral()
}

dependencies {
    // Provided by the app at runtime; only GoogleMap and its model types are used.
    compileOnly("com.google.android.gms:play-services-maps:18.2.0")
}
