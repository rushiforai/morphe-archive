import com.android.build.api.dsl.LibraryExtension

plugins {
    alias(libs.plugins.android.library)
}

configure<LibraryExtension> {
    namespace = "io.github.redditnsfwonly.stub"
    compileSdk = 36
    defaultConfig { minSdk = 28 }
}
