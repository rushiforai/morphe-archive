/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tumblr.flags.featureSwitchHookPatch
import app.morphe.patches.tumblr.lookup.appClassesWithString
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.hasShape
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.only
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.lookup.sameAs
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.lookup.strings
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.patchLog
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.EXTENSION_ROOT
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import app.morphe.util.namedRegisters
import app.morphe.util.writesRegister
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Hide Blaze prompts"
internal const val BLAZE_BUTTONS = "$EXTENSION_PACKAGE/ui/BlazeButtons;"
internal const val OWN_POST_BLAZE_HOOK = "$BLAZE_BUTTONS->ownPostButton(I)Z"
internal const val POST_MENU_BLAZE_HOOK = "$BLAZE_BUTTONS->postMenuItem(I)Z"
internal const val SHARE_BLAZE_HOOK = "$BLAZE_BUTTONS->shareTarget(I)Z"
internal const val COMMUNITY_MENU_HOOK = "$BLAZE_BUTTONS->communityMenu(Ljava/util/List;)Ljava/util/List;"

/** How the state of the row under your own posts prints itself. Only that class loads it. */
internal const val AUTHOR_ACTIONS_STATE = "AuthorActionsState(showDelete="

/** What the row's state prints in front of its show-Blaze flag. */
internal const val SHOW_BLAZE = ", showBlaze="

/** The Blaze item's label in a post's three-dot menu. R keeps its field names. */
internal const val CORE_STRINGS = "Lcom/tumblr/core/ui/R\$string;"
internal const val BLAZE_MENU_LABEL = "blaze_post_overflow_menu_action_item"

/** The share sheet's argument that says the post can be Blazed. */
internal const val CAN_BLAZE = "can_blaze"

/** A community post's menu: its post, its items and the Promote item. Rumblr's models keep their names. */
internal const val COMMUNITY_POST_INFO = "Lcom/tumblr/rumblr/communities/CommunityPostInfo;"
internal const val COMMUNITY_MENU_ITEM = "Lcom/tumblr/rumblr/communities/PostOverflowMenuItem;"
internal const val COMMUNITY_PROMOTE = "Lcom/tumblr/rumblr/communities/PostOverflowMenuItem\$PromotePost;"

/** One Blaze button's answer: [hook] goes in at [at], takes [register] and hands its answer back there. */
internal class BlazeSite(val method: MutableMethod, val at: Int, val register: Int, val hook: String) {
    /** Whether the answer is a list, moved back as an object. */
    val list: Boolean get() = hook.endsWith(")Ljava/util/List;")
}

/**
 * Turns on the extension's claims on Tumblr's Blaze prompt flags: the Blaze dashboard entry points
 * in your blog's header and beside Premium, the nudge after you post, and the settings and landing
 * page banners. The feature switch hook then answers off for each while the switch is on.
 *
 * The Blaze buttons on posts have no flag of their own, so [resolveBlazeSites] finds the four
 * answers they're shown from and `BlazeButtons` answers no for each while the switch is on: the
 * flame under your own posts, the Blaze item in a post's three-dot menu, Blaze in the share sheet
 * and Promote in a community post's menu. All four or none: a build where one doesn't fit keeps
 * every Blaze button on posts, logs why, and the switch still hides the prompts above. Found by
 * reading Tumblr 47.0.0.108 (2026-11-13).
 */
@Suppress("unused")
val hideBlazePromptsPatch = bytecodePatch(
    name = PATCH,
    description = "Hides the prompts to pay for Blaze, Tumblr's way to promote a post. That covers the Blaze" +
        " buttons on your blog and dashboard, the nudge after you post, the Blaze banners, and the Blaze" +
        " buttons on posts: the flame under your own posts, Blaze in a post's menu and the share sheet, and" +
        " Promote in community posts. Starts off. Turn it on in Tumblr settings > HushTumblr > Interface.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, tumblrExtensionPatch, featureSwitchHookPatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("hideBlazePrompts")
        requireStatusMethod("blazePromptFlags")
        requireStatusMethod("blazeButtons")
        enableCapability("blazePromptFlags")
        if (hookBlazeButtons()) enableCapability("blazeButtons")
        enableStatus("hideBlazePrompts")
    }
}

/**
 * Puts each Blaze button's hook in, all four or none. False, with a warning and nothing changed,
 * when this build doesn't show them the way 47.0.0.108 does.
 */
internal fun BytecodePatchContext.hookBlazeButtons(): Boolean {
    val sites = try {
        resolveBlazeSites()
    } catch (refused: PatchException) {
        patchLog.warning("${refused.message}, so the Blaze buttons on posts stay")
        return false
    }
    // Only once every site is there: a call to a method the extension lacks would crash Tumblr.
    sites.forEach { requireExtensionHook(PATCH, it.hook) }
    for (site in sites) {
        val move = if (site.list) "move-result-object" else "move-result"
        site.method.addInstructions(
            site.at,
            """
                invoke-static/range { v${site.register} .. v${site.register} }, ${site.hook}
                $move v${site.register}
            """,
        )
    }
    return true
}

