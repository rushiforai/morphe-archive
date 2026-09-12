// Compile-time-only stubs that replicate the field/method signatures of classes from the
// patched app (org.fdroid.fdroid). Never bundled at runtime: the extension depends on this
// module with `compileOnly`, so the real app classes are what's actually linked against once
// the extension DEX is merged into the patched APK.
plugins {
    `java-library`
}

java {
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
}

repositories {
    mavenCentral()
}

dependencies {
    // Same substitute android.jar morphe-patcher itself compiles against; only used to resolve
    // android.* types for these compile-only stubs.
    compileOnly("com.google.android:android:4.1.1.4")
}
