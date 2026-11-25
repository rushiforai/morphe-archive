package app.stayfree.patches.login

import app.stayfree.patches.shared.resource.restoreServiceFilesPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.stayfree.patches.inbox.hasEverLoggedInStayFreshPatch
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

@Suppress("unused")
val removeGoogleLoginRequestPatch = bytecodePatch(
    name = "Remove Google login request",
    description = "Removes the \"Sign in with Google\" page from onboarding and the " +
        "\"Create StayFree profile\" step from the home setup checklist. Signing in manually " +
        "from the drawer/pairing screens still works.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)
    dependsOn(restoreServiceFilesPatch)

    // The home "Complete StayFree setup" card treats the sign-in step as done when
    // `signedIn || hasUserEverLoggedInStayFresh`; that pref getter is forced true there.
    dependsOn(hasEverLoggedInStayFreshPatch)

    execute {
        // Drop GoogleSignIn from the page list right after listOf(...) returns. The list is
        // immutable, so it is copied into an ArrayList first. Removing (instead of nulling the
        // array slot) is what the app itself does for pages at runtime (the consent branch
        // filters pages out of the same list), and paging walks index+1 against the list size,
        // so a shorter list is safe. The skip-button handler still names GoogleSignIn, but only
        // fires from that page.
        //
        // Not faked instead: "is signed in" — it gates access-token reads, and lying there would
        // hand null tokens to the API and open the Gmail engine unauthenticated.
        OnboardingPagesFingerprint.let { fingerprint ->
            val method = fingerprint.method
            val moveResultIndex = fingerprint.instructionMatches.last().index + 1
            if (method.getInstruction(moveResultIndex).opcode != Opcode.MOVE_RESULT_OBJECT) {
                throw PatchException("Expected move-result-object after listOf")
            }
            val listRegister = method.getInstruction<OneRegisterInstruction>(moveResultIndex).registerA

            // The enum class is obfuscated (`Lqs7;` in 20.18.1); read it off the matched sget.
            val pageField = method.getInstruction<ReferenceInstruction>(
                fingerprint.instructionMatches.first().index,
            ).reference as FieldReference

            // v0/v1 held the array and its elements and are dead after listOf. Registers are
            // addressed as plain vN since inline smali drops p-registers / v16+ in 4-bit slots.
            if (listRegister !in 2..15) {
                throw PatchException("Unexpected registers in onboarding page builder")
            }

            method.addInstructions(
                moveResultIndex + 1,
                """
                    new-instance v0, Ljava/util/ArrayList;
                    invoke-direct {v0, v$listRegister}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
                    sget-object v1, ${pageField.definingClass}->${pageField.name}:${pageField.type}
                    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
                    move-object v$listRegister, v0
                """,
            )
        }
    }
}
