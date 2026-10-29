package io.github.pengusto.patches.readyou

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.*
import io.github.pengusto.patches.codeDigest

private const val importer = "Lme/ash/reader/infrastructure/rss/OPMLDataSource;"
private const val outline = "Lbe/ceau/opml/entity/Outline;"

@Suppress("unused")
val nestedOpmlPatch = bytecodePatch(
    name = "Import nested OPML feeds",
    description = "Import feeds inside nested OPML folders into their outer group, preserving document order and feed settings. Official GitHub Read You 0.16.2 APK only.",
    default = false,
) {
    compatibleWith(Compatibility(name = "Read You", packageName = "me.ash.reader",
        targets = listOf(AppTarget(version = "0.16.2"))))
    extendWith("extensions/readyou.mpe")
    execute {
        mapOf(
            importer to "7adf132c0e0dc13796e79b3763291e26769f3c22e14138a023638554f092bbe6",
            outline to "9e17890594434fb0b2fa5311d30273eea3e98c730f63a4aa9c260f83f3516722",
        ).forEach { (type, expected) ->
            check(classDefBy(type).codeDigest() == expected) {
                "Unsupported or already patched Read You bytecode: $type. Use the original official GitHub 0.16.2 APK."
            }
        }
        val parse = mutableClassDefBy(importer).methods.single { it.name == "parseFileInputStream" }
        // The guarded method loads this outer outline's direct children into v2
        // at index 100. Replace only its iterator; the top-level iterator stays intact.
        parse.replaceInstruction(101,
            "invoke-static {v2}, Lio/github/pengusto/patches/extension/readyou/OpmlImport;->descendants(Ljava/util/List;)Ljava/util/Iterator;")
    }
}
