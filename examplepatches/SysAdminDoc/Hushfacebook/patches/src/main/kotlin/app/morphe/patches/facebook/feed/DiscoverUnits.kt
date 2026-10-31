/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * The feed's rows of Stories between posts, read from 577 and 580 (2026-09-27).
 *
 * Facebook sends such a row as a feed edge whose unit answers [DISCOVER_FEED_UNIT_TYPE], a literal
 * of the shared showcase model's `getTypeName()` (`LX/3zj;` in 580, `LX/3zZ;` in 577, which also
 * answers StoriesTrayFeedUnit and ShowcaseFeedUnit). Its edge validator (580 `LX/2Rw;->CZn`, 577
 * `LX/2Pe;->Ca0`) checks the unit's cards, and the part definition that sees that type tag builds
 * Facebook's DiscoverUnitComponent for it (580 `LX/7Y4;`, 577 `LX/6ls;`). That component reads the
 * unit's [UNCONNECTED_STORIES_FLAG] (0xaff56b7b) through `TreeJNI.getBooleanValue`, and a row with
 * it set opens its Stories as `from_feed_inline_viewer_multi_bucket_unconnected`: the row of
 * several people's Stories you aren't connected to, "Stories you might like". Facebook's feed
 * ranking files the same rows under the story type MBSU_UNCONNECTED.
 *
 * 585 (2026-10-30): the component (arm64 `LX/094U;`, armv7 `LX/094Z;`) no longer reads the flag
 * itself. Its `render` asks the unit model's accessor (arm64 `LX/0AeR;->HER()Z`, armv7
 * `LX/0AeU;->HEP()Z`), and of that interface's two implementations one loads 0xaff56b7b into
 * `TreeJNI.getBooleanValue` (arm64 `LX/094W;`, armv7 `LX/094b;`) and the other into the tree
 * interface's own `(I)Z` (arm64 `LX/0CEv;`, armv7 `LX/0CEy;`). Nothing else in the APK loads the key.
 */
internal const val DISCOVER_FEED_UNIT_TYPE = "DiscoverFeedUnit"
internal const val UNCONNECTED_STORIES_FLAG = "is_unconnected_mbsu"

/**
 * Kept name. The layout manager DiscoverUnitComponent builds for its row of cards, a Kotlin inner
 * class whose constructor takes the component itself, which is how the component's renamed class
 * is found.
 */
internal const val DISCOVER_UNIT_LAYOUT =
    "Lcom/facebook/feed/discoverunits/DiscoverUnitComponent\$getLinearLayoutInfoFactory\$1\$1;"

/** Kept name and member. The native reader Facebook's component reads the flag with. */
private const val TREE_BOOLEAN_READER = "Lcom/facebook/graphservice/tree/TreeJNI;->getBooleanValue(I)Z"

private fun MethodReference.asString() =
    "$definingClass->$name(${parameterTypes.joinToString("") { it.toString() }})$returnType"

/**
 * Whether [method] loads the key of [UNCONNECTED_STORIES_FLAG] and hands that register, within the
 * next few instructions, to `TreeJNI.getBooleanValue`: how Facebook's DiscoverUnitComponent reads it.
 */
internal fun readsUnconnectedStoriesFlag(method: Method): Boolean {
    val key = treeFieldKey(UNCONNECTED_STORIES_FLAG)
    val body = method.implementation?.instructions?.toList() ?: return false
    body.forEachIndexed { index, instruction ->
        if (instruction !is NarrowLiteralInstruction || instruction !is OneRegisterInstruction ||
            !instruction.opcode.name.startsWith("const") || instruction.narrowLiteral != key
        ) {
            return@forEachIndexed
        }
        val register = instruction.registerA
        for (next in body.subList(index + 1, minOf(body.size, index + 4))) {
            val call = (next as? ReferenceInstruction)?.reference as? MethodReference ?: continue
            if (next.opcode == Opcode.INVOKE_VIRTUAL && call.asString() == TREE_BOOLEAN_READER &&
                (next as? FiveRegisterInstruction)?.registerD == register
            ) {
                return true
            }
        }
    }
    return false
}

/** Each `()Z` method [method] calls, as `Owner->name`: where 585's component asks the unit model's accessors. */
internal fun booleanAccessorCalls(method: Method): Set<String> =
    method.implementation?.instructions?.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        ?.filter { it.parameterTypes.isEmpty() && it.returnType == "Z" }
        ?.map { "${it.definingClass}->${it.name}" }
        ?.toSet() ?: emptySet()

/**
 * Of [owners], each `Owner->name` accessor that [classDef] implements with a method reading
 * [UNCONNECTED_STORIES_FLAG]: the class itself or an interface it declares, by the reading method's name.
 */
internal fun unconnectedStoriesAccessors(classDef: ClassDef, owners: Set<String>): Set<String> {
    val implemented = (classDef.interfaces + classDef.type).filter { it in owners }
    if (implemented.isEmpty()) return emptySet()
    return classDef.methods.filter { it.parameterTypes.isEmpty() && it.returnType == "Z" && readsUnconnectedStoriesFlag(it) }
        .flatMap { reader -> implemented.map { "$it->${reader.name}" } }
        .toSet()
}

/**
 * The classes [layout]'s constructor takes that read [UNCONNECTED_STORIES_FLAG]: DiscoverUnitComponent,
 * as [classOf] finds each parameter's class. A build wants exactly one. Up to 584 the component reads
 * the flag itself; 585's asks the unit model's `()Z` accessor (arm64 `LX/0AeR;->HER()Z`, armv7
 * `LX/0AeU;->HEP()Z`), and [flagAccessors], handed the owners of every `()Z` call the candidates make,
 * answers which of them have an implementation reading the flag ([unconnectedStoriesAccessors]).
 */
internal fun unconnectedStoriesReaders(
    layout: ClassDef,
    flagAccessors: (Set<String>) -> Set<String> = { emptySet() },
    classOf: (String) -> ClassDef?,
): List<ClassDef> {
    val candidates = layout.methods.filter { it.name == "<init>" }
        .flatMap { constructor -> constructor.parameterTypes.map { it.toString() } }
        .filter { it.startsWith("L") }
        .distinct()
        .mapNotNull(classOf)
    // Why: 585 moved the tree read into the unit model's accessor, so a call to an accessor whose
    // implementation reads the flag counts as the component reading it.
    val asked = candidates.flatMap { component -> component.methods.flatMap(::booleanAccessorCalls) }.toSet()
    val reading = if (asked.isEmpty()) emptySet() else flagAccessors(asked.map { it.substringBefore("->") }.toSet()) intersect asked
    return candidates.filter { component ->
        component.methods.any { readsUnconnectedStoriesFlag(it) || booleanAccessorCalls(it).any(reading::contains) }
    }
}
