// Compile-time stubs of the GeckoView and Kotlin runtime types that the Firefox Focus extension
// calls. Only the signatures matter (they match Focus 158.0's dex); the app provides the real
// classes at runtime. Nested under an extension project, so the settings plugin includes it
// without turning it into an extension (.mpe). No Android types appear here, so it stays a plain
// Java library; the extension reaches GeckoView (a FrameLayout) by reflection instead.
plugins {
    `java-library`
}

tasks.withType<JavaCompile>().configureEach {
    options.release.set(17)
}
