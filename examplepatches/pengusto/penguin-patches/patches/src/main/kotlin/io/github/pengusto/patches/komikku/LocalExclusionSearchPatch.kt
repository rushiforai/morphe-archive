package io.github.pengusto.patches.komikku

import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import io.github.pengusto.patches.codeDigest

private const val library = "Leu/kanade/tachiyomi/ui/library/LibraryScreenModel;"

@Suppress("unused")
val localExclusionSearchPatch = bytecodePatch(
    name = "Keep local manga in exclusion searches",
    description = "Keep local manga when an excluded search term does not match. Matching titles, tags and remote source IDs are still excluded. Official GitHub Komikku 1.14.1 ARM64 APK tested.",
    default = false,
) {
    compatibleWith(Compatibility(name = "Komikku", packageName = "app.komikku",
        targets = listOf(AppTarget(version = "1.14.1"))))
    execute {
        check(classDefBy(library).codeDigest() ==
            "42526298b6fc3968a3a7821fb396d28e5c1aaa1a124e60e06e7ff67a1b483ab7") {
            "Unsupported or already patched Komikku library search. Use the original official GitHub 1.14.1 ARM64 APK."
        }
        val filter = mutableClassDefBy(library).methods.single { it.name == "filterManga" }
        val code = filter.implementation!!
        // A local source has no searchable numeric ID. Skip its equality test,
        // then continue every remaining exclusion predicate (never return early).
        // Replace in place: incoming branches must still land on this guard.
        // Inserting then deleting redirects those branches past the new guard.
        code.replaceInstruction(239, BuilderInstruction21t(Opcode.IF_EQZ, 5, code.newLabelForIndex(243)))
    }
}
