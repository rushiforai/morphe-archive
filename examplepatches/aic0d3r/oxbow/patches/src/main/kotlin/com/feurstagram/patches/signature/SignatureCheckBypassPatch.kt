package com.feurstagram.patches.signature

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.feurstagram.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import com.feurstagram.patches.shared.Constants.EXTENSION_PACKAGE
import com.feurstagram.patches.shared.freeLocals
import com.feurstagram.patches.shared.parameterRegister

/**
 * Instagram wraps a signing certificate's SHA-256 in a "key hash" (Base64, 43 chars) via
 * X.3uq, keeps Meta's trusted key hashes in a static allowlist in X.1eX, and exposes two
 * membership checks:
 *
 *   - X.1eX.A01(keyHash)          -> keyHash in allowlist
 *   - X.1eY.A01(keyHash, ref, z)  -> family-app scope trust (with the same allowlist fallback)
 *
 * Instagram 446 reshaped the second one into an instance method on the trusted-provider class
 * that takes the caller identity and reads the key hashes from it, so the patch matches either
 * form.
 *
 * Re-signing the APK produces a key hash that is not in the allowlist, so both checks fail,
 * X.0XS.A02 (the "is this APK signed by Meta" gate) turns false, and Instagram's deep-link
 * dispatcher silently drops navigation to the linked content (issue #36).
 *
 * Each check therefore answers true for this APK's own key hash only (OwnSignature.isOwn
 * compares it with the signing certificate PackageManager reports for this package) and
 * otherwise runs Instagram's code. Answering true for every certificate, as the first version
 * did, handed Instagram's phone id and the "family app" providers to any installed app.
 *
 * Both methods take the X.3uq key-hash type, so they are matched structurally after locating
 * that type by its stable error string. The obfuscated class/method names therefore never
 * appear in this patch and it survives Instagram renaming them between releases.
 */
internal object KeyHashClassFingerprint : Fingerprint(
    strings = listOf("Invalid SHA256 key hash"),
)

/**
 * At method entry: when the key hash a check is asked about is this APK's own, answer true;
 * Instagram's code runs for every other certificate. [loadHashIntoV0] is smali that leaves
 * that key hash (or null) in v0. Uses v0 only, which is free at entry whenever the method has
 * a local register.
 */
private fun MutableMethod.returnTrueIfOwnCertificate(loadHashIntoV0: String) {
    if (freeLocals() < 1) throw PatchException("$name has no free register for the signature hook")
    addInstructionsWithLabels(
        0,
        """
            $loadHashIntoV0
            invoke-static {v0}, $EXTENSION_PACKAGE/OwnSignature;->isOwn(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :instagram
            const/4 v0, 0x1
            return v0
        """,
        ExternalLabel("instagram", getInstruction(0)),
    )
}

@Suppress("unused")
val signatureCheckBypassPatch = bytecodePatch(
    name = "Signature check bypass",
    description = "Lets Instagram's two signing-certificate trust checks answer yes for this APK's own " +
        "certificate, so a re-signed build is treated as an official Meta build and deep links route to " +
        "their content. Every other certificate gets Instagram's own answer, so other apps are still " +
        "checked.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val keyHashType = KeyHashClassFingerprint.classDef.type

        // Only one method with signature boolean(X.3uq): X.1eX.A01, the allowlist membership
        // check powering X.0XS.A02 (the self-signature gate) and every other trust decision.
        val allowlistCheck = Fingerprint(
            returnType = "Z",
            parameters = listOf(keyHashType),
            custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
        ).method
        allowlistCheck.returnTrueIfOwnCertificate("move-object/from16 v0, v${allowlistCheck.parameterRegister(0)}")

        // The family-app scope trust check used by the deep-link resolver
        // (com.facebook.secure.deeplink). Up to Instagram 445 it is the only method with
        // signature boolean(X.3uq, X.3uq, Z) (X.1eY.A01), whose first parameter is the caller's.
        val legacyScopeCheck = Fingerprint(
            returnType = "Z",
            parameters = listOf(keyHashType, keyHashType, "Z"),
            custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
        ).methodOrNull

        // From Instagram 446 it became an instance method boolean(CallerIdentity, Z) on the
        // trusted-provider class, which reads the caller's key hash through a getter on its
        // first parameter instead of taking it as one. That shape is unique in the APK; the
        // class's own "*|all_packages|*" string is not, so it is matched on structure alone.
        val scopeCheck = legacyScopeCheck ?: Fingerprint(
            returnType = "Z",
            custom = { method, _ ->
                !AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.parameterTypes.size == 2 &&
                    method.parameterTypes[1].toString() == "Z" &&
                    method.keyHashGetter(method.parameterTypes[0].toString(), keyHashType) != null
            },
        ).method

        val caller = scopeCheck.parameterRegister(0)
        val loadCallerHash = if (legacyScopeCheck != null) {
            "move-object/from16 v0, v$caller"
        } else {
            val getter = scopeCheck.keyHashGetter(scopeCheck.parameterTypes[0].toString(), keyHashType)
                ?: throw PatchException("signature scope check ${scopeCheck.name} reads no key hash")
            // A null caller has no hash to read; isOwn(null) is false, so Instagram's code answers.
            """
                move-object/from16 v0, v$caller
                if-eqz v0, :own
                invoke-virtual {v0}, $getter
                move-result-object v0
                :own
            """
        }
        scopeCheck.returnTrueIfOwnCertificate(loadCallerHash)
    }
}

/** The getter declared on [ownerType] that returns the key-hash type, which the method calls; null when none. */
private fun Method.keyHashGetter(ownerType: String, keyHashType: String): MethodReference? =
    implementation?.instructions?.mapNotNull { instruction ->
        (instruction as? ReferenceInstruction)?.reference as? MethodReference
    }?.firstOrNull { it.returnType == keyHashType && it.definingClass == ownerType }
