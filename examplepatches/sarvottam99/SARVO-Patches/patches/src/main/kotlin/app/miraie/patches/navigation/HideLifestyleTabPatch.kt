package app.miraie.patches.navigation

import app.miraie.patches.shared.Constants.COMPATIBILITY_MIRAIE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val HOME_SCREEN_ACTIVITY =
    "Lcom/panasonic/in/miraie/dashboard/HomeScreenActivity;"
private const val MIRAIE_RESOURCE_IDS = "Lcom/panasonic/in/miraie/R\$id;"

private object HomeScreenInitBottomTabsFingerprint : Fingerprint(
    definingClass = HOME_SCREEN_ACTIVITY,
    name = "initBottomTabs",
    returnType = "V",
    parameters = emptyList()
)

@Suppress("unused")
val hideLifestyleTabPatch = bytecodePatch(
    name = "Hide Lifestyle tab",
    description = "Hides only the Lifestyle tab from MirAIe's bottom navigation. Other tabs, icons and their order remain unchanged.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MIRAIE)

    execute {
        val method = HomeScreenInitBottomTabsFingerprint.method
        val implementation = method.implementation
            ?: throw PatchException("MirAIe HomeScreenActivity.initBottomTabs() has no implementation")
        val instructions = implementation.instructions

        // The target 01.4.32 method has five Menu.add() calls and ends in RETURN_VOID.
        // Fail closed if the app's navigation implementation changes.
        val hasLifestyleResourceId = instructions.any { instruction ->
            if (instruction.opcode != Opcode.SGET) {
                false
            } else {
                val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                reference?.definingClass == MIRAIE_RESOURCE_IDS &&
                    reference.name == "nav_item_lifestyle" &&
                    reference.type == "I"
            }
        }
        if (!hasLifestyleResourceId) {
            throw PatchException("Could not find R.id.nav_item_lifestyle in initBottomTabs()")
        }

        val menuAddCount = instructions.count { instruction ->
            if (instruction.opcode != Opcode.INVOKE_INTERFACE) {
                false
            } else {
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Landroid/view/Menu;" &&
                    reference.name == "add" &&
                    reference.returnType == "Landroid/view/MenuItem;"
            }
        }
        if (menuAddCount != 5) {
            throw PatchException("Unexpected bottom-navigation structure: expected 5 Menu.add() calls, found $menuAddCount")
        }

        if (implementation.registerCount < 3) {
            throw PatchException("Unexpected initBottomTabs() register layout; cannot safely use v0/v1")
        }

        val returnIndex = instructions.lastIndex
        if (returnIndex < 0 || instructions[returnIndex].opcode != Opcode.RETURN_VOID) {
            throw PatchException("initBottomTabs() no longer ends with RETURN_VOID; refusing an unsafe insertion")
        }

        // Run only after all five MenuItems have been created. Resolve the exact
        // Lifestyle item by its resource ID; do not depend on menu position or
        // reuse the MenuItem register returned by Menu.add().
        method.addInstructions(
            returnIndex,
            """
                iget-object v0, p0, $HOME_SCREEN_ACTIVITY->mBottomNavigationView:Lcom/google/android/material/bottomnavigation/BottomNavigationView;
                invoke-virtual {v0}, Lcom/google/android/material/bottomnavigation/BottomNavigationView;->getMenu()Landroid/view/Menu;
                move-result-object v0
                sget v1, $MIRAIE_RESOURCE_IDS->nav_item_lifestyle:I
                invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;
                move-result-object v0
                if-eqz v0, :miraie_hide_lifestyle_done
                const/4 v1, 0x0
                invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;
                :miraie_hide_lifestyle_done
                nop
            """
        )
    }
}
