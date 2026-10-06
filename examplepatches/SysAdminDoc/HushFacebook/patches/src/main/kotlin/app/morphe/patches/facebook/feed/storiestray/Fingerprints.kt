/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.storiestray

import app.morphe.patches.facebook.feed.holdsString
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21t
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Kept literals. The Stories tray is never a feed edge: NewsFeedAdapterConfiguration builds the
 * feed's adapter list and adds the tray as an adapter of its own, in one of two methods of the same
 * class (read from 573, 577 and 580, 2026-09-25):
 *
 * - The classic tray, in the method holding the trace name [ADD_STORIES_ADAPTER] (`LX/2Qi;->A00`
 *   in 580, `LX/2Tu;->A00` in 577, `LX/2T2;->A00` in 573). It adds the tray controller's adapter to
 *   the list and returns it, or returns null.
 * - The unified "tofu" tray, in the static sibling holding [TRAY_ADAPTER_START], [TRAY_ADAPTER_STOP]
 *   and [TOFU] (`A01` of the same classes). Its first instruction returns null unless a server gate
 *   is on. The start and stop names also sit in the tray controller's constructor, which is why the
 *   sibling has to take the configuration class and the list builder too.
 *
 * Both take (the configuration class, `ImmutableList$Builder`) and are static. Their callers only look
 * the answer up in the finished list with `ImmutableList.indexOf`, which gives -1 for null, so null
 * is the state Facebook itself is in when the tray is gated off.
 */
internal const val ADD_STORIES_ADAPTER = "NewsFeedAdapterConfiguration.addStoriesAdapter"
internal const val TRAY_ADAPTER_START = "stories_tray_create_adapter_start"
internal const val TRAY_ADAPTER_STOP = "stories_tray_create_adapter_stop"
internal const val TOFU = "tofu"
internal const val IMMUTABLE_LIST_BUILDER = "Lcom/google/common/collect/ImmutableList\$Builder;"

/** Whether [method] has a tray adapter's shape: static, (its own class, list builder), an object back. */
internal fun isTrayAdapterShape(method: Method): Boolean =
    AccessFlags.STATIC.isSet(method.accessFlags) && method.implementation != null &&
        method.returnType.startsWith("L") &&
        method.parameterTypes.map { it.toString() } == listOf(method.definingClass, IMMUTABLE_LIST_BUILDER)

/** The classic tray adapter methods of [configuration]: the shape, and the trace name. */
internal fun legacyTrayAdapters(configuration: ClassDef): List<Method> = configuration.methods.filter {
    isTrayAdapterShape(it) && holdsString(it, ADD_STORIES_ADAPTER)
}

/** The unified tray adapter methods of [configuration]: the shape, and all three of its names. */
internal fun unifiedTrayAdapters(configuration: ClassDef): List<Method> = configuration.methods.filter {
    isTrayAdapterShape(it) && holdsString(it, TRAY_ADAPTER_START) && holdsString(it, TRAY_ADAPTER_STOP) &&
        holdsString(it, TOFU)
}

/**
 * The trace name of the one method that builds the feed's adapter list and calls both tray
 * adapters. The patch doesn't hook it; it's here for what its shape means to the switch. The
 * method returns first thing when a field of its own class, the list it built last time, is
 * already set, and that field is cleared only when the feed's view goes (read from 577 and 580,
 * 2026-09-26). So the tray adapters are asked once per feed view, on the resume that follows its
 * creation, and never again on a pull to refresh or a later resume. That's why the patch hides
 * the tray through its adapters' counts, which the feed reads on every change, and not where the
 * adapters are built, and why [buildsListOnce] is pinned on every declared build: a Facebook that
 * starts rebuilding the list would say so in the fixture test.
 */
internal const val CREATE_ADAPTER = "NewsFeedAdapterConfiguration.createAdapter"

/**
 * Whether [builder] calls every one of [calls] and returns before the first of them when a field
 * of its own class is already set: an `iget-object` of one of its own fields, then an `if-nez` on
 * that register to an instruction past the last call.
 */
internal fun buildsListOnce(builder: Method, calls: List<Method>): Boolean {
    val instructions = builder.implementation?.instructions?.toList() ?: return false
    val addresses = IntArray(instructions.size + 1)
    for (i in instructions.indices) addresses[i + 1] = addresses[i] + instructions[i].codeUnits
    val callIndexes = calls.map { call ->
        instructions.indexOfFirst {
            it.opcode.name.startsWith("invoke-static") &&
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.refersTo(call) == true
        }
    }
    if (callIndexes.any { it < 0 }) return false
    val firstCall = callIndexes.min()
    val lastCall = callIndexes.max()
    for (i in 0 until firstCall - 1) {
        val load = instructions[i] as? Instruction22c ?: continue
        if (load.opcode != Opcode.IGET_OBJECT) continue
        val field = load.reference as? FieldReference ?: continue
        if (field.definingClass != builder.definingClass) continue
        val guard = instructions[i + 1] as? Instruction21t ?: continue
        if (guard.opcode != Opcode.IF_NEZ || guard.registerA != load.registerA) continue
        val target = addresses.indexOf(addresses[i + 1] + guard.codeOffset)
        if (target in (lastCall + 1) until instructions.size) return true
    }
    return false
}

/**
 * Whether this reference names [method]. The parameter lists are compared by their spelling: a
 * reference's immutable list and a method's don't compare equal even when they print the same.
 */
private fun MethodReference.refersTo(method: Method): Boolean =
    definingClass == method.definingClass && name == method.name && returnType == method.returnType &&
        parameterTypes.map { it.toString() } == method.parameterTypes.map { it.toString() }
