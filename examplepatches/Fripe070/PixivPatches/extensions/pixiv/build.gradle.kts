import com.android.build.api.dsl.ApplicationExtension

dependencies {
    compileOnly(libs.morphe.extensions.library)
    implementation(libs.androidx.core)
    implementation(libs.androidx.annotation)
}

configure<ApplicationExtension> {
    compileSdk = 35

    defaultConfig {
        minSdk = 26
    }
}
