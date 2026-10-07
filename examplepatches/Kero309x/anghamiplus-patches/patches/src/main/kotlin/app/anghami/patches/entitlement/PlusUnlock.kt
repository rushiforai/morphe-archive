package app.anghami.patches.entitlement

import app.anghami.patches.core.AnghamiTarget
import app.anghami.patches.core.forceFalse
import app.anghami.patches.core.forceTrue
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Presents the signed-in account as a Plus subscriber to every local check.
 *
 * The account flags `isPlus` and `isPlusUser` are pinned to `true`, the switch
 * that re-enables player restrictions is pinned to `false`, and the queue gate
 * `canPlayOfflineAndFree` is pinned to `true`. The two plan accessors of the
 * account proto answer `"Plus"` instead of the value received from the backend.
 *
 * This unlocks the client-side Plus surfaces — the download manager gate, the
 * settings entries and the player/queue branches that test the subscriber flag,
 * plus the quality selector in the UI.
 *
 * Nothing server-side is bypassed: stream and download URLs, licence checks,
 * the plan type returned by the authentication endpoint and the premium-account
 * playback errors remain enforced by the backend.
 */
@Suppress("unused")
val plusUnlockPatch = bytecodePatch(
    name = "Unlock Plus Experience",
    description = "Enables client-side Plus features, eliminates free-tier playback restrictions, and enables offline UI mode.",
    default = true,
) {
    compatibleWith(AnghamiTarget.COMPATIBILITY)

    execute {
        IsPlusSignature.method.forceTrue()
        IsPlusUserSignature.method.forceTrue()
        EnablePlayerRestrictionsSignature.method.forceFalse()

        // The original body already answers `false`; prepending `return true`
        // makes it unreachable.
        CanPlayOfflineAndFreeSignature.method.forceTrue()

        GetPlanTypeSignature.method.addInstructions(
            0,
            """
                const-string v0, "Plus"
                return-object v0
            """
        )

        GetPlanSignature.method.addInstructions(
            0,
            """
                const-string v0, "Plus"
                return-object v0
            """
        )
    }
}

/** `Account.isPlus()` — static subscriber flag of the account. */
object IsPlusSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/local/Account;",
    name = "isPlus",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/ghost/local/Account;",
            name = "getBooleanAttribute",
        ),
    )
)

/** `Account.isPlusUser()` — instance subscriber flag of the account. */
object IsPlusUserSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/local/Account;",
    name = "isPlusUser",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/anghami/ghost/local/Account\$PlanType;->PLAN_TYPE_PLUS:Lcom/anghami/ghost/local/Account\$PlanType;"
        ),
        fieldAccess(
            smali = "Lcom/anghami/ghost/local/Account\$PlanType;->PLAN_TYPE_FREE_TRIAL:Lcom/anghami/ghost/local/Account\$PlanType;"
        ),
        methodCall(
            definingClass = "Ljava/lang/String;",
            name = "equals",
        ),
    )
)

/** `Account.enablePlayerRestrictions()` — re-enables the free-tier player limits. */
object EnablePlayerRestrictionsSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/local/Account;",
    name = "enablePlayerRestrictions",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/ghost/local/Account;",
            name = "getBooleanAttribute",
        ),
    )
)

/** `PlayQueue.canPlayOfflineAndFree()` — gate for offline and free queue playback. */
object CanPlayOfflineAndFreeSignature : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "canPlayOfflineAndFree",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        opcode(Opcode.CONST_4),
        opcode(Opcode.RETURN),
    )
)

/** `ProtoAccount$Account.getPlanType()` — subscription plan type accessor. */
object GetPlanTypeSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/model/proto/ProtoAccount\$Account;",
    name = "getPlanType",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

/** `ProtoAccount$Account.getPlan()` — subscription plan name accessor. */
object GetPlanSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/model/proto/ProtoAccount\$Account;",
    name = "getPlan",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)
