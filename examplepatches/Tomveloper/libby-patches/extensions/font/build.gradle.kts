extension {
    // No longer font-only: this DEX also hosts the shared /morphe/ router.
    name = "extensions/libby.mpe"
}

android {
    namespace = "app.libby.font"
}

val fontUiDir = layout.projectDirectory.dir("src/main/font-ui")
val generatedFontUiDir = layout.buildDirectory.dir("generated/fontUi/java").get().asFile

val generateFontUi by tasks.registering {
    inputs.files(
        fontUiDir.file("section.html"),
        fontUiDir.file("section.css"),
        fontUiDir.file("controller.js"),
    )
    outputs.dir(generatedFontUiDir)

    doLast {
        val html = fontUiDir.file("section.html").asFile.readText()
        val css = fontUiDir.file("section.css").asFile.readText()
        val js = fontUiDir.file("controller.js").asFile.readText()

        val out = generatedFontUiDir.resolve("app/libby/font/FontUiData.java")
        out.parentFile.mkdirs()
        out.writeText(
            """
            package app.libby.font;

            /** Generated from src/main/font-ui. Do not edit by hand. */
            public final class FontUiData {
                public static final String HTML = ${html.toJavaExpression()};
                public static final String CSS = ${css.toJavaExpression()};
                public static final String JS = ${js.toJavaExpression()};

                private FontUiData() {
                }
            }
            """.trimIndent(),
        )
    }
}

android.sourceSets.getByName("main").java.srcDir(generatedFontUiDir)

tasks.matching { it.name == "preBuild" }.configureEach {
    dependsOn(generateFontUi)
}

fun String.toJavaExpression(): String {
    // A JVM string constant is limited to 65535 bytes of modified UTF-8. The
    // UI script grows with every feature, so emit large values as a chain of
    // smaller literals that is concatenated at class-initialization time.
    val maxChunk = 30000
    if (length <= maxChunk) {
        return toJavaLiteral()
    }
    val builder = StringBuilder("new StringBuilder()")
    var index = 0
    while (index < length) {
        val end = minOf(index + maxChunk, length)
        builder.append(".append(")
            .append(substring(index, end).toJavaLiteral())
            .append(")")
        index = end
    }
    return builder.append(".toString()").toString()
}

fun String.toJavaLiteral(): String = buildString {
    append('"')
    for (ch in this@toJavaLiteral) {
        when (ch) {
            '\\' -> append("\\\\")
            '"' -> append("\\\"")
            '\n' -> append("\\n")
            '\r' -> append("\\r")
            '\t' -> append("\\t")
            else -> {
                if (ch.code < 0x20 || ch.code > 0x7e) {
                    append("\\u")
                    append(ch.code.toString(16).padStart(4, '0'))
                } else {
                    append(ch)
                }
            }
        }
    }
    append('"')
}
