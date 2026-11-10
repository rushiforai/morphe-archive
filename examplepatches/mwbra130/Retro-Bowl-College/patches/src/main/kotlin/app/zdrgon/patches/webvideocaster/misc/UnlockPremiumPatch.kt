package app.zdrgon.patches.webvideocaster.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.webvideocaster.shared.Constants.COMPATIBILITY_WEB_VIDEO_CASTER
import app.zdrgon.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.logging.Logger

/**
 * Web Video Caster — Unlock premium.
 *
 * Premium is a purely local decision in 6.1.0. RevenueCat entitlement
 * "Premium" and the Supabase-backed "WVC Premium Account" are merged by
 * the manager Le89; into three StateFlows, and every premium feature
 * (ad removal, ad block, bookmarks, queue, most visited, recent videos,
 * custom search engine, homepage, …) reads that local state. There is
 * no server-served premium content to miss. Forging a Play purchase —
 * the Games In One design — cannot work here: RevenueCat validates
 * receipts on its backend, so instead this patch forces the app's own
 * central premium funnel to report premium.
 *
 * Both feeders (Lhz9;->b for RevenueCat, Lej4;->y for the Premium
 * Account service) converge on the single setter
 * Lv36;->v(Lt79;Ljava/lang/String;)V, which stores the account into
 * Le89;->b and the computed hasPremium Boolean into Le89;->c. Three
 * edits, all in classes6.dex:
 *
 * 1. At the top of Lv36;->v, the incoming PremiumAccount is re-wrapped
 *    in a fresh Lr79; whose entitlement is a new Loc9; ("Yes", the same
 *    object Lhz9;->a builds for an active entitlement; the app itself
 *    constructs Loc9; with null ids/purchase in Le89;-adjacent code).
 *    The original auth user, account mode and source string are kept.
 *    From then on Le89;->b holds a premium account, so every reader —
 *    including the synchronous gate Ltc9;->b/c behind
 *    WebVideoCasterApplication.s() ("Premium user, no need to
 *    initialize ads") — sees the active entitlement.
 *
 * 2. In the same method, the single "has premium = false" assignment
 *    (move v4, v1, where v1 holds 0, right before the Boolean store
 *    into Le89;->c) is replaced with const/4 v4, 0x1, so the
 *    hasPremium flow reports premium regardless of the
 *    account-linking sub-branches in the original computation. An
 *    insert before the valueOf call would be dead code: every real
 *    path reaches that call through a goto, and branch targets bind
 *    to the target instruction, skipping inserted instructions —
 *    verified in the v1.35.0 Desktop output dex and fixed here.
 *
 * 3. Le89;-><init> seeds Le89;->c with Boolean.FALSE; that one
 *    sget-object is flipped to Boolean.TRUE so the flow is premium
 *    from process start and stays premium on the entitlement-Unknown
 *    path, where Lv36;->v returns without storing.
 *
 * Register budget (6.1.0 dex, verified): Lv36;->v has .registers 9 —
 * v6 = this, v7 = PremiumAccount param, v8 = source String param, and
 * v0–v5 are locals that the original body assigns before reading, so
 * the entry wrap may use all of them. The method has no try/catch.
 *
 * PairIP note: the premium classes are plain dex with real bodies —
 * none of the methods above are PairIP-VM stubs. PairIP's separate
 * license layer (classes2.dex LicenseClient.performLocalInstallerCheck)
 * demands installer com.android.vending on a re-signed build, so pair
 * this patch with the "Change installer source" patch, exactly as
 * Gradient Weather requires. Runtime tamper behaviour beyond that
 * local check can only be settled on-device.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks Web Video Caster Premium (ad removal, ad block, bookmarks, queue and the other premium features). No real purchase is made.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WEB_VIDEO_CASTER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        SetPremiumAccountFingerprint.method.apply {
            // Edit 1 — re-wrap the account with a "Yes" entitlement.
            // v0 = auth user (Lub9;), v1 = account mode (Lj89;) are read
            // from the original account before v7 is replaced.
            addInstructions(
                0,
                """
                    invoke-interface {v7}, Lt79;->c()Lub9;
                    move-result-object v0
                    invoke-interface {v7}, Lt79;->a()Lj89;
                    move-result-object v1
                    new-instance v2, Loc9;
                    const/4 v3, 0x0
                    const/4 v4, 0x1
                    invoke-direct {v2, v3, v3, v4, v3}, Loc9;-><init>(Ljava/lang/String;Ljava/lang/String;ZLcom/instantbits/cast/webvideo/premium/PremiumPurchase;)V
                    new-instance v5, Lr79;
                    invoke-direct {v5, v2, v0, v1, v8}, Lr79;-><init>(Lpc9;Lub9;Lj89;Ljava/lang/String;)V
                    move-object v7, v5
                """.trimIndent(),
            )

            // Edit 2 — force the hasPremium Boolean store to true by
            // rewriting the method's one "result = false" move. The
            // Boolean.valueOf argument register identifies the result
            // register; the only plain MOVE into it is the false path.
            val insns = instructions.toList()
            val valueOfIndex = insns.indexOfFirst { insn ->
                val ref = insn.getReference<MethodReference>()
                ref != null && ref.definingClass == "Ljava/lang/Boolean;" && ref.name == "valueOf"
            }
            if (valueOfIndex < 0) {
                throw PatchException("Could not find the Boolean.valueOf store in the premium setter.")
            }
            val valueOf = insns[valueOfIndex] as? Instruction35c
                ?: throw PatchException("Boolean.valueOf call is not a 35c invoke.")
            val resultRegister = valueOf.registerC
            val falseMoves = insns.indices.filter { idx ->
                val insn = insns[idx]
                insn.opcode == Opcode.MOVE &&
                    (insn as? TwoRegisterInstruction)?.registerA == resultRegister
            }
            if (falseMoves.size != 1) {
                throw PatchException("Expected exactly one false assignment to the premium result register, found ${falseMoves.size}.")
            }
            replaceInstruction(falseMoves[0], "const/4 v$resultRegister, 0x1")
        }
        logger.info("Web Video Caster: premium setter now wraps every account as entitled and stores hasPremium = true.")

        // Edit 3 — seed the hasPremium flow with TRUE.
        PremiumManagerInitFingerprint.method.apply {
            val insns = instructions.toList()
            val falseIndex = insns.indexOfFirst { insn ->
                val ref = insn.getReference<FieldReference>()
                ref != null && ref.definingClass == "Ljava/lang/Boolean;" && ref.name == "FALSE"
            }
            if (falseIndex < 0) {
                throw PatchException("Could not find the Boolean.FALSE seed in the premium manager constructor.")
            }
            val register = (insns[falseIndex] as OneRegisterInstruction).registerA
            replaceInstruction(
                falseIndex,
                "sget-object v$register, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;",
            )
        }
        logger.info("Web Video Caster: hasPremium flow now starts as true.")
    }
}
