extension { name = "extensions/extension.mpe" }
android { namespace = "app.sharklatan.airplay.extension" }
dependencies {
    implementation("com.googlecode.plist:dd-plist:1.23")
    implementation("net.i2p.crypto:eddsa:0.3.0")
    implementation("com.nimbusds:srp6a:2.1.0")
}
