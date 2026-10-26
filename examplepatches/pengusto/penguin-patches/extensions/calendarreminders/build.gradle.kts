extension { name = "extensions/calendarreminders.mpe" }
android {
    namespace = "io.github.pengusto.patches.extension.calendarreminders"
    defaultConfig { minSdk = 26 }
    sourceSets.getByName("main").java.srcDir(
        "../extension/src/main/java/io/github/pengusto/patches/extension/calendarreminders"
    )
}
configurations.matching { it.name.endsWith("RuntimeClasspath") }.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
}
