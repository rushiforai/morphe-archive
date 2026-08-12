plugins {
    alias(libs.plugins.android.library)
}

android {
    namespace = "app.morphe.extension.sharedyoutube.library"
    compileSdk = 35

    defaultConfig {
        minSdk = 23
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}

dependencies {
    compileOnly(libs.annotation)

    implementation(libs.gson)
    //noinspection UseTomlInstead
    implementation("com.github.ynab:J2V8:6.2.1-16kb.2@aar")

    implementation(project(":extensions:shared:library"))
}
