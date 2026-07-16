import com.android.build.api.dsl.ApplicationExtension

dependencies {
    implementation(libs.morphe.extensions.library)
    implementation(project(":extensions:shared:library"))
    compileOnly(libs.annotation)
}

configure<ApplicationExtension> {
    namespace = "app.morphe.extension"
    compileSdk = 36

    defaultConfig {
        minSdk = 26
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}
