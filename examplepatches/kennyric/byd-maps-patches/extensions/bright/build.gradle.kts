import java.security.MessageDigest

extension {
    name = "extensions/bright.mpe"
}

android {
    namespace = "nl.johninnl.patches.bright"
}

// The audited article-signing constant enters only here, from the
// git-ignored engineering input (BRIGHT_ARTICLE_SIGNING_KEY or
// .bright-article-signing-key). The value is compiled into the private
// article client and never logged. A missing key leaves the placeholder:
// the article control fails its preflight while privacy controls build.
val signingKeySource = providers.environmentVariable("BRIGHT_ARTICLE_SIGNING_KEY")
    .orElse(providers.fileContents(rootProject.layout.projectDirectory.file(".bright-article-signing-key")).asText)
val generatedSigningKey = layout.buildDirectory.dir("generated/signing-key/java")
// AGP source sets reject Provider instances; the build directory layout is
// known at configuration time, so resolve it directly and order javac.
android.sourceSets["main"].java.srcDir(generatedSigningKey.get())
val digestOnly = signingKeySource.map { key ->
    if (key.isBlank()) "missing" else MessageDigest.getInstance("SHA-256").digest(key.trim().toByteArray())
        .joinToString("") { "%02x".format(it.toInt() and 0xff) }
}
val generateSigningKey = tasks.register("generateSigningKey") {
    val digest = digestOnly.orElse("missing")
    inputs.property("signingKeyDigest", digest)
    outputs.dir(generatedSigningKey)
    doLast {
        val raw = signingKeySource.orNull?.trim()
        val available = !raw.isNullOrEmpty() && Regex("[A-Za-z0-9_-]{16,128}").matches(raw)
        val value = if (available) "\"$raw\"" else "null"
        val digestValue = if (available) "\"${digest.get()}\"" else "null"
        val destination = generatedSigningKey.get().asFile.resolve("patches/bright/BrightSigningKey.java")
        destination.parentFile.mkdirs()
        destination.writeText(
            """
            |// GENERATED from the git-ignored engineering key input; never commit or log the value.
            |package patches.bright;
            |
            |final class BrightSigningKey {
            |    private BrightSigningKey() {
            |    }
            |
            |    static SigningKeySource source() {
            |        return new SigningKeySource() {
            |            public byte[] load() {
            |                return VALUE == null ? null : VALUE.getBytes(java.nio.charset.StandardCharsets.UTF_8);
            |            }
            |        };
            |    }
            |
            |    static final String VALUE = $value;
            |    static final String SHA256 = $digestValue;
            |}
            """.trimMargin()
        )
    }
}
tasks.matching { it.name.startsWith("compile") && (it.name.endsWith("JavaWithJavac") || it.name.endsWith("Kotlin")) }
    .configureEach { dependsOn(generateSigningKey) }
