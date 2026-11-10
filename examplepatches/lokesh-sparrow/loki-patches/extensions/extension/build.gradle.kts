/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

// The extension is a plain Java library that is compiled into the patched app. Its only
// module-specific configuration is the translations step below; everything else (Android
// namespace, compile options) comes from the Morphe extension plugin.

extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.linkedin.extension"
}

// The settings screen is translated in JSON: one file per
// language in src/main/translations, with en.json as the source. An extension cannot carry
// Android resources, so those files are compiled into a Java class instead. The output has
// to stay a plain static map lookup - no reflection, no resources - because it runs inside
// the LinkedIn process.

val translationsDir = layout.projectDirectory.dir("src/main/translations")
val generatedDir = layout.buildDirectory.dir("generated/translations")

/**
 * One Java string literal with the same characters as [text]. Only printable ASCII is kept
 * as is; everything else (Cyrillic, Thai, emoji, ...) becomes a \u escape, so the generated
 * file is pure ASCII and javac reads it the same way on every platform.
 */
fun javaLiteral(text: String): String = buildString {
    append('"')
    for (c in text) {
        when (c) {
            '"' -> append("\\\"")
            '\\' -> append("\\\\")
            '\n' -> append("\\n")
            else -> if (c.code in 0x20..0x7E) append(c) else append("\\u%04x".format(c.code))
        }
    }
    append('"')
}

/** A translations JSON file; the keys are the English texts. */
fun readTranslations(file: File): Map<String, String> {
    @Suppress("UNCHECKED_CAST")
    return groovy.json.JsonSlurper().parse(file, "UTF-8") as Map<String, String>
}

fun placeholders(text: String) = Regex("%\\d+\\$[sd]").findAll(text).map { it.value }.sorted().toList()

val generateTranslations by tasks.registering {
    description = "Turns src/main/translations/*.json into app.linkedin.extension.Translations."
    inputs.dir(translationsDir)
    outputs.dir(generatedDir)

    doLast {
        val dir = translationsDir.asFile
        // languages.json maps a language code to its own name, and its order is the order the
        // language picker shows.
        val languages = readTranslations(dir.resolve("languages.json"))
        val english = readTranslations(dir.resolve("en.json")).keys
        val translated = languages.keys.filter { it != "en" }

        val source = StringBuilder()
        source.append("package app.linkedin.extension;\n\n")
        source.append("import java.util.HashMap;\nimport java.util.LinkedHashMap;\nimport java.util.Map;\n\n")
        source.append("/** Generated from src/main/translations. Do not edit. */\n")
        source.append("final class Translations {\n")
        source.append("    static final Map<String, String> LANGUAGES = new LinkedHashMap<>();\n\n")
        source.append("    static {\n")
        languages.forEach { (code, name) -> source.append("        LANGUAGES.put(${javaLiteral(code)}, ${javaLiteral(name)});\n") }
        source.append("    }\n\n")
        source.append("    private Translations() {\n    }\n\n")
        source.append("    /** English text to translated text, or null for English and unknown languages. */\n")
        source.append("    static Map<String, String> forLanguage(String code) {\n        switch (code) {\n")
        translated.forEachIndexed { index, code ->
            source.append("            case ${javaLiteral(code)}: return language$index();\n")
        }
        source.append("            default: return null;\n        }\n    }\n")

        translated.forEachIndexed { index, code ->
            val file = dir.resolve("$code.json")
            // A language listed in languages.json does not need a file yet; it then falls
            // back to English, which is the same thing an empty file would do.
            val entries = if (file.exists()) readTranslations(file) else emptyMap()

            val unknown = entries.keys - english
            check(unknown.isEmpty()) { "$code.json has keys that are not in en.json: $unknown" }

            // String.format is called with the English text and its arguments, so a
            // translation with different placeholders would throw at runtime instead of
            // showing up in review. Compare them here while the build is still cheap.
            val problems = entries.filter { (key, text) ->
                text.isNotEmpty() && placeholders(text) != placeholders(key)
            }
            check(problems.isEmpty()) {
                problems.entries.joinToString("; ") { (key, text) ->
                    "$code.json: placeholders of \"$key\" are ${placeholders(text)}, expected ${placeholders(key)}"
                }
            }

            val missing = english - entries.keys
            if (missing.isNotEmpty()) {
                logger.warn("$code.json is missing ${missing.size} translations; English is used for them.")
            }

            source.append("\n    private static Map<String, String> language$index() {\n")
            source.append("        Map<String, String> m = new HashMap<>();\n")
            entries.forEach { (key, text) ->
                if (text.isNotEmpty()) source.append("        m.put(${javaLiteral(key)}, ${javaLiteral(text)});\n")
            }
            source.append("        return m;\n    }\n")
        }
        source.append("}\n")

        val target = generatedDir.get().asFile.resolve("app/linkedin/extension/Translations.java")
        target.parentFile.mkdirs()
        target.writeText(source.toString())
    }
}

android.sourceSets.getByName("main").java.srcDir(generatedDir.get().asFile)
tasks.named("preBuild") { dependsOn(generateTranslations) }
