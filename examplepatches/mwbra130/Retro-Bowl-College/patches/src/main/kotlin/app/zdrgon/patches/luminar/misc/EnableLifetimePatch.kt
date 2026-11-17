package app.zdrgon.patches.luminar.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.zdrgon.patches.luminar.shared.Constants.COMPATIBILITY_LUMINAR
import app.zdrgon.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.util.logging.Logger

private const val STORE_CLASS = "Ls57;"
private const val HELPER_NAME = "morpheForceLifetime"
private const val HELPER_REFERENCE = "Ls57;->morpheForceLifetime(Llka;)Llka;"

/**
 * Luminar — Enable Lifetime.
 *
 * Luminar sells Lifetime ($69.99 one-time) and Yearly
 * ($29.99/yr). Entitlement is served by Adapty: its backend
 * validates receipts and serves the profile, but no
 * server-computed premium flag is ever read — Skylum code
 * derives the whole gate locally from the profile. The store
 * (Ls57;) holds a StateFlow of UserPaymentData (Llka;) whose
 * isPremium / isPrime / planType fields feed ~24 feature and UI
 * readers, and Superwall's entitlement set is only a mirror of
 * that state (see Fingerprints.kt for the full derivation map).
 *
 * Step 1 (getter pins): every derivation — Ls9;->d, the store's
 * own profile callbacks Le57;/Lf57;, the Superwall purchase
 * controller Lw9; — funnels through the premium access level's
 * two DTO getters: the level (IDs "premium" / "premium&prime")
 * counts when isActive() is true, and the plan is Lifetime when
 * isLifetime() is true. This patch pins both getters to true,
 * plus AdaptyProfile$Subscription.isActive() so primeSku and the
 * persisted has_store_prime_subscription flag light up too.
 *
 * Step 2 (sink pin, added in round 2): the getter pins cannot
 * help when a never-purchaser Adapty profile lacks the "premium"
 * access-level entry entirely — Ls9;->a / Ls57;->a then return
 * null and the derivation produces isPremium = false regardless
 * (on-device v1.79.16: paywall stayed, Restore Purchase did
 * nothing). So the patch also adds a public static helper,
 * Ls57;->morpheForceLifetime(Llka;)Llka;, which rebuilds any
 * UserPaymentData through its 11-argument constructor with
 * isPremium = 1, isPrime = 1, primeSku =
 * "com.skylum.luminarandroid.prime_notrial" and planType =
 * Lag7;->c (LIFETIME), copying every other field, and runs it
 * at all three points where a UserPaymentData enters the
 * store's StateFlow (census in Fingerprints.kt):
 *   - prepended to the sink Ls57;->n, so the StateFlow set and
 *     the is_last_known_premium persistence in its body both see
 *     the forced values (covers the StoreProfile path, the
 *     Luwa;->a startup seed, and the account-license merges);
 *   - right after the Llka; construction inside Le57;->onResult
 *     (getProfile callback) and Lf57;->onResult
 *     (restorePurchases callback), which write the flow directly
 *     and bypass the sink.
 * The patch creates no purchase and touches nothing in Adapty's
 * networking or billing; it only changes what the local code
 * derives and stores.
 */
