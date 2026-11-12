package app.template.patches.materialcapsule.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.materialcapsule.BillingProductsFingerprint
import app.template.patches.materialcapsule.ProStoreDecryptFingerprint
import app.template.patches.shared.Constants.MATERIAL_CAPSULE_COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags

/** True if [type] is a FlowCollector-style interface: abstract + a single 2-arg
 *  `(Object, Continuation)Object` method. */
private fun BytecodePatchContext.isCollectorInterface(type: String): Boolean {
    val cd = mutableClassDefByOrNull(type) ?: return false
    if (!AccessFlags.INTERFACE.isSet(cd.accessFlags)) return false
    return cd.methods.any {
        AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
            it.parameters.size == 2 &&
            it.returnType == "Ljava/lang/Object;"
    }
}

/**
 * Unlocks Material Capsule Pro **client-side**.
 *
 * Recon result (see docs/materialcapsule.md): the entitlement is *not* server-validated.
 * It lives entirely on the device:
 *
 *  • `u40.b(...)` asks Google Play (`queryPurchasesAsync`) whether the account owns any
 *    of the app's products and returns that boolean.
 *  • The boolean is encrypted with an AndroidKeyStore AES key (alias `pro_version_key`)
 *    and persisted in DataStore under `SECURE_DATA` by `uu1.e(Z, …)`.
 *  • Every consumer reads it back through `uu1.c(Continuation)Object` (one-shot) or the
 *    `uu1`-backed Flow `qu1` (`qu1.a(collector, Continuation)`), which feeds the main
 *    `wt4.i` pro flow the Compose UI collects.
 *
 * There is **no** server entitlement call — the only network check in this area is Play
 * Integrity (anti-tamper, `uv3`/`nv3`), which merely forces the *local* pro read to
 * `false` when the device fails verification; it never re-issues or validates the
 * subscription. So both local read paths are forced to `true`:
 *
 *  1. **[ProStoreDecryptFingerprint]** → the secure store class's one-shot
 *     `c(Continuation)Object` read returns `Boolean.TRUE`.
 *  2. the Flow source class (`qu1`: holds a pro-store field and collects via a
 *     `(collector, Continuation)Object` method) is patched to emit `Boolean.TRUE`
 *     downstream — this is the path the Compose UI collects.
 *  3. **[BillingProductsFingerprint]** → the purchase predicate `b(...)` returns
 *     `Boolean.TRUE`, so the app's own refresh also writes `"yes"` into its store.
 *
 * Nothing is faked against Google Play and no purchase is fabricated — only the *local*
 * predicate/reads answer yes. Restore-purchase and real purchases still work.
 */
@Suppress("unused")
val materialCapsuleMockProPatch = bytecodePatch(
    name = "Mock Pro (client-side)",
    description = "Forces the client-side Pro entitlement (custom colors, card/anim " +
        "controls, full-size player, app search, widgets, gestures). Material Capsule's " +
        "premium is a local flag derived from a Play purchase query and stored " +
        "AES-encrypted on-device — it is NOT server-re-validated, so the whole set opens. " +
        "No purchase is fabricated; real purchases and restore still work.",
    default = true,
) {
    compatibleWith(MATERIAL_CAPSULE_COMPATIBILITY)

    val returnTrue = "sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;\n" +
        "return-object v0"

    execute {
        // ── 1. Secure pro store: identify the store class via its decrypt helper ──────
        val storeDef = ProStoreDecryptFingerprint.matchOrNull()?.originalClassDef
            ?: error("Pro store class not found (ProStoreDecryptFingerprint)")
        val storeType = storeDef.type

        // One-shot read: uu1.c(Continuation)Object → Boolean.TRUE
        mutableClassDefBy(storeType).methods
            .first {
                it.name == "c" &&
                    it.parameters.size == 1 &&
                    it.returnType == "Ljava/lang/Object;"
            }
            .addInstructions(0, returnTrue)

        // ── 2. Pro Flow source: qu1.a(collector, Continuation)Object → emit TRUE ──────
        // The flow class is the one holding a pro-store field and collecting via a
        // (collector-interface, Continuation) method. Its own register frame is small
        // enough that p1/p2 are addressable from inline smali (unlike pu1.d).
        var flowType: String? = null
        classDefForEach { cd ->
            if (flowType != null) return@classDefForEach
            val holdsStore = cd.fields.any { it.type == storeType }
            val collects = cd.methods.any {
                it.parameters.size == 2 &&
                    it.returnType == "Ljava/lang/Object;" &&
                    isCollectorInterface(it.parameters[0].type)
            }
            if (holdsStore && collects) flowType = cd.type
        }
        val ft = flowType ?: error("Pro flow class not found")
        val collect = mutableClassDefBy(ft).methods.first {
            it.parameters.size == 2 &&
                it.returnType == "Ljava/lang/Object;" &&
                isCollectorInterface(it.parameters[0].type)
        }
        val collectorType = collect.parameters[0].type      // the FlowCollector interface
        val contType = collect.parameters[1].type           // the Continuation
        // The collector's emit method (single abstract method on that interface).
        val emitName = mutableClassDefBy(collectorType).methods
            .first { it.parameters.size == 2 && it.returnType == "Ljava/lang/Object;" }
            .name
        collect.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-interface {p1, v0, p2}, $collectorType->$emitName(Ljava/lang/Object;$contType)Ljava/lang/Object;
                move-result-object v0
                return-object v0
            """.trimIndent(),
        )

        // ── 3. Purchase predicate: u40.b(u40, Continuation)Object → Boolean.TRUE ──────
        BillingProductsFingerprint.matchOrNull()
            ?.let { match ->
                val billingType = match.originalClassDef.type
                mutableClassDefBy(billingType).methods
                    .firstOrNull {
                        it.name == "b" &&
                            it.parameters.size == 2 &&
                            it.returnType == "Ljava/lang/Object;" &&
                            it.parameters[0].type == billingType
                    }
                    ?.addInstructions(0, returnTrue)
            }
    }
}
