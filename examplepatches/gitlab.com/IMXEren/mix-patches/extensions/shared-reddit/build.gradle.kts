dependencies {
    implementation(project(":extensions:shared-reddit:library"))
    compileOnly(project(":extensions:shared:library"))
    compileOnly(libs.volley)
}
