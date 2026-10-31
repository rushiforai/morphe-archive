import com.android.build.api.dsl.ApplicationExtension

configure<ApplicationExtension> {
    namespace = "app.morphe.extension.sabp"
    compileSdk = 36

    defaultConfig {
        // Smart AudioBook Player itself requires Android 11.
        minSdk = 30
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}
