dependencies {
    implementation(project(":extensions:shared-reddit:library"))

    compileOnly(libs.morphe.extensions.library)
    compileOnly(project(":extensions:shared:library"))
    compileOnly(libs.annotation)
    compileOnly(libs.okhttp)
    compileOnly(libs.volley)
}
