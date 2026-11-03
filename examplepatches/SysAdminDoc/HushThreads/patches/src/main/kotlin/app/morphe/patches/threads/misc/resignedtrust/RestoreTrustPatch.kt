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
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.threads.misc.settings.EXTENSION_ROOT
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.getFreeRegisterProvider
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PATCH = "Restore screens on re-signed builds"

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
        val tiles = shareTiles()
        method.answerOriginalSigners(packageInfo, signers)
        tiles.lambdas.forEach { mutableTile(it).openRefusedShareTiles(tiles.launcher) }

        enableStatus("restoreTrust")
    }
}

/** The share actions and the link the tiles for Instagram, Facebook and WhatsApp start their apps with. */
internal val SHARE_TILE_ACTIONS = listOf(
    "com.instagram.share.ADD_TO_FEED",
    "com.instagram.share.ADD_TO_REEL_THREAD",
    "com.facebook.reels.SHARE_TO_REEL",
    "https://wa.me/status",
)

/** Messenger's package, which its tile names when it builds the intent. */
internal const val MESSENGER = "com.facebook.orca"

/** The share sheet's tiles: the lambdas that start the apps, and the launcher every one of them goes through. */
internal class ShareTiles(val launcher: MethodReference, val lambdas: List<Method>)

/**
 * Finds the share sheet's tiles. 453 kept them in one suspend lambda. 454 (2026-11-02) spreads them
 * over two or three, and on its x86 and armeabi-v7a builds Messenger's tile reads its other strings
 * from Redex's table of outlined strings. The tiles for Instagram, Facebook and WhatsApp still name
 * their share actions, and all the tiles launch through one launcher, so the launcher is read off
 * them. Messenger's tile is then the one lambda naming Messenger that hands that launcher an intent
 * and drops the answer.
 */
internal fun BytecodePatchContext.shareTiles(): ShareTiles {
    val named = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        for (method in classDef.methods) {
            if (!method.isLambdaBody()) continue
            val strings = method.strings()
            if (MESSENGER in strings || SHARE_TILE_ACTIONS.any { it in strings }) named += method
        }
    }
    val apps = named.filter { method -> SHARE_TILE_ACTIONS.any { it in method.strings() } }
    SHARE_TILE_ACTIONS.firstOrNull { action -> apps.none { action in it.strings() } }?.let {
        throw PatchException("$PATCH: no share tile starts $it")
    }
    val launchers = apps.flatMap { method -> method.body().filter { it.isTileLaunch() } }
        .map { (it as ReferenceInstruction).reference as MethodReference }.distinct()
    val launcher = launchers.singleOrNull()
        ?: throw PatchException("$PATCH: the tiles for Instagram, Facebook and WhatsApp use ${launchers.size} launchers")
    val messenger = named.filter { method ->
        val body = method.body()
        MESSENGER in method.strings() &&
            body.indices.any { body[it].launches(launcher) && body.getOrNull(it + 1)?.opcode != Opcode.MOVE_RESULT }
    }
    if (messenger.size != 1) throw PatchException("$PATCH: ${messenger.size} lambdas look like Messenger's tile")
    return ShareTiles(launcher, (apps + messenger).distinct())
}

/** The editable copy of [tile]. */
internal fun BytecodePatchContext.mutableTile(tile: Method): MutableMethod =
    mutableClassDefBy(tile.definingClass).methods.single {
        it.name == tile.name && it.returnType == tile.returnType &&
            it.parameterTypes.map(CharSequence::toString) == tile.parameterTypes.map(CharSequence::toString)
    }

/**
 * Threads' launcher starts an app only if it carries Meta's signature and answers false otherwise,
 * and every tile drops that answer, so a tap on a patched Messenger does nothing (#16). Each launch
 * hands its answer to the extension along with the context and intent it was given, using a register
 * nothing reads again. The launcher's check itself stays, since the rest of Threads relies on it.
 */
internal fun MutableMethod.openRefusedShareTiles(launcher: MethodReference) {
    val body = instructions.toList()
    val launches = body.indices.filter { body[it].launches(launcher) }
    if (launches.isEmpty()) throw PatchException("$PATCH: $definingClass->$name has no launch")
    for (at in launches.asReversed()) {
        val call = body[at] as FiveRegisterInstruction
        if (body[at + 1].opcode == Opcode.MOVE_RESULT) {
            throw PatchException("$PATCH: the launch at $at in $definingClass->$name already reads its answer")
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

private fun Instruction.launches(launcher: MethodReference) =
    opcode == Opcode.INVOKE_VIRTUAL && (this as ReferenceInstruction).reference == launcher

/** A Kotlin lambda's body: `invoke` or `invokeSuspend`, taking and answering an Object. */
private fun Method.isLambdaBody() =
    (name == "invoke" || name == "invokeSuspend") && returnType == "Ljava/lang/Object;" &&
        parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;")

private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Method.strings() = body().mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }

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
    requireLocals(PATCH, 3)
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
