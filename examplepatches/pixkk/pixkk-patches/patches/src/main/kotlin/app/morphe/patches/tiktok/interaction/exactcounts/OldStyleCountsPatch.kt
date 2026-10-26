/*
 * Copyright 2026 pixkk
 */
package app.morphe.patches.tiktok.interaction.exactcounts

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.util.addInstructionsWithLabels

private const val WHAT = "Old-style counts"
private const val EXTENSION = "Lapp/pixkk/extension/feed/OldStyleCounts;"

@Suppress("unused")
val oldStyleCountsPatch = bytecodePatch(
    name = WHAT,
    description = "Writes long like, comment and other counts as 12.3K and 1.2M in every language, " +
        "not with the language's own word for thousand. It can be turned off in " +
        "the Pixkk Patches settings.",
) {
    category("Feed")
    dependsOn(sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        // TikTok's count formatters.
        val formatters = CountFormatterFingerprint.matchAll() + CompactCountFormatterFingerprint.matchAll()
        if (formatters.size < COUNT_FORMATTERS.first + COMPACT_COUNT_FORMATTERS.first) {
            throw PatchException("$WHAT: only ${formatters.size} count formatters found")
        }
        formatters.forEach { match ->
            val method = match.method
            // p0 and p1 hold the long. v0 is a local the method writes before it reads.
            method.addInstructionsWithLabels(
                0,
                """
                    invoke-static {p0, p1}, $EXTENSION->format(J)Ljava/lang/String;
                    move-result-object v0
                    if-eqz v0, :tiktok
                    return-object v0
                """,
                ExternalLabel("tiktok", method.getInstruction(0)),
            )
        }
    }
}
