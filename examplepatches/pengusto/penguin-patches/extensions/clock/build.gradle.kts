extension { name = "extensions/clock.mpe" }
android {
    namespace = "io.github.pengusto.patches.extension.clock"
    defaultConfig { minSdk = 26 }
    sourceSets.getByName("main").java.srcDir(
        "../extension/src/main/java/io/github/pengusto/patches/extension/clock"
    )
}
dependencies { compileOnly(project(":stubs:clock")) }
configurations.matching { it.name.endsWith("RuntimeClasspath") }.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}
