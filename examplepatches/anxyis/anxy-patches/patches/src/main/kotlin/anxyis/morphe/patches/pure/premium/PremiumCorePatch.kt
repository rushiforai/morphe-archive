package anxyis.morphe.patches.pure.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import anxyis.morphe.patches.pure.shared.ALIGHT_5270
import anxyis.morphe.patches.pure.shared.forceResultConst
import anxyis.morphe.patches.pure.shared.matchSingle
import anxyis.morphe.patches.pure.shared.resultRegister
import anxyis.morphe.patches.pure.shared.singleInvoke
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Membership-benefit forces (the premium core).
 *
 * SHAPE (all sites, FACT from the normalized stock->Tanryu diff): a
 * boolean gate computes `Set.contains(...)Z` (or `sk/P.b2()Z`), the
 * move-result feeds a branch or a Boolean.valueOf. Tanryu replaces the
 * move-result with `const 1` (or `const p, 0x1` for param regs).
 * We insert the const AFTER the move-result: same register, same value,
 * no instruction deleted.
 *
 * Anchors are exact 5.0.270 descriptors + the intra-method invoke that
 * precedes the forced move-result. Sites that share a shape but live in
 * different methods are separate fingerprints so a missing/extra match
 * fails loudly instead of silently under-patching.
 */

// --- account/Nr.kB(FirebaseAuth)V: force Zjm(true) ---------------------------
// Stock: move-result v3 (from b2()Z) -> Zjm(Z)V. Tanryu: const v3,0x1.
// We keep the b2() call (harmless) and force v3 right after it.
private object NrKB : Fingerprint(
    definingClass = "Lcom/alightcreative/account/Nr;",
    name = "kB",
    returnType = "V",
    parameters = listOf("Lcom/google/firebase/auth/FirebaseAuth;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/alightcreative/account/IAPMiddleware;",
            name = "Zjm",
        ),
    ),
)

// --- account/Jy6.Ud(Set)I: two contains()Z -> 1 -------------------------------
// Stock Ud: contains(q)->move-result v0; contains(y)->move-result p0.
// Tanryu: const/4 v0,0x1 / const/4 p0,0x1.
private object Jy6UdQ : Fingerprint(
    definingClass = "Lcom/alightcreative/account/Jy6;",
    name = "Ud",
    returnType = "I",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/util/Set;"),
    filters = listOf(opcode(Opcode.SGET_OBJECT)),
)

@Suppress("unused")
val premiumCorePatch = bytecodePatch(
    name = "Premium ON",
    description = "Switches premium membership on.",
) {
    compatibleWith(ALIGHT_5270)
    execute {
        // account/Nr.kB: single b2()Z call whose result feeds Zjm.
        NrKB.matchSingle()
        val kb = mutableClassDefByOrNull("Lcom/alightcreative/account/Nr;")
            ?.methods?.singleOrNull {
                it.name == "kB" && it.parameterTypes == listOf("Lcom/google/firebase/auth/FirebaseAuth;") &&
                    it.returnType == "V"
            } ?: throw PatchException("Pure: account/Nr.kB not found")
        val b2idx = kb.singleInvoke(
            "Lcom/alightcreative/account/Nr;", "b2",
        )
        kb.forceResultConst(b2idx, "const", "0x1")

        // account/Jy6.Ud: two contains()Z sites -> const/4 1.
        Jy6UdQ.matchSingle()
        val ud = mutableClassDefByOrNull("Lcom/alightcreative/account/Jy6;")
            ?.methods?.singleOrNull {
                it.name == "Ud" && it.parameterTypes == listOf("Ljava/util/Set;") &&
                    it.returnType == "I"
            } ?: throw PatchException("Pure: account/Jy6.Ud not found")
        val impl = ud.implementation
            ?: throw PatchException("Pure: Jy6.Ud has no implementation")
        val containsIdx = impl.instructions.mapIndexedNotNull { i, insn ->
            if (insn.opcode == Opcode.INVOKE_INTERFACE) {
                val ref = (insn as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                    ?.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference
                if (ref != null && "Ljava/util/Set;->contains" in "${ref.definingClass}->${ref.name}") i else null
            } else null
        }
        if (containsIdx.size != 2) {
            throw PatchException("Pure: Jy6.Ud contains() sites = ${containsIdx.size}, expected 2")
        }
        // Insert back-to-front so indices stay valid. NOTE: second site's
        // move-result is p0 (high reg: const/4 cannot encode p-regs, and
        // Tanryu writes `const/4 p0, 0x1` textually — apktool assembles p-regs
        // via the /16 form transparently; the inline compiler is stricter, so
        // route through forceResultConst which widens automatically).
        for (idx in containsIdx.sortedDescending()) {
            ud.forceResultConst(idx, "const/4", "0x1")
        }
    }
}
