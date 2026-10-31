// Compile-time copies of the Amazon IVS networking API that ships inside the Twitch app.
// Only used to compile the extension; the real classes come from the patched app.
plugins {
    `java-library`
}

java {
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
}
