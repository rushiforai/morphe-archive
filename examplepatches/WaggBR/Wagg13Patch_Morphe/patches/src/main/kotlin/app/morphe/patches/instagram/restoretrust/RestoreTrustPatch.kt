/*
 * Restore trust on re-signed builds for Instagram (Morphe).
 *
 * Instagram's security code compares the signing certificates of the running app (and of other
 * Meta apps) with a table of Meta certificates. A re-signed build carries a different certificate,
 * so those local checks fail; the login request built from them fails too. This patch makes the one
 * method that reads a package's signers answer with Instagram's original Meta signing history when
 * the package is the running app, so the checks pass. It does not change how Android installed the
 * APK.
 *
 * Adapted from HushGram (SysAdminDoc/HushGram) and Andrew Liang's morphe-patches (GPL-3.0).
 * Trimmed to the self-package answer only (the same-key Threads/Facebook/Messenger family handling
 * is left out).
 */

package app.morphe.patches.instagram.restoretrust

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.SupportedAbi.ARM64_V8A
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

private const val PACKAGE_INFO = "Landroid/content/pm/PackageInfo;"
private const val SIGNATURE_HELPER =
    "Lapp/morphe/extension/instagram/patches/signature/InstagramSignature;"

/**
 * The method that hands Instagram's security code the signers of a package. It prefers the
 * `SigningInfo` of the package and falls back to the old `signatures` array; it is the only method
 * with no parameters that reads both signer lists and the old array too. Its class and name are
 * Redex names, so the fingerprint uses only framework references.
 */
internal object PackageSignersFingerprint : Fingerprint(
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/content/pm/SigningInfo;",
            name = "getApkContentsSigners",
        ),
        methodCall(
            definingClass = "Landroid/content/pm/SigningInfo;",
            name = "getSigningCertificateHistory",
        ),
        fieldAccess(
            definingClass = "Landroid/content/pm/PackageInfo;",
            name = "signatures",
        ),
    ),
)

@Suppress("unused")
val restoreTrustPatch = bytecodePatch(
    name = "Restore trust on re-signed builds",
    description = "Lets Instagram's own checks of who signed the app pass on a patched build, so the " +
        "parts that need them keep working.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "Instagram",
            packageName = "com.instagram.android",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xFC483C,
            targets = listOf(
                AppTarget(
                    version = "452.1.0.53.64",
                    versionCodes = mapOf(ARM64_V8A to 385811006),
                ),
            ),
        ),
    )

    extendWith("extensions/extension.mpe")

    execute {
        val method = PackageSignersFingerprint.method
        val owner = mutableClassDefBy(method.definingClass)

        // The package whose signers the method reads. The class holds exactly one.
        val packageInfoFields = owner.fields.filter { it.type.toString() == PACKAGE_INFO }
        if (packageInfoFields.size != 1) {
            throw PatchException("Expected 1 PackageInfo field on ${method.definingClass}, found ${packageInfoFields.size}")
        }
        val packageInfo = packageInfoFields.single().name

        // The result holds the signer list and two flags; its constructor states that shape.
        val signers = method.returnType.toString()
        val constructor = mutableClassDefBy(signers).methods.singleOrNull {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/List;", "Z", "Z")
        }
        if (constructor == null) throw PatchException("$signers has no (List, boolean, boolean) constructor")

        method.addInstructionsWithLabels(
            0,
            """
            move-object/from16 v0, p0
            iget-object v0, v0, ${method.definingClass}->$packageInfo:$PACKAGE_INFO
            invoke-static { v0 }, $SIGNATURE_HELPER->originalSigners(Landroid/content/pm/PackageInfo;)Ljava/util/List;
            move-result-object v1
            if-eqz v1, :restore_trust_original
            new-instance v0, $signers
            const/4 v2, 0x0
            invoke-direct { v0, v1, v2, v2 }, $signers-><init>(Ljava/util/List;ZZ)V
            return-object v0
            """.trimIndent(),
            ExternalLabel("restore_trust_original", method.getInstruction(0)),
        )
    }
}
