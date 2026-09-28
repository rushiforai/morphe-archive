extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.patchlab.extension"
    // This extension is Java-only. Avoid packaging Kotlin's runtime into the
    // MPE because ZenSMS already supplies its own R8-processed Kotlin runtime.
    enableKotlin = false
}

dependencies {
    // ZenSMS' R8-renamed Function1 interface is needed only while compiling
    // the callback classes. The real definition is supplied by the target APK.
    compileOnly(project(":zensms-stubs"))
    compileOnly("org.jetbrains.kotlin:kotlin-stdlib:1.9.24")
}
