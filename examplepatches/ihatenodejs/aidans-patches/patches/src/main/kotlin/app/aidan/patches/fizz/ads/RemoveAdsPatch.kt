package app.aidan.patches.fizz.ads

import app.aidan.patches.fizz.shared.COMPATIBILITY_FIZZ
import app.aidan.patches.fizz.shared.fizzTargets
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val HOME_FEED_VIEW_MODEL = "Lcom/fizzsocial/fizz/ui/feed/HomeFeedViewModel;"
private const val FEED_FILTER_BRIDGE = "Lapp/aidan/extension/fizz/FeedFilterBridge;"

/**
 * Feed state types used by the ad filter injection. The view model is stable, but the
 * per-tab page state is an obfuscated data class that is renamed on every release.
 *
 * [displayItemsMethod] maps a page state to a new page state, reads the old display items from
 * [pageStateClass]`.l` and compares them with the freshly built list before emitting.
 */
private data class FeedTargets(
    val displayItemsMethod: String,
    val viewStateClass: String,
    val pageStateClass: String,
)

private val FEED_TARGETS_1_54_0 = FeedTargets(
    displayItemsMethod = "l0",
    viewStateClass = "Ltd/j4;",
    pageStateClass = "Ltd/f0;",
)

private val FEED_TARGETS_1_72_0 = FeedTargets(
    displayItemsMethod = "u0",
    viewStateClass = "Lee/w8;",
    pageStateClass = "Lee/d2;",
)

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
        val targets = fizzTargets("1.54.0" to FEED_TARGETS_1_54_0, "1.72.0" to FEED_TARGETS_1_72_0)

        patchHomeFeedDisplayItems(
            targets = targets,
            removeMarketplace = removeMarketplaceAds.value != false
        )
    }
}

/**
 * Injects FeedFilterBridge.filterDisplayItems(items) into the feed state builder before the
 * freshly built display items are compared with the previous page state and stored in it.
 */
private fun BytecodePatchContext.patchHomeFeedDisplayItems(removeMarketplace: Boolean, targets: FeedTargets) {
    val hvmClass = mutableClassDefByOrNull(HOME_FEED_VIEW_MODEL)
        ?: throw PatchException("Class $HOME_FEED_VIEW_MODEL not found")

    val pageStateClass = mutableClassDefByOrNull(targets.pageStateClass)
        ?: throw PatchException("Class ${targets.pageStateClass} not found")

    val builderMethod = hvmClass.methods.firstOrNull {
        it.name == targets.displayItemsMethod &&
            it.parameterTypes.map(CharSequence::toString) == listOf(targets.viewStateClass) &&
            it.returnType == targets.viewStateClass &&
            it.implementation != null
    } ?: throw PatchException(
        "Method $HOME_FEED_VIEW_MODEL->${targets.displayItemsMethod}" +
            "(${targets.viewStateClass})${targets.viewStateClass} not found"
    )

    val instructions = builderMethod.implementation?.instructions
        ?: throw PatchException(
            "Missing instructions in $HOME_FEED_VIEW_MODEL->${targets.displayItemsMethod}"
        )

    // Anchor: the previous page state's display items, read once before the difference check.
    val previousItemsIndex = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.IGET_OBJECT &&
            (instruction as? ReferenceInstruction)?.reference?.let { ref ->
                (ref as? FieldReference)?.let { field ->
                    field.name == "l" && field.definingClass == targets.pageStateClass
                } == true
            } == true
    }
    if (previousItemsIndex < 0) {
        throw PatchException(
            "Anchor IGET_OBJECT ${targets.pageStateClass}->l not found in " +
                "$HOME_FEED_VIEW_MODEL->${targets.displayItemsMethod}"
        )
    }

    val previousItemsRegister = (instructions[previousItemsIndex] as TwoRegisterInstruction).registerA

    // The difference check compares the freshly built list (receiver) with the previous list
    // (argument). Filtering the receiver covers both the comparison and the stored value.
    val equalsIndex = instructions.drop(previousItemsIndex).indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_VIRTUAL &&
            (instruction as? FiveRegisterInstruction)?.registerD == previousItemsRegister
    }
    if (equalsIndex < 0) {
        throw PatchException(
            "Display items comparison not found after IGET_OBJECT ${targets.pageStateClass}->l in " +
                "$HOME_FEED_VIEW_MODEL->${targets.displayItemsMethod}"
        )
    }

    val targetIndex = previousItemsIndex + equalsIndex
    val equalsInsn = instructions[targetIndex] as? FiveRegisterInstruction
        ?: throw PatchException(
            "Display items comparison at index $targetIndex in " +
                "$HOME_FEED_VIEW_MODEL->${targets.displayItemsMethod} is not a five-register instruction"
        )
    val listReg = equalsInsn.registerC
    if (listReg > 0xF) {
        throw PatchException(
            "Display items register v$listReg exceeds the 4-bit operand range of the injected " +
                "invoke-static in $HOME_FEED_VIEW_MODEL->${targets.displayItemsMethod}"
        )
    }

    val filterMethod = if (removeMarketplace) "filterDisplayItems" else "filterAdsOnly"
    val smali = """
        invoke-static {v$listReg}, $FEED_FILTER_BRIDGE->$filterMethod(Ljava/util/List;)Ljava/util/List;
        move-result-object v$listReg
    """.trimIndent()

    builderMethod.addInstructions(targetIndex, smali)

    // Guard the contract the injection depends on: the filtered list is what the builder hands
    // to the page state copy, so no unfiltered state can be emitted.
    val stateCopyFound = instructions.drop(targetIndex).any { instruction ->
        (instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE) &&
            (instruction as? ReferenceInstruction)?.reference?.let { ref ->
                (ref as? MethodReference)?.let { method ->
                    method.definingClass == targets.pageStateClass &&
                        method.returnType == targets.pageStateClass
                } == true
            } == true
    }
    if (!stateCopyFound) {
        throw PatchException(
            "Page state copy ${targets.pageStateClass}-><copy> not found after the display items " +
                "comparison in $HOME_FEED_VIEW_MODEL->${targets.displayItemsMethod}"
        )
    }

    check(pageStateClass != hvmClass)
}
