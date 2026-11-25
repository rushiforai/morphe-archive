package app.stayfree.patches.inbox

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

@Suppress("unused")
val removeInboxControlPatch = bytecodePatch(
    name = "Remove Inbox Control",
    description = "Removes the Inbox Control (Gmail cleaner) feature: its drawer entry, its " +
        "permissions section and every screen that opens it. The Neon theme and custom app " +
        "icons that were locked behind signing up for it are unlocked, and the Gmail sign-in no " +
        "longer keeps the permission setup reminder on the home screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)

    dependsOn(hasEverLoggedInStayFreshPatch, permissionSetupCompletePatch)

    execute {
        // 1. Drawer: skip the row composable for INBOX_CLEANING. The early return sits before the
        //    composer's startRestartGroup (F0), so no Compose group is left unbalanced; the
        //    LazyColumn item just emits nothing. p0 is v28 here (.locals 28), so it is copied
        //    with the 16-bit move first — a p-register in if-ne's 4-bit slot would be dropped.
        DrawerRowComposableFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v0, p0
                    sget-object v1, $DRAWER_SCREEN_TYPE->INBOX_CLEANING:$DRAWER_SCREEN_TYPE
                    if-ne v0, v1, :show_row
                    return-void
                """,
                ExternalLabel("show_row", getInstruction(0)),
            )
        }

        // 2. Every remaining entry point funnels through here; make it a no-op so nothing can
        //    open the Flutter Inbox Control UI or start its Gmail sign-in.
        OpenInboxControlFingerprint.method.addInstructions(0, "return-void")

        // 3. Permissions screen: give the Inbox Control category an empty item list; the builder's
        //    own isEmpty() filter then drops the section.
        PermissionsListBuilderFingerprint.let { fingerprint ->
            val method = fingerprint.method
            val constructorIndex = fingerprint.instructionMatches.last().index
            val itemsRegister = method.getInstruction<FiveRegisterInstruction>(constructorIndex).registerE
            if (itemsRegister > 15) throw PatchException("Unexpected items register v$itemsRegister")

            method.addInstructions(
                constructorIndex,
                """
                    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                    move-result-object v$itemsRegister
                """,
            )
        }
    }
}
