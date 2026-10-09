package app.aidan.patches.fizz.ads

import app.aidan.patches.fizz.shared.COMPATIBILITY_FIZZ
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val HOME_FEED_VIEW_MODEL = "Lcom/fizzsocial/fizz/ui/feed/HomeFeedViewModel;"
private const val FEED_FILTER_BRIDGE = "Lapp/aidan/extension/fizz/FeedFilterBridge;"
private const val FEED_PAGE_STATE_CLASS = "Ltd/f0;"

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove Ads",
    description = "Removes sponsored feed advertisements and optional marketplace listing advertisements from the feed.",
    default = true
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_FIZZ)
    extendWith("extensions/extension.mpe")

    val removeMarketplaceAds = booleanOption(
        key = "removeMarketplaceAds",
        default = true,
        title = "Remove Marketplace Ads",
        description = "Removes marketplace listing advertisements injected into the feed."
    )

    execute {
        patchHomeFeedDisplayItems(
            removeMarketplace = removeMarketplaceAds.value != false
        )
    }
}

/**
 * Injects FeedFilterBridge.filterDisplayItems(items) into
 * HomeFeedViewModel.l0 before displayItems is compared and assigned to FeedPageState.
 */
private fun BytecodePatchContext.patchHomeFeedDisplayItems(removeMarketplace: Boolean) {
    val hvmClass = mutableClassDefByOrNull(HOME_FEED_VIEW_MODEL)
        ?: throw PatchException("Class $HOME_FEED_VIEW_MODEL not found")

    val l0Method = hvmClass.methods.firstOrNull {
        it.name == "l0" && it.implementation != null
    } ?: throw PatchException("Method $HOME_FEED_VIEW_MODEL.l0 not found")

    val instructions = l0Method.implementation?.instructions
        ?: throw PatchException("Missing instructions in $HOME_FEED_VIEW_MODEL.l0")

    val f0DisplayItemsIndex = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.IGET_OBJECT &&
            (instruction as? ReferenceInstruction)?.reference?.let { ref ->
                (ref as? FieldReference)?.let { field ->
                    field.name == "l" && (field.definingClass == FEED_PAGE_STATE_CLASS || field.definingClass.endsWith("/f0;"))
                } == true
            } == true
    }
    if (f0DisplayItemsIndex < 0) {
        throw PatchException("Anchor IGET_OBJECT td.f0.l not found in $HOME_FEED_VIEW_MODEL.l0")
    }

    val equalsOffset = instructions.drop(f0DisplayItemsIndex).indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_VIRTUAL
    }
    val targetIndex = if (equalsOffset >= 0) f0DisplayItemsIndex + equalsOffset else f0DisplayItemsIndex + 1

    val equalsInsn = instructions[targetIndex]
    val listReg = (equalsInsn as? FiveRegisterInstruction)?.registerC ?: 6

    val filterMethod = if (removeMarketplace) "filterDisplayItems" else "filterAdsOnly"
    val smali = """
        invoke-static {v$listReg}, $FEED_FILTER_BRIDGE->$filterMethod(Ljava/util/List;)Ljava/util/List;
        move-result-object v$listReg
    """.trimIndent()

    l0Method.addInstructions(targetIndex, smali)
}
