dependencies {
    compileOnly(project(":extensions:bongo:stub"))
    compileOnly(project(":extensions:shared:stub"))
    compileOnly(project(":extensions:shared:library"))

    implementation(libs.david.webb)
}
