package app.ratbanana.patches.gaminghub.home

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.ratbanana.patches.gaminghub.shared.Constants.COMPATIBILITY_GAMING_HUB
import app.ratbanana.patches.gaminghub.shared.Constants.EXTENSION_PACKAGE
import app.ratbanana.patches.gaminghub.shared.requireFreeRegistersAtEntry

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/HomeRowFilter;"

/** Registers the injected code needs: the row title and the hidden titles. */
private const val REQUIRED_FREE_REGISTERS = 2

/**
 * Creates a patch that removes a server-driven row from the home feed by its title.
 *
 * @param name Patch name shown in Morphe.
 * @param description Patch description shown in Morphe.
 * @param defaultTitles Title of the row as the server sends it in English.
 */
internal fun hideHomeRowPatch(
    name: String,
    description: String,
    defaultTitles: String,
): BytecodePatch = bytecodePatch(
    name = name,
    description = description,
    default = true,
) {
    compatibleWith(COMPATIBILITY_GAMING_HUB)

    extendWith("extensions/extension.mpe")

    val rowTitles by stringOption(
        key = "rowTitles",
        default = defaultTitles,
        title = "Row titles",
        description = "Title of the row to hide, as shown in the app. " +
            "Separate alternative titles (for example other languages) with '|'.",
        required = true,
    ) { titles -> !titles.isNullOrBlank() }

    execute {
        val hiddenTitles = rowTitles!!.toSmaliStringLiteral()

        val slotClass = classDefByOrNull(SLOT_CLASS)
            ?: throw PatchException("Home feed slot class $SLOT_CLASS not found")
        if (slotClass.methods.none { it.name == SLOT_TITLE_GETTER && it.parameterTypes.isEmpty() }) {
            throw PatchException("Home feed slot title getter $SLOT_TITLE_GETTER not found")
        }

        CardInfoFactoryFingerprint.method.apply {
            requireFreeRegistersAtEntry(REQUIRED_FREE_REGISTERS)

            addInstructionsWithLabels(
                0,
                """
                    invoke-virtual { p1 }, $SLOT_CLASS->$SLOT_TITLE_GETTER()Ljava/lang/String;
                    move-result-object v0
                    const-string v1, "$hiddenTitles"
                    invoke-static { v0, v1 }, $EXTENSION_CLASS->shouldHideRow(Ljava/lang/String;Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :show_row
                    const/4 v0, 0x0
                    return-object v0
                    :show_row
                    nop
                """,
            )
        }
    }
}

/** Escapes a value so it can be embedded in a smali `const-string` literal. */
private fun String.toSmaliStringLiteral(): String = buildString {
    for (character in this@toSmaliStringLiteral) {
        when (character) {
            '\\' -> append("\\\\")
            '"' -> append("\\\"")
            '\n' -> append("\\n")
            '\r' -> append("\\r")
            '\t' -> append("\\t")
            else -> append(character)
        }
    }
}
