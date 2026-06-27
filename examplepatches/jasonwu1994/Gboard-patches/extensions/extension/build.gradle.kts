import java.security.MessageDigest
import java.util.Base64

extension {
    name = "extensions/gboard-patches.rve"
}

val quickJsPayloadSourceDir = layout.projectDirectory.dir("native-payload/arm64-v8a")
val generatedQuickJsPayloadDir = layout.buildDirectory.dir(
    "generated/source/quickJsPayload/java"
)

android {
    namespace = "dev.jason.gboardpatches.extension"

    buildFeatures {
        buildConfig = true
    }

    defaultConfig {
        buildConfigField("String", "PATCH_AUTHOR", "\"jasonwu1994\"")
        buildConfigField("String", "PATCH_AUTHOR_URL", "\"https://github.com/jasonwu1994\"")
        buildConfigField(
            "String",
            "PATCH_REPOSITORY_URL",
            "\"https://github.com/jasonwu1994/Gboard-patches\""
        )
        buildConfigField("String", "PATCH_VERSION", "\"${project.version}\"")
    }

    sourceSets.named("main") {
        java.srcDir(generatedQuickJsPayloadDir.get().asFile)
    }
}

dependencies {
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.robolectric:robolectric:4.14.1")
}

val generateQuickJsNativePayload by tasks.registering {
    val payloadFile = quickJsPayloadSourceDir.file("libgboardpatches_quickjs.so")
    val outputFile = generatedQuickJsPayloadDir.map { directory ->
        directory.file(
            "dev/jason/gboardpatches/extension/toprowswipe/quickjs/QuickJsNgNativePayload.java"
        )
    }

    inputs.file(payloadFile)
    outputs.file(outputFile)

    doLast {
        val sourceFile = payloadFile.asFile
        if (!sourceFile.exists()) {
            throw GradleException("QuickJS payload not found: $sourceFile")
        }

        val bytes = sourceFile.readBytes()
        val sha256 = MessageDigest.getInstance("SHA-256")
            .digest(bytes)
            .joinToString("") { value -> "%02x".format(value) }
        val base64 = Base64.getEncoder().encodeToString(bytes)
        val chunkSize = 8192
        val chunks = buildList {
            var index = 0
            while (index < base64.length) {
                add(base64.substring(index, minOf(index + chunkSize, base64.length)))
                index += chunkSize
            }
        }

        val renderedChunks = chunks.joinToString(",\n") { chunk ->
            "            \"$chunk\""
        }
        val output = outputFile.get().asFile
        output.parentFile.mkdirs()
        output.writeText(
            """
            package dev.jason.gboardpatches.extension.toprowswipe.quickjs;

            public final class QuickJsNgNativePayload {
                private static final String ABI = "arm64-v8a";
                private static final String LIBRARY_NAME = "libgboardpatches_quickjs.so";
                private static final String SHA256 = "$sha256";
                private static final String[] BASE64_CHUNKS = new String[] {
$renderedChunks
                };

                private QuickJsNgNativePayload() {
                }

                public static String abi() {
                    return ABI;
                }

                public static String libraryName() {
                    return LIBRARY_NAME;
                }

                public static String sha256() {
                    return SHA256;
                }

                public static String base64() {
                    StringBuilder builder = new StringBuilder();
                    for (String chunk : BASE64_CHUNKS) {
                        builder.append(chunk);
                    }
                    return builder.toString();
                }
            }
            """.trimIndent()
        )
    }
}

tasks.named("preBuild") {
    dependsOn(generateQuickJsNativePayload)
}
