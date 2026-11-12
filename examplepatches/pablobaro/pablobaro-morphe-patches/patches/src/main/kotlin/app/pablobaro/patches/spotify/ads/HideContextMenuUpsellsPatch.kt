package app.pablobaro.patches.spotify.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.pablobaro.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import app.pablobaro.patches.shared.EXTENSION
import app.pablobaro.patches.shared.EXTENSION_PACKAGE
import app.pablobaro.patches.shared.parameterRegister
import app.pablobaro.patches.spotify.ContextMenuViewModelConstructorFingerprint
import app.pablobaro.patches.spotify.ContextMenuViewModelToStringFingerprint
import app.pablobaro.patches.spotify.GetViewModelFingerprint
import app.pablobaro.patches.spotify.SignallingStorageKeyFingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/spotify/HideContextMenuUpsellsPatch;"

/**
 * Signal type of the "Premium" tag that is always shown next to an item.
 * The other types are hidden for premium users, so their items are real features for them.
 */
private const val PREMIUM_SIGNAL_TYPE = 1

@Suppress("unused")
val hideContextMenuUpsellsPatch = bytecodePatch(
    name = "Hide context menu upsells",
    description = "Removes \"Premium\" entries from the context menus of songs, albums and playlists.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    extendWith(EXTENSION)

    execute {
        val isPremiumUpsellCheck = signalIsPremiumUpsellCheck() ?: viewModelIsPremiumUpsellCheck()

        mutableClassDefBy(EXTENSION_CLASS).methods.single { it.name == "isPremiumUpsell" }.apply {
            removeInstructions(instructions.size)
            addInstructions(0, isPremiumUpsellCheck)
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

/**
 * Newer versions: ContextMenuItem(itemResId, ..., signal, ...), where the signal holds the type of the tag
 * ("Premium", "New", ...) shown next to the item. Premium upsells have the always shown "Premium" tag.
 *
 * @return The body of `isPremiumUpsell(Object item)`, or null if this is an older version.
 */
private fun BytecodePatchContext.signalIsPremiumUpsellCheck(): String? {
    val signalType = SignallingStorageKeyFingerprint.originalMethodOrNull?.parameterTypes?.first()?.toString()
        ?: return null
    // The constructor casts every item of the list to check for duplicate item ids.
    val itemType = ContextMenuViewModelConstructorFingerprint.originalMethodOrNull?.implementation?.instructions
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
 * Older versions: ContextMenuItem.getViewModel() returns ViewModel(available, enabled, isPremiumUpsell, ...).
 * isPremiumUpsell is the second boolean field in dex order.
 *
 * @return The body of `isPremiumUpsell(Object item)`.
 */
private fun BytecodePatchContext.viewModelIsPremiumUpsellCheck(): String {
    val getViewModel = GetViewModelFingerprint.originalMethod
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
