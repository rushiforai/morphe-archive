/*
 * Adapted from rushiranpise/morphe-patches at e3bb3af54e13ecfac60eb8bf9bdf287330f0529f and
 * RookieEnough/De-Vanced at 5cf78f17aae0665c196fb71d63d50726d9ba518e (SpoofPackageVersionPatch.kt).
 * GPL-3.0. See NOTICE.
 */
package app.hushmessenger.patches.misc

import app.hushmessenger.patches.MessengerTarget
import app.hushmessenger.patches.coexist.validateVersionCode
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document

internal const val SPOOF_VERSION_PATCH = "Spoof package version"
internal const val SPOOF_VERSION_KEY = "versionCode"
internal const val HIGHEST_VERSION_CODE = Int.MAX_VALUE

/** Android version codes are positive 32-bit integers, so 1 through 2147483647. */
internal fun validSpoofedVersionCode(value: Int?): Boolean = value != null && value >= 1

/**
 * Sets the manifest's version code from [real] to [spoofed]. Refused before anything changes when
 * the manifest has no manifest element, a versionCodeMajor (whose high half would change what the
 * number means) or a different code than the one the patcher read.
 */
internal fun Document.spoofVersionCode(real: String, spoofed: Int) {
    val root = documentElement
    if (root == null || root.tagName != "manifest") refuse("AndroidManifest.xml has no manifest element")
    if (!validSpoofedVersionCode(spoofed)) refuse("$spoofed isn't a version code from 1 to $HIGHEST_VERSION_CODE")
    if (root.hasAttribute("android:versionCodeMajor")) refuse("AndroidManifest.xml sets a versionCodeMajor")
    val code = root.getAttribute("android:versionCode").trim()
    if (code != real.trim() || code.toIntOrNull() == null) refuse("AndroidManifest.xml says its version code is \"$code\", not $real")
    root.setAttribute("android:versionCode", spoofed.toString())
}

private fun refuse(reason: String): Nothing =
    throw PatchException("$SPOOF_VERSION_PATCH: $reason. Use an unmodified arm64 Messenger ${MessengerTarget.supportedApks()}.")

@Suppress("unused")
val spoofPackageVersionPatch = resourcePatch(
    name = SPOOF_VERSION_PATCH,
    description = "Gives Messenger a high version number so the Play Store stops offering Meta's updates. Messenger may report it to Meta. Going back means uninstalling first, which erases its data. Pick it in Expert mode. Works as soon as you patch it in, with no switch.",
    default = false,
) {
    category("Updates")
    compatibleWith(MessengerTarget.COMPATIBILITY)

    val versionCode by intOption(
        key = SPOOF_VERSION_KEY,
        default = HIGHEST_VERSION_CODE,
        title = "Version number",
        description = "A whole number from 1 to $HIGHEST_VERSION_CODE. Pick one higher than Messenger's version in the Play Store, or it will keep offering updates. The default is the highest Android allows.",
        required = true,
    ) { validSpoofedVersionCode(it) }

    execute {
        val real = packageMetadata.versionCode
        validateVersionCode(real)
        val spoofed = versionCode ?: refuse("no version code was set")
        document("AndroidManifest.xml").use { it.spoofVersionCode(real, spoofed) }
    }
}
