/**
 * Adapted from De-Vanced's Icon Pack Studio patch
 * https://github.com/RookieEnough/De-Vanced
 * which in turn forked ReVanced Patches (GPL-3.0)
 * https://github.com/ReVanced/revanced-patches
 */

package app.mrcool.patches.iconpackstudio.pro

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Locates the purchase-item holder by the three products it defines.
 * Icon Pack Studio 2.5 build 003 is R8-obfuscated, so the former
 * IPSPurchaseRepository class name is no longer present in the DEX.
 */
internal object PurchaseItemsCtorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        string("lifetime"),
        string("subscription"),
        string("iconstudio.fx.pack1")
    )
)

/** The static, no-argument boolean that reports whether any paid item is owned. */
internal object CheckProFingerprint : Fingerprint(
    classFingerprint = PurchaseItemsCtorFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf(),
    returnType = "Z"
)
