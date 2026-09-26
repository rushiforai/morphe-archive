import com.android.build.api.dsl.ApplicationExtension

extension {
    name = "extensions/ather.mpe"
}

dependencies {
    // Compile time only. The Ather app ships com.ather.maps.a0 itself, so the stub
    // must never reach the extension dex.
    compileOnly(project(":extensions:ather:stub"))
}

configure<ApplicationExtension> {
    namespace = "app.morphe.extension.ather"
    compileSdk = 37

    defaultConfig {
        minSdk = 26
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}
