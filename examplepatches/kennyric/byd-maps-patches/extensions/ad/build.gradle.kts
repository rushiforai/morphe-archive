extension { name = "extensions/ad.mpe" }
android {
 namespace = "nl.johninnl.ad"
 defaultConfig { minSdk = 24 }
 testOptions { unitTests.isReturnDefaultValues = true }
}
dependencies { testImplementation("junit:junit:4.13.2") }
configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
 .configureEach { exclude(group = "org.jetbrains.kotlin") }
