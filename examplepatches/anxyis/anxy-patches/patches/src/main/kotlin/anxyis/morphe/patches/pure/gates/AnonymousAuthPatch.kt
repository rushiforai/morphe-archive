package anxyis.morphe.patches.pure.gates

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import anxyis.morphe.patches.pure.shared.ALIGHT_5270
import anxyis.morphe.patches.pure.shared.matchSingle
import anxyis.morphe.patches.pure.shared.requireMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * Anonymous-auth swap (AuthMethodPickerActivity).
 *
 * Tanryu repoints the Google-sign-in branch to anonymous sign-in:
 *  (a) const-class GoogleSignInHandler -> AnonymousSignInHandler (one line),
 *  (b) check-cast + Params-construct + initWith(params) replaced by
 *      check-cast Anonymous + getFlowParams + initWith(flowParams)
 *      (net: 3 stock lines removed, 2 added — same invoke, new args),
 *  (c) pswitch google layout -> fui_provider_button_anonymous layout,
 *  (d) lone nop insert before :sswitch_data_0 (reassembly artifact; SKIP).
 * onCreate's license call is owned by the license strip.
 *
 * All edits are single-instruction remove+insert at verified indices
 * (no label renumbering: (b) keeps all labels; the removed
 * `new-instance Params / invoke-direct Params.<init>` pair vanishes and
 * `getFlowParams` + its move-result take their place — register v2 reused
 * for FlowParameters, which is a reference type like Params was; the
 * subsequent initWith(Object) call is type-agnostic).
 */
private const val AUTH = "Lcom/firebase/ui/auth/ui/idp/AuthMethodPickerActivity;"

private object HandleSignIn : Fingerprint(
    definingClass = AUTH,
    name = "handleSignInOperation",
    returnType = "V",
    parameters = listOf(
        "Lcom/firebase/ui/auth/AuthUI\$IdpConfig;",
        "Landroid/view/View;",
    ),
)

private object PopulateList : Fingerprint(
    definingClass = AUTH,
    name = "populateIdpList",
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
)

@Suppress("unused")
val anonymousAuthPatch = bytecodePatch(
    name = "Easy sign-in",
    description = "Sign in without needing a Google account.",
) {
    compatibleWith(ALIGHT_5270)
    execute {
        HandleSignIn.matchSingle()
        PopulateList.matchSingle()
        val m = requireMethod(
            AUTH, "handleSignInOperation",
            listOf("Lcom/firebase/ui/auth/AuthUI\$IdpConfig;", "Landroid/view/View;"), "V",
        )
        var impl = m.implementation ?: throw PatchException("Pure: handleSignInOperation no impl")

        // (a) const-class swap (exactly one GoogleSignInHandler const-class).
        val ccIdx = impl.instructions.mapIndexedNotNull { i, insn ->
            if (insn.opcode != Opcode.CONST_CLASS) return@mapIndexedNotNull null
            val ref = (insn as? ReferenceInstruction)?.reference as? TypeReference
            if (ref?.toString() == "Lcom/firebase/ui/auth/data/remote/GoogleSignInHandler;") i else null
        }.singleOrNull() ?: throw PatchException("Pure: GoogleSignInHandler const-class not unique")
        m.removeInstructions(ccIdx, 1)
        m.addInstructions(
            ccIdx,
            "const-class v2, Lcom/firebase/ui/auth/data/remote/AnonymousSignInHandler;",
        )

        // (b) check-cast Google + Params new-instance/direct + initWith ->
        //     check-cast Anonymous + getFlowParams + initWith.
        impl = m.implementation ?: throw PatchException("Pure: handleSignInOperation lost impl")
        val insns = impl.instructions.toList()
        val castIdx = insns.indexOfFirst { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? TypeReference
            insn.opcode == Opcode.CHECK_CAST && ref?.toString() == "Lcom/firebase/ui/auth/data/remote/GoogleSignInHandler;"
        }
        if (castIdx < 0) throw PatchException("Pure: GoogleSignInHandler check-cast not found")
        // Verify the expected 4-insn window: check-cast, new-instance Params,
        // invoke-direct Params.<init>, invoke-virtual initWith.
        fun methodAt(i: Int): MethodReference? =
            ((insns.getOrNull(i) as? ReferenceInstruction)?.reference as? MethodReference)
        fun typeAt(i: Int): String? =
            ((insns.getOrNull(i) as? ReferenceInstruction)?.reference as? TypeReference)?.toString()
        val newType = typeAt(castIdx + 1)
        val dirIdx = methodAt(castIdx + 2)
        val withIdx = methodAt(castIdx + 3)
        if (insns.getOrNull(castIdx + 1)?.opcode != Opcode.NEW_INSTANCE ||
            newType != "Lcom/firebase/ui/auth/data/remote/GoogleSignInHandler\$Params;" ||
            dirIdx?.name != "<init>" ||
            withIdx?.name != "initWith"
        ) {
            throw PatchException("Pure: handleSignInOperation Params window mismatch")
        }
        // Remove back-to-front, insert new sequence at castIdx+1.
        m.removeInstructions(castIdx + 3, 1) // initWith (re-added below)
        m.removeInstructions(castIdx + 1, 2) // new-instance + <init>
        m.removeInstructions(castIdx, 1) // check-cast (re-added below)
        m.addInstructions(
            castIdx,
            """
            check-cast v0, Lcom/firebase/ui/auth/data/remote/AnonymousSignInHandler;
            invoke-virtual {p0}, Lcom/firebase/ui/auth/ui/HelperActivityBase;->getFlowParams()Lcom/firebase/ui/auth/data/model/FlowParameters;
            move-result-object v2
            invoke-virtual {v0, v2}, Lcom/firebase/ui/auth/viewmodel/ProviderSignInBase;->initWith(Ljava/lang/Object;)Lcom/firebase/ui/auth/viewmodel/ProviderSignInBase;
            """.trimIndent(),
        )

        // (c) pswitch layout swap: the single sget of fui_idp_button_google.
        val pl = requireMethod(AUTH, "populateIdpList", listOf("Ljava/util/List;"), "V")
        val plImpl = pl.implementation ?: throw PatchException("Pure: populateIdpList no impl")
        val sgetIdx = plImpl.instructions.mapIndexedNotNull { i, insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference
            if (ref?.name == "fui_idp_button_google") i else null
        }.singleOrNull() ?: throw PatchException("Pure: fui_idp_button_google sget not unique")
        pl.removeInstructions(sgetIdx, 1)
        pl.addInstructions(
            sgetIdx,
            "sget v1, Lcom/firebase/ui/auth/R\$layout;->fui_provider_button_anonymous:I",
        )
    }
}
