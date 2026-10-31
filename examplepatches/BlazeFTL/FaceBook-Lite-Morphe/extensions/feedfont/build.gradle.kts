extension {
    name = "extensions/feedfont.mpe"
}

android {
    namespace = "app.fblite.extension.feedfont"
}

dependencies {
    compileOnly(project(":extensions:feedfont:stub"))
}

apply(from = rootProject.file("gradle/rename-obfuscated-classes.gradle.kts"))
