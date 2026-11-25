extension { name = "extensions/trouw.mpe" }
android {
 namespace = "nl.johninnl.trouw"
 defaultConfig { minSdk = 32 }
 testOptions { unitTests.isReturnDefaultValues = true }
}
dependencies {
 compileOnly("androidx.media3:media3-common:1.10.1")
 testImplementation("junit:junit:4.13.2")
}
configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
 .configureEach { exclude(group = "org.jetbrains.kotlin") }
