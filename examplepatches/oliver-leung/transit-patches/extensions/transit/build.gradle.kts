extension {
    name = "extensions/transit.mpe"
}

android {
    namespace = "app.transitpatches.extension"
}

dependencies {
    compileOnly(libs.annotation)
    compileOnly(project(":extensions:transit:stub"))
}