@Suppress("unused")
val enableLifetimePatch = bytecodePatch(
    name = "Enable Lifetime",
    description = "Turns on Lifetime permanently: every premium feature unlocks as if the one-time Lifetime purchase (Mobile + Web) were bought, and stays on across restarts.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LUMINAR)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        val returnTrue =
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()

        AccessLevelIsActiveFingerprint.method.addInstructions(0, returnTrue)
        logger.info("Luminar: AdaptyProfile.AccessLevel.isActive pinned to true.")

        AccessLevelIsLifetimeFingerprint.method.addInstructions(0, returnTrue)
        logger.info("Luminar: AdaptyProfile.AccessLevel.isLifetime pinned to true (planType derives LIFETIME).")

        SubscriptionIsActiveFingerprint.method.addInstructions(0, returnTrue)
        logger.info("Luminar: AdaptyProfile.Subscription.isActive pinned to true (primeSku / persisted Prime state).")

        // ── Round 2: force the value at the store's write points ──

        // The rebuild helper, added to the store class itself. Its
        // own implementation has 16 registers (the sink method has
        // only 6 — too few to stage the 11-argument constructor
        // call inline — so the rebuild lives here and the write
        // points just call it). Constructor argument order is the
        // Llka; field order a..k; c/d/e/j are forced, the rest are
        // copied from the incoming object. Field references use
        // the colon form the inline smali parser requires.
        val helper = ImmutableMethod(
            STORE_CLASS,
            HELPER_NAME,
            listOf(ImmutableMethodParameter("Llka;", null, null)),
            "Llka;",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(16),
        ).toMutable().apply {
            addInstructionsWithLabels(
                0,
                """
                    iget-object v1, p0, Llka;->a:Ljava/lang/String;
                    iget-object v2, p0, Llka;->b:Ljava/lang/String;
                    const/4 v3, 0x1
                    const/4 v4, 0x1
                    const-string v5, "com.skylum.luminarandroid.prime_notrial"
                    iget-boolean v6, p0, Llka;->f:Z
                    iget-object v7, p0, Llka;->g:Lji5;
                    iget-boolean v8, p0, Llka;->h:Z
                    iget-object v9, p0, Llka;->i:Ljava/lang/String;
                    sget-object v10, Lag7;->c:Lag7;
                    iget-object v11, p0, Llka;->k:Ljava/time/Instant;
                    new-instance v0, Llka;
                    invoke-direct/range {v0 .. v11}, Llka;-><init>(Ljava/lang/String; Ljava/lang/String; Z Z Ljava/lang/String; Z Lji5; Z Ljava/lang/String; Lag7; Ljava/time/Instant;)V
                    return-object v0
                """.trimIndent()
            )
        }
        StoreSinkFingerprint.classDef.methods.add(helper)
        logger.info("Luminar: added $HELPER_REFERENCE rebuild helper to the store.")

        // The sink: rebuild the incoming value at entry, so the
        // original body (StateFlow compareAndSet + the
        // is_last_known_premium persistence read of field c) sees
        // the forced values. p1 is the UserPaymentData parameter.
        StoreSinkFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p1}, $HELPER_REFERENCE
                move-result-object p1
            """.trimIndent()
        )
        logger.info("Luminar: store sink Ls57;->n now forces Lifetime on every value.")

        // The two callbacks that bypass the sink: each builds its
        // UserPaymentData with one Llka; <init> call and writes it
        // into the flow itself. Rebuild the constructed object in
        // place, immediately after its constructor returns, before
        // it is wrapped in Ll47; and pushed into the flow.
        fun forceAfterConstruction(fingerprint: Fingerprint, label: String) {
            val method = fingerprint.method
            val insns = method.instructionsOrNull?.toList()
                ?: throw PatchException("Luminar: $label has no instructions to patch.")
            val matches = insns.withIndex().filter { (_, insn) ->
                if (insn.opcode != Opcode.INVOKE_DIRECT && insn.opcode != Opcode.INVOKE_DIRECT_RANGE) {
                    return@filter false
                }
                val reference = insn.getReference<MethodReference>() ?: return@filter false
                reference.definingClass == "Llka;" && reference.name == "<init>"
            }
            if (matches.size != 1) {
                throw PatchException(
                    "Luminar: expected exactly one Llka; <init> call in $label, found ${matches.size}."
                )
            }
            val (index, insn) = matches.single()
            val register = when (insn) {
                is Instruction3rc -> insn.startRegister
                is Instruction35c -> insn.registerC
                else -> throw PatchException("Luminar: unexpected Llka; <init> instruction format in $label.")
            }
            method.addInstructions(
                index + 1,
                """
                    invoke-static {v$register}, $HELPER_REFERENCE
                    move-result-object v$register
                """.trimIndent()
            )
            logger.info("Luminar: $label now forces Lifetime on its constructed UserPaymentData (v$register).")
        }

        forceAfterConstruction(GetProfileCallbackFingerprint, "getProfile callback Le57;->onResult")
        forceAfterConstruction(RestorePurchasesCallbackFingerprint, "restorePurchases callback Lf57;->onResult")
    }
}
