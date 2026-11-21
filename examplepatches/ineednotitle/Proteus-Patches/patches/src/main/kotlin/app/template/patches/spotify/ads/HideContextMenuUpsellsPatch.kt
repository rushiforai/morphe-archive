package app.template.patches.spotify.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.SPOTIFY_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.template.patches.spotify.shared.ContextMenuViewModelConstructorFingerprint
import app.template.patches.spotify.shared.ContextMenuViewModelToStringFingerprint
import app.template.patches.spotify.shared.GetViewModelFingerprint
import app.template.patches.spotify.shared.SignallingStorageKeyFingerprint
import app.template.patches.spotify.shared.parameterRegister
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val EXTENSION_CLASS =
    "Lapp/template/extension/extension/SpotifyContextMenuFilter;"

/**
 * Signal type of the "Premium" tag that is always shown next to an item. The
 * other signal types are hidden for premium users, so their items are real
 * features for those users and must be kept.
 */
private const val PREMIUM_SIGNAL_TYPE = 1

// Removes "Premium" entries from the context menus of songs, albums and
// playlists.
//
// The context menu items are filtered at the ContextMenuViewModel constructor:
// every List parameter is passed through the extension, which drops items that
// are premium upsells. How an item is identified as an upsell depends on the
// app version and is resolved at patch time; the resulting check is written
// into the extension's isPremiumUpsell stub:
//   • Newer versions: items carry a signalling tag ("Premium", "New", ...);
//     upsells are exactly the items whose signal type is the always-visible
//     Premium tag.
//   • Older versions: items expose a view model with an isPremiumUpsell flag.
//
// Fail-safe: items that cannot be classified are kept; the filter returns the
// original list when nothing was removed; a view model shape that matches
// neither strategy fails the patch loudly at patch time.

@Suppress("unused")
val spotifyHideContextMenuUpsellsPatch = bytecodePatch(
    name = "Hide context menu upsells",
    description = "Removes \"Premium\" entries from the context menus of songs, albums and playlists.",
    default = false,
) {
    compatibleWith(SPOTIFY_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        val isPremiumUpsellCheck = signalIsPremiumUpsellCheck() ?: viewModelIsPremiumUpsellCheck()

        mutableClassDefBy(EXTENSION_CLASS).methods.single { it.name == "isPremiumUpsell" }.apply {
            clearBody()
            addInstructions(0, isPremiumUpsellCheck)
        }

        val contextMenuViewModel = ContextMenuViewModelToStringFingerprint.matchAllOrNull()?.firstOrNull()?.classDef
            ?: ContextMenuViewModelConstructorFingerprint.matchAllOrNull()?.firstOrNull()?.classDef
            ?: throw PatchException("Could not find the context menu view model")

        val constructors = mutableClassDefBy(contextMenuViewModel).methods.filter { method ->
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

/**
 * Newer versions: ContextMenuItem(itemResId, ..., signal, ...), where the
 * signal holds the type of the tag ("Premium", "New", ...) shown next to the
 * item. Premium upsells carry the always-shown "Premium" tag.
 *
 * @return The body of `isPremiumUpsell(Object item)`, or null if this is an
 * older version without signalling tags.
 */
private fun BytecodePatchContext.signalIsPremiumUpsellCheck(): String? {
    val signalType = SignallingStorageKeyFingerprint.matchAllOrNull()?.firstOrNull()?.method
        ?.parameterTypes?.first()?.toString() ?: return null
    // The constructor casts every item of the list to check for duplicate item
    // ids; that cast reveals the item type.
    val itemType = ContextMenuViewModelConstructorFingerprint.matchAllOrNull()?.firstOrNull()?.method
        ?.implementation?.instructions
        ?.firstOrNull { it.opcode == Opcode.CHECK_CAST }
        ?.let { ((it as ReferenceInstruction).reference as TypeReference).type }
        ?: return null
    val item = classDefBy(itemType)

    val getSignal = item.methods.firstOrNull { method ->
        method.returnType == signalType && method.parameterTypes.isEmpty() && method.implementation != null &&
            !AccessFlags.STATIC.isSet(method.accessFlags)
    }?.let { "${invokeOpcode(item)} { p0 }, $itemType->${it.name}()$signalType\nmove-result-object p0" }
        ?: item.fields.firstOrNull { it.type == signalType && !AccessFlags.STATIC.isSet(it.accessFlags) }
            ?.let { "iget-object p0, p0, $itemType->${it.name}:$signalType" }
        ?: return null

    val typeField = classDefBy(signalType).fields
        .filter { it.type == "I" && !AccessFlags.STATIC.isSet(it.accessFlags) }
        .singleOrNull()
        ?: throw PatchException("Could not find the type field of the signal $signalType")

    return """
        check-cast p0, $itemType
        $getSignal
        if-eqz p0, :not_upsell
        iget p0, p0, $signalType->${typeField.name}:I
        add-int/lit8 p0, p0, -$PREMIUM_SIGNAL_TYPE
        if-nez p0, :not_upsell
        const/4 p0, 0x1
        return p0
        :not_upsell
        const/4 p0, 0x0
        return p0
    """
}

/**
 * Older versions: ContextMenuItem.getViewModel() returns
 * ViewModel(available, enabled, isPremiumUpsell, ...), where isPremiumUpsell
 * is the second boolean field in dex order.
 *
 * @return The body of `isPremiumUpsell(Object item)`.
 */
private fun BytecodePatchContext.viewModelIsPremiumUpsellCheck(): String {
    val getViewModel = GetViewModelFingerprint.matchAllOrNull()?.firstOrNull()?.method
        ?: throw PatchException("Could not find the context menu item getViewModel method")
    val itemType = getViewModel.definingClass
    val viewModelType = getViewModel.returnType
    val isPremiumUpsell = classDefBy(viewModelType).fields.filter { it.type == "Z" }.getOrNull(1)
        ?: throw PatchException("Could not find the isPremiumUpsell field in $viewModelType")

    return """
        check-cast p0, $itemType
        ${invokeOpcode(classDefBy(itemType))} { p0 }, $itemType->${getViewModel.name}()$viewModelType
        move-result-object p0
        if-eqz p0, :not_upsell
        iget-boolean p0, p0, $viewModelType->${isPremiumUpsell.name}:Z
        return p0
        :not_upsell
        const/4 p0, 0x0
        return p0
    """
}

private fun invokeOpcode(classDef: ClassDef) =
    if (AccessFlags.INTERFACE.isSet(classDef.accessFlags)) "invoke-interface" else "invoke-virtual"
