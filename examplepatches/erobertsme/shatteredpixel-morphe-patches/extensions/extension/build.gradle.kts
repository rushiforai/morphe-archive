extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.template.extension"
}

dependencies {
	compileOnly(project(":extensions:extension:stub"))
}
