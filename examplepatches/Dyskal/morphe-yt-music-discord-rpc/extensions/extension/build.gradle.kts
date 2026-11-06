extension {
    name = "extensions/discord.mpe"
}

android {
    namespace = "me.dyskal.ytmrpc"
    defaultConfig { minSdk = 26 }
}

dependencies {
    implementation("androidx.browser:browser:1.8.0")
    implementation("com.squareup.okhttp3:okhttp:4.12.0")
    testImplementation("junit:junit:4.13.2")
    testImplementation("com.squareup.okhttp3:mockwebserver:4.12.0")
    testImplementation("org.json:json:20240303")
}
