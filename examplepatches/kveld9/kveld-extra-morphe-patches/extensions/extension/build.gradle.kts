// Note: Upstream AGP emits Gradle 10 deprecations (Project dependency notation, Configuration.setVisible)
// handled by app.morphe.patches plugin and AGP upstream updates.
extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "com.kveld9.morphe.extra.extension"
}

dependencies {
    implementation(libs.hiddenapibypass)
}
