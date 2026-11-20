extension {
    name = "extensions/meesho.mpe"
}

android {
    namespace = "app.windowshopper.extension.meesho"
    testOptions.unitTests.isReturnDefaultValues = true
}

dependencies {
    compileOnly(libs.okhttp)
    compileOnly(libs.retrofit)
    compileOnly(libs.kotlin.stdlib)
    testImplementation(libs.okhttp)
    testImplementation(libs.retrofit)
    testImplementation(libs.json)
    testImplementation(libs.junit)
}
