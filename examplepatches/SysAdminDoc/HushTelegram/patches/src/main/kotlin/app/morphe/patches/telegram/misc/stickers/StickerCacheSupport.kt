/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.stickers

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.names.origType
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val STICKER_CACHE = "$EXTENSION_PACKAGE/misc/StickerCache;"
internal const val CACHE_KEPT = "$STICKER_CACHE->kept(Ljava/lang/Object;Ljava/lang/Object;)Z"
private const val SET_CONTAINS = "Ljava/util/Set;->contains(Ljava/lang/Object;)Z"
private const val KEEP_MEDIA_KEY = "keep_media_type_"
private const val NO_MEDIA = ".nomedia"

private const val OBJECT = "Ljava/lang/Object;"

/**
 * The cache cleanup's checks of whether a file is in use: each a method and the index of its
 * `Set.contains` call. Or [missing], why this build's cleanup can't keep stickers.
 */
internal class StickerCachePlan(val sites: List<Pair<MutableMethod, Int>>, val missing: String?) {
    /** The same edits on copies, so a smali problem refuses before the app is touched. */
    fun rehearse() {
        sites.groupBy({ it.first }, { it.second }).forEach { (method, at) -> edit(MutableMethod(ImmutableMethod.of(method)), at) }
    }

    fun apply() {
        sites.groupBy({ it.first }, { it.second }).forEach { (method, at) -> edit(method, at) }
    }

    /** Each check at [indices] asks the runtime instead, with the same two registers. */
    private fun edit(method: MutableMethod, indices: List<Int>) {
        for (at in indices) {
            val smali = when (val check = method.implementation!!.instructions[at]) {
                is RegisterRangeInstruction ->
                    "invoke-static/range {v${check.startRegister} .. v${check.startRegister + 1}}, $CACHE_KEPT"
                is FiveRegisterInstruction -> "invoke-static {v${check.registerC}, v${check.registerD}}, $CACHE_KEPT"
                else -> throw PatchException("Keep downloaded stickers: instruction $at of ${method.name} is no longer the in-use check")
            }
            method.replaceInstruction(at, smali)
        }
    }
}

/**
 * Telegram's cache cleanup (AutoDeleteMediaTask) skips a file whose path is in its static set of
 * files in use, both in the daily pass that deletes what a chat's Keep media time has run out on
 * and in the walk that collects files while the cache is over its size limit. The runtime answers
 * those questions instead, Telegram's set first, so with the switch on sticker files stay too. A
 * hand-made clear of the cache goes another way and still removes them.
 */
internal fun BytecodePatchContext.resolveStickerCache(): StickerCachePlan {
    fun missing(why: String) = StickerCachePlan(emptyList(), why)
    try {
        requireStatusMethod("keepStickerCache")
        controlHook(STICKER_CACHE, "kept", listOf(OBJECT, OBJECT), "Z")
    } catch (changed: PatchException) {
        return missing("the cache cleanup's runtime hook changed (${changed.message})")
    }

    // fillFilesRecursive(File, ArrayList): the size limit's walk, which skips .nomedia and the files in use.
    val walks = mutableListOf<Pair<String, String>>()
    forEachClassMentioning(Mention.reference(NO_MEDIA)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.filter { it.isCacheWalk() }.forEach { walks += cls.type to it.toString() }
    }
    if (walks.size != 1) return missing("the cache cleanup no longer walks its folders through one method (${walks.size})")
    val walk = tgMutableClassDefBy(walks.single().first).methods.single { it.toString() == walks.single().second }
    val walkChecks = walk.inUseChecks { it.definingClass == walk.definingClass && it.type == "Ljava/util/Set;" }
    if (walkChecks.size != 1) return missing("the cache cleanup's walk no longer asks once whether a file is in use (${walkChecks.size})")
    val (walkAt, inUse) = walkChecks.single()

    // The daily keep-media pass, the method that reads each Keep media time and the same set.
    val passes = mutableListOf<Pair<MutableMethod, Int>>()
    forEachClassMentioning(Mention.allReferences(listOf(KEEP_MEDIA_KEY, SET_CONTAINS))) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        val owners = cls.methods.filter { m -> m.controlBody().any { it.controlString() == KEEP_MEDIA_KEY } }.map { it.toString() }
        if (owners.isEmpty()) return@forEachClassMentioning
        for (m in tgMutableClassDefBy(cls.type).methods) {
            if (m.toString() !in owners) continue
            m.inUseChecks { it.toString() == inUse }.forEach { (at, _) -> passes += m to at }
        }
    }
    if (passes.isEmpty()) return missing("the daily cache cleanup no longer asks whether a file is in use")
    return StickerCachePlan(listOf(walk to walkAt) + passes, null)
}

/** fillFilesRecursive(File, ArrayList): static, calls itself on each folder and passes over .nomedia. */
private fun Method.isCacheWalk(): Boolean {
    if (!AccessFlags.STATIC.isSet(accessFlags) || implementation == null || returnType != "V") return false
    if (parameterTypes.map(CharSequence::toString) != listOf("Ljava/io/File;", "Ljava/util/ArrayList;")) return false
    val body = controlBody()
    val self = toString()
    return body.any { it.controlString() == NO_MEDIA } &&
        body.any { it.opcode == Opcode.INVOKE_STATIC && it.call()?.toString() == self }
}

/**
 * Each `Set.contains` call whose set was last loaded, in the code before it, from a static field
 * [field] accepts, with that field: the index of the call and the field's reference.
 */
private fun Method.inUseChecks(field: (FieldReference) -> Boolean): List<Pair<Int, String>> {
    val body = controlBody()
    val found = mutableListOf<Pair<Int, String>>()
    for (index in body.indices) {
        val call = body[index]
        if ((call.opcode != Opcode.INVOKE_INTERFACE && call.opcode != Opcode.INVOKE_INTERFACE_RANGE) || call.controlRef() != SET_CONTAINS) continue
        val set = call.namedRegisters().first()
        val load = (index - 1 downTo 0).firstOrNull { at ->
            val earlier = body[at]
            val written = (earlier as? OneRegisterInstruction)?.registerA
            earlier.opcode.setsRegister() && written != null &&
                (written == set || (earlier.opcode.setsWideRegister() && written + 1 == set))
        } ?: continue
        val read = body[load].controlField()
        if (body[load].opcode == Opcode.SGET_OBJECT && read != null && field(read)) found += index to read.toString()
    }
    return found
}