/** The four Blaze answers, checked before any edit. Throws when one doesn't fit. */
internal fun BytecodePatchContext.resolveBlazeSites(): List<BlazeSite> = listOf(
    resolveOwnPostFlame(),
    resolvePostMenuBlaze(),
    resolveShareSheetBlaze(),
    resolveCommunityPromote(),
)

/**
 * The flame in the row under your own posts. The row's state is a data class whose `toString`
 * prints [SHOW_BLAZE] and then the flag read from its field; its getter for that field reads it
 * and returns it, and the hook goes in front of that return. In 47.0.0.108 that's `m01.y()`,
 * read by the row (`a01.i`) and Tumblr TV's two post views.
 */
internal fun BytecodePatchContext.resolveOwnPostFlame(): BlazeSite {
    val state = appClassesWithString(AUTHOR_ACTIONS_STATE).only(PATCH, "the state of the row under your own posts")
    val printer = state.methods.filter { AUTHOR_ACTIONS_STATE in it.strings() }
        .only(PATCH, "the printer of the state of the row under your own posts")
    val body = printer.instructionList()
    val label = body.indexOfFirst { it.opcode == Opcode.CONST_STRING && it.stringRef() == SHOW_BLAZE }
    val append = body.getOrNull(label + 2)
    val appended = append?.methodRef()
    requireShape(
        PATCH,
        label >= 0 && appended != null && appended.definingClass == "Ljava/lang/StringBuilder;" &&
            appended.name == "append" && appended.hasShape(listOf("Z"), "Ljava/lang/StringBuilder;"),
        "the row under your own posts doesn't print its Blaze flag after \"$SHOW_BLAZE\"",
    )
    val flag = append!!.namedRegisters()[1]
    val read = (label - 1 downTo 0).firstOrNull { writesRegister(body[it], flag) }
    val field = read?.let { body[it] }?.takeIf { it.opcode == Opcode.IGET_BOOLEAN }?.fieldRef()
    requireShape(
        PATCH,
        field != null && field.definingClass == state.type && (label until label + 2).none { writesRegister(body[it], flag) },
        "the row under your own posts doesn't print its Blaze flag from its own field",
    )
    val getters = state.methods.filter { it.readsAndReturns(field!!) }
    return getterSite(getters.only(PATCH, "the getter of the Blaze flag of the row under your own posts"), OWN_POST_BLAZE_HOOK)
}

/**
 * The Blaze item in a post's three-dot menu. Each menu builder asks the post whether it can be
 * Blazed and adds the item, labeled [BLAZE_MENU_LABEL], only when it can: a no-argument boolean
 * getter, its answer and an `if-eqz` on it right before the label is read. Every builder asks the
 * same getter, which reads the post's field and returns it, and the hook goes in front of that
 * return. In 47.0.0.108 that's `r4g.J()`, asked by the post header's menu (`PostCardHeader.H2`) and
 * the notes screen's (`flh.y`). The other readers of the label draw the flame and the blog
 * header's Blaze entry, which aren't asked that way.
 */
internal fun BytecodePatchContext.resolvePostMenuBlaze(): BlazeSite {
    val asked = mutableListOf<MethodReference>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        for (method in owner.methods) {
            val body = method.instructionList()
            for ((at, instruction) in body.withIndex()) {
                val label = instruction.fieldRef()
                if (instruction.opcode != Opcode.SGET || label?.definingClass != CORE_STRINGS || label.name != BLAZE_MENU_LABEL) continue
                gatingGetter(body, at)?.let { asked += it }
            }
        }
    }
    requireShape(PATCH, asked.isNotEmpty(), "no post menu asks whether a post can be Blazed before it adds the Blaze item")
    val getter = asked.first()
    requireShape(PATCH, asked.all { it.sameAs(getter) }, "the post menus ask ${asked.distinctBy { it.toString() }.size} different questions before they add the Blaze item")
    val owner = classDefByOrNull(getter.definingClass)
    val method = owner?.methods?.singleOrNull { it.sameAs(getter) }
    requireShape(PATCH, method != null && method.readsAndReturns(null), "$getter doesn't read the post's Blaze flag and return it")
    return getterSite(method!!, POST_MENU_BLAZE_HOOK)
}

/** The getter whose answer the `if-eqz` right before [at] tests, as `invoke-virtual {p} ->()Z; move-result`, or null. */
private fun gatingGetter(body: List<Instruction>, at: Int): MethodReference? {
    val ask = body.getOrNull(at - 3) ?: return null
    val answer = body.getOrNull(at - 2) ?: return null
    val test = body.getOrNull(at - 1) ?: return null
    val getter = ask.methodRef() ?: return null
    if (ask.opcode != Opcode.INVOKE_VIRTUAL || !getter.hasShape(emptyList(), "Z")) return null
    if (answer.opcode != Opcode.MOVE_RESULT || test.opcode != Opcode.IF_EQZ) return null
    return getter.takeIf { (answer as OneRegisterInstruction).registerA == (test as OneRegisterInstruction).registerA }
}

/**
 * Whether the method is an instance getter with no arguments that reads a boolean field of its own
 * class ([field], or any when null) from `this` and returns it, and nothing else.
 */
