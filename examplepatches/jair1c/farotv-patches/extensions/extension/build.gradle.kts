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

    @get:InputDirectory
    @get:PathSensitive(PathSensitivity.RELATIVE)
    abstract val locales: DirectoryProperty

    @get:OutputDirectory
    abstract val outputDirectory: DirectoryProperty

    @get:Input
    abstract val version: Property<String>

    // All scripts run as one bundle, so a syntax error in any of them disables every FaroTV feature.
    // Each file is checked with "node --check" (Node.js is installed in the release workflow);
    // without Node.js the check is skipped with a warning.
    private fun checkSyntax(files: List<java.io.File>) {
        val node = try {
            ProcessBuilder("node", "--version").redirectErrorStream(true).start().also { it.waitFor() }
            "node"
        } catch (e: Exception) {
            logger.warn("Node.js not found: the scripts in src/main/js are not syntax checked.")
            return
        }
        val errors = files.mapNotNull { file ->
            val process = ProcessBuilder(node, "--check", file.absolutePath).redirectErrorStream(true).start()
            val output = process.inputStream.bufferedReader().readText()
            if (process.waitFor() == 0) null else "${file.name}:\n$output"
        }
        if (errors.isNotEmpty()) throw GradleException("JavaScript syntax errors:\n" + errors.joinToString("\n"))
    }

    @TaskAction
    fun generate() {
        val files = scripts.get().asFile.listFiles { f -> f.name.endsWith(".js") }!!
            .sortedWith(compareBy({ when (it.name) { "i18n.js" -> 0; "runtime.js" -> 1; else -> 2 } }, { it.name }))
        checkSyntax(files)
        val catalogs = locales.get().asFile.listFiles { f -> f.name.endsWith(".json") }!!
            .sortedBy { it.name }.associate { file ->
                if (!file.nameWithoutExtension.matches(Regex("[a-z]{2,3}(-[a-z0-9]{2,8})*")))
                    throw GradleException("Use a lowercase language tag for catalog: ${file.name}")
                file.nameWithoutExtension to groovy.json.JsonSlurper().parseText(file.readText(Charsets.UTF_8))
            }
        val english = catalogs["en"] as? Map<*, *> ?: throw GradleException("Missing English catalog")
        val placeholders = Regex("\\{[A-Za-z0-9_]+}")
        for ((language, entries) in catalogs) {
            val catalog = entries as? Map<*, *> ?: throw GradleException("Invalid catalog: $language")
            if (catalog.keys != english.keys) throw GradleException("Translation keys differ: $language")
            for ((key, value) in catalog) {
                if (value !is String || value.isBlank()) throw GradleException("Empty translation: $language/$key")
                if (placeholders.findAll(value).map { it.value }.toSet() !=
                    placeholders.findAll(english[key].toString()).map { it.value }.toSet())
                    throw GradleException("Translation placeholders differ: $language/$key")
            }
        }
        val json = groovy.json.JsonOutput.toJson(catalogs)
        // The bundle version, shown in Settings > Acerca de.
        val lines = listOf("window.__farotvTranslations = $json;", "window.__farotvVersion = \"${version.get()}\";") + files.flatMap { file ->
            listOf("// ---- ${file.name}") + file.readText(Charsets.UTF_8).lines()
        }
        // Non-ASCII characters (accents in the Spanish texts) become \uXXXX escapes, so the
        // generated Java file does not depend on the compiler's source encoding.
        fun escape(line: String) = buildString {
            for (c in line) when {
                c == '\\' -> append("\\\\")
                c == '"' -> append("\\\"")
                c == '\t' -> append("    ")
                c == '\n' -> append("\\n")
                c.code < 32 -> {}
                c.code < 128 -> append(c)
                else -> append("\\u%04x".format(c.code))
            }
        }
        // Build at runtime to avoid Java's 64 KiB limit for a single constant string.
        val chunks = lines.joinToString("\n").chunked(8000).joinToString("\n") { chunk ->
            "        script.append(\"" + escape(chunk) + "\");"
        }
        val target = outputDirectory.file("app/tvpatches/extension/youtubetv/TvScriptsPayload.java").get().asFile
        target.parentFile.mkdirs()
        target.writeText(
            "package app.tvpatches.extension.youtubetv;\n" +
                "final class TvScriptsPayload {\n    static final String SCRIPT = build();\n" +
                "    private static String build() {\n        StringBuilder script = new StringBuilder();\n$chunks\n        return script.toString();\n    }\n" +
                "    private TvScriptsPayload() {}\n}\n"
        )
        val translations = outputDirectory.file("app/tvpatches/extension/youtubetv/TvTranslationsPayload.java").get().asFile
        val catalogChunks = json.chunked(8000).joinToString("\n") { "        text.append(\"${escape(it)}\");" }
        translations.writeText("package app.tvpatches.extension.youtubetv;\n" +
            "final class TvTranslationsPayload { static final String JSON = build();\n" +
            "    private static String build() { StringBuilder text = new StringBuilder();\n$catalogChunks\n        return text.toString(); }\n}\n")
    }
}

androidComponents.onVariants { variant ->
    val task = tasks.register<GenerateTvScriptsPayload>(
        "generate${variant.name.replaceFirstChar { it.uppercaseChar() }}TvScriptsPayload"
    ) {
        scripts.set(layout.projectDirectory.dir("src/main/js"))
        locales.set(layout.projectDirectory.dir("src/main/locales"))
        version.set(project.version.toString())
    }
    variant.sources.java?.addGeneratedSourceDirectory(task, GenerateTvScriptsPayload::outputDirectory)
}
