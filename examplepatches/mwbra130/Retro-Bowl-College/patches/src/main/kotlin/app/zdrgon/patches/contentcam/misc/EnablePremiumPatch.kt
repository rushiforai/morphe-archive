package app.zdrgon.patches.contentcam.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.contentcam.shared.Constants.COMPATIBILITY_CONTENTCAM
import app.zdrgon.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import java.util.logging.Logger

/**
 * ContentCam — Enable Premium.
 *
 * ContentCam sells Premium three ways: a monthly subscription
 * ($3.99/mo), an annual subscription ($14.99/yr, 7-day trial) and a
 * one-time "Lifetime" product ($44.99) — Play Billing products
 * "contentcam_premium_sub" and "contentcam_premium" (the Lifetime
 * one). Locally there is no tier and no expiry: the dev's billing
 * manager (Ls03;) keeps Premium as a single boolean — field d,
 * exposed to the UI as the StateFlow in field f and persisted as
 * SharedPreferences "premium"/"entitled" — and the root composable
 * collects that one flow and threads the boolean through every
 * Premium gate in the app (Front/Back, Photos, 4K, 60fps, manual
 * controls, teleprompter, timelapse, unlimited projects, trim in
 * review). A purchase is verified on-device (RSA signature check
 * against the embedded Play license key); nothing is validated by
 * a server.
 *
 * The boolean is produced at exactly one point: Ls03;->m(Z)V,
 * which stores its argument to the field, to prefs and into the
 * flow. Its callers are the purchase handler (true, after
 * verification) and the restore sync that re-derives the flag from
 * Play's purchase list at every launch — the sync that writes
 * false again when no purchase comes back.
 *
 * This patch forces m's argument to true (v3 is the boolean
 * parameter register; the method's first instruction stores it),
 * so every sync persists "entitled" = true through the app's own
 * write path — exactly the state a genuine Lifetime purchase
 * produces, with the Lifetime tier's permanence, because the only
 * writer that can store false can now only store true.
 *
 * It also forces the constructor's persisted-state store: the
 * getBoolean("entitled") result is overwritten with true just
 * before it is stored into d, so the StateFlow is seeded true and
 * the app is Premium from the first frame, before any billing
 * sync runs (and even if Play services are unreachable).
 *
 * The patch creates no purchase and touches nothing in the
 * billing library; it only changes the answer the app's own
 * entitlement writer stores.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Turns on Premium permanently (Front/Back, Photos, 4K, 60fps, manual controls, teleprompter, timelapse, unlimited projects, trim in review), as if the one-time Lifetime purchase were bought.",
    default = true
) {
    compatibleWith(COMPATIBILITY_CONTENTCAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        // Producer pin: m(Z) can only ever store true.
        EntitledStateWriterFingerprint.method.addInstructions(
            0,
            """
                const/4 v3, 0x1
            """.trimIndent()
        )
        logger.info("ContentCam: Premium state writer pinned (Ls03;->m(Z) always stores true).")

        // Constructor seed: the persisted "entitled" read is forced
        // to true at the store into d, so the flow starts true.
        BillingManagerConstructorFingerprint.method.run {
            val insns = instructions.toList()
            val storeIndex = insns.indexOfFirst {
                it.opcode == Opcode.IPUT_BOOLEAN &&
                    it.getReference<FieldReference>()?.let { ref ->
                        ref.definingClass == "Ls03;" && ref.name == "d" && ref.type == "Z"
                    } == true
            }
            if (storeIndex < 0) {
                throw PatchException("Could not find the persisted entitled store in the Ls03; constructor.")
            }
            val register = (insns[storeIndex] as TwoRegisterInstruction).registerA
            val constOpcode = if (register <= 15) "const/4" else "const/16"
            addInstruction(storeIndex, "$constOpcode v$register, 0x1")
            logger.info("ContentCam: Premium flow seeded true in the Ls03; constructor (register v$register).")
        }
    }
}
