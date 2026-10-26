extension { name = "extensions/tasks.mpe" }
android {
    namespace = "io.github.pengusto.patches.extension.tasks"
    defaultConfig { minSdk = 26 }
    sourceSets.getByName("main").kotlin.srcDir(
        "../extension/src/main/java/io/github/pengusto/patches/extension/tasks"
    )
}
kotlin {
    compilerOptions {
        freeCompilerArgs.addAll("-Xno-param-assertions", "-Xno-call-assertions", "-Xno-receiver-assertions")
    }
}
dependencies { compileOnly(libs.coroutines.core) }
configurations.matching { it.name.endsWith("RuntimeClasspath") }.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}
