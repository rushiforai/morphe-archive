package app.stayfree.patches.inbox

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * App preferences constructor (`Loc8;-><init>` in 20.14.1). Each Kotlin delegated pref is built
 * from its key string and stored in its own `Lt26;` field:
 * ```
 * const-string p1, "hasUserEverLoggedInStayFresh"
 * invoke-static {v1, p1, v0}, Lyi7;->e(Lcy5;Ljava/lang/String;Z)Lt26;
 * move-result-object p1
 * iput-object p1, p0, Loc8;->o:Lt26;
 * ```
 * The iput-object gives the field; the getter is then the only `()Z` method that reads it.
 * Resolving it this way avoids depending on the delegate's array index (`b0[4]`), which shifts
 * whenever a pref is added.
 */
private object HasEverLoggedInStayFreshDelegateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        string("hasUserEverLoggedInStayFresh"),
        fieldAccess(opcode = Opcode.IPUT_OBJECT, location = InstructionLocation.MatchAfterWithin(3)),
    ),
)

/**
 * Forces the `hasUserEverLoggedInStayFresh` pref getter to true. Its callers are:
 *  - the home "Complete StayFree setup" card (sign-in step counts as done),
 *  - `Theme.isThemeAvailable` (Neon theme locked behind "Sign up for Inbox Control"),
 *  - app-icon customization (`stayfresh_login_requirement_app_icon` gate) and its tip,
 *  - whether to log `STAYFRESH_NEW_USER_LOGGED_IN` (skipped once true).
 * None of them read account data, so nothing dereferences a missing token.
 */
val hasEverLoggedInStayFreshPatch = bytecodePatch(
    description = "Marks the user as having logged into Inbox Control once, which unlocks the " +
        "features gated on it and completes the sign-in setup step.",
) {
    execute {
        val match = HasEverLoggedInStayFreshDelegateFingerprint.match()
        val delegateField = (
            match.method.implementation!!.instructions.elementAt(match.instructionMatches.last().index)
                as ReferenceInstruction
            ).reference as FieldReference

        val getters = match.classDef.methods.filter { method ->
            method.returnType == "Z" &&
                method.parameterTypes.isEmpty() &&
                AccessFlags.STATIC.isSet(method.accessFlags).not() &&
                method.implementation?.instructions?.any { instruction ->
                    instruction.opcode == Opcode.IGET_OBJECT &&
                        ((instruction as ReferenceInstruction).reference as FieldReference).let {
                            it.name == delegateField.name && it.definingClass == delegateField.definingClass
                        }
                } == true
        }
        if (getters.size != 1) {
            throw PatchException("Expected one getter for ${delegateField.name}, found ${getters.size}")
        }

        getters.single().addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
