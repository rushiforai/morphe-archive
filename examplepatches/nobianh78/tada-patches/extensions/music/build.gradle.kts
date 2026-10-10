import com.android.build.api.dsl.ApplicationExtension

dependencies {
    compileOnly(libs.tada.extensions.library)
    compileOnly(project(":extensions:shared-youtube:library"))
    compileOnly(project(":extensions:shared-youtube:stub"))
    compileOnly(project(":extensions:shared:library"))
    compileOnly(project(":extensions:youtube:stub"))
    compileOnly(libs.annotation)
    compileOnly(libs.protobuf.javalite)
}

configure<ApplicationExtension> {
    lint { abortOnError = false }
    defaultConfig {
        minSdk = 26
    }
}
