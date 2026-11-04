extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.linkedin.extension"
}

// Translations live in src/main/translations as one JSON file per language (en.json is the source), the format
// Crowdin uses. Extensions can't carry Android resources, so the files are turned into a Java class at build time.
val translationsDir = layout.projectDirectory.dir("src/main/translations")
val generatedTranslationsDir = layout.buildDirectory.dir("generated/translations")

val generateTranslations by tasks.registering {
    inputs.dir(translationsDir)
    outputs.dir(generatedTranslationsDir)

    doLast {
        fun quote(text: String) = buildString {
            append('"')
            text.forEach { c ->
                when (c) {
                    '"' -> append("\\\"")
                    '\\' -> append("\\\\")
                    '\n' -> append("\\n")
                    else -> if (c.code < 0x20 || c.code > 0x7E) append("\\u%04x".format(c.code)) else append(c)
                }
            }
            append('"')
        }

        fun readJson(file: File): Map<String, String> {
            @Suppress("UNCHECKED_CAST")
            return groovy.json.JsonSlurper().parse(file, "UTF-8") as Map<String, String>
        }

        val dir = translationsDir.asFile
        // languages.json: code -> name of the language in that language, in the order shown in settings.
        val languages = readJson(dir.resolve("languages.json"))
        val source = readJson(dir.resolve("en.json")).keys

        val out = StringBuilder()
        out.append("package app.linkedin.extension;\n\n")
        out.append("import java.util.HashMap;\nimport java.util.LinkedHashMap;\nimport java.util.Map;\n\n")
        out.append("/** Generated from src/main/translations. Do not edit. */\n")
        out.append("final class Translations {\n")
        out.append("    static final Map<String, String> LANGUAGES = new LinkedHashMap<>();\n\n")
        out.append("    static {\n")
        languages.forEach { (code, name) -> out.append("        LANGUAGES.put(${quote(code)}, ${quote(name)});\n") }
        out.append("    }\n\n")
        out.append("    private Translations() {\n    }\n\n")
        out.append("    /** English text to translated text, or null for English and unknown languages. */\n")
        out.append("    static Map<String, String> forLanguage(String code) {\n        switch (code) {\n")
        val translated = languages.keys.filter { it != "en" }
        translated.forEachIndexed { index, code ->
            out.append("            case ${quote(code)}: return language$index();\n")
        }
        out.append("            default: return null;\n        }\n    }\n")

        translated.forEachIndexed { index, code ->
            val file = dir.resolve("$code.json")
            val entries = if (file.exists()) readJson(file) else emptyMap()
            val unknown = entries.keys - source
            check(unknown.isEmpty()) { "$code.json has keys that are not in en.json: $unknown" }
            // A translation must use the same placeholders as the English text, or String.format would throw.
            val placeholder = Regex("%\\d+\\$[sd]")
            entries.forEach { (english, text) ->
                if (text.isEmpty()) return@forEach
                val expected = placeholder.findAll(english).map { it.value }.sorted().toList()
                val actual = placeholder.findAll(text).map { it.value }.sorted().toList()
                check(expected == actual) { "$code.json: placeholders of \"$english\" are $actual, expected $expected" }
            }
            val missing = source - entries.keys
            if (missing.isNotEmpty()) logger.warn("$code.json is missing ${missing.size} translations; English is used for them.")
            out.append("\n    private static Map<String, String> language$index() {\n")
            out.append("        Map<String, String> m = new HashMap<>();\n")
            entries.forEach { (english, text) ->
                if (text.isNotEmpty()) out.append("        m.put(${quote(english)}, ${quote(text)});\n")
            }
            out.append("        return m;\n    }\n")
        }
        out.append("}\n")

        val target = generatedTranslationsDir.get().asFile.resolve("app/linkedin/extension/Translations.java")
        target.parentFile.mkdirs()
        target.writeText(out.toString())
    }
}

android.sourceSets.getByName("main").java.srcDir(generatedTranslationsDir.get().asFile)
tasks.named("preBuild") { dependsOn(generateTranslations) }
