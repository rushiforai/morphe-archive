extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.xfilter.extension"
}

dependencies {
    testImplementation("junit:junit:4.13.2")
    // Real org.json for JVM tests; android.jar only ships stubs.
    testImplementation("org.json:json:20250517")
}
