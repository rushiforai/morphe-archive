// Compile-only stand-ins for the Relay classes the extension calls. Never packaged: the real
// classes are in the patched app.
plugins {
    `java-library`
}

java {
    sourceCompatibility = JavaVersion.VERSION_11
    targetCompatibility = JavaVersion.VERSION_11
}
