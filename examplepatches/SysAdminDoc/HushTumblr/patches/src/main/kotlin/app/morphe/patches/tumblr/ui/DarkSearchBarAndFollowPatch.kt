/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.hasShape
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.only
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.EXTENSION_ROOT
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val PATCH = "Dark search bar and Follow button"
internal const val DARK_CONTROLS = "$EXTENSION_PACKAGE/ui/DarkControls;"
internal const val EXPLORE_SEARCH_BAR_HOOK = "$DARK_CONTROLS->exploreSearchBar(Landroid/view/View;)V"
internal const val BLOG_FOLLOW_BUTTON_HOOK = "$DARK_CONTROLS->blogFollowButton(Landroid/view/MenuItem;)V"

/** The Follow item of a blog's top bar, whose action view is the white button of `follow_menu_item`. */
internal const val FOLLOW_ITEM_ID = "action_follow"

/** A blog's header and top bar. A fragment named in Tumblr's layouts and navigation, so R8 keeps its name. */
internal const val BLOG_HEADER = "Lcom/tumblr/ui/fragment/BlogHeaderFragment;"

private const val FIND_VIEW = "Landroid/view/View;->findViewById(I)Landroid/view/View;"
private const val FIND_ITEM = "Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;"

/** Where a found view or menu item is kept in a field: the hook goes right after, at [at], and reads [register]. */
internal class KeptViewSite(val method: MutableMethod, val at: Int, val register: Int)

/**
 * Explore's search bar and a blog's Follow button are white in every one of Tumblr's themes
 * (`search_white_rounded_corners` is plain white, and `bg_rounded_btn_image` is `st_image_ui`, white
 * in all six palettes). Neither follows the page color, so on a black background they glare.
 *
 * The bar is found once, by Explore's header helper (`com.tumblr.util.c` in 47.3.0.110), which both
 * Explore screens build. Right after the helper keeps the bar, `DarkControls.exploreSearchBar` gets
 * it. The Follow button is the action view of the `action_follow` item, which
 * [BLOG_HEADER]'s menu builder keeps in a field. Right after, `DarkControls.blogFollowButton` gets
 * the item. Both hooks only change colors, and only while their switch is on.
 */
@Suppress("unused")
val darkSearchBarAndFollowPatch = bytecodePatch(
    name = PATCH,
    description = "Adds switches that turn Explore's white search bar and the white Follow button at the top of a" +
        " blog dark, and one that takes the Search Tumblr label off the bar. They start off. Turn them on in" +
        " Tumblr settings > HushTumblr > Interface.",
    default = true,
) {
    category("Navigation")
    dependsOn(settingsPatch, tumblrExtensionPatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("darkSearchBarAndFollow")
        requireStatusMethod("darkControls")
        // Both found and checked before any edit, so a refusal leaves the APK as it was.
        val bar = resolveExploreSearchBar()
        val follow = resolveBlogFollowItem()
        bar.method.addInstructions(bar.at, "invoke-static { v${bar.register} }, $EXPLORE_SEARCH_BAR_HOOK")
        follow.method.addInstructions(follow.at, "invoke-static { v${follow.register} }, $BLOG_FOLLOW_BUTTON_HOOK")
        enableCapability("darkControls")
        enableStatus("darkSearchBarAndFollow")
    }
}

private fun Instruction.loadsId(name: String): Boolean =
    opcode == Opcode.SGET && fieldRef()?.let { it.definingClass == VIEW_IDS && it.name == name } == true

private fun Instruction.calls(signature: String): Boolean = methodRef()?.let {
    "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == signature
} == true

/**
 * The index of the `iput-object` that keeps what [finder] found for the id [name], and the register
 * it's in, or null when the method doesn't look the id up that way. Between the lookup's
 * `move-result-object` and the `iput-object` only a null check and a cast of the same register may
 * sit, so the register still holds the found thing where the hook reads it.
 */
private fun Method.keptAfterLookup(name: String, finder: String): Pair<Int, Int>? {
    val steps = instructionList()
    val load = steps.indices.filter { steps[it].loadsId(name) }.singleOrNull() ?: return null
    if (load + 3 >= steps.size || !steps[load + 1].calls(finder)) return null
    val result = steps[load + 2]
    if (result.opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val found = (result as OneRegisterInstruction).registerA
    for (at in load + 3 until minOf(load + 6, steps.size)) {
        val step = steps[at]
        when (step.opcode) {
            Opcode.IPUT_OBJECT -> return if ((step as TwoRegisterInstruction).registerA == found) at to found else null
            Opcode.CHECK_CAST -> if ((step as OneRegisterInstruction).registerA != found) return null
            Opcode.INVOKE_VIRTUAL -> if (!step.calls("Ljava/lang/Object;->getClass()Ljava/lang/Class;")) return null
            else -> return null
        }
    }
    return null
}

private fun MutableMethod.siteAfter(kept: Pair<Int, Int>, what: String): KeptViewSite {
    val (at, register) = kept
    requireShape(PATCH, register < 16, "$what sits in v$register, past what the added call can name")
    requireShape(PATCH, at + 1 < implementation!!.instructions.size, "$what is the last thing its method does")
    requireShape(
        PATCH,
        (implementation!!.instructions[at + 1] as BuilderInstruction).location.labels.isEmpty(),
        "Tumblr's code jumps to the step after it keeps $what",
    )
    return KeptViewSite(this, at + 1, register)
}

/** Where Explore's header keeps its search bar, throwing when this build has none, several, or one of another shape. */
internal fun BytecodePatchContext.resolveExploreSearchBar(): KeptViewSite {
    requireExtensionHook(PATCH, EXPLORE_SEARCH_BAR_HOOK)
    val found = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.filterTo(found) { method -> method.instructionList().any { it.loadsId(SEARCH_BAR_ID) } }
    }
    val finder = found.only(PATCH, "the code that finds Explore's search bar")
    val kept = finder.keptAfterLookup(SEARCH_BAR_ID, FIND_VIEW)
    requireShape(PATCH, kept != null, "Explore's header no longer keeps the search bar it finds")
    return mutableOf(finder).siteAfter(kept!!, "Explore's search bar")
}

/** Where a blog's top bar keeps its Follow item, throwing when this build has none, several, or one of another shape. */
internal fun BytecodePatchContext.resolveBlogFollowItem(): KeptViewSite {
    requireExtensionHook(PATCH, BLOG_FOLLOW_BUTTON_HOOK)
    val builder = (classDefByOrNull(BLOG_HEADER)?.methods ?: emptyList<Method>())
        .filter { method ->
            !method.isStatic() && method.hasShape(listOf("Landroid/view/Menu;", "Landroid/view/MenuInflater;"), "V") &&
                method.instructionList().any { it.loadsId(FOLLOW_ITEM_ID) }
        }
        .only(PATCH, "the blog top bar's menu builder")
    val kept = builder.keptAfterLookup(FOLLOW_ITEM_ID, FIND_ITEM)
    requireShape(PATCH, kept != null, "a blog's top bar no longer keeps its Follow item")
    return mutableOf(builder).siteAfter(kept!!, "a blog's Follow item")
}