private fun Method.readsAndReturns(field: FieldReference?): Boolean {
    if (isStatic() || parameterTypes.isNotEmpty() || returnType != "Z") return false
    val body = instructionList()
    if (body.size != 2 || body[0].opcode != Opcode.IGET_BOOLEAN || body[1].opcode != Opcode.RETURN) return false
    val read = body[0].fieldRef() ?: return false
    val self = implementation!!.registerCount - 1
    return read.definingClass == definingClass && read.type == "Z" && (field == null || read.name == field.name) &&
        (body[0] as TwoRegisterInstruction).registerB == self &&
        (body[0] as OneRegisterInstruction).registerA == (body[1] as OneRegisterInstruction).registerA
}

/** The hook in front of [getter]'s return, on the flag it read. */
private fun BytecodePatchContext.getterSite(getter: Method, hook: String): BlazeSite {
    val flag = (getter.instructionList()[0] as OneRegisterInstruction).registerA
    return BlazeSite(mutableOf(getter), 1, flag, hook)
}

/**
 * Blaze in the share sheet. The sheet builds its targets in a method that reads [CAN_BLAZE] from
 * its arguments with `getBoolean` and adds the Blaze target only when it's true, an `if-eqz` on the
 * answer. The hook goes in front of that test. In 47.0.0.108 that's `com.tumblr.sharing.d.Q6()`.
 * The sheet's argument comes from the same Blaze check the Blaze dashboard reads, so it's
 * answered here, where only the share sheet reads it.
 */
internal fun BytecodePatchContext.resolveShareSheetBlaze(): BlazeSite {
    val sites = mutableListOf<BlazeSite>()
    for (owner in appClassesWithString(CAN_BLAZE)) for (method in owner.methods) {
        val body = method.instructionList()
        for ((at, instruction) in body.withIndex()) {
            if (instruction.opcode != Opcode.CONST_STRING || instruction.stringRef() != CAN_BLAZE) continue
            val key = (instruction as OneRegisterInstruction).registerA
            val read = (at + 1..at + 2).firstOrNull { body.getOrNull(it)?.methodRef()?.name == "getBoolean" } ?: continue
            val call = body[read]
            val answer = body.getOrNull(read + 1)
            val test = body.getOrNull(read + 2)
            if (call.methodRef()?.hasShape(listOf("Ljava/lang/String;", "Z"), "Z") != true || call.namedRegisters().getOrNull(1) != key) continue
            if (answer?.opcode != Opcode.MOVE_RESULT || test?.opcode != Opcode.IF_EQZ) continue
            val shown = (answer as OneRegisterInstruction).registerA
            if ((test as OneRegisterInstruction).registerA != shown) continue
            sites += BlazeSite(mutableOf(method), read + 2, shown, SHARE_BLAZE_HOOK)
        }
    }
    val site = sites.only(PATCH, "the share sheet's Blaze target")
    requireFallthrough(site, "the share sheet's Blaze test")
    return site
}

/**
 * Promote in a community post's menu. The menu's model hands over the items for a
 * [COMMUNITY_POST_INFO] as a list, and the menu turns each [COMMUNITY_MENU_ITEM] into a row. The
 * hook takes that list right after it's handed over and hands back one without
 * [COMMUNITY_PROMOTE]. In 47.0.0.108 that's `t2g$a.invokeSuspend`, the only caller of `bm4.a`.
 */
internal fun BytecodePatchContext.resolveCommunityPromote(): BlazeSite {
    requireShape(PATCH, classDefByOrNull(COMMUNITY_PROMOTE)?.superclass == COMMUNITY_MENU_ITEM,
        "$COMMUNITY_PROMOTE isn't a community post menu item in this build")
    val sites = mutableListOf<BlazeSite>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        for (method in owner.methods) {
            val body = method.instructionList()
            if (body.none { it.opcode == Opcode.CHECK_CAST && it.typeRef() == COMMUNITY_MENU_ITEM }) continue
            for ((at, instruction) in body.withIndex()) {
                val call = instruction.methodRef() ?: continue
                if (instruction.opcode != Opcode.INVOKE_INTERFACE || !call.hasShape(listOf(COMMUNITY_POST_INFO), "Ljava/util/List;")) continue
                val answer = body.getOrNull(at + 1)
                if (answer?.opcode != Opcode.MOVE_RESULT_OBJECT) continue
                sites += BlazeSite(mutableOf(method), at + 2, (answer as OneRegisterInstruction).registerA, COMMUNITY_MENU_HOOK)
            }
        }
    }
    val site = sites.only(PATCH, "a community post menu's items")
    requireFallthrough(site, "a community post menu's items")
    return site
}

private fun Instruction.typeRef(): String? = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

/** Refuses when anything jumps onto the place the hook goes, which would skip it. */
private fun requireFallthrough(site: BlazeSite, what: String) {
    val implementation = site.method.implementation!!
    requireShape(
        PATCH,
        site.at < implementation.instructions.size &&
            (implementation.instructions[site.at] as BuilderInstruction).location.labels.isEmpty(),
        "something in ${site.method.definingClass}->${site.method.name} jumps past where $what is answered",
    )
}
