package arpit.morphe.patches.movieboxtv.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import arpit.morphe.patches.movieboxtv.shared.Constants.COMPATIBILITY_MOVIEBOX_TV
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n

/**
 * Replaces the body of a `()Z` / `()Ljava/lang/Boolean;` getter with a constant.
 *
 * All targets are Kotlin data-class accessors compiled to `.registers 2`
 * (`v0` + `p0`), so `v0` is always a free local.
 */
private fun MutableMethod.returnConstant(value: Boolean, objectType: Boolean) {
    addInstructions(
        0,
        if (objectType) {
            val field = if (value) "TRUE" else "FALSE"
            """
                sget-object v0, Ljava/lang/Boolean;->$field:Ljava/lang/Boolean;
                return-object v0
            """
        } else {
            val literal = if (value) "0x1" else "0x0"
            """
                const/4 v0, $literal
                return v0
            """
        },
    )
}

/**
 * Unlocks the account's VIP features and removes the two server-side blocks that sit next to
 * them in the response beans:
 *
 * 1. the account is reported as VIP — `BffGetVipUserInfoData.isVip()` and the older
 *    `BffUserInfoData.isVip()`,
 * 2. the per-title VIP locks are cleared — `BffSubjectInfo`, `BffShortTvInfo`,
 *    `BffOperatingSubject`, `BffActorWorkItem` and `BffSearchRankSubject` all report
 *    `isVip = false`,
 * 3. `BffVisitorLoginData.getRegionBlock()` answers `false`, so the region-locked player and
 *    the "not available in your region" dialog stay closed,
 * 4. the data layer's own VIP `StateFlow` starts as VIP and ignores every later server write,
 *    which is what the player's resolution gate reads: while it was false, choosing 4K/1080p
 *    opened the VIP pay page instead of switching the stream, and the saved resolution was
 *    cleared on every playback.
 *
 * These are response beans read by the UI layer; the play-info endpoints keep their own
 * entitlement fields, so a title can still be refused by the backend.
 */
@Suppress("unused")
val unlockVipPatch = bytecodePatch(
    name = "Unlock VIP",
    description = "Reports the account as VIP, clears the per-title VIP locks and removes the " +
        "visitor region block.",
) {
    compatibleWith(COMPATIBILITY_MOVIEBOX_TV)

    execute {
        // Account flags: the app must see a VIP user.
        VipUserInfoFingerprint.method.returnConstant(value = true, objectType = true)
        UserInfoVipFingerprint.method.returnConstant(value = true, objectType = true)

        // Title flags: content must not be marked as VIP-only.
        SubjectVipFingerprint.method.returnConstant(value = false, objectType = false)
        ShortTvVipFingerprint.method.returnConstant(value = false, objectType = true)
        OperatingSubjectVipFingerprint.method.returnConstant(value = false, objectType = false)
        ActorWorkVipFingerprint.method.returnConstant(value = false, objectType = false)
        SearchRankSubjectVipFingerprint.method.returnConstant(value = false, objectType = false)

        // Region lock.
        RegionBlockFingerprint.method.returnConstant(value = false, objectType = true)

        // Player resolution gate. `TvPlayerSettingsPanel` sends the user to the VIP pay page
        // when the chosen option is premium and the data layer's VIP state is false, so a
        // bean-only VIP unlock leaves 4K/1080p selected but never applied. Force the state
        // reader and pin the state itself, so a server refresh cannot switch it back.
        VipStateFingerprint.method.returnConstant(value = true, objectType = false)

        val vipStateWriter = VipStateWriterFingerprint.method
        vipStateWriter.addInstruction(
            0,
            BuilderInstruction11n(Opcode.CONST_4, vipStateWriter.p0Register + 1, 1),
        )
    }
}
