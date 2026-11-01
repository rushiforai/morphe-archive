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
import app.morphe.util.getFreeRegisterProvider
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PACKAGE_INFO = "Landroid/content/pm/PackageInfo;"

private const val ORIGINAL_SIGNERS = "Lapp/morphe/extension/hushthreads/misc/ThreadsSignature;->" +
    "originalSigners(Landroid/content/pm/PackageInfo;)Ljava/util/List;"

private const val OPEN_REFUSED_TILE = "Lapp/morphe/extension/hushthreads/coexist/ShareTiles;->" +
    "openRefused(ZLandroid/content/Context;Landroid/content/Intent;)V"

@Suppress("unused")
val restoreTrustPatch = bytecodePatch(
    name = "Restore screens on re-signed builds",
    description = "Fixes Threads screens that fail on a patched app because they check who signed it. Also lets " +
        "Threads share sign-in with an Instagram signed with this build's key, and makes the share sheet's tiles " +
        "open patched Meta apps. Works as soon as you patch it in, with no switch.",
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

        // FBNS's own check (#6) is fbnsSignersPatch, which every build carries through the settings patch.
        method.answerOriginalSigners(packageInfo, signers)
        ShareTileLaunchFingerprint.method.openRefusedShareTiles()

        enableStatus("restoreTrust")
    }
}

/**
 * Threads' launcher starts an app only if it carries Meta's signature and answers false otherwise,
 * and every tile drops that answer, so a tap on a patched Messenger does nothing (#16). Each launch
 * hands its answer to the extension along with the context and intent it was given, using a register
 * nothing reads again. The launcher's check itself stays, since the rest of Threads relies on it.
 */
internal fun MutableMethod.openRefusedShareTiles() {
    val body = instructions.toList()
    val launches = body.indices.filter { body[it].isTileLaunch() }
    val composer = body.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == SHARE_TILE_COMPOSER_EXTRA
    }
    if (launches.none { it > composer }) {
        throw PatchException("Restore screens on re-signed builds: no launch after Messenger's tile sets up its intent")
    }
    for (at in launches.asReversed()) {
        val call = body[at] as FiveRegisterInstruction
        if (body[at + 1].opcode == Opcode.MOVE_RESULT) {
            throw PatchException("Restore screens on re-signed builds: the launch at $at already reads its answer")
        }
        val free = getFreeRegisterProvider(at + 1, 1, call.registerD, call.registerE).getFreeRegister4Bit()
        addInstructions(
            at + 1,
            """
                move-result v$free
                invoke-static { v$free, v${call.registerD}, v${call.registerE} }, $OPEN_REFUSED_TILE
            """,
        )
    }
}

/** A launcher call: an instance method taking a context and an intent and answering whether it started anything. */
private fun Instruction.isTileLaunch(): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL) return false
    val called = (this as ReferenceInstruction).reference as MethodReference
    return called.returnType == "Z" &&
        called.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Landroid/content/Intent;")
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
