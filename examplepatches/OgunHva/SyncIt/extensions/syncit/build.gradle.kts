extension {
    name = "extensions/syncit.mpe"
}

android {
    namespace = "app.syncit.extension"
}

dependencies {
    compileOnly(project(":extensions:syncit:stub"))
}
