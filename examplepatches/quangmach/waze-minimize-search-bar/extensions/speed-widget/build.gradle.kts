extension {
    name = "extensions/speed-widget.mpe"
}

android {
    namespace = "app.template.extension.speedwidget"
    buildTypes.named("release") {
        isMinifyEnabled = true
        proguardFiles("proguard-rules.pro")
        optimization.keepRules {
            ignoreFromAllExternalDependencies(true)
        }
    }
}

dependencies {
    implementation("com.google.android.gms:play-services-location:21.3.0")
}
