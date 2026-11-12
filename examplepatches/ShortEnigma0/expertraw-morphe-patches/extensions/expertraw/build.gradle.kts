import com.android.build.api.dsl.ApplicationExtension

dependencies {
    compileOnly(project(":extensions:shared:library"))
    compileOnly(project(":extensions:expertraw:stub"))
}

configure<ApplicationExtension> {
    compileSdk = 36

    defaultConfig {
        minSdk = 34
    }
}
