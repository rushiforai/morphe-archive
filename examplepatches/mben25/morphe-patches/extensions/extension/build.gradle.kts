extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.template.extension"
}

dependencies {
    // StayFree in-app QR scanner. Pure Java decoder, so it works without Google Play Services
    // (Brave's scanner uses GMS Mobile Vision, which AOSP ROMs may not have).
    implementation("com.google.zxing:core:3.5.3")
}
