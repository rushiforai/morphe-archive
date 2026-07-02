dependencies {
    compileOnly(project(":extensions:shared:library"))
    compileOnly(project(":extensions:strava:stub"))
    compileOnly(libs.okhttp)
}

extension {
    name = "extensions/strava.mpe"
}

