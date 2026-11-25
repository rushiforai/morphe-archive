extension { name = "extensions/soundcloud.mpe" }

android {
    namespace = "nl.johninnl.soundcloud"
    defaultConfig { minSdk = 32 }
}

dependencies {
    compileOnly("org.jetbrains.kotlin:kotlin-stdlib:2.2.10")
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.jetbrains.kotlin:kotlin-stdlib:2.2.10")
}

configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
    .configureEach { exclude(group = "org.jetbrains.kotlin") }
