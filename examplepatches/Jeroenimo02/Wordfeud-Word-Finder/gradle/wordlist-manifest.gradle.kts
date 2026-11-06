// Generates app/wordfeudwordfinder/extension/words/WordListManifest.java from wordlists/manifest.json.
// Applied by extensions/extension/build.gradle.kts and tools/jvm-tests/build.gradle.kts.
//
// The patch downloads each list from raw.githubusercontent.com/<repository>/<commit>/<file>, pinned to the
// commit this build was made from (the commit contains the lists), and checks it against the SHA-256 in the
// manifest. Repository: GITHUB_REPOSITORY in CI, else the wordlistRepository property in gradle.properties.
// Commit: GITHUB_SHA in CI, else `git rev-parse HEAD`.

val wordlistRoot: File = rootProject.projectDir.let { if (File(it, "wordlists").isDirectory) it else it.parentFile.parentFile }
val wordlistManifestFile = File(wordlistRoot, "wordlists/manifest.json")
val wordlistOutDir = layout.buildDirectory.dir("generated/source/wordlists")

fun wordlistCommit(): String {
    System.getenv("GITHUB_SHA")?.takeIf { it.matches(Regex("[0-9a-f]{40}")) }?.let { return it }
    return try {
        val p = ProcessBuilder("git", "rev-parse", "HEAD").directory(wordlistRoot).redirectErrorStream(true).start()
        val out = p.inputStream.bufferedReader().readText().trim()
        if (p.waitFor() == 0 && out.matches(Regex("[0-9a-f]{40}"))) out else "main"
    } catch (e: Exception) {
        "main"
    }
}

val wordlistRepository: String = System.getenv("GITHUB_REPOSITORY")?.takeIf { it.contains("/") }
    ?: (findProperty("wordlistRepository") as String?)
    ?: rootProject.findProperty("wordlistRepository") as String?
    ?: "Jeroenimo02/Wordfeud-Word-Finder"

// Address of the report worker (tools/report-worker), e.g. https://wordfeud-word-report.<sub>.workers.dev/report.
// Empty: the patch reports nothing.
val wordReportUrl: String = ((findProperty("wordReportUrl") ?: rootProject.findProperty("wordReportUrl")) as String?)
    ?.trim()?.takeIf { it.startsWith("https://") } ?: ""

tasks.register("generateWordListManifest") {
    val outDir = wordlistOutDir
    val manifest = wordlistManifestFile
    val repo = wordlistRepository
    val commit = wordlistCommit()
    val reportUrl = wordReportUrl
    inputs.file(manifest)
    inputs.property("repository", repo)
    inputs.property("commit", commit)
    inputs.property("reportUrl", reportUrl)
    outputs.dir(outDir)
    doLast {
        val json = groovy.json.JsonSlurper().parse(manifest) as Map<*, *>
        val languages = json["languages"] as Map<*, *>
        val rulesets = json["rulesets"] as Map<*, *>
        fun lit(s: String) = "\"" + s.replace("\\", "\\\\").replace("\"", "\\\"") + "\""
        val rows = rulesets.entries.sortedBy { it.key.toString().toInt() }.joinToString("\n") { (id, code) ->
            val l = languages[code] as Map<*, *>
            "        {${lit(id.toString())}, ${lit(l["file"] as String)}, ${lit(l["sha256"] as String)}, ${lit(l["version"].toString())}},"
        }
        val file = outDir.get().file("app/wordfeudwordfinder/extension/words/WordListManifest.java").asFile
        file.parentFile.mkdirs()
        file.writeText(
            """
            |package app.wordfeudwordfinder.extension.words;
            |
            |/** Generated from wordlists/manifest.json by gradle/wordlist-manifest.gradle.kts; do not edit. */
            |final class WordListManifest {
            |    static final String REPOSITORY = ${lit(repo)};
            |    static final String COMMIT = ${lit(commit)};
            |    /** Report worker address (https), or "" when reporting is off. */
            |    static final String REPORT_URL = ${lit(reportUrl)};
            |    /** {ruleset id, file in the repository, SHA-256 of the file, version}. */
            |    static final String[][] ENTRIES = {
            |$rows
            |    };
            |
            |    private WordListManifest() {}
            |}
            |""".trimMargin()
        )
    }
}
