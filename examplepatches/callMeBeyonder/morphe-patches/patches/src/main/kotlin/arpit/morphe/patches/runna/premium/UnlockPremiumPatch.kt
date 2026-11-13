package arpit.morphe.patches.runna.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import arpit.morphe.patches.runna.shared.Constants.COMPATIBILITY_RUNNA
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Entitlement identifier configured in Runna's RevenueCat dashboard. */
private const val PREMIUM_ENTITLEMENT = "premium"

/** Store SKU reported as the source of the active entitlement. */
private const val PREMIUM_PRODUCT = "runna_annual_2w"

/**
 * Converts a dex register index into the `v`/`p` name used by smali source.
 *
 * Patcher instruction objects expose registers in the method's full frame, while
 * textual smali distinguishes local (`v`) registers from parameter (`p`) registers.
 */
private fun smaliRegisterName(method: Method, index: Int): String {
    val parameterCount = method.parameterTypes.size +
        if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
    val firstParameter = method.implementation!!.registerCount - parameterCount
    return if (index >= firstParameter) "p${index - firstParameter}" else "v$index"
}

/**
 * Unlocks Runna Premium.
 *
 * Runna is React Native and gates its paid surfaces on a RevenueCat entitlement
 * called `premium`. The Hermes bundle only ever sees
 * `customerInfo.entitlements.active.premium` / `.all.premium`, which is produced
 * by RevenueCat's `hybridcommon` bridge — not by Runna's own code. Replacing
 * `EntitlementInfosMapperKt.map()` with a synthetic result makes the JS layer see
 * an active `premium` entitlement, so the premium UI, plan setup and the
 * `isPremium` selectors unlock.
 *
 * Everything happens on-device: RevenueCat caches entitlement data locally and the
 * bridge is fed from that cache, so no request to the RevenueCat API is involved.
 * The backend still reports a non-paying `userProfile.subscriptionStatus`, but it
 * ships the full plan payload and only marks the weeks with a client-side
 * `lockedV3` flag. A second hook rewrites that flag in the GraphQL response, so the
 * plan weeks open without a purchase.
 *
 * Deliberately not patched: `CustomerInfo.getActiveSubscriptions()`. Runna's
 * subscription management screen reads it; spoofing it would misreport the
 * account and can break the "restore purchases" flow without unlocking anything
 * extra.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Reports an active `premium` entitlement to Runna's JavaScript layer, " +
        "clears the backend's client-side plan lock flags and subscription status, " +
        "unlocking premium screens, all plan weeks and the plan footer without a Play " +
        "purchase.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUNNA)

    execute {
        val mapper = EntitlementInfosMapperFingerprint.method

        // The injected body reuses the parameter register (`p0`) as scratch space and
        // needs v0-v3 (including a wide v2/v3 pair), so five registers total. A
        // one-parameter mapper from R8 has seven; fail loudly instead of emitting
        // invalid smali if a future build ever shrinks it.
        val registerCount = mapper.implementation?.registerCount ?: 0
        check(registerCount >= 5) {
            "EntitlementInfosMapperKt.map() has $registerCount registers; the patch " +
                "needs at least 5 to build the entitlement map."
        }

        mapper.addInstructions(
            0,
            """
                new-instance p0, Ljava/util/HashMap;
                invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

                const-string v0, "identifier"
                const-string v1, "$PREMIUM_ENTITLEMENT"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "isActive"
                const/4 v1, 0x1
                invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                move-result-object v1
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "willRenew"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "periodType"
                const-string v1, "NORMAL"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "latestPurchaseDate"
                const-string v1, "2026-01-01T00:00:00.000Z"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "originalPurchaseDate"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "latestPurchaseDateMillis"
                const-wide v2, 0x19b76daa800L
                invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
                move-result-object v1
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "originalPurchaseDateMillis"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "expirationDate"
                const-string v1, "expirationDateMillis"
                const/4 v2, 0x0
                invoke-interface {p0, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                invoke-interface {p0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "store"
                const-string v1, "PLAY_STORE"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "productIdentifier"
                const-string v1, "$PREMIUM_PRODUCT"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "productPlanIdentifier"
                const-string v1, "unsubscribeDetectedAt"
                invoke-interface {p0, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                invoke-interface {p0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "unsubscribeDetectedAtMillis"
                const-string v1, "billingIssueDetectedAt"
                invoke-interface {p0, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                invoke-interface {p0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "billingIssueDetectedAtMillis"
                const/4 v1, 0x0
                invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                move-result-object v1
                const-string v2, "isSandbox"
                invoke-interface {p0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                const/4 v2, 0x0
                invoke-interface {p0, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "ownershipType"
                const-string v1, "PURCHASED"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "verification"
                const-string v1, "VERIFIED"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                new-instance v1, Ljava/util/HashMap;
                invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

                const-string v0, "$PREMIUM_ENTITLEMENT"
                invoke-interface {v1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                new-instance p0, Ljava/util/HashMap;
                invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

                const-string v0, "active"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "all"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                const-string v0, "verification"
                const-string v1, "VERIFIED"
                invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

                return-object p0
            """,
        )

        /*
         * Plan content gate.
         *
         * Even with an active entitlement the backend still tags plan weeks as
         * `lockedV3: { isLocked: true, lockedType: "FREE_TRIAL_LOCKED" }` and reports
         * `subscriptionStatus: FREE_TRIAL` / `subscriptionStatusV2: FREE_USER`
         * because the account has no real Play purchase. The workout data itself is
         * delivered — it is already in the Apollo cache — so the lock is only a
         * rendering flag that the bundle reads from the GraphQL payload. The two
         * subscription fields feed `useFreeUserLockedContent` and the plan footer,
         * which otherwise keeps a "Subscribe to Runna Premium" CTA pinned to the
         * Plan tab even when every week is visible.
         *
         * Expo SDK 54 installs `expo/fetch` as the global `fetch` and Apollo's
         * `HttpLink` passes no custom fetcher, so responses never reach React
         * Native's `NetworkingModule`. `response.text()` is served by Expo's
         * `ExpoFetchModule` text callback, which decodes the collected body bytes as
         * UTF-8 and resolves the JS promise with the resulting string. Rewriting that
         * string flips both lock fields before Apollo parses the JSON.
         */
        val textCallback = ExpoFetchTextResponseFingerprint.method
        val decodeIndex = textCallback.implementation!!.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.INVOKE_DIRECT &&
                instruction.getReference<MethodReference>()?.let { reference ->
                    reference.definingClass == "Ljava/lang/String;" &&
                        reference.name == "<init>" &&
                        reference.parameterTypes == listOf("[B", "Ljava/nio/charset/Charset;")
                } == true
        }
        check(decodeIndex >= 0) {
            "Could not find the Expo fetch UTF-8 body decode."
        }

        // `new String(bytes, charset)` leaves the decoded body in its destination
        // register; the byte-array and charset registers are dead afterwards and can
        // be reused as scratch space for the replacements.
        val decode = textCallback.getInstruction<FiveRegisterInstruction>(decodeIndex)
        val bodyRegister = decode.getRegisterC()
        val bytesRegister = decode.getRegisterD()
        val charsetRegister = decode.getRegisterE()
        check(setOf(bodyRegister, bytesRegister, charsetRegister).size == 3) {
            "Expo fetch text decode uses overlapping registers."
        }

        val body = smaliRegisterName(textCallback, bodyRegister)
        val scratchA = smaliRegisterName(textCallback, bytesRegister)
        val scratchB = smaliRegisterName(textCallback, charsetRegister)

        textCallback.addInstructions(
            decodeIndex + 1,
            """
                const-string $scratchA, "\"isLocked\":true"
                const-string $scratchB, "\"isLocked\":false"
                invoke-virtual {$body, $scratchA, $scratchB}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                move-result-object $body
                const-string $scratchA, "\"lockedType\":\"FREE_TRIAL_LOCKED\""
                const-string $scratchB, "\"lockedType\":\"NOT_LOCKED\""
                invoke-virtual {$body, $scratchA, $scratchB}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                move-result-object $body
                const-string $scratchA, "\"subscriptionStatus\":\"FREE_TRIAL\""
                const-string $scratchB, "\"subscriptionStatus\":\"ACTIVE\""
                invoke-virtual {$body, $scratchA, $scratchB}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                move-result-object $body
                const-string $scratchA, "\"subscriptionStatusV2\":\"FREE_USER\""
                const-string $scratchB, "\"subscriptionStatusV2\":\"PREMIUM\""
                invoke-virtual {$body, $scratchA, $scratchB}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                move-result-object $body
            """,
        )
    }
}
