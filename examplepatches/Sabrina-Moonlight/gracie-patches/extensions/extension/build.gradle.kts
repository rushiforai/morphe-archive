extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.template.extension"
}

dependencies {
    compileOnly("com.squareup.okhttp3:okhttp:4.12.0")
    implementation("org.lsposed.hiddenapibypass:hiddenapibypass:4.3")
}
