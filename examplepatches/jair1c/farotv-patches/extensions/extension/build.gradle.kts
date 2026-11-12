extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.tvpatches.extension"
}

// The scripts in src/main/js are joined (runtime.js first, then the rest in name order) and
// embedded as a Java string constant: TvScriptsPayload.SCRIPT.
// Idea from ysamjo/morphe-patches (GPLv3).
abstract class GenerateTvScriptsPayload : DefaultTask() {
    @get:InputDirectory
    @get:PathSensitive(PathSensitivity.RELATIVE)
    abstract val scripts: DirectoryProperty

    @get:OutputDirectory
    abstract val outputDirectory: DirectoryProperty

    @get:Input
    abstract val version: Property<String>

    @TaskAction
    fun generate() {
        val files = scripts.get().asFile.listFiles { f -> f.name.endsWith(".js") }!!
            .sortedWith(compareBy({ it.name != "runtime.js" }, { it.name }))
        // The bundle version, shown in Settings > Acerca de.
        val lines = listOf("window.__farotvVersion = \"${version.get()}\";") + files.flatMap { file ->
            listOf("// ---- ${file.name}") + file.readText(Charsets.UTF_8).lines()
        }
        // Non-ASCII characters (accents in the Spanish texts) become \uXXXX escapes, so the
        // generated Java file does not depend on the compiler's source encoding.
        fun escape(line: String) = buildString {
            for (c in line) when {
                c == '\\' -> append("\\\\")
                c == '"' -> append("\\\"")
                c == '\t' -> append("    ")
                c.code < 32 -> {}
                c.code < 128 -> append(c)
                else -> append("\\u%04x".format(c.code))
            }
        }
        val literal = lines.joinToString("\n            + ") { line -> "\"" + escape(line) + "\\n\"" }
        val target = outputDirectory.file("app/tvpatches/extension/youtubetv/TvScriptsPayload.java").get().asFile
        target.parentFile.mkdirs()
        target.writeText(
            "package app.tvpatches.extension.youtubetv;\n" +
                "final class TvScriptsPayload {\n    static final String SCRIPT = $literal;\n" +
                "    private TvScriptsPayload() {}\n}\n"
        )
    }
}

androidComponents.onVariants { variant ->
    val task = tasks.register<GenerateTvScriptsPayload>(
        "generate${variant.name.replaceFirstChar { it.uppercaseChar() }}TvScriptsPayload"
    ) {
        scripts.set(layout.projectDirectory.dir("src/main/js"))
        version.set(project.version.toString())
    }
    variant.sources.java?.addGeneratedSourceDirectory(task, GenerateTvScriptsPayload::outputDirectory)
}
