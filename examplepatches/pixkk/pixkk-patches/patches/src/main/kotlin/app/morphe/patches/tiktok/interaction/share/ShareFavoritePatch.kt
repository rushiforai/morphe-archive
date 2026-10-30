/*
 * Copyright 2026 pixkk
 */
package app.morphe.patches.tiktok.interaction.share

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.shared.bakeDefault
import app.morphe.util.addInstruction
import app.morphe.util.addInstructionsWithLabels
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val EXTENSION = "Lapp/pixkk/extension/share/ShareFavorite;"
private const val FAVORITE_ACTION = "LX/0zZk;"

/**
 * The method of the share menu's builder that adds the "Add to favorites" button. It leaves the
 * button out for an account a server flag has not turned it on for.
 */
internal object FavoriteGateFingerprint : Fingerprint(
    definingClass = "LX/0FyQ;",
    name = "LJIIZILJ",
    returnType = "V",
    parameters = emptyList(),
)

/** The share menu's model: it holds the bottom row's buttons as a list once the menu is made. */
internal object SharePanelModelFingerprint : Fingerprint(
    definingClass = "LX/0G4Y;",
    name = "<init>",
    returnType = "V",
)

@Suppress("unused")
val shareFavoritePatch = bytecodePatch(
    name = "Favorites button in share menu",
    description = "Puts the Add to favorites button into the share menu's bottom row, in the place " +
        "you choose. The place is set in the Pixkk Patches settings.",
) {
    category("Interface")
    compatibleWith(*AppCompatibilities.tiktok())
    dependsOn(sharedExtensionPatch)

    val place by intOption(
        key = "place",
        default = 3,
        title = "Button place",
        description = "Where the button goes in the bottom row, counted from the left from 1 " +
            "(Report is 1). A place past the last button puts it last; 0 leaves it out. A patched " +
            "app starts with it until it is changed on the settings page.",
    )

    execute {
        bakeDefault("shareFavoritePosition", (place ?: 3).coerceIn(0, 20))

        // The builder adds the button through a chain of checks. When the button is wanted the
        // method jumps over them to the point where the button is made.
        FavoriteGateFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val made = instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.NEW_INSTANCE &&
                    instruction.getReference<TypeReference>()?.type == FAVORITE_ACTION
            }
            if (made < 1) throw PatchException("Favorites button in share menu: the builder no longer makes the button")
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION->wanted()Z
                    move-result v0
                    if-eqz v0, :checks
                    goto :make
                """,
                ExternalLabel("checks", getInstruction(0)),
                ExternalLabel("make", getInstruction(made - 1)),
            )
        }

        // Once the menu's row is made the button is moved to its place.
        SharePanelModelFingerprint.method.apply {
            val returns = implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
            if (returns.isEmpty()) throw PatchException("Favorites button in share menu: the model's constructor never returns")
            for (index in returns.reversed()) {
                addInstruction(index, "invoke-static { p0 }, $EXTENSION->arrange(Ljava/lang/Object;)V")
            }
        }
    }
}
