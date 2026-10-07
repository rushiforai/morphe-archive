package app.template.patches.walmart

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/template/extension/extension/WalmartRouteMyList;"

val walmartCompatibility = Compatibility(
    name = "Walmart",
    packageName = "com.walmart.android",
    appIconColor = 0x0071CE,
    // Must match the file type on APKMirror (walmart-shopping-savings-26-38-android-apk-download),
    // otherwise Morphe Manager won't send the user there.
    apkFileType = ApkFileType.APK,
    targets = listOf(
        AppTarget(version = "26.38"),
    ),
)

// Hook ChecklistFragment.onViewCreated to inject the map icon next to "Reset checklist"
object ChecklistFragmentViewCreatedFingerprint : Fingerprint(
    definingClass = "Lcom/walmart/glass/lists/view/lists/ChecklistFragment;",
    name = "onViewCreated",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

// Route My List's native fragment owns both the real shelf-label capability check and its
// timer/cooldown state. Hook it after its layout is created so the extension can ask that
// state machine to render, then present the native action as a compact affordance.
// In Route My List's ViewModel (j), Walmart hardcoded ESL flashing so that only the very
// first item on the route (loop index == 0, isFirstItem) has showFlash set to true. For all
// subsequent items (index > 0), showFlash is forced to false. Nop-ing the if-nez check right
// before the shop-to-light Ee() call makes isFirstItem evaluate to true for every item in the
// route so any stop with an ESL tag can flash.
object RouteMyListViewModelMeFingerprint : Fingerprint(
    definingClass = "Lcom/walmart/glass/instoremaps/viewmodel/j;",
    name = "Me",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
)

object NativeRouteMyListViewCreatedFingerprint : Fingerprint(
    definingClass = "Lcom/walmart/glass/instoremaps/view/InStoreMapsMultiItemLocatorFragment;",
    name = "onViewCreated",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

// d0 is the native carousel callback. Its checkbox handler (d) mutates the view model synchronously;
// adding our callback immediately after it lets the extension advance only after that mutation.
object NativeRouteMyListCheckboxFingerprint : Fingerprint(
    definingClass = "Lcom/walmart/glass/instoremaps/view/d0;",
    name = "d",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Lcom/walmart/glass/instoremaps/model/c;", "Landroid/view/View;"),
)

// d0.g is the "Add back to list" callback when an item is uncompleted in the map carousel.
object NativeRouteMyListAddBackFingerprint : Fingerprint(
    definingClass = "Lcom/walmart/glass/instoremaps/view/d0;",
    name = "g",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Lcom/walmart/glass/instoremaps/model/c;", "Landroid/view/View;"),
)

// W is the Function2<ItemCarouselItem, ItemCarouselItem, Unit> installed via
// itemCarouselView.setOnItemFocused(new W(this)) in InStoreMapsMultiItemLocatorFragment.
object ItemCarouselFocusChangedFingerprint : Fingerprint(
    definingClass = "Lcom/walmart/glass/instoremaps/view/W;",
    name = "invoke",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
)

val routeMyListPatch = bytecodePatch(
    name = "Route My List",
    description = "Adds a 'Plan my route' map icon to the Walmart 'Shop in-store' checklist screen that opens " +
        "Walmart's own in-store map with every list item's aisle pinned at once.",
    default = true,
) {
    compatibleWith(walmartCompatibility)

    extendWith("extensions/extension.mpe")

    execute {
        val checklistMethod = ChecklistFragmentViewCreatedFingerprint.method
        checklistMethod.addInstructions(
            1,
            "invoke-static/range {p0 .. p1}, $EXTENSION_CLASS->onChecklistFragmentViewCreated(Ljava/lang/Object;Landroid/view/View;)V",
        )

        val nativeRouteMethod = NativeRouteMyListViewCreatedFingerprint.method
        nativeRouteMethod.addInstructions(
            nativeRouteMethod.instructions.size - 1,
            "invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->onNativeRouteMyListViewCreated(Ljava/lang/Object;)V",
        )

        val meMethod = RouteMyListViewModelMeFingerprint.method
        val eeCallIndex = meMethod.instructions.indexOfFirst { insn ->
            insn is ReferenceInstruction &&
                (insn.reference as? MethodReference)?.let { ref ->
                    ref.name == "Ee" && ref.definingClass == "Lcom/walmart/glass/instoremaps/viewmodel/j;"
                } == true
        }
        check(eeCallIndex >= 0) { "Could not find Ee call in viewmodel.j.Me" }
        val ifNezIndex = (eeCallIndex - 1 downTo 0).first { i ->
            meMethod.instructions[i].opcode == Opcode.IF_NEZ
        }
        meMethod.replaceInstruction(ifNezIndex, "nop")

        val checkboxMethod = NativeRouteMyListCheckboxFingerprint.method
        checkboxMethod.addInstructions(
            checkboxMethod.instructions.size - 1,
            "invoke-static/range {p0 .. p1}, $EXTENSION_CLASS->onNativeRouteCheckboxChecked(Ljava/lang/Object;Ljava/lang/Object;)V",
        )

        val addBackMethod = NativeRouteMyListAddBackFingerprint.method
        addBackMethod.addInstructions(
            addBackMethod.instructions.size - 1,
            "invoke-static/range {p0 .. p1}, $EXTENSION_CLASS->onNativeRouteAddBack(Ljava/lang/Object;Ljava/lang/Object;)V",
        )

        val focusMethod = ItemCarouselFocusChangedFingerprint.method
        focusMethod.addInstructions(
            focusMethod.instructions.size - 1,
            "invoke-static/range {p2 .. p2}, $EXTENSION_CLASS->onCarouselItemFocused(Ljava/lang/Object;)V",
        )
    }
}
