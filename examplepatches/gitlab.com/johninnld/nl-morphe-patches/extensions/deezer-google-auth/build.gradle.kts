extension { name = "extensions/deezer-google-auth.mpe" }
android {
    namespace = "nl.johninnl.deezer.auth"
    defaultConfig { minSdk = 28 }
    buildTypes.getByName("release") {
        // R8 renamed our generated lambda/API-outline classes to root-package a..i, which
        // correctly fails the patch's namespace-isolation guard. Keep D8's owned names.
        // No foreign namespace is admitted or relocated into our namespace to hide it.
        isMinifyEnabled = false
        proguardFiles("proguard-rules.pro")
    }
}
dependencies { testImplementation("junit:junit:4.13.2") }
configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
    .configureEach { exclude(group = "org.jetbrains.kotlin") }
