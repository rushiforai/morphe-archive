extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "io.github.pengusto.patches.extension"
    // App-specific MPEs keep existing released runtime payloads unchanged.
    val commonSources = file("src/main/java/io/github/pengusto/patches/extension")
        .listFiles().orEmpty().filter { it.isDirectory && it.name !in setOf("kvaesitso", "clock", "calendarreminders", "tasks", "feeder", "readyou") }
    sourceSets.getByName("main").apply {
        java.setSrcDirs(commonSources)
        kotlin.setSrcDirs(commonSources)
    }
}
