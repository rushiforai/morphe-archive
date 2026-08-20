extension {
    name = "extensions/shared.mpe"
}

android {
    namespace = "app.template.extension"
}

dependencies {
    implementation(project(":extensions:shared:library"))
}
