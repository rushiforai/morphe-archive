package dev.hyzor.patches.duolingo.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// Matches LoggedInState.toString(); the state object that wraps the signed-in User.
object LoggedInStateFingerprint : Fingerprint(
    strings = listOf("LoggedIn(user=", ")"),
)

// Matches User.toString().
object UserFingerprint : Fingerprint(
    strings = listOf("User(adsConfig=", ", id=", ", betaStatus="),
)

/**
 * The helper that reads the user's "paid" bit. It is a public static `(User, L…)Z` that starts
 * with `getClass()` and immediately reads the boolean `User` field (`z22.k(User, f9d)Z` in
 * 6.104.3, the field is `R0`). The field is computed rather than serialized, which is why it is
 * located through its usage instead of the serializer's field names.
 *
 * `MatchFirst` + `MatchAfterImmediately` pin that exact two-instruction shape: the other public
 * static `(User, …)Z` helper (`Ljev.f`) also calls `getClass()`, but only after a second
 * `getClass()` call, so it does not match.
 *
 * The second parameter is `"L"` in the fingerprint: Morphe matches parameter types with
 * `startsWith`, so that pins "some reference type" without pinning the obfuscated holder class.
 */
object UserIsPaidFieldUsageFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Lcom/duolingo/data/user/User;", "L"),
    filters = listOf(
        methodCall(name = "getClass", location = InstructionLocation.MatchFirst()),
        fieldAccess(
            definingClass = "Lcom/duolingo/data/user/User;",
            type = "Z",
            location = InstructionLocation.MatchAfterImmediately(),
        ),
    ),
)

/**
 * `MaxHooksUserData` reads the user's "MAX" bit in its constructor (`Q0` in 6.104.3).
 */
object UserHasGoldFieldUsageFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        strings = listOf("MaxHooksUserData(isAdmin="),
    ),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/duolingo/data/user/User;",
            type = "Z",
        ),
    ),
)

/**
 * A check of `SubscriptionFeatureGroup.contains(SubscriptionFeatures.<feature>)`. The matched
 * `move-result` is the boolean the caller branches on; MAX mode forces it to true.
 */
fun getFeatureFingerprint(feature: String) = Fingerprint(
    filters = listOf(
        fieldAccess(
            name = feature,
            definingClass = "Lcom/duolingo/data/subscription/models/SubscriptionFeatures;",
        ),
        methodCall(
            name = "contains",
            location = InstructionLocation.MatchAfterImmediately(),
        ),
        opcode(Opcode.MOVE_RESULT, InstructionLocation.MatchAfterImmediately()),
    ),
)

/**
 * Locates the field behind `VideoCallTabCtaButtonState`'s upsell eligibility flag by the label
 * printed by its `toString()`, then the boolean read that follows it.
 */
fun getVideoCallTabCtaButtonStateFieldFingerprint(field: String): Fingerprint {
    return Fingerprint(
        strings = listOf("VideoCallTabCtaButtonState(userHasMax="),
        filters = listOf(
            string(field),
            // `const-string` / `append` / `iget-boolean` / `append` in 6.104.3.
            opcode(Opcode.IGET_BOOLEAN, InstructionLocation.MatchAfterAnywhere()),
        ),
    )
}

/**
 * `EnergyConfig.<init>(current, max, …)` in 6.104.3: the primary constructor, which the app uses
 * when it updates the energy config. Its first two parameters are the current and maximum energy.
 */
object EnergyConfigCtorFingerprint : Fingerprint(
    definingClass = "Lcom/duolingo/core/energy/models/EnergyConfig;",
    name = "<init>",
    parameters = listOf("I", "I", "J", "J", "J", "I", "J", "Ljava/lang/Integer;"),
)

/**
 * The synthetic Kotlin default-arguments constructor that the Kotlinx serializer calls when it
 * deserializes an `EnergyConfig`. The leading `I` is the default-arguments mask, so the current
 * and maximum energy are p2 and p3 (not p1 and p2 as in the primary constructor).
 */
object EnergyConfigSerializationCtorFingerprint : Fingerprint(
    definingClass = "Lcom/duolingo/core/energy/models/EnergyConfig;",
    name = "<init>",
    parameters = listOf("I", "I", "I", "J", "J", "J", "I", "J", "Ljava/lang/Integer;", "Z"),
)
