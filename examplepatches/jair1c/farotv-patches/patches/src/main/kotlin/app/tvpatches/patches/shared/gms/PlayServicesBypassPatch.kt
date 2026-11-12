/*
 * Part of the GmsCore support patch from Morphe, split out so the app can run under another
 * package name without any GmsCore (MicroG) installed.
 *
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.tvpatches.patches.shared.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchDefinition
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.util.returnEarly
import app.tvpatches.patches.shared.clone.cloneAppPatch
import app.tvpatches.patches.shared.clone.setOrGetFallbackPackageName
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Renames the app (so it installs next to the original) and stops it from refusing to run
 * when Google Play Services does not recognize the new package name or signature.
 *
 * It does NOT redirect anything to GmsCore. Calls to Play Services may still be rejected;
 * this patch only makes the app ignore that.
 *
 * @param fromPackageName The package name of the original app.
 * @param toPackageNameDefault The package name to use if the user did not set one in "Clone app".
 * @param primeMethodFingerprint Method holding the allow-list of Google package names.
 */
fun playServicesBypassPatch(
    fromPackageName: String,
    toPackageNameDefault: String,
    primeMethodFingerprint: Fingerprint? = null,
    earlyReturnFingerprints: Set<Fingerprint> = setOf(),
    block: PatchDefinition.() -> Unit = {},
) = patch(
    name = "Run without Google Play Services",
    description = "Changes the package name so the patched app installs next to the original one, " +
            "and keeps it running when Google Play Services rejects the new package name. " +
            "Sign in with an activation code (yt.be/activate).",
) {
    dependsOn(cloneAppPatch)

    execute {
        val toPackageName = setOrGetFallbackPackageName(toPackageNameDefault)

        // "Is Google Play Services available?" -> always "yes" (ConnectionResult.SUCCESS).
        GooglePlayUtilityFingerprint.method.returnEarly(0)
        // "Throw if Google Play Services is not available" -> never throw.
        ServiceCheckFingerprint.method.returnEarly()

        // The "prime" method holds an allow-list of Google package names.
        // Replace the original package name there with the new one.
        primeMethodFingerprint?.method?.apply {
            val index = instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.CONST_STRING &&
                    ((instruction as ReferenceInstruction).reference as StringReference).string == fromPackageName
            }
            if (index < 0) throw IllegalStateException("Prime method has no \"$fromPackageName\" string")
            val register = getInstruction<OneRegisterInstruction>(index).registerA
            replaceInstruction(index, "const-string v$register, \"$toPackageName\"")
        }

        earlyReturnFingerprints.forEach {
            it.method.apply {
                if (returnType == "Z") returnEarly(false) else returnEarly()
            }
        }

        // Rename the app's own permissions so it does not clash with the original app
        // (INSTALL_FAILED_DUPLICATE_PERMISSION). "Clone app" skips this for YouTube because
        // these patches handle it.
        val permissionRenames = mapOf(
            "$fromPackageName.permission.C2D_MESSAGE" to "$toPackageName.permission.C2D_MESSAGE",
            "$fromPackageName.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION" to
                "$toPackageName.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION",
        )
        resourceXml("AndroidManifest.xml").use { manifest ->
            manifest.elements().forEach { element ->
                element.attributeNames.forEach attributes@{ name ->
                    val value = element.attribute(name) ?: return@attributes
                    val replaced = permissionRenames[value] ?: return@attributes
                    element.setAttribute(name, replaced)
                }
            }
        }
    }

    block()
}
