extension { name = "extensions/wuplay.mpe" }
android {
    namespace = "nl.johninnl.wuplay"
    defaultConfig { minSdk = 24 }
    buildTypes { getByName("release") { proguardFiles("proguard-rules.pro") } }
}
dependencies { compileOnly("org.jetbrains.kotlin:kotlin-stdlib:2.2.10") }
configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
    .configureEach { exclude(group = "org.jetbrains.kotlin") }
