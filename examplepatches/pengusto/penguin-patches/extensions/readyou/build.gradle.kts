extension { name = "extensions/readyou.mpe" }
android {
    namespace = "io.github.pengusto.patches.extension.readyou"
    defaultConfig { minSdk = 26 }
    sourceSets.getByName("main").java.srcDir(
        "../extension/src/main/java/io/github/pengusto/patches/extension/readyou"
    )
}
dependencies { compileOnly(project(":stubs:readyou")) }
configurations.matching { it.name.endsWith("RuntimeClasspath") }.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}
