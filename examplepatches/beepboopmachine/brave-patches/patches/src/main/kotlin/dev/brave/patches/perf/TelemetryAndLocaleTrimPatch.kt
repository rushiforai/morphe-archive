package dev.brave.patches.perf

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.deleteResource
import app.morphe.patcher.patch.listApkEntries
import app.morphe.patcher.patch.patch
import dev.brave.patches.shared.COMPATIBILITY_BRAVE

internal object P3aSerializationFingerprint : Fingerprint(
    definingClass = "Lp3a;",
    name = "a",
    returnType = "V",
    parameters = listOf("Lmt6;")
)

internal object UmaSessionStatsTwoParamFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/metrics/UmaSessionStats;",
    name = "changeMetricsReportingConsent",
    returnType = "V",
    parameters = listOf("Z", "Z")
)

internal object UmaSessionStatsSingleParamFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/metrics/UmaSessionStats;",
    name = "changeMetricsReportingConsent",
    returnType = "V",
    parameters = listOf("Z")
)

// Android locale qualifiers in res/values-* start with either:
//   - a 2-letter ISO 639-1 language code (e.g. values-fr, values-zh-rCN, values-es-v31)
//   - a BCP-47 tag prefixed with "b+" (e.g. values-b+sr+Latn, values-b+es+419)
// No non-locale Android configuration qualifier is a bare 2-letter lowercase segment or "b+*".
private val ISO_2_LOCALE_SEGMENT = Regex("^[a-z]{2}$")

private fun isNonEnglishLocaleValuesDir(dirName: String): Boolean {
    if (!dirName.startsWith("values-")) return false
    val qualifierPart = dirName.removePrefix("values-")
    if (qualifierPart.isEmpty()) return false
    val firstSegment = qualifierPart.substringBefore('-')

    if (firstSegment.startsWith("b+")) {
        return firstSegment != "b+en" && !firstSegment.startsWith("b+en+")
    }
    if (ISO_2_LOCALE_SEGMENT.matches(firstSegment)) {
        return firstSegment != "en"
    }
    return false
}

@Suppress("unused")
val telemetryAndLocaleTrimPatch = patch(
    name = "Telemetry & Locale Trim",
    description = "Disables P3A telemetry serialization, metrics reporting consent, and prunes unused locale resources."
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    execute {
        // 1. Prepend return-void to Lp3a;->a(Lmt6;)V to neutralize P3A serialization
        P3aSerializationFingerprint.method.apply {
            addInstructions(0, "return-void")
        }

        // 2. Force changeMetricsReportingConsent parameters to false (supports both (ZZ)V and upstream (Z)V)
        UmaSessionStatsTwoParamFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    const/4 p0, 0x0
                    const/4 p1, 0x0
                """.trimIndent()
            )
        }
        UmaSessionStatsSingleParamFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                "const/4 p0, 0x0"
            )
        }

        // 3. Prune strictly non-English locale resource directories while preserving all non-locale
        // Android configuration qualifiers (values-v*, values-night*, values-sw*, values-w*, values-h*, etc.)
        listApkEntries("res/values-").forEach { entry ->
            val parts = entry.removePrefix("res/").split("/")
            val dirName = parts.firstOrNull() ?: return@forEach
            if (isNonEnglishLocaleValuesDir(dirName)) {
                deleteResource(entry)
            }
        }

        // 4. Prune large non-English Chromium locale .pak files (preserving lang_en, fallback-locales, and tiny gender variants)
        listApkEntries("assets/locales#lang_").forEach { entry ->
            if (entry.startsWith("assets/locales#lang_en/")) return@forEach
            if (entry.endsWith("_FEMININE.pak") || entry.endsWith("_MASCULINE.pak") || entry.endsWith("_NEUTER.pak")) {
                return@forEach
            }
            if (entry.endsWith(".pak")) {
                deleteResource(entry)
            }
        }
    }
}
