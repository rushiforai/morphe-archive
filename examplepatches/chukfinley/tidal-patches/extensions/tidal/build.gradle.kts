extension {
    name = "extensions/tidal.mpe"
}

android {
    namespace = "dev.chuk.extension.tidal"

    defaultConfig {
        // Must stay at 24 or above. Below that, D8 desugars the default methods of the Compose
        // node interfaces into `Interface$-CC` helper classes. Those classes exist in neither
        // this extension nor the patched app (TIDAL builds with minSdk 29 and keeps real default
        // methods), so the app would crash with NoClassDefFoundError on the first layout pass.
        minSdk = 26
    }
}

dependencies {
    // Compose and RecyclerView APIs the swipe gesture implements. These are never bundled into
    // the extension - the patched app provides them at runtime.
    compileOnly("androidx.compose.ui:ui:1.9.0")
    compileOnly("androidx.compose.ui:ui-unit:1.9.0")
    compileOnly("androidx.compose.ui:ui-graphics:1.9.0")
    compileOnly("androidx.compose.runtime:runtime:1.9.0")
    compileOnly("androidx.recyclerview:recyclerview:1.3.2")
}
