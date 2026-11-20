import java.io.ByteArrayOutputStream
import java.util.Base64
import java.util.zip.Deflater

extension {
    name = "extensions/extension.mpe"
}

/*
 * The MobileConfig overrides payload is embedded at build time instead of
 * being shipped as an asset: the patcher merges only the extension's dex
 * into the target APK, so assets never reach the device.
 *
 * `config/mc_overrides.json` stays the canonical, validated source of
 * truth (see scripts/validate_config.py). It must be a single line —
 * Instagram's loader only reliably parses compact single-line JSON.
 *
 * The payload is deflated and base64-encoded before being embedded as a
 * BuildConfig string: a raw multi-parameter payload (the ad-removal set
 * has ~1400 entries) exceeds the JVM's 64 KiB string-constant limit.
 * MCOverrides inflates it at runtime.
 */
val mcOverridesFile = rootProject.file("config/mc_overrides.json")

android {
    namespace = "app.hemk651.meta.extension"

    buildFeatures {
        buildConfig = true
    }

    defaultConfig {
        val json = mcOverridesFile.readText().trim()
        require(json.isNotEmpty()) { "config/mc_overrides.json is empty" }
        require(!json.contains('\n') && !json.contains('\r')) {
            "config/mc_overrides.json must be a single line (Instagram's " +
                    "loader only reliably parses compact single-line JSON)"
        }

        val deflater = Deflater(Deflater.BEST_COMPRESSION, true)
        val payload = json.toByteArray(Charsets.UTF_8)
        deflater.setInput(payload)
        deflater.finish()
        val compressed = ByteArrayOutputStream()
        val buffer = ByteArray(8192)
        while (!deflater.finished()) {
            val n = deflater.deflate(buffer)
            if (n == 0) break
            compressed.write(buffer, 0, n)
        }
        deflater.end()
        val encoded = Base64.getEncoder().encodeToString(compressed.toByteArray())
        logger.lifecycle(
            "mc_overrides payload: {} bytes -> {} compressed+base64",
            payload.size, encoded.length
        )
        require(encoded.length <= 60000) {
            "compressed payload exceeds the string-constant limit; " +
                    "reduce the payload size"
        }

        buildConfigField(
            "String",
            "MC_OVERRIDES_JSON",
            "\"" + encoded.replace("\\", "\\\\").replace("\"", "\\\"") + "\""
        )

        // The menu shows this as the patch version (Build info, Misc, crash
        // reports). It comes from the Gradle project version, which is set to
        // the release version before the bundle is built for publishing, so
        // the menu always shows the version that is actually installed
        // instead of a stale constant.
        buildConfigField(
            "String",
            "PATCH_VERSION",
            "\"" + project.version.toString()
                .replace("\\", "\\\\").replace("\"", "\\\"") + "\""
        )
    }
}

// Re-generate BuildConfig whenever the canonical payload changes.
tasks.matching { it.name.startsWith("generate") && it.name.endsWith("BuildConfig") }
    .configureEach {
        inputs.file(mcOverridesFile)
    }
