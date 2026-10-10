/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Forked from:
 * https://github.com/andrewliang25/morphe-patches/blob/5db2e57e133aede5297c48b419168cf30fd89953/patches/src/main/kotlin/app/andrewliang/patches/facebook/resignedtrust/RestoreTrustPatch.kt
 * Copyright 2026 Andrew Liang (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026.
 */
package app.morphe.patches.threads.misc.resignedtrust

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.requireLocals
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.threads.misc.settings.settingsPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val PACKAGE_INFO = "Landroid/content/pm/PackageInfo;"

private const val ORIGINAL_SIGNERS = "Lapp/morphe/extension/hushthreads/misc/ThreadsSignature;->" +
    "originalSigners(Landroid/content/pm/PackageInfo;)Ljava/util/List;"

private const val FBNS_SIGNERS = "Lapp/morphe/extension/hushthreads/misc/ThreadsSignature;->" +
    "fbnsSigners(Landroid/content/pm/PackageInfo;[Landroid/content/pm/Signature;)[Landroid/content/pm/Signature;"

@Suppress("unused")
val restoreTrustPatch = bytecodePatch(
    name = "Restore screens on re-signed builds",
    description = "Fixes Threads screens that fail on a patched app because they check who signed it. Also lets " +
        "Threads share sign-in with an Instagram signed with this build's key. Works as soon as you patch" +
        " it in, with no switch.",
    default = true,
) {
    category("Fixes")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.threads())

    dependsOn(threadsExtensionPatch)

    execute {
        val method = PackageSignersFingerprint.method
        val owner = mutableClassDefBy(method.definingClass)

        // The package whose signers the method reads. The class holds exactly one.
        val packageInfoFields = owner.fields.filter { it.type.toString() == PACKAGE_INFO }
        check(packageInfoFields.size == 1) {
            "Expected 1 PackageInfo field on ${method.definingClass}, found ${packageInfoFields.size}"
        }
        val packageInfo = packageInfoFields.single().name

        // The result holds the signer list and two flags. Its constructor states that shape.
        val signers = method.returnType.toString()
        val constructor = mutableClassDefBy(signers).methods.singleOrNull {
            it.name == "<init>" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/List;", "Z", "Z")
        }
        check(constructor != null) { "$signers has no (List, boolean, boolean) constructor" }

        // Both sites are checked before either is edited: a refusal must leave Threads untouched.
        val fbns = FbnsPackageCheckFingerprint.method
        fbns.fbnsSignersRead()

        method.answerOriginalSigners(packageInfo, signers)
        fbns.routeFbnsSigners()

        enableStatus("restoreTrust")
    }
}

/**
 * For the running app, under Threads' name or a clone's, answer with the original certificate and
 * skip the body. For any other package, the extension answers null and the body runs as before. The
 * two flags are false, as the body sets them for a single signer.
 *
 * The injection is at index 0, where no local is live yet, so v0 to v2 are free once the method is
 * known to have three locals. `iget-object` takes 4-bit registers, so `this` is copied down into v0
 * first: in a method with more than sixteen registers `p0` sits above v15, and the patcher's smali
 * compiler leaves out an instruction whose register doesn't fit, without a word.
 */
internal fun MutableMethod.answerOriginalSigners(packageInfo: String, signers: String) {
    requireLocals("Restore screens on re-signed builds", 3)
    addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, p0
            iget-object v0, v0, $definingClass->$packageInfo:$PACKAGE_INFO
            invoke-static { v0 }, $ORIGINAL_SIGNERS
            move-result-object v1
            if-eqz v1, :original
            new-instance v0, $signers
            const/4 v2, 0x0
            invoke-direct { v0, v1, v2, v2 }, $signers-><init>(Ljava/util/List;ZZ)V
            return-object v0
        """,
        ExternalLabel("original", getInstruction(0)),
    )
}

/**
 * FBNS, the push service Meta's apps share, checks each package it may hand pushes to against
 * Meta's certificates, reading `PackageInfo.signatures` itself. On a re-signed build Threads fails
 * its own check, and each time the app comes back to the front FBNS starts another broadcast thread
 * that never ends (#6). The array that read gives goes through the extension, which answers the
 * original certificate for this app and the system's answer for any other package.
 *
 * The call goes straight after the read and names its two registers. `invoke-static` takes 4-bit
 * registers, so both must be v15 or lower, and the read must not overwrite the package it read
 * from, which the call still needs.
 */
internal fun MutableMethod.routeFbnsSigners() {
    val (index, info, signatures) = fbnsSignersRead()
    addInstructions(
        index + 1,
        """
            invoke-static { v$info, v$signatures }, $FBNS_SIGNERS
            move-result-object v$signatures
        """,
    )
}

/** FBNS's one read of `PackageInfo.signatures`: its index, the package register and the signatures register. */
internal fun MutableMethod.fbnsSignersRead(): Triple<Int, Int, Int> {
    val reads = instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.IGET_OBJECT &&
            ((instruction as ReferenceInstruction).reference as FieldReference).let {
                it.definingClass == PACKAGE_INFO && it.name == "signatures"
            }
    }
    val (index, read) = reads.singleOrNull()
        ?: throw PatchException("Restore screens on re-signed builds: expected one read of PackageInfo.signatures in FBNS's package check, found ${reads.size}")
    val signatures = (read as TwoRegisterInstruction).registerA
    val info = read.registerB
    if (signatures == info || signatures > 15 || info > 15) {
        throw PatchException("Restore screens on re-signed builds: FBNS's package check reads signatures into v$signatures from v$info, which the call can't name")
    }
    return Triple(index, info, signatures)
}
