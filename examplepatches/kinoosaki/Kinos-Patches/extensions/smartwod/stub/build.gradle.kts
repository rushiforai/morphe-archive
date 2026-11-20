// Compile-time stubs of the React Native bridge API that the SmartWOD extension calls. Only the
// signatures matter; the app provides the real classes at runtime. Nested under an extension
// project, so the settings plugin includes it without turning it into an extension (.mpe).
plugins {
    `java-library`
}

tasks.withType<JavaCompile>().configureEach {
    options.release.set(17)
}
