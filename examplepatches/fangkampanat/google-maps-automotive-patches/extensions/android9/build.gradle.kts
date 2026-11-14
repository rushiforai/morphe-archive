import com.android.build.api.dsl.ApplicationExtension

dependencies {
    compileOnly(project(":extensions:android9:stub"))
}

configure<ApplicationExtension> {
    namespace = "app.morphe.extension.android9"
    compileSdk = 36

    defaultConfig {
        minSdk = 28
    }

    buildTypes {
        getByName("release") {
            proguardFiles("proguard-rules.pro")
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}
