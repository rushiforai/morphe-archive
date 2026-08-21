plugins {
    alias(libs.plugins.ksp)
}

dependencies {
    compileOnly(libs.morphe.extensions.library)
    implementation(libs.annotation)
    // Provided by the host app; must not be bundled again.
    compileOnly(libs.okhttp)
    // Not present in Boost, so this one is compiled in.
    implementation(libs.jsoup)
    coreLibraryDesugaring(libs.desugar.jdk.libs)
}

android {
    namespace = "app.morphe.extension.boostforlemmy"

    defaultConfig {
        // Matches Boost for Lemmy's own minSdk.
        minSdk = 32
    }
}

kotlin {
    compilerOptions {
        // OkHttp is built with a newer Kotlin than the Morphe plugin uses.
        freeCompilerArgs.add("-Xskip-metadata-version-check")
    }
}
