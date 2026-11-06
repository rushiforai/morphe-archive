// Produces extensions/instagram.mpe. Carries this bundle's own Links helper alongside the
// download and entity classes vendored from piko.
dependencies {
    compileOnly(project(":extensions:shared:library"))
    compileOnly(project(":extensions:instagram:stub"))
    compileOnly(libs.morphe.extensions.library)
    compileOnly(libs.instagram.morphe.extensions.library)
    compileOnly(libs.annotation)
    compileOnly(libs.appcompat)
}

android {
    defaultConfig {
        minSdk = 26
    }
}
