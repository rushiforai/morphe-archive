extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.xposed.extension"
}

dependencies {
    // Provided by the patched app. Only ContinuationImpl/Continuation are referenced,
    // since R8 renames most other stdlib members inside X.
    compileOnly("org.jetbrains.kotlin:kotlin-stdlib:2.2.0")

    // Local JVM tests for the code that doesn't touch Android or X: matching, parsing, tables.
    testImplementation(libs.junit)
    testImplementation(libs.json)
}
