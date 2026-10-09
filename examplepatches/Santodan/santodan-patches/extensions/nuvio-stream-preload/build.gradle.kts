extension { name = "extensions/nuvio-stream-preload.mpe" }
android {
    namespace = "software.santodan.extension.nuviostreams"
    compileOptions { isCoreLibraryDesugaringEnabled = false }
}
dependencies { compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2") }
