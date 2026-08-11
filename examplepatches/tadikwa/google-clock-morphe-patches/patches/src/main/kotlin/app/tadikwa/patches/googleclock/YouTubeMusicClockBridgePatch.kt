package app.tadikwa.patches.googleclock

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val MORPHE_YTM_PACKAGE =
    "app.morphe.android.apps.youtube.music"

private const val MUSIC_BROWSER_SERVICE =
    "Lcom/google/android/apps/youtube/music/mediabrowser/MusicBrowserService;"

private const val PREMIUM_ENTITLEMENT_CLASS = "Lkhr;"
private const val PREMIUM_ENTITLEMENT_METHOD = "e"

private object MusicBrowserRootFingerprint : Fingerprint(
    definingClass = MUSIC_BROWSER_SERVICE,
    returnType = "Lbze;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Landroid/os/Bundle;",
    ),
    strings = listOf(
        "MBS: onGetRoot(). appPkg: '%s'",
        "MBS: getRoot() call from system.ui for recent playback but account was non-premium",
        "MBS: getRoot() returning empty for: %s\nisBrowsable: %b",
        "com.google.android.apps.youtube.music.mediabrowser.user_has_premium_entitlement",
    ),
)

/*
 * Critical MediaBrowser capability gate.
 *
 * Static inspection of YT Music Morphe 9.15.51 shows that Lkzf.g() has only
 * two callers and BOTH are inside MusicBrowserService.onGetRoot().
 *
 * More importantly, Lkzf.g() can still execute:
 *
 *   const/4 ..., 0x7
 *   invoke-virtual {..}, Lkzf;->f(I)V
 *
 * even when the direct Lkhr.e() Premium result is true. Lkzf.f(7) publishes
 * PlaybackState ERROR(7), which is the exact state Google Clock receives.
 *
 * v1.8 only forced the entitlement read inside g(); that was insufficient.
 * v1.9 makes this MediaBrowser-only capability function return true before
 * any of its original side effects can run.
 */
private object MediaBrowserCapabilityFingerprint : Fingerprint(
    definingClass = "Lkzf;",
    name = "g",
    returnType = "Z",
    parameters = emptyList(),
)

/*
 * Browse requests can also advertise the account entitlement through:
 *   probably_has_unlimited_entitlement
 *
 * Keep this coherent with the MediaBrowser bridge.
 */
private object MediaBrowserEntitlementHintFingerprint : Fingerprint(
    definingClass = "Lkow;",
    name = "b",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    strings = listOf(
        "has_unlimited_entitlement",
        "probably_has_unlimited_entitlement",
    ),
)

/*
 * onLoadChildren() can route selected clients through an asynchronous
 * "user consent for browsing" future. For DeskClock only, bypass that
 * detour and continue directly to the normal media-tree supplier.
 *
 * Lavfd.a is the client object whose package string is
 * "com.google.android.deskclock".
 */
private object MediaBrowserConsentFingerprint : Fingerprint(
    definingClass = "Lkzf;",
    name = "l",
    returnType = "Z",
    parameters = listOf("Lavgi;"),
)

/*
 * Once browsing works, firing an alarm can enter the background playback
 * path. This method contains another real-Premium entitlement check with
 * the explicit diagnostic string below. Keep it coherent with the bridge.
 */
private object BackgroundPlaybackFingerprint : Fingerprint(
    definingClass = "Ljjc;",
    name = "run",
    returnType = "V",
    parameters = emptyList(),
    strings = listOf(
        "startBackgroundPlaybackForWidget but user is missing premium",
    ),
)

private val MORPHE_YTM_COMPATIBILITY = Compatibility(
    name = "YT Music Morphe",
    packageName = MORPHE_YTM_PACKAGE,
    appIconColor = 0xFF0000,
    targets = listOf(
        AppTarget(
            version = "9.15.51",
            isExperimental = true,
            description = "Google Clock MediaBrowser/alarm bridge for Morphe-patched YT Music 9.15.51."
        )
    )
)

