extension {
    name = "extensions/hideads.mpe"
}

android {
    namespace = "app.fblite.extension.hideads"
}

dependencies {
    compileOnly(project(":extensions:hideads:stub"))
}

apply(from = rootProject.file("gradle/rename-obfuscated-classes.gradle.kts"))
