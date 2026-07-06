extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.frantic.extension"
    // ponytail: default build-tools (36.0.0) is corrupted locally (missing aapt);
    // pin to an installed healthy version. Drop once the SDK is repaired.
    buildToolsVersion = "36.1.0"
}
