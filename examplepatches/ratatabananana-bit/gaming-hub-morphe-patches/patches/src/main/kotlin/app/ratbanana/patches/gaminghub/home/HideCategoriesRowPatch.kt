package app.ratbanana.patches.gaminghub.home

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.ratbanana.patches.gaminghub.shared.Constants.COMPATIBILITY_GAMING_HUB
import app.ratbanana.patches.gaminghub.shared.Constants.EXTENSION_PACKAGE
import app.ratbanana.patches.gaminghub.shared.requireFreeRegistersAtEntry

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/HomeRowFilter;"

/**
 * The categories row shows a built-in, localized header instead of the title the server sends,
 * so it is identified by its display type rather than by title.
 */
@Suppress("unused")
val hidePopularInstantPlaysCategoriesPatch = bytecodePatch(
    name = "Hide Popular Instant Plays categories",
    description = "Removes the \"Popular Instant Plays categories\" row from the home screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GAMING_HUB)

    extendWith("extensions/extension.mpe")

    execute {
        val slotClass = classDefByOrNull(SLOT_CLASS)
            ?: throw PatchException("Home feed slot class $SLOT_CLASS not found")
        val displayTypeGetter = slotClass.methods.firstOrNull {
            it.name == SLOT_DISPLAY_TYPE_GETTER && it.parameterTypes.isEmpty()
        } ?: throw PatchException("Home feed slot display type getter $SLOT_DISPLAY_TYPE_GETTER not found")

        CardInfoFactoryFingerprint.method.apply {
            requireFreeRegistersAtEntry(1)

            addInstructionsWithLabels(
                0,
                """
                    invoke-virtual { p1 }, $SLOT_CLASS->$SLOT_DISPLAY_TYPE_GETTER()${displayTypeGetter.returnType}
                    move-result-object v0
                    invoke-static { v0 }, $EXTENSION_CLASS->isCategoryListRow(Ljava/lang/Object;)Z
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
