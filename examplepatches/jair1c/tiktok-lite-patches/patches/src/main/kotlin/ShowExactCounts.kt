package app.tiktoklitepatches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

@Suppress("unused")
val showExactCounts = bytecodePatch(
    name = "Show exact counts",
    description = "Adds an off-by-default switch in Mod settings to display full counts.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "TikTok Lite",
        packageName = "com.zhiliaoapp.musically.go",
        targets = listOf(tikTokLite4782Target),
    ))
    dependsOn(tikTokLiteExtension)

    execute {
        val settings = "Lapp/tiktoklitepatches/extension/ModSettings;"
        Fingerprint(
            definingClass = settings,
            name = "exactCountsAvailable",
            parameters = emptyList(),
            returnType = "Z",
        ).method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")

        // Adapt the compact-count formatter anchor from Kveld to the four 47.8.2 implementations.
        val formatters = Fingerprint(
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
            parameters = listOf("J"),
            returnType = "Ljava/lang/String;",
            strings = listOf("1.0M"),
        ).matchAll().map { it.method }

        check(formatters.size == 4) { "Expected four compact count formatters, found ${formatters.size}" }
        val localizedFormatter = Fingerprint(
            definingClass = "LX/JqU;",
            name = "L",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
            parameters = listOf("J"),
            returnType = "Ljava/lang/String;",
        ).method
        for (formatter in formatters + localizedFormatter) {
            formatter.addInstructionsWithLabels(
                0,
                """
                    invoke-static {}, $settings->exactCountsEnabled()Z
                    move-result v0
                    if-eqz v0, :original_counts
                    invoke-static/range {p0 .. p1}, Lapp/tiktoklitepatches/extension/ExactCounts;->format(J)Ljava/lang/String;
                    move-result-object v0
                    return-object v0
                    :original_counts
                    nop
                """.trimIndent(),
            )
        }
    }
}
