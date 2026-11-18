import com.android.build.api.dsl.LibraryExtension

plugins { id("com.android.library") }
configure<LibraryExtension> {
    namespace = "nl.johninnl.reolink.calls.stub"
    compileSdk = 36
    defaultConfig { minSdk = 28 }
}
