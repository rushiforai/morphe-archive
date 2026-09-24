/*
 * Copyright 2026
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
package app.morphe.patches.pixelcamera.gallery

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pixelcamera.shared.Constants.COMPATIBILITY_PIXEL_CAMERA
import java.util.logging.Logger

private val logger = Logger.getLogger("UseThirdPartyGalleryOnLockScreenPatch")

/**
 * Opt-in companion to [useThirdPartyGalleryPatch].
 *
 * When the camera is launched over the lock screen, Pixel Camera builds a
 * *secure* review intent - `android.provider.action.REVIEW_SECURE`, or Google
 * Photos' `...mars.api.ACTION_REVIEW_SECURE`. The contract is that the viewer
 * shows only the items captured during this locked session and nothing else.
 *
 * A third-party gallery does not implement that contract. It receives a plain
 * `ACTION_VIEW` and will show whatever it normally shows, which can mean the
 * entire library is readable above the lock screen without authentication.
 *
 * For that reason the base patch leaves secure launches on the stock path, and
 * this patch exists separately, disabled by default, so enabling it is a
 * deliberate choice.
 *
 * ### How it works
 *
 * The base patch injects a single call to
 * `GalleryRedirect.prepareGalleryIntent(Intent, View)` and never varies. The
 * helper consults `GalleryRedirect.redirectSecureReview()`, which ships
 * returning false. This patch rewrites that one method to return true.
 *
 * Nothing in Pixel Camera's own bytecode is touched here - the only mutation is
 * to a method of the injected extension class, which this project owns. That
 * keeps the two patches independent of each other's instruction offsets.
 */
@Suppress("unused")
val useThirdPartyGalleryOnLockScreenPatch = bytecodePatch(
    name = "Use third-party gallery on lock screen",
    description = "Also opens lock screen captures in the system-default gallery. " +
        "Third-party galleries do not implement Android's secure review contract, " +
        "so the gallery may show your entire library above the lock screen.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_PIXEL_CAMERA)

    // Guarantees the extension has been merged and the launcher hooked before
    // this patch runs. The extension is deliberately NOT declared again with
    // extendWith here, which would merge the same DEX twice.
    dependsOn(useThirdPartyGalleryPatch)

    execute {
        val extensionClassDef = try {
            classDefBy(EXTENSION_CLASS)
        } catch (e: Exception) {
            throw PatchException(
                "Extension class $EXTENSION_CLASS is not present. This patch depends on " +
                    "\"Use third-party gallery\", which merges it; enable that patch too.",
                e,
            )
        }

        val switchMethod = mutableClassDefBy(extensionClassDef).methods.firstOrNull {
            it.name == SECURE_SWITCH_METHOD &&
                it.returnType == "Z" &&
                it.parameters.isEmpty()
        } ?: throw PatchException(
            "Could not find $SECURE_SWITCH_METHOD()Z in $EXTENSION_CLASS. The extension " +
                "and the patch are out of sync - rebuild the extension module.",
        )

        val registerCount = switchMethod.implementation?.registerCount ?: 0
        if (registerCount < 1) {
            throw PatchException(
                "$SECURE_SWITCH_METHOD() has $registerCount register(s); at least one is " +
                    "needed to return a value. Refusing to patch.",
            )
        }

        // Prepend an unconditional `return true`. Prepending rather than
        // replacing the body means this does not depend on how many
        // instructions the Java compiler emitted for `return false`.
        switchMethod.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        logger.info("Secure (lock screen) review will now be redirected.")
    }
}
