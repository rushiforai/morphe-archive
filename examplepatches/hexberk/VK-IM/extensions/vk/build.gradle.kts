import com.android.build.api.dsl.ApplicationExtension

dependencies {
    compileOnly(project(":extensions:shared:library"))
    compileOnly(libs.morphe.extensions.library)

    implementation(libs.androidx.core)
    implementation(libs.hiddenapi)
}

configure<ApplicationExtension> {
    compileSdk = 36

    defaultConfig {
        minSdk = 26
    }
}
