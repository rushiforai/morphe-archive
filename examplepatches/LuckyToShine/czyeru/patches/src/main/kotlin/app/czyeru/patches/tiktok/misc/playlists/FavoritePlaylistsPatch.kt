package app.czyeru.patches.tiktok.misc.playlists

import app.czyeru.patches.shared.compat.AppCompatibilities
import app.czyeru.patches.tiktok.misc.extension.sharedExtensionPatch
import app.czyeru.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/czyeru/extension/tiktok/playlists/FavoritePlaylistsPatch;"

private const val SETTINGS_STATUS_DESCRIPTOR =
    "Lapp/czyeru/extension/tiktok/settings/SettingsStatus;"

/**
 * Calls the extension at the start of the favorite playlists adapter bind and of the
 * list's onViewCreated. Both patches share these hooks, so they are added once.
 */
private val favoritePlaylistsHooksPatch = bytecodePatch {
    dependsOn(sharedExtensionPatch)

    execute {
        CollectionListViewCreatedFingerprint.method.addInstruction(
            0,
            "invoke-static/range {p1 .. p1}, $EXTENSION_CLASS_DESCRIPTOR->" +
                "onListViewCreated(Landroid/view/View;)V",
        )

        CollectionListBindViewHolderFingerprint.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p2}, $EXTENSION_CLASS_DESCRIPTOR->" +
                "onBindCell(Ljava/lang/Object;Ljava/lang/Object;I)V",
        )
    }
}

@Suppress("unused")
val favoritePlaylistGridPatch = bytecodePatch(
    name = "Favorite playlists grid",
    description = "Adds an option to show favorite playlists in a 3-column 8pt grid " +
        "with square covers and the title and video count below.",
    default = true,
) {
    dependsOn(favoritePlaylistsHooksPatch)

    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, $SETTINGS_STATUS_DESCRIPTOR->enableFavoritePlaylistGrid()V",
        )

        // Span count: pass every return value through the extension.
        CollectionListSpanCountFingerprint.method.let { method ->
            val returnIndices = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN }
                .map { it.index }

            returnIndices.asReversed().forEach { returnIndex ->
                val register = method.getInstruction<OneRegisterInstruction>(returnIndex).registerA
                method.addInstructions(
                    returnIndex,
                    """
                        invoke-static {v$register}, $EXTENSION_CLASS_DESCRIPTOR->getSpanCount(I)I
                        move-result v$register
                    """,
                )
            }
        }

        // Cell type: when the grid is on, skip the personal-homepage row cell (full-width,
        // four thumbnails) and use the standard cover card cell.
        CollectionListCreateViewHolderFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()

            val cellIndices = instructions.withIndex()
                .filter { (_, instruction) ->
                    instruction.opcode == Opcode.NEW_INSTANCE &&
                        ((instruction as ReferenceInstruction).reference as TypeReference).type !=
                        "Ljava/lang/Exception;"
                }
                .map { it.index }
            if (cellIndices.size != 3) {
                throw PatchException(
                    "Favorite playlists grid: expected 3 view holder types, found ${cellIndices.size}.",
                )
            }
            val coverCardIndex = cellIndices.last()

            // First static call after the header branch is the personal-homepage experiment gate.
            val experimentGateIndex = instructions.withIndex().first { (index, instruction) ->
                index > cellIndices.first() && instruction.opcode == Opcode.INVOKE_STATIC
            }.index

            addInstructionsWithLabels(
                experimentGateIndex,
                """
                    invoke-static {}, $EXTENSION_CLASS_DESCRIPTOR->useCoverCardCell()Z
                    move-result v0
                    if-nez v0, :cover_card_cell
                """,
                ExternalLabel("cover_card_cell", getInstruction(coverCardIndex)),
            )
        }
    }
}

@Suppress("unused")
val favoritePlaylistSearchPatch = bytecodePatch(
    name = "Favorite playlists search V1",
    description = "Adds an option to show a search bar on the favorite playlists page " +
        "that instantly filters your playlists by name, " +
        "loading the remaining pages in the background while you search.",
    default = true,
) {
    dependsOn(favoritePlaylistsHooksPatch)

    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, $SETTINGS_STATUS_DESCRIPTOR->enableFavoritePlaylistSearch()V",
        )
    }
}
