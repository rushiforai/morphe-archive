extension {
    name = "extensions/meesho.mpe"
}

android {
    namespace = "app.windowshopper.extension.meesho"
    testOptions.unitTests.isReturnDefaultValues = true
    buildFeatures.buildConfig = true
    defaultConfig.buildConfigField("String", "PATCHES_VERSION", "\"${project.version}\"")
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
