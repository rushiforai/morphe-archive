import com.android.build.api.dsl.ApplicationExtension

configure<ApplicationExtension> {
    namespace = "app.morphe.extension"
    compileSdk = 36

    defaultConfig {
        minSdk = 24
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}
