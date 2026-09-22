import com.android.build.api.dsl.ApplicationExtension

dependencies {
    implementation(libs.hiddenapi)
    implementation("org.mozilla:rhino:1.8.0")
}

configure<ApplicationExtension> {
    namespace = "app.morphe.extension.chmate"
    compileSdk = 36

    defaultConfig {
        minSdk = 21
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}