private fun premiumResultIndexes(
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
): List<Int> =
    instructions.withIndex().mapNotNull { (index, instruction) ->
        val reference =
            (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@mapNotNull null

        val isPremiumCall =
            reference.definingClass == PREMIUM_ENTITLEMENT_CLASS &&
                reference.name == PREMIUM_ENTITLEMENT_METHOD &&
                reference.returnType == "Z" &&
                reference.parameterTypes.isEmpty()

        if (!isPremiumCall) return@mapNotNull null
        index + 1
    }

@Suppress("unused")
val youtubeMusicClockBridgePatch = bytecodePatch(
    name = "Google Clock alarm MediaBrowser bridge",
    description = "Bridges Morphe YT Music to Google Clock alarms. The MediaBrowser capability gate is short-circuited before it can publish PlaybackState ERROR(7), while browse entitlement metadata and alarm background playback are kept compatible.",
    default = true,
) {
    compatibleWith(MORPHE_YTM_COMPATIBILITY)

    execute {
        // 1) onGetRoot(): all three direct entitlement reads must look Premium.
        MusicBrowserRootFingerprint.method.apply {
            val indexes = premiumResultIndexes(instructions)

            if (indexes.size != 3) {
                throw PatchException(
                    "Expected exactly 3 Premium entitlement reads in MusicBrowserService.onGetRoot(), found ${indexes.size}"
                )
            }

            indexes.forEach { resultIndex ->
                val resultInstruction =
                    instructions.getOrNull(resultIndex)
                        ?: throw PatchException(
                            "Premium entitlement call in onGetRoot() has no result instruction"
                        )

                if (resultInstruction !is OneRegisterInstruction) {
                    throw PatchException(
                        "Unexpected result instruction after onGetRoot() entitlement call"
                    )
                }

                val register = resultInstruction.registerA
                replaceInstruction(resultIndex, "const/4 v$register, 0x1")
            }
        }

        // 2) Critical fix: do NOT execute Lkzf.g()'s original body.
        //
        // g() is only called by MusicBrowserService.onGetRoot() in this build.
        // Its original body can call f(7) even with Premium=true, so changing
        // only the entitlement value does not prevent PlaybackState ERROR(7).
        MediaBrowserCapabilityFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }

        // 3) Keep downstream MediaBrowser request metadata consistent.
        MediaBrowserEntitlementHintFingerprint.method.apply {
            val indexes = premiumResultIndexes(instructions)

            if (indexes.size != 1) {
                throw PatchException(
                    "Expected exactly 1 Premium entitlement read in Lkow.b(), found ${indexes.size}"
                )
            }

            val resultIndex = indexes.single()
            val resultInstruction =
                instructions.getOrNull(resultIndex)
                    ?: throw PatchException(
                        "Premium entitlement call in Lkow.b() has no result instruction"
                    )

            if (resultInstruction !is OneRegisterInstruction) {
                throw PatchException(
                    "Unexpected result instruction after Lkow.b() entitlement call"
                )
            }

            val register = resultInstruction.registerA
            replaceInstruction(resultIndex, "const/4 v$register, 0x1")
        }

        // 4) DeskClock only: don't wait on the asynchronous browse-consent path.
        MediaBrowserConsentFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    sget-object v0, Lavfd;->a:Lavfd;
                    invoke-virtual {p1, v0}, Lavgi;->equals(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :morphe_original_consent
                    const/4 v0, 0x0
                    return v0
                """,
                ExternalLabel(
                    "morphe_original_consent",
                    getInstruction(0),
                ),
            )
        }

        // 5) Allow the eventual alarm/background playback path too.
        BackgroundPlaybackFingerprint.method.apply {
            val indexes = premiumResultIndexes(instructions)

            if (indexes.size != 1) {
                throw PatchException(
                    "Expected exactly 1 Premium entitlement read in background playback, found ${indexes.size}"
                )
            }

            val resultIndex = indexes.single()
            val resultInstruction =
                instructions.getOrNull(resultIndex)
                    ?: throw PatchException(
                        "Background playback entitlement call has no result instruction"
                    )

            if (resultInstruction !is OneRegisterInstruction) {
                throw PatchException(
                    "Unexpected result instruction after background playback entitlement call"
                )
            }

            val register = resultInstruction.registerA
            replaceInstruction(resultIndex, "const/4 v$register, 0x1")
        }
    }
}
