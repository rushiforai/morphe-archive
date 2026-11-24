extension { name = "extensions/car-app-ports.mpe" }

android {
    namespace = "nl.johninnl.carports"
    defaultConfig { minSdk = 29 }
    // These classes share the original apps' public Car App Library ABI. Keep their names,
    // including the upstream implementations instantiated through library reflection.
    buildTypes.getByName("release") { isMinifyEnabled = false }
}

dependencies {
    compileOnly("androidx.car.app:app:1.7.0")
    // The originals already contain app and app-automotive 1.7.0. Carry only the missing
    // projected implementation, without a second copy of the shared protocol classes.
    implementation("androidx.car.app:app-projected:1.7.0") { isTransitive = false }
}

configurations.matching { it.name == "releaseRuntimeClasspath" || it.name == "debugRuntimeClasspath" }
    .configureEach { exclude(group = "org.jetbrains.kotlin") }
