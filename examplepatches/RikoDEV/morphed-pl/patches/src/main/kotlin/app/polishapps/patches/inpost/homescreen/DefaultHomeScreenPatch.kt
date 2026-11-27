package app.polishapps.patches.inpost.homescreen

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.inpost.shared.constructorStrings
import app.polishapps.patches.inpost.shared.parameterTypeNames
import app.polishapps.patches.inpost.shared.singleClass
import app.polishapps.patches.inpost.shared.singleMethod
import app.polishapps.patches.inpost.shared.strings
import app.polishapps.patches.shared.Constants.COMPATIBILITY_INPOST
import app.polishapps.patches.shared.prependReturn
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val defaultHomeScreenPatch = bytecodePatch(
    name = "Default to parcel tracking",
    description = "Opens the parcel tracking tab instead of the home tab on startup.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INPOST)

    execute {
        // --- 1. Patch the NavGraph start destination ---
        //
        // BottomNavigationViewStateProvider.e() returns the first menu item's ID (Home tab),
        // which HomeActivity.onCreate uses as the NavGraph's start destination.
        // We change it to return the second item (tracked shipments).

        val providerClass = singleClass("BottomNavigationViewStateProvider") { classDef ->
            classDef.constructorStrings().let {
                it.contains("supportedBottomNavigationDestinationsProvider") &&
                    it.contains("nimbusButtonViewStateResolvingStrategy")
            }
        }

        val getDefaultTab = singleMethod("BottomNavigationViewStateProvider.getDefaultTabId") { classDef, method ->
            classDef.type == providerClass.type &&
                method.returnType == "I" &&
                method.parameterTypes.isEmpty() &&
                method.name != "<init>" && method.name != "<clinit>" && method.name != "hashCode" &&
                method.implementation?.instructions?.any {
                    it.opcode == Opcode.INVOKE_INTERFACE
                } == true
        }

        val tabInstructions = getDefaultTab.implementation!!.instructions.toList()

        val providerFieldRef = tabInstructions
            .first { it.opcode == Opcode.IGET_OBJECT }
            .let { (it as ReferenceInstruction).reference as FieldReference }

        val listMethodRef = tabInstructions
            .filter { it.opcode == Opcode.INVOKE_INTERFACE }
            .map { (it as ReferenceInstruction).reference as MethodReference }
            .first { it.returnType == "Ljava/util/List;" }

        val menuDestIdType = tabInstructions
            .first { it.opcode == Opcode.CHECK_CAST }
            .let { (it as ReferenceInstruction).reference.toString() }

        val getDestIdRef = tabInstructions
            .filter { it.opcode == Opcode.INVOKE_VIRTUAL }
            .map { (it as ReferenceInstruction).reference as MethodReference }
            .first { it.returnType == "I" && it.parameterTypes.isEmpty() }

        getDefaultTab.prependReturn(
            """
                iget-object v0, p0, ${providerFieldRef.definingClass}->${providerFieldRef.name}:${providerFieldRef.type}
                invoke-interface {v0}, ${listMethodRef.definingClass}->${listMethodRef.name}()Ljava/util/List;
                move-result-object v0
                const/4 v1, 0x1
                invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;
                move-result-object v0
                check-cast v0, $menuDestIdType
                invoke-virtual {v0}, ${getDestIdRef.definingClass}->${getDestIdRef.name}()I
                move-result v0
                return v0
            """,
        )

        // --- 2. Patch the initial HomeViewState ---
        //
        // HomeViewStateCreator picks the first visible item (Home) as currentBottomNavigationItemId.
        // We change it to pick the second item (tracked shipments) so the bottom bar highlights
        // the correct tab from the start, avoiding a brief flicker.

        val createViewState = singleMethod("HomeViewStateCreator.a") { _, method ->
            "current_menu_id_key" in method.strings() &&
                method.parameterTypes.size == 2 &&
                method.parameterTypeNames()[0] == "Ljava/util/List;"
        }

        val homeViewStateType = createViewState.returnType

        val invokedMethods = createViewState.implementation!!.instructions
            .filter { it.opcode == Opcode.INVOKE_VIRTUAL }
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }

        val isVisibleCall = invokedMethods.firstOrNull { ref ->
            ref.returnType == "Z" &&
                ref.parameterTypes.isEmpty() &&
                ref.definingClass != homeViewStateType &&
                !ref.definingClass.startsWith("Ljava/") &&
                !ref.definingClass.startsWith("Lkotlin/")
        } ?: throw PatchException("Could not find getIsVisible call in HomeViewStateCreator")

        val menuItemType = isVisibleCall.definingClass

        val getIdCall = invokedMethods.firstOrNull { ref ->
            ref.definingClass == menuItemType &&
                ref.returnType == "I" &&
                ref.parameterTypes.isEmpty()
        } ?: throw PatchException("Could not find getId call on $menuItemType in HomeViewStateCreator")

        val getIdName = getIdCall.name

        createViewState.prependReturn(
            """
                const/4 v0, 0x1
                invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;
                move-result-object v0
                check-cast v0, $menuItemType
                invoke-virtual {v0}, $menuItemType->$getIdName()I
                move-result v1

                new-instance v0, $homeViewStateType
                move-object v2, p1
                const/4 v3, 0x0
                const/4 v4, 0x0
                const/4 v5, 0x0
                invoke-direct/range {v0 .. v5}, $homeViewStateType-><init>(ILjava/util/List;IZZ)V
                return-object v0
            """,
        )
    }
}
