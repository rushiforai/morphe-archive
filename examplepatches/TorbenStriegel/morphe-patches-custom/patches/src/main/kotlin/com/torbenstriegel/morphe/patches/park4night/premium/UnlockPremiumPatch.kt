package com.torbenstriegel.morphe.patches.park4night.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.torbenstriegel.morphe.patches.shared.Constants.COMPATIBILITY_PARK4NIGHT

/**
 * Unlocks Park4Night premium (Pro) access.
 *
 * Ported from rushiranpise/morphe-patches (Park4NightUnlockPremiumPatch.kt).
 *
 * App: fr.tramb.park4night 7.1.62, native Kotlin/Java, Google Play Billing +
 * server-side validation, R8/ProGuard obfuscated.
 *
 * Premium gate architecture:
 *
 * Layer 1 — User model (J1/n) runtime gates:
 *   canAccessPro() -> isPro() || isAmbassador() || isAdmin()   (primary gate)
 *   isPro()        -> subscriptionEndDate != null && isFutureDate(subscriptionEndDate)
 * Layer 2 — ProStatePreference (persisted DataStore getters):
 *   isPro() / isPub() / isPubDetail() / isMonthlySubscribed() / isYearlySubscribed()
 *
 * Each gate is replaced with `const/4 v0, 0x1; return v0`.
 *
 * The obfuscated user class (J1/n) name is version-bound and must be re-verified on
 * every bump; the ProStatePreference class name is not obfuscated and is stable.
 */
private const val USER_CLASS = "LJ1/n;"
private const val PRO_STATE_PREF_CLASS =
    "Lcom/park4night/p4nsharedlayers/data/datasources/local/dto/ProStatePreference;"

// J1/n.canAccessPro() — root premium gate
// Calls isPro() then isAmbassador() then isAdmin() internally.
object CanAccessProFingerprint : Fingerprint(
    definingClass = USER_CLASS,
    name = "canAccessPro",
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = USER_CLASS, name = "isPro"),
        methodCall(definingClass = USER_CLASS, name = "isAmbassador"),
        methodCall(definingClass = USER_CLASS, name = "isAdmin"),
    ),
)

// J1/n.isPro() — date-based subscription check
object IsProFingerprint : Fingerprint(
    definingClass = USER_CLASS,
    name = "isPro",
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = USER_CLASS, name = "isFutureDate"),
    ),
)

// ProStatePreference getters — persisted subscription flags
object ProStatePrefIsProFingerprint : Fingerprint(
    definingClass = PRO_STATE_PREF_CLASS,
    name = "isPro",
    returnType = "Z",
    parameters = emptyList(),
)

object ProStatePrefIsPubFingerprint : Fingerprint(
    definingClass = PRO_STATE_PREF_CLASS,
    name = "isPub",
    returnType = "Z",
    parameters = emptyList(),
)

object ProStatePrefIsPubDetailFingerprint : Fingerprint(
    definingClass = PRO_STATE_PREF_CLASS,
    name = "isPubDetail",
    returnType = "Z",
    parameters = emptyList(),
)

object ProStatePrefIsMonthlyFingerprint : Fingerprint(
    definingClass = PRO_STATE_PREF_CLASS,
    name = "isMonthlySubscribed",
    returnType = "Z",
    parameters = emptyList(),
)

object ProStatePrefIsYearlyFingerprint : Fingerprint(
    definingClass = PRO_STATE_PREF_CLASS,
    name = "isYearlySubscribed",
    returnType = "Z",
    parameters = emptyList(),
)

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks Park4Night premium (Pro) access, removing all feature gates " +
        "for offline maps, advanced filters, and publisher content.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PARK4NIGHT)

    execute {
        val trueInstructions = "const/4 v0, 0x1\nreturn v0"

        // Layer 1 — User model runtime gates
        for (fingerprint in listOf(CanAccessProFingerprint, IsProFingerprint)) {
            fingerprint.method.apply {
                removeInstructions(0, instructions.count())
                addInstructions(0, trueInstructions)
            }
        }

        // Layer 2 — Persisted ProStatePreference gates
        for (fingerprint in listOf(
            ProStatePrefIsProFingerprint,
            ProStatePrefIsPubFingerprint,
            ProStatePrefIsPubDetailFingerprint,
            ProStatePrefIsMonthlyFingerprint,
            ProStatePrefIsYearlyFingerprint,
        )) {
            fingerprint.method.apply {
                removeInstructions(0, instructions.count())
                addInstructions(0, trueInstructions)
            }
        }
    }
}
