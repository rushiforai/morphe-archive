/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.marketplaceonly

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.requireLocals
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.facebook.shared.redexOriginalName
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val STARTUP_PREFETCH = "FeedAppInits\$friendlyFeedPrefetchOnAppInit\$1"
internal const val SCREEN_ON_PREFETCH = "ScreenOnFeedPrefetchOrchestrator\$onScreenOn\$1"
internal const val FRIENDLY_FETCHER = "Lcom/facebook/feed/freshfeed/csr/FriendlyFeedSupplementalFetcher;"
internal const val SKIP_FEED_PREFETCH = "$EXTENSION_PACKAGE/navigation/MarketplaceOnly;->skipFeedPrefetch()Z"
private const val ATOMIC_BOOLEAN = "Ljava/util/concurrent/atomic/AtomicBoolean;"

internal data class PrefetchGuard(val method: Method, val index: Int, val scratch: Int)

private val Instruction.call: MethodReference?
    get() = (this as? ReferenceInstruction)?.reference as? MethodReference
private val Instruction.literal: String?
    get() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

/**
 * Only these two named feed warm-ups are changed. Neither is a user request or a shared loader.
 * The startup task already returns without fetching when its AtomicBoolean is set. Screen-on
 * first consumes a pending flag with compareAndSet(true, false); its new return must follow that
 * cleanup, at the existing cancellation branch's target, before any prefetch is started.
 */
internal fun feedPrefetchGuard(owner: ClassDef): PrefetchGuard? {
    val name = redexOriginalName(owner)
    if (name != STARTUP_PREFETCH && name != SCREEN_ON_PREFETCH) return null
    if ("Ljava/lang/Runnable;" !in owner.interfaces) return null
    val run = owner.methods.singleOrNull {
        it.name == "run" && it.returnType == "V" && it.parameterTypes.isEmpty() &&
            !AccessFlags.STATIC.isSet(it.accessFlags)
    } ?: return null
    val body = run.implementation ?: return null
    val code = body.instructions.toList()
    if (code.isEmpty() || body.registerCount < 2) return null
    if (name == STARTUP_PREFETCH) {
        if (body.tryBlocks.isNotEmpty()) return null
        if (code.count { it.call?.let { call ->
                call.definingClass == FRIENDLY_FETCHER && call.returnType == "V" &&
                    call.parameterTypes.map(CharSequence::toString) == listOf("Lcom/facebook/auth/usersession/FbUserSession;", "I")
            } == true } != 1) return null
        if (code.none { it.call?.toString() == "$ATOMIC_BOOLEAN->get()Z" }) return null
        return PrefetchGuard(run, 0, 0)
    }
    if (code.none { it.literal == "main_feed" } || code.none { it.literal == "SUPPLEMENTAL_FETCH_SCREEN_ON" }) return null
    val cas = code.indices.singleOrNull { code[it].call?.toString() == "$ATOMIC_BOOLEAN->compareAndSet(ZZ)Z" }
        ?: return null
    if (cas < 2 || cas + 9 >= code.size) return null
    val args = code[cas].callRegisters()
    if (args.size != 3) return null
    // The scheduler's pending flag is consumed, not set or merely read.
    for ((instruction, register, value) in listOf(Triple(code[cas - 2], args[1], 1L), Triple(code[cas - 1], args[2], 0L))) {
        if ((instruction as? OneRegisterInstruction)?.registerA != register ||
            (instruction as? WideLiteralInstruction)?.wideLiteral != value) return null
    }
    if (code[cas + 1].opcode != Opcode.MOVE_RESULT || code[cas + 2].literal != "ScreenOnFeedPrefetchOrchestrator") return null
    val result = (code[cas + 1] as OneRegisterInstruction).registerA
    val branch = code[cas + 3]
    if (branch.opcode != Opcode.IF_NEZ || (branch as OneRegisterInstruction).registerA != result) return null
    if (code[cas + 4].literal != "skip_foreground_cancelled" || code[cas + 6].opcode != Opcode.RETURN_VOID) return null
    val target = cas + 7
    val offset = code.subList(cas + 3, target).sumOf { it.codeUnits }
    if ((branch as OffsetInstruction).codeOffset != offset) return null
    // The first original operation overwrites the scratch value on every continuing path.
    if (code[target].opcode != Opcode.INVOKE_STATIC || code[target].call?.returnType != "Z" ||
        code[target].callRegisters().isNotEmpty() || code[target + 1].opcode != Opcode.MOVE_RESULT ||
        (code[target + 1] as OneRegisterInstruction).registerA != result) return null
    val address = code.take(target).sumOf { it.codeUnits }
    if (body.tryBlocks.any { address in it.startCodeAddress until it.startCodeAddress + it.codeUnitCount }) return null
    return PrefetchGuard(run, target, result)
}

/** Hidden dependency: the single Marketplace switch owns these guards too. */
internal val marketplaceFeedPrefetchPatch = bytecodePatch {
    dependsOn(settingsPatch)
    execute {
        val found = mutableListOf<Pair<ClassDef, PrefetchGuard>>()
        classDefForEach { owner -> feedPrefetchGuard(owner)?.let { found += owner to it } }
        for (name in listOf(STARTUP_PREFETCH, SCREEN_ON_PREFETCH)) {
            val (owner, guard) = found.singleOrNull { redexOriginalName(it.first) == name }
                ?: throw PatchException("$PATCH: expected one verified feed prefetch task named $name.")
            mutableClassDefBy(owner).methods.single { it.name == "run" && it.parameterTypes.isEmpty() }
                .guardFeedPrefetch(guard)
        }
    }
}

internal fun MutableMethod.guardFeedPrefetch(guard: PrefetchGuard) {
    requireLocals(PATCH, 1)
    addInstructionsAtControlFlowLabel(guard.index, """
        invoke-static { }, $SKIP_FEED_PREFETCH
        move-result v${guard.scratch}
        if-eqz v${guard.scratch}, :continue_prefetch
        return-void
        :continue_prefetch
        nop
    """)
}
