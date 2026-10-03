/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

dependencies {
    compileOnly(project(":extensions:shared:library"))
    implementation(fileTree(mapOf("dir" to "libs", "include" to listOf("*.jar", "*.aar"))))
    testImplementation(libs.junit)
}

extension {
    name = "extensions/facebook.mpe"
}

android {
    namespace = "app.morphe.extension.facebook"

    defaultConfig {
        versionCode = 1
        versionName = "1.0"
    }
}
