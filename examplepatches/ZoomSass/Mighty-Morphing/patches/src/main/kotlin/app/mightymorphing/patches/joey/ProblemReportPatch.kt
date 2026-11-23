package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.insertAt
import app.mightymorphing.patches.shared.writeBody
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch

private const val REPORT = "Lapp/mightymorphing/extension/joey/ProblemReport;"

/**
 * No name, so it is not listed in Morphe. Pulled in by every patch that adds Morphe Settings,
 * so "Report a problem" is there with or without Modern UI.
 * Records crashes from app start (class and method lines only) and stamps the bundle version.
 */
internal val problemReportPatch = bytecodePatch {
    compatibleWith(JOEY)

    extendWith("extensions/extension.mpe")

    execute {
        Fingerprint(
            definingClass = "Lo/o/joey/MyApplication;",
            name = "onCreate",
            returnType = "V",
            parameters = listOf(),
        ).method.insertAt(
            0,
            """
            invoke-static {p0}, $REPORT->install(Landroid/content/Context;)V
            """,
        )

        // Gradle fills this file with the version the bundle is built as (-Pversion).
        val stamped = Class.forName("app.mightymorphing.patches.joey.ProblemReportPatchKt").classLoader
            ?.getResourceAsStream("bundle-version.txt")?.bufferedReader()?.readText()?.trim()
        val version = stamped?.takeIf { it.isNotEmpty() && !it.contains("$") && !it.contains("\"") } ?: "unknown"
        writeBody(
            Fingerprint(
                definingClass = REPORT,
                name = "bundleVersion",
                returnType = "Ljava/lang/String;",
                parameters = listOf(),
            ).method,
            1,
            """
            const-string v0, "$version"
            return-object v0
            """,
        )
    }
}
