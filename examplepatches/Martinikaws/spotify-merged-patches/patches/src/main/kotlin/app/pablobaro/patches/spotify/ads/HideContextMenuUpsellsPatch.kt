package app.pablobaro.patches.spotify.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.pablobaro.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import app.pablobaro.patches.shared.EXTENSION
import app.pablobaro.patches.shared.EXTENSION_PACKAGE
import app.pablobaro.patches.shared.parameterRegister
import app.pablobaro.patches.spotify.ContextMenuViewModelConstructorFingerprint
import app.pablobaro.patches.spotify.ContextMenuViewModelToStringFingerprint
import app.pablobaro.patches.spotify.GetViewModelFingerprint

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/spotify/HideContextMenuUpsellsPatch;"

@Suppress("unused")
val hideContextMenuUpsellsPatch = bytecodePatch(
    name = "Hide context menu upsells",
    description = "Removes \"Premium\" entries from the context menus of songs, albums and playlists. (Only works on older Spotify versions.)",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    extendWith(EXTENSION)

    finalize {
        // Runs in finalize, after every Spicetify patch has executed: those verify Spotify's
        // classes against pinned hashes, which must see the classes before this patch edits them.
        // The item view model is ViewModel(available, enabled, isPremiumUpsell, ...).
        // isPremiumUpsell is the second boolean field in dex order.
        // On Spotify 9.1.80 getViewModel is obfuscated and the fingerprint does not match.
        // The extension then finds the view model and the field by reflection at runtime.
        val viewModelType = try {
            GetViewModelFingerprint.originalMethod.returnType
        } catch (_: PatchException) {
            null
        }
        if (viewModelType != null) {
            val isPremiumUpsell = classDefBy(viewModelType).fields.filter { it.type == "Z" }.getOrNull(1)
                ?: throw PatchException("Could not find the isPremiumUpsell field in $viewModelType")

            mutableClassDefBy(EXTENSION_CLASS).methods.single { it.name == "isPremiumUpsell" }.apply {
                removeInstructions(instructions.size)
                addInstructions(
                    0,
                    """
                        check-cast p0, $viewModelType
                        iget-boolean p0, p0, $viewModelType->${isPremiumUpsell.name}:Z
                        return p0
                    """,
                )
            }
        }

        val contextMenuViewModel = ContextMenuViewModelToStringFingerprint.classDefOrNull
            ?: ContextMenuViewModelConstructorFingerprint.classDef

        val constructors = contextMenuViewModel.methods.filter { method ->
            method.name == "<init>" && method.implementation != null &&
                method.parameterTypes.any { it.toString() == "Ljava/util/List;" }
        }
        if (constructors.isEmpty()) throw PatchException("Could not find the context menu view model constructor")

        constructors.forEach { constructor ->
            constructor.parameterTypes.forEachIndexed { index, type ->
                if (type.toString() != "Ljava/util/List;") return@forEachIndexed
                val register = constructor.parameterRegister(index)
                constructor.addInstructions(
                    0,
                    """
                        invoke-static/range { v$register .. v$register }, $EXTENSION_CLASS->filterContextMenuItems(Ljava/util/List;)Ljava/util/List;
                        move-result-object v$register
                    """,
                )
            }
        }
    }
}
