package app.stayfree.patches.login

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.stayfree.patches.inbox.hasEverLoggedInStayFreshPatch
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val removeGoogleLoginRequestPatch = bytecodePatch(
    name = "Remove Google login request",
    description = "Removes the \"Sign in with Google\" page from onboarding and the " +
        "\"Create StayFree profile\" step from the home setup checklist. Signing in manually " +
        "from the drawer/pairing screens still works.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)

    // The home "Complete StayFree setup" card treats the sign-in step as done when
    // `signedIn || hasUserEverLoggedInStayFresh`; that pref getter is forced true there.
    dependsOn(hasEverLoggedInStayFreshPatch)

    execute {
        // Drop OnboardingGoogleAccountPage from the freshly built mutable page list, right after
        // mutableListOf(...) returns. Removing (instead of nulling the array slot) is what the app
        // itself does for pages at runtime (needsOptIn / remotely-removable pages), and paging
        // only walks index+1 against the list size, so a shorter list is safe.
        //
        // Not faked instead: "is signed in" (Lir4;->i()Z) — it gates access-token reads, and
        // lying there would hand null tokens to the API and open the Gmail engine unauthenticated.
        OnboardingPagesConstructorFingerprint.let { fingerprint ->
            val method = fingerprint.method
            val callIndex = fingerprint.instructionMatches.last().index
            val moveResultIndex = callIndex + 1
            val moveResult = method.getInstruction<OneRegisterInstruction>(moveResultIndex)
            if (method.getInstruction(moveResultIndex).opcode != Opcode.MOVE_RESULT_OBJECT) {
                throw PatchException("Expected move-result-object after mutableListOf")
            }
            val listRegister = moveResult.registerA

            // The page enum register from the sget-object is free again here (the next
            // instruction reloads it with Build.MANUFACTURER). Both registers are addressed as
            // plain vN, since inline smali silently drops p-registers / v16+ in 4-bit slots.
            val pageRegister = method.getInstruction<OneRegisterInstruction>(
                fingerprint.instructionMatches.first().index,
            ).registerA
            if (listRegister > 15 || pageRegister > 15) {
                throw PatchException("Unexpected high registers v$listRegister / v$pageRegister")
            }

            method.addInstructions(
                moveResultIndex + 1,
                """
                    sget-object v$pageRegister, $ONBOARDING_PAGE_TYPE->OnboardingGoogleAccountPage:$ONBOARDING_PAGE_TYPE
                    invoke-interface {v$listRegister, v$pageRegister}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
                """,
            )
        }
    }
}
