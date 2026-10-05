extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.template.extension"
}

dependencies {
    // Present in the Letterboxd APK at runtime; not bundled.
    compileOnly("androidx.fragment:fragment:1.8.5")
    compileOnly("androidx.annotation:annotation:1.9.1")
    // For MaterialButton, to match trailer_button's own style (StreamingButton).
    compileOnly("com.google.android.material:material:1.12.0")
    // For the Watchlist nav item — navigate the tabs controller like a real tab (WatchlistNav).
    compileOnly("androidx.navigation:navigation-runtime:2.8.5")
    // For intercepting the back gesture on the Watchlist screen (WatchlistNav).
    compileOnly("androidx.activity:activity:1.9.3")
    // For hiding the Watchlist screen's toolbar back arrow (WatchlistNav).
    compileOnly("androidx.appcompat:appcompat:1.7.0")
}
