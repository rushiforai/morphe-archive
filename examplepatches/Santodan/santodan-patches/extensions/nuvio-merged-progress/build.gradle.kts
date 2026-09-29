extension {
    name = "extensions/nuvio-merged-progress.mpe"
}

android {
    namespace = "software.santodan.extension.nuviomerged"
    compileOptions { isCoreLibraryDesugaringEnabled = false }
}

dependencies {
    compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
}
