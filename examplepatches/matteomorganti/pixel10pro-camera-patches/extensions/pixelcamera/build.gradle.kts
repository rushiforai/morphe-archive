import com.android.build.api.dsl.ApplicationExtension

dependencies {
    compileOnly(libs.annotation)
}

configure<ApplicationExtension> {
    compileSdk = 36

    defaultConfig {
        // Pixel Camera 10.4.x declares minSdk 37, but the extension itself only
        // uses APIs available since 21. Keep this low so the same extension can
        // be merged into older Pixel Camera builds.
        minSdk = 26
    }
}
