package app.zdrgon.patches.rainviewer.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.rainviewer.shared.Constants
import app.zdrgon.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import java.util.logging.Logger

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks RainViewer Pro. Use with Change installer source.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        // Purchases are server-verified (mobile/verify/android/) and the
        // premium status is server-sourced, so a forged Play purchase cannot
        // work. But every gate below the status sync is local: the sync's
        // result becomes the UserPremiumStatus enum (Lhw7;), is written to
        // the "premium"/"premium_v1" prefs, and is pushed into the feature
        // state holder (Leh5;) that all gates read. Pin the status at its
        // two sources to the PRO value, Lhw7;->e (the "pro"/V2 constant).

        // Server path: Ltw7;->g fetches mobile/purchases/android/actual and
        // its non-null result wins the sync. Return PRO before any network
        // code runs — returning a value directly is the normal
        // non-suspending completion for a suspend function, so callers'
        // state machines handle it unchanged.
        ServerPremiumStatusFingerprint.method.addInstructions(
            0,
            "sget-object v0, Lhw7;->e:Lhw7;\n" +
                "return-object v0",
        )
        logger.info("RainViewer: server premium status pinned to PRO.")

        // Local path: Ltw7;->e computes the status from Play Billing, then
        // persists and returns it. The computed status lands in a register
        // at a CHECK_CAST to Lhw7;, just before the "premium_v1" pref write.
        // Overwrite that register with PRO there, so the method itself
        // writes premium=true (V2 has ordinal 2) and returns PRO, with every
        // other side effect of the method left intact.
        LocalPremiumStatusFingerprint.method.run {
            val insns = instructions.toList()
            val stringIndex = insns.indexOfFirst {
                it.getReference<StringReference>()?.string == "premium_v1"
            }
            if (stringIndex < 0) {
                throw PatchException("Could not find the premium_v1 pref write in the local status method.")
            }
            val castIndex = (0 until stringIndex).lastOrNull { idx ->
                insns[idx].opcode == Opcode.CHECK_CAST &&
                    insns[idx].getReference<TypeReference>()?.type == "Lhw7;"
            } ?: throw PatchException("Could not find the status check-cast in the local status method.")
            val register = (insns[castIndex] as OneRegisterInstruction).registerA
            addInstruction(castIndex + 1, "sget-object v$register, Lhw7;->e:Lhw7;")
        }
        logger.info("RainViewer: local premium status pinned to PRO.")

        // Chokepoint pin, added after the first on-device test: integrity
        // passed but premium still showed FREE. The tw7 sync is not the
        // only writer of the feature state — a prefs-restore collector
        // (Lv24;) re-applies the persisted status int directly into
        // Leh5;->j, bypassing tw7, and Leh5;->h skips its delegate call
        // when the incoming status equals the current one. Every status
        // application in the app funnels through Leh5;->j, so overwrite
        // the status parameter at the entry of both j and h: whatever any
        // caller computed, PRO is what gets applied to the flows every
        // gate reads.
        //
        // Both methods have descriptor (Lft0;Lhw7;Z)Ljava/lang/Object;
        // with all single-width parameters, so the status parameter is
        // the second-to-last register (registerCount - 2): v11 of 13 in
        // j, v6 of 8 in h — verified against the dex.
        listOf(FeatureStatusApplyFingerprint, FeatureStatusUpdateFingerprint).forEach { fingerprint ->
            fingerprint.method.run {
                val registerCount = implementation?.registerCount
                    ?: throw PatchException("Feature status method has no implementation.")
                addInstruction(0, "sget-object v${registerCount - 2}, Lhw7;->e:Lhw7;")
            }
        }
        logger.info("RainViewer: feature status apply pinned to PRO.")
    }
}
