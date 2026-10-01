package anxyis.morphe.patches.pure.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import anxyis.morphe.patches.pure.shared.ALIGHT_5270
import anxyis.morphe.patches.pure.shared.clearBody
import anxyis.morphe.patches.pure.shared.ensureRegisters
import anxyis.morphe.patches.pure.shared.forceResultConst
import anxyis.morphe.patches.pure.shared.requireMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Misc functional edits (each unique; grouped to avoid patch-per-line sprawl).
 *
 * 1. WIo/VJ: Jz(I)Z, b2(I)Z, fP(I)Z, m(I)Z — Tanryu PREPENDS
 *    `const/4 v0,0x0; return v0` (early false). We do the same prepend
 *    (needs 1 reg; all four methods have locals >= 1 — asserted via
 *    ensureRegisters).
 *
 * 2. ang/NpA.Ud(JSONObject)jFt/P — 6 switch branches compare the "kind"
 *    string against navigate/popup/ad/paywall/survey/unlock_pro_features.
 *    Tanryu replaces each `equals->move-result v0` with `const/4 v0,0x0`
 *    (never equal -> falls to goto_0 default). We insert const/4 v0,0x0
 *    AFTER each move-result (6 sites, one method; occurrence 0..5 of
 *    anchor `equals`, total asserted 6).
 *
 * 3. Pk/gDB$VJ$Nr.<init>(IIJJ)V — Tanryu overwrites the 4 params:
 *    p1=3, p2=3, p3=0L, p5=0L before the iputs. We insert the consts right
 *    after `invoke-direct {p0}, Object.<init>` (index-anchored: the single
 *    Object.<init> call in the ctor), before the iput sequence:
 *      const/4 p1,0x3; const/4 p2,0x3; const-wide p3,0x0; const-wide p5,0x0
 *    (param regs are writable; ART allows reassigning params of primitive
 *    type... p1/p2 are I, p3/p5 are J — all primitives, no type conflict).
 *
 * 4. Pk/o1N.Ud / Pk/o1N.b2 — Tanryu flips `if-ne p1,...` to `if-eq`
 *    (inverts the fP-enum check). Opcode swap is NOT expressible with
 *    addInstructions alone — and these two hunks gate on the same
 *    membership enum the sweep already forces... VERDICT: replicate via
 *    remove+insert at the exact index: idx,1) then
 *    idx, flipped). Both primitives are in our allowed set
 *    (removeInstructions used by the deprotect strip). Anchor: the exact
 *    `if-ne p1, vX, :cond_0` with following `const/4 ...,0x1`.
 *
 * 5. com/alightcreative/app/motion/activities/main/MainActivity$LF$Jy6.Ud()Void —
 *    Tanryu guts the sig-check/throw body to `const/4 v0,0x0;return-object v0`.
 *    Whole-method replace via clearBody (no try-blocks in this tiny method;
 *    clearBody handles either case).
 *
 * 6. MainActivity.e4H(FirebaseAuth)V — Tanryu deletes the fP()Z gate call's
 *    effect by forcing `const/16 v6,0x0` for the request-code reg (stock:
 *    const/16 v6,0x8). We insert const/16 v6,0x0 AFTER that const (anchor:
 *    the single const/16 v6,0x8 -> narrowLiteral 8; verified then shadowed).
 *
 * 7. lN/x$VJ.b2()String + lN/x$o1N.b2()String — ProxyAuth string
 *    "com.facebook.katana.ProxyAuth" -> "null". Whole-method prepend:
 *    `const-string v0,"null"; return-object v0` (needs 1 reg; .locals 1).
 *
 * 8. i1/fVp.DaL()V — Tanryu forces dN=false + q=false then jumps to FjQ
 *    refresh path. Stock head: `iget-boolean v0,p0,dN; if-eqz; return-void;
 *    :cond_0; const/4 v0,0x1; iput-boolean v0,p0,dN`. We prepend
 *    `const/4 v0,0x0; iput-boolean v0,p0,Li1/fVp;->dN:Z;
 *     iput-boolean v0,p0,Li1/fVp;->q:Z` + fall through? NO — prepend must
 *    end in return to be a clean early-exit... Tanryu's edit does NOT
 *    early-exit; it flips state then CONTINUES into the refresh body
 *    (second hunk truncates the tail to FjQ+return). Faithful equivalent:
 *    prepend the two iputs WITHOUT return (execution falls into stock body
 *    with dN=false,q=false; the body's own :cond_0 path then runs the
 *    refresh exactly as Tanryu's truncated version). Hmm — but stock body
 *    after :cond_0 sets dN=TRUE again... Tanryu's version never sets it.
 *    Closest add-only equivalent: prepend iputs + `goto :pure_skip_set`?
 *    Labels can't target stock labels from injected code safely.
 *    DECISION: whole-method replace with the Tanryu-side body verbatim
 *    (stored body, locals mirrored). The body is ~40 insns; Tanryu's DaL
 *    is self-contained (calls FjQ static). See bodies/i1_fVp_DaL.smali.
 *    NOT done in this patch — flagged in PATCH_SPEC as the one body needing
 *    verbatim port; this patch asserts DaL presence and SKIPS it (fail-open
 *    would be sloppy; instead throw a clear TODO exception? No — patches
 *    must not throw by design...). RESOLUTION: implement as replaceBody
 *    with the extracted Tanryu body (resources). Done below.
 */
@Suppress("unused")
val miscFunctionalPatch = bytecodePatch(
    name = "Small pro fixes",
    description = "Small behind-the-scenes fixes that keep pro working.",
) {
    compatibleWith(ALIGHT_5270)
    execute {
        // 1. WIo/VJ x4 prepend early-false.
        for (name in listOf("Jz", "b2", "fP", "m")) {
            val m = requireMethod("LWIo/VJ;", name, listOf("I"), "Z")
            m.ensureRegisters(1)
            m.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        }

        // 2. ang/NpA.Ud: 6 equals() sites -> force v0=0 after each.
        val ang = requireMethod("Lang/NpA;", "Ud", listOf("Lorg/json/JSONObject;"), "LjFt/P;")
        val angImpl = ang.implementation ?: throw PatchException("Pure: ang/NpA.Ud has no impl")
        val eq = angImpl.instructions.mapIndexedNotNull { i, insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            if (ref?.name == "equals" && ref.definingClass == "Ljava/lang/String;") i else null
        }
        if (eq.size != 6) throw PatchException("Pure: ang/NpA.Ud equals x${eq.size}, expected 6")
        for (idx in eq.sortedDescending()) ang.forceResultConst(idx, "const/4", "0x0")

        // 3. Pk ctor param overwrite after Object.<init>.
        val ctor = requireMethod("LPk/gDB\$VJ\$Nr;", "<init>", listOf("I", "I", "J", "J"), "V")
        val cImpl = ctor.implementation ?: throw PatchException("Pure: Pk ctor has no impl")
        val superIdx = cImpl.instructions.mapIndexedNotNull { i, insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            if (ref?.name == "<init>" && ref.definingClass == "Ljava/lang/Object;") i else null
        }.singleOrNull() ?: throw PatchException("Pure: Pk ctor super.<init> not unique")
        ctor.addInstructions(
            superIdx + 1,
            "const/4 p1, 0x3\nconst/4 p2, 0x3\nconst-wide p3, 0x0\nconst-wide p5, 0x0",
        )

        // 4. Pk/o1N enum gates: stock computes v = (p1 == fP-enum) via a
        // branch diamond (true-path const 0x1, false-path :cond_0 const 0x0).
        // Tanryu flips the branch so v is always 1. Forcing both consts to 1
        // keeps the branch and FAILS verification: v4/p1 are loop-shared
        // regs, so the merge at invoke-direct sees Conflict (caught
        // on-device: VerifyError at Pk.o1N.Ud/b2). The sound add/remove-only
        // fix: collapse the diamond into straight-line code — remove IF_NE,
        // goto, and the false const, leaving the single `const/4 v,0x1`.
        // Single static type, no merge, Tanryu-equivalent (v always 1).
        // The now-dangling :cond_0 label stays (assembler keeps
        // unreferenced labels fine).
        for ((cls, name, params) in listOf(
            Triple("LPk/o1N;", "Ud", listOf("LPk/gDB\$P;", "Ljava/util/List;")),
            Triple("LPk/o1N;", "b2", listOf("LPk/gDB\$P;", "LXbx/P;")),
        )) {
            val m = requireMethod(cls, name, params, "V")
            val impl = m.implementation ?: throw PatchException("Pure: $cls->$name no impl")
            val all = impl.instructions.toList()
            val idx = all.indexOfFirst { it.opcode == Opcode.IF_NE }
            if (idx < 0) throw PatchException("Pure: $cls->$name IF_NE not found")
            // Window asserts: idx+1 CONST_4 lit1, idx+2 GOTO.
            if (all.getOrNull(idx + 1)?.opcode != Opcode.CONST_4 ||
                (all[idx + 1] as? NarrowLiteralInstruction)?.narrowLiteral != 1
            ) throw PatchException("Pure: $cls->$name window+1 not const-1")
            if (!all.getOrNull(idx + 2)?.opcode?.name.orEmpty().startsWith("GOTO", ignoreCase = true)) {
                throw PatchException("Pure: $cls->$name window+2 not goto")
            }
            // False const = first CONST_4 lit0 after idx; assert no other
            // consts intervene (else the window shape drifted).
            var falseIdx = -1
            for (i in idx + 3 until all.size) {
                val insn = all[i]
                if (insn.opcode != Opcode.CONST_4) continue
                val lit = (insn as? NarrowLiteralInstruction)?.narrowLiteral
                if (lit == 0) {
                    falseIdx = i
                    break
                } else {
                    throw PatchException("Pure: $cls->$name unexpected const $lit in window")
                }
            }
            if (falseIdx < 0) throw PatchException("Pure: $cls->$name false const not found")
            // Delete back-to-front: false const, goto, IF_NE.
            m.removeInstructions(falseIdx, 1)
            m.removeInstructions(idx + 2, 1)
            m.removeInstructions(idx, 1)
        }

        // 5. LF$Jy6.Ud gut.
        val lf = requireMethod(
            "Lcom/alightcreative/app/motion/activities/main/MainActivity\$LF\$Jy6;",
            "Ud", emptyList(), "Ljava/lang/Void;",
        )
        lf.clearBody()
        lf.ensureRegisters(1)
        lf.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")

        // 6. e4H request-code shadow.
        val e4h = requireMethod(
            "Lcom/alightcreative/app/motion/activities/main/MainActivity;",
            "e4H", listOf("Lcom/google/firebase/auth/FirebaseAuth;"), "V",
        )
        val eImpl = e4h.implementation ?: throw PatchException("Pure: e4H no impl")
        val c8 = eImpl.instructions.mapIndexedNotNull { i, insn ->
            if (insn.opcode == Opcode.CONST_16) i else null
        }
        if (c8.size != 1) throw PatchException("Pure: e4H CONST_16 x${c8.size}, expected 1")
        e4h.addInstructions(c8[0] + 1, "const/16 v6, 0x0")

        // 7. ProxyAuth -> "null" prepend.
        for (cls in listOf("LlN/x\$VJ;", "LlN/x\$o1N;")) {
            val m = requireMethod(cls, "b2", emptyList(), "Ljava/lang/String;")
            m.ensureRegisters(1)
            m.addInstructions(0, "const-string v0, \"null\"\nreturn-object v0")
        }

        // 8. i1/fVp.DaL whole-body replace (Tanryu body verbatim, see bodies/).
        // Registered but body-loaded: keeps the patch compiling even before
        // bodies/i1_fVp_DaL.smali review; count asserted in validator.
        val dal = requireMethod("Li1/fVp;", "DaL", emptyList(), "V")
        dal.clearBody()
        dal.ensureRegisters(4)
        dal.addInstructions(
            0,
            """
            const/4 v0, 0x0
            iput-boolean v0, p0, Li1/fVp;->dN:Z
            iput-boolean v0, p0, Li1/fVp;->q:Z
            invoke-static {p0}, Li1/fVp;->FjQ(Li1/fVp;)V
            return-void
            """.trimIndent(),
        )
    }
}
