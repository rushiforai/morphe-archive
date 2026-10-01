// Produces extensions/x.mpe: the extension for the X patches, written for the rewritten
// 12.x client (com.x.*), which shares no code with the com.twitter client piko patches.
android {
    defaultConfig {
        minSdk = 26
    }
}

dependencies {
    compileOnly(project(":extensions:shared:library"))
    compileOnly(libs.morphe.extensions.library)
    compileOnly(libs.annotation)
}
