dependencies {
    compileOnly(project(":extensions:shared:library"))
    compileOnly(project(":extensions:tiktok:stub"))
    compileOnly(libs.annotation)

    testImplementation(project(":extensions:shared:library"))
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.14.1")
}

extension {
    name = "extensions/tiktok.mpe"
}

android {
    namespace = "app.morphe.extension.tiktok"

    defaultConfig {
        minSdk = 22
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }
}
