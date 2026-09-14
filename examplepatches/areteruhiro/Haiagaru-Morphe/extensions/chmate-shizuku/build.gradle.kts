import com.android.build.api.dsl.ApplicationExtension

dependencies {
    implementation("dev.rikka.shizuku:api:13.1.5")
    implementation("dev.rikka.shizuku:provider:13.1.5")
}

configure<ApplicationExtension> {
    namespace = "app.morphe.extension.chmate.shizuku"
    compileSdk = 36

    buildFeatures {
        aidl = true
    }

    defaultConfig {
        minSdk = 24
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}
