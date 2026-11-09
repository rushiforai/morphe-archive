package app.polishapps.patches.vulcan.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.polishapps.patches.shared.Constants.COMPATIBILITY_VULCAN
import app.polishapps.patches.shared.Constants.VULCAN_26_08_00
import app.polishapps.patches.shared.targetsFor
import app.polishapps.patches.vulcan.DART_FALSE
import app.polishapps.patches.vulcan.DART_TRUE
import app.polishapps.patches.vulcan.ENTER_FRAME
import app.polishapps.patches.vulcan.blInstruction
import app.polishapps.patches.vulcan.containsSnapshotBuildId
import app.polishapps.patches.vulcan.expectBytes
import app.polishapps.patches.vulcan.nativeLibrary
import app.polishapps.patches.vulcan.textFileOffset

private data class PremiumTargets(
    val libPath: String,
    val snapshotBuildId: String,
    val capabilitiesRemoveCall: Long,
    val setAddStub: Long,
    val hasPremium: Long,
    val revalidateParameter: Long,
    val revalidateParameterSecond: Long,
    val capabilityViolationBranch: Long,
    val premiumOverrideCheck: Long,
    val billingLockVisibilityCheck: Long,
    val premiumLockIsLocked: Long,
)

private val targetsByVersion = mapOf(
    VULCAN_26_08_00 to PremiumTargets(
        libPath = "lib/arm64-v8a/libapp.so",
        snapshotBuildId = "d6031998d1b3bbfebf59cc9bbff9aee1",
        capabilitiesRemoveCall = 0x0107b0bc,
        setAddStub = 0x011b8498,
        hasPremium = 0x00871338,
        revalidateParameter = 0x0087d0fc,
        revalidateParameterSecond = 0x0087d194,
        capabilityViolationBranch = 0x00881428,
        premiumOverrideCheck = 0x00eaff10,
        billingLockVisibilityCheck = 0x00eafce8,
        premiumLockIsLocked = 0x00df24c0,
    ),
)

private val REMOVE_PREMIUM_CALL = byteArrayOf(
    0xae.toByte(), 0x0c, 0xe7.toByte(), 0x97.toByte(),
)

/** `ldur x0, [fp, #-0x20]`, the billing reconciliation flag in `BillingComponent.revalidate`. */
private val REVALIDATE_FLAG = byteArrayOf(
    0xa0.toByte(), 0x03, 0x5e, 0xf8.toByte(),
)

/** `add x0, x22, #0x30`, the tagged Dart `false`. */
private val DART_FALSE_INTO_X0 = byteArrayOf(
    0xc0.toByte(), 0xc2.toByte(), 0x00, 0x91.toByte(),
)

/** `tbz w0, #4, 0x8814a8`, the capability-violation refresh branch. */
private val CAPABILITY_VIOLATION_REFRESH = byteArrayOf(
    0x00, 0x04, 0x20, 0x36,
)

/** `b 0x881520`, the early return of `CredentialsComponent.handleCapabilityViolation`. */
private val CAPABILITY_VIOLATION_RETURN = byteArrayOf(
    0x3e, 0x00, 0x00, 0x14,
)

@Suppress("unused")
val unlockPremiumPatch = resourcePatch(
    name = "Unlock premium",
    description = "Reports an active Premium capability on every student account and removes " +
        "the premium lock overlays. Billing and the store stay available.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_VULCAN)

    execute {
        val targets = targetsFor(targetsByVersion)
        val file = nativeLibrary(targets.libPath)
        val bytes = file.readBytes()
        if (!bytes.containsSnapshotBuildId(targets.snapshotBuildId)) {
            throw PatchException(
                "${targets.libPath} does not contain the expected Dart snapshot build ID " +
                    targets.snapshotBuildId,
            )
        }

        val capabilitiesOffset = bytes.textFileOffset(targets.capabilitiesRemoveCall).toInt()
        bytes.expectBytes(capabilitiesOffset, REMOVE_PREMIUM_CALL, "capabilities remove call")
        blInstruction(targets.capabilitiesRemoveCall, targets.setAddStub).copyInto(bytes, capabilitiesOffset)

        val hasPremiumOffset = bytes.textFileOffset(targets.hasPremium).toInt()
        bytes.expectBytes(hasPremiumOffset, ENTER_FRAME, "EduVulcanJWTToken.hasPremium prologue")
        DART_TRUE.copyInto(bytes, hasPremiumOffset)

        // BillingComponent.revalidate() adds "EDUVULCAN_PREMIUM" to the stored capability list when
        // this flag is true, then updates the domain and asks the UI to refresh. With the capability
        // forced active that repeats forever. Passing the tagged Dart false keeps the stored account
        // data untouched while the UI still sees the computed premium capability.
        val revalidateOffset = bytes.textFileOffset(targets.revalidateParameter).toInt()
        bytes.expectBytes(revalidateOffset, REVALIDATE_FLAG, "BillingComponent.revalidate flag")
        DART_FALSE_INTO_X0.copyInto(bytes, revalidateOffset)

        val revalidateSecondOffset = bytes.textFileOffset(targets.revalidateParameterSecond).toInt()
        bytes.expectBytes(revalidateSecondOffset, REVALIDATE_FLAG, "BillingComponent.revalidate demo flag")
        DART_FALSE_INTO_X0.copyInto(bytes, revalidateSecondOffset)

        // The server reports a capability violation when the app asks for data it does not own.
        // With the premium capability forced active that happens for premium endpoints, and the
        // handler updates the account and refreshes the app. Skip the refresh and return instead.
        val violationOffset = bytes.textFileOffset(targets.capabilityViolationBranch).toInt()
        bytes.expectBytes(violationOffset, CAPABILITY_VIOLATION_REFRESH, "capability violation refresh branch")
        CAPABILITY_VIOLATION_RETURN.copyInto(bytes, violationOffset)

        val overrideOffset = bytes.textFileOffset(targets.premiumOverrideCheck).toInt()
        bytes.expectBytes(overrideOffset, ENTER_FRAME, "EvPremiumOverrideCapabilityCheck.isSatisfied prologue")
        DART_FALSE.copyInto(bytes, overrideOffset)

        val lockOffset = bytes.textFileOffset(targets.billingLockVisibilityCheck).toInt()
        bytes.expectBytes(lockOffset, ENTER_FRAME, "BillingLockVisibilityCheck.isSatisfied prologue")
        DART_FALSE.copyInto(bytes, lockOffset)

        val isLockedOffset = bytes.textFileOffset(targets.premiumLockIsLocked).toInt()
        bytes.expectBytes(isLockedOffset, ENTER_FRAME, "PremiumLockTapOverrider.isLocked prologue")
        DART_FALSE.copyInto(bytes, isLockedOffset)

        file.writeBytes(bytes)
    }
}
