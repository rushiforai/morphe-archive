

dependencies {
    compileOnly("com.squareup.okhttp3:okhttp:4.9.2")
}

extension { name = "extensions/extension.mpe" }

android {
    namespace = "app.revanced.extension"
    lint {
        disable += "NewApi"
    }
}
