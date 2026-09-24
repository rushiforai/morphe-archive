/*
 * Copyright 2026
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
package app.morphe.patches.pixelcamera.gallery

import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.pixelcamera.shared.Constants.COMPATIBILITY_PIXEL_CAMERA
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import java.util.logging.Logger

private val logger = Logger.getLogger("UseThirdPartyGalleryPatch")

/**
 * Replaces an `invoke-virtual`/`invoke-interface` with a static call to the
 * extension, reusing the exact same registers so the surrounding register
 * allocation and verifier state are unchanged.
 *
 * The instruction being replaced must be in 35c form (the non-range invoke),
 * which is guaranteed for calls with at most five register arguments.
 *
 * @param index          instruction index to replace
 * @param expectedArgs   register count the replaced call must have; a mismatch
 *                       means the app's code shape changed and the replacement
 *                       signature would no longer line up
 * @param target         smali method reference to call instead
 * @param what           human-readable name used in failure messages
 */
internal fun MutableMethod.replaceCallWithExtensionCall(
    index: Int,
    expectedArgs: Int,
    target: String,
    what: String,
) {
    val invoke = try {
        getInstruction<Instruction35c>(index)
    } catch (e: ClassCastException) {
        throw PatchException(
            "$what: instruction at index $index is not a non-range invoke. " +
                "Pixel Camera's code shape changed; the fingerprint matched but the " +
                "mutation is no longer safe.",
            e,
        )
    }

    if (invoke.registerCount != expectedArgs) {
        throw PatchException(
            "$what: expected a call taking $expectedArgs register(s) but found " +
                "${invoke.registerCount}. Refusing to patch rather than emit code " +
                "with a mismatched signature.",
        )
    }

    val registers = listOf(
        invoke.registerC,
        invoke.registerD,
        invoke.registerE,
        invoke.registerF,
        invoke.registerG,
    ).take(invoke.registerCount).joinToString(", ") { "v$it" }

    replaceInstruction(index, "invoke-static { $registers }, $target")
    logger.fine("$what: replaced instruction $index with $target")
}

/** Fails with a precise message instead of an opaque index-out-of-bounds. */
internal fun Match.instructionIndexOrThrow(filterIndex: Int, what: String): Int {
    val matches = instructionMatches
    if (filterIndex >= matches.size) {
        throw PatchException(
            "$what: fingerprint matched but filter #$filterIndex produced no " +
                "instruction match (${matches.size} matches present).",
        )
    }
    return matches[filterIndex].index
}

@Suppress("unused")
val useThirdPartyGalleryPatch = bytecodePatch(
    name = "Use third-party gallery",
    description = "Allows the Pixel Camera thumbnail to open captured media in the " +
        "system-default gallery instead of requiring Google Photos.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PIXEL_CAMERA)

    extendWith("extensions/pixelcamera.mpe")

    execute {
        // ------------------------------------------------------------------
        // Detection. Both fingerprints are resolved before anything is
        // mutated, so a fingerprint failure never leaves a half-patched APK.
        // ------------------------------------------------------------------
        val launcherMatch = ThumbnailReviewLauncherFingerprint.matchOrNull()
            ?: throw PatchException(
                "Could not find the camera-roll review launcher. Expected a " +
                    "public final method (Intent, View, Bitmap) -> boolean that calls " +
                    "Intent.resolveActivity, references the strings " +
                    "\"photos_review_launch_timestamp\" and " +
                    "\"shared_element_return_transition\", and calls " +
                    "Activity.startActivityForResult. Re-run " +
                    "`python tools/dexscan.py hunt <base.apk>` and update Fingerprints.kt.",
            )

        val gateMatch = PhotosAvailabilityGateFingerprint.matchOrNull()
            ?: throw PatchException(
                "Could not find the Google Photos availability gate. Expected a " +
                    "public final void method taking one object parameter that references " +
                    "\"$PHOTOS_PACKAGE_NAME\", calls a method returning " +
                    "android.content.pm.PackageInfo, calls " +
                    "PackageManager.getApplicationEnabledSetting and " +
                    "PackageManager.isPackageSuspended, and references the string " +
                    "\"Photos is disabled. Canceling.\". Re-run " +
                    "`python tools/dexscan.py hunt <base.apk>` and update Fingerprints.kt.",
            )

        val packageInfoIndex =
            gateMatch.instructionIndexOrThrow(GATE_PACKAGE_INFO_FILTER, "Photos PackageInfo probe")
        val enabledSettingIndex =
            gateMatch.instructionIndexOrThrow(GATE_ENABLED_SETTING_FILTER, "Photos enabled probe")
        val suspendedIndex =
            gateMatch.instructionIndexOrThrow(GATE_SUSPENDED_FILTER, "Photos suspended probe")

        logger.info(
            "Targets resolved: launcher=${launcherMatch.originalClassDef.type}" +
                "->${launcherMatch.originalMethod.name}, " +
                "gate=${gateMatch.originalClassDef.type}->${gateMatch.originalMethod.name}",
        )

        // ------------------------------------------------------------------
        // Mutation 1 - redirect the launch.
        //
        // Injected at instruction 0, before the app's own
        // `intent.resolveActivity(...)` null-check, so that check now tests the
        // rewritten implicit intent. p1 is the Intent, p2 is the thumbnail
        // View; both are method parameters, so no scratch register is needed
        // and `.registers` does not grow.
        //
        // Whether secure (lock-screen) launches are also redirected is decided
        // at runtime by GalleryRedirect.redirectSecureReview(), which the
        // separate lock-screen patch rewrites. This injection is identical
        // either way.
        // ------------------------------------------------------------------
        launcherMatch.method.addInstructions(
            0,
            "invoke-static { p1, p2 }, " +
                "$EXTENSION_CLASS->prepareGalleryIntent(" +
                "Landroid/content/Intent;Landroid/view/View;)V",
        )

        // ------------------------------------------------------------------
        // Mutation 2 - neutralise the Google Photos availability gate.
        //
        // Three same-shape call replacements. Highest index first so that even
        // if a future patcher release makes replacement shift indices, the
        // earlier indices stay valid.
        // ------------------------------------------------------------------
        val gateMethod = gateMatch.method

        gateMethod.replaceCallWithExtensionCall(
            index = suspendedIndex,
            expectedArgs = 2,
            target = "$EXTENSION_CLASS->isPackageSuspended(" +
                "Landroid/content/pm/PackageManager;Ljava/lang/String;)Z",
            what = "Photos suspended probe",
        )

        gateMethod.replaceCallWithExtensionCall(
            index = enabledSettingIndex,
            expectedArgs = 2,
            target = "$EXTENSION_CLASS->applicationEnabledSetting(" +
                "Landroid/content/pm/PackageManager;Ljava/lang/String;)I",
            what = "Photos enabled probe",
        )

        gateMethod.replaceCallWithExtensionCall(
            index = packageInfoIndex,
            expectedArgs = 1,
            target = "$EXTENSION_CLASS->galleryPackageInfo(" +
                "Ljava/lang/Object;)Landroid/content/pm/PackageInfo;",
            what = "Photos PackageInfo probe",
        )
    }
}
