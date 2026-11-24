extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.template.extension"
}

dependencies {
    // Provided by AARE at runtime (it uses Shizuku for car audio): compile against the same version.
    compileOnly("dev.rikka.shizuku:api:13.1.5")
    // Integrated Shizuku: BinderContainer comes with the provider, also part of AARE.
    compileOnly("dev.rikka.shizuku:provider:13.1.5")
}

dependencies {
    // TunnelMathTest and other pure-Java tests, run in CI before every release.
    testImplementation("junit:junit:4.13.2")
}
