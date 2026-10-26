extension { name = "extensions/feeder.mpe" }
android {
    namespace = "io.github.pengusto.patches.extension.feeder"
    defaultConfig { minSdk = 29 }
    sourceSets.getByName("main").java.srcDir(
        "../extension/src/main/java/io/github/pengusto/patches/extension/feeder"
    )
}
dependencies { compileOnly(project(":stubs:feeder")) }
configurations.matching { it.name.endsWith("RuntimeClasspath") }.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}
