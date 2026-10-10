import com.android.build.api.dsl.ApplicationExtension

dependencies {
    compileOnly(project(":extensions:shared:library"))
    compileOnly(project(":extensions:reddit:stub"))
    compileOnly(libs.tada.extensions.library)

    // Used by TADaSettingsIconVectorDrawable.
    implementation(libs.androidx.core)

    // Used by SpoofSignaturePatch.
    implementation(libs.hiddenapi)
}

configure<ApplicationExtension> {
    lint { abortOnError = false }
    compileSdk = 36

    defaultConfig {
        minSdk = 28
    }
}
