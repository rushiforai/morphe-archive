extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.template.extension"
}

dependencies {
    // Needed by FlightradarHelper to reach hidden PackageManager internals on Android 9+.
    implementation("org.lsposed.hiddenapibypass:hiddenapibypass:4.3")
}
