extension { name = "extensions/maps-gearslip.mpe" }

android {
    namespace = "nl.johninnl.maps.gearslip"
    defaultConfig { minSdk = 29 }
    testOptions { unitTests.isIncludeAndroidResources = true }
}

dependencies {
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.16.1")
    testImplementation("androidx.car.app:app:1.8.0-rc01")
}

configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
    .configureEach { exclude(group = "org.jetbrains.kotlin") }
