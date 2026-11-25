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
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import app.morphe.util.writesRegister
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val PATCH = "Fix hard-to-read text"
internal const val READABLE_TEXT = "$EXTENSION_PACKAGE/ui/ReadableText;"
internal const val RELATED_TAG_HEIGHT_HOOK = "$READABLE_TEXT->relatedTagHeight(Landroid/view/View;I)I"
internal const val BLOG_SEARCH_BOX_HOOK = "$READABLE_TEXT->blogSearchBox(Landroid/graphics/drawable/Drawable;II)I"

/** The row of related tags under a trending topic. A view named in Tumblr's layouts, so R8 keeps its name. */
internal const val TAG_CAROUSEL = "Lcom/tumblr/ui/widget/TagCarousel;"

/** Tumblr's dimensions. The class and its field names are kept. */
internal const val TUMBLR_DIMENS = "Lcom/tumblr/R\$dimen;"

/** The fixed height the row gives each tag, 23.5 dp. */
internal const val RELATED_TAG_HEIGHT = "dashboard_card_carousel_tag_height"

/** The results of a search inside a blog. An activity in the manifest, so its name is kept. */
internal const val BLOG_SEARCH = "Lcom/tumblr/ui/activity/GraywaterBlogSearchActivity;"

/**
 * The screen that search is typed on, the one fragment `InblogSearchActivity` shows. It colors its
 * own box, with the same steps the results screen uses.
 */
internal const val BLOG_SEARCH_TYPING = "Lcom/tumblr/ui/widget/blogpages/search/InblogSearchTabbedFragment;"

/** 0.2 as a float, the strength of the tint Tumblr gives the search box. */
internal const val SEARCH_BOX_TINT = 0x3e4ccccd

private const val LAYOUT_PARAMS = "Landroid/view/ViewGroup\$LayoutParams;"
private const val SET_LAYOUT_PARAMS = "Landroid/view/View;->setLayoutParams($LAYOUT_PARAMS)V"
private const val SET_TINT = "Landroid/graphics/drawable/Drawable;->setTint(I)V"
private const val SET_HINT_COLOR = "Landroid/widget/TextView;->setHintTextColor(I)V"
private const val MUTATE = "Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;"

/** The tag row's builder: the hook goes at [at], before the height in [height] is stored, and reads the tag in [tag]. */
internal class RelatedTagSite(val method: MutableMethod, val at: Int, val tag: Int, val height: Int)

/**
 * A blog search screen's color method: the hook goes at [at], before `setTint`, and reads the box's
 * background in [box], the text color in [text] and Tumblr's tint in [tint].
 */
internal class SearchBoxSite(val method: MutableMethod, val at: Int, val box: Int, val text: Int, val tint: Int)

/**
 * Two places where Tumblr's layout leaves text unreadable, each fixed where the value is set.
 *
 * [TAG_CAROUSEL] builds each related tag under a trending topic with a `LinearLayout.LayoutParams`
 * whose height is the fixed [RELATED_TAG_HEIGHT], while the tag's text is sized in sp. At a bigger
 * font the text is taller than its view and the bottom is cut off. The height goes through
 * `ReadableText.relatedTagHeight` on its way into the params, which answers wrap content and keeps
 * Tumblr's height as the least.
 *
 * A search inside a blog is two screens, [BLOG_SEARCH_TYPING] where it's typed and [BLOG_SEARCH]
 * for its results, and both are themed by the blog: with a header image, the top bar is that image
 * blurred and the text color is always white. The box typed in is a 20% white shape under a 20%
 * tint of the text color, so over a bright header white text has nothing behind it. On each screen
 * the tint goes through `ReadableText.blogSearchBox` on its way into `setTint`, with the box's
 * drawable and the text color.
 */
@Suppress("unused")
val fixHardToReadTextPatch = bytecodePatch(
    name = PATCH,
    description = "Fits the related tags under a trending topic at bigger text sizes, where Tumblr cuts them in" +
        " half, and shades the box you type in when you search a blog so the words show over a bright header." +
        " On by default. Turn it off in Tumblr settings > HushTumblr > Interface.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, tumblrExtensionPatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("fixHardToReadText")
        requireStatusMethod("readableText")
        // All three found and checked before any edit, so a refusal leaves the APK as it was.
        val tag = resolveRelatedTagHeight()
        val boxes = resolveBlogSearchBoxes()
        tag.method.addInstructions(
            tag.at,
            "invoke-static { v${tag.tag}, v${tag.height} }, $RELATED_TAG_HEIGHT_HOOK\n" +
                "move-result v${tag.height}",
        )
        for (box in boxes) box.method.addInstructions(
            box.at,
            "invoke-static { v${box.box}, v${box.text}, v${box.tint} }, $BLOG_SEARCH_BOX_HOOK\n" +
                "move-result v${box.tint}",
        )
        enableCapability("readableText")
        enableStatus("fixHardToReadText")
    }
}

private fun Instruction.calls(signature: String): Boolean = methodRef()?.let {
    "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == signature
} == true

private fun Instruction.loadsTagHeight(): Boolean =
    opcode == Opcode.SGET && fieldRef()?.let { it.definingClass == TUMBLR_DIMENS && it.name == RELATED_TAG_HEIGHT } == true

private fun MutableMethod.requireNoJumpTo(at: Int, what: String) = requireShape(
    PATCH,
    (implementation!!.instructions[at] as BuilderInstruction).location.labels.isEmpty(),
    "Tumblr's code jumps to $what",
)

/**
 * Where the tag row stores a tag's fixed height, throwing when this build has none, several, or one
 * of another shape.
 *
 * The builder reads [RELATED_TAG_HEIGHT], turns it into pixels with a static call, stores the
 * answer in the params' `height`, and then hands the params to the tag with `setLayoutParams`. The
 * tag is the receiver of that call, so it's a view, and nothing may write its register between the
 * hook and the call.
 */
internal fun BytecodePatchContext.resolveRelatedTagHeight(): RelatedTagSite {
    requireExtensionHook(PATCH, RELATED_TAG_HEIGHT_HOOK)
    val builder = (classDefByOrNull(TAG_CAROUSEL)?.methods ?: emptyList<Method>())
        .filter { method -> method.instructionList().any { it.loadsTagHeight() } }
        .only(PATCH, "the related tags row's tag builder")
    val steps = builder.instructionList()
    val load = steps.indices.filter { steps[it].loadsTagHeight() }.only(PATCH, "the related tag height's read")
    requireShape(PATCH, load + 3 < steps.size, "the related tag height is read at the end of its method")
    val pixels = steps[load + 1]
    val answer = steps[load + 2]
    val store = steps[load + 3]
    requireShape(
        PATCH,
        pixels.opcode == Opcode.INVOKE_STATIC && pixels.methodRef()?.returnType == "I" &&
            answer.opcode == Opcode.MOVE_RESULT && store.opcode == Opcode.IPUT &&
            store.fieldRef()?.let { it.name == "height" && it.type == "I" } == true,
        "the related tag height no longer goes straight into the tag's layout params",
    )
    val height = (answer as OneRegisterInstruction).registerA
    val params = (store as TwoRegisterInstruction).registerB
    requireShape(PATCH, store.registerA == height, "the tag's layout params take another value as their height")
    val handed = (load + 4 until steps.size).firstOrNull { steps[it].calls(SET_LAYOUT_PARAMS) }
    requireShape(PATCH, handed != null, "the tag's layout params are never handed to the tag")
    val hand = steps[handed!!] as FiveRegisterInstruction
    requireShape(PATCH, hand.registerCount == 2 && hand.registerD == params, "another view takes the tag's layout params")
    val tag = hand.registerC
    requireShape(PATCH, tag != height && tag != params, "the tag shares a register with its height or params")
    requireShape(PATCH, tag < 16 && height < 16, "the tag or its height sits past what the added call can name")
    requireShape(
        PATCH,
        steps.subList(load, handed).none { writesRegister(it, tag) },
        "the tag is made after its height is read",
    )
    val method = mutableOf(builder)
    for (at in load + 1..handed) method.requireNoJumpTo(at, "the middle of the tag's height being set")
    return RelatedTagSite(method, load + 3, tag, height)
}

/**
 * Where the two blog search screens tint their boxes, the typing screen first, throwing when either
 * has none, several, or one of another shape.
 */
internal fun BytecodePatchContext.resolveBlogSearchBoxes(): List<SearchBoxSite> {
    requireExtensionHook(PATCH, BLOG_SEARCH_BOX_HOOK)
    return listOf(
        resolveSearchBox(BLOG_SEARCH_TYPING, "the blog search typing screen"),
        resolveSearchBox(BLOG_SEARCH, "the blog search results screen"),
    )
}

/**
 * Where the screen in [owner] tints its box.
 *
 * The screen's color method takes the text color, sets the hint color, and tints the box's own
 * background: `mutate()`, the 0.2 float, a static call that fades the text color by it, and
 * `setTint` with the answer.
 */
private fun BytecodePatchContext.resolveSearchBox(owner: String, screen: String): SearchBoxSite {
    val colors = (classDefByOrNull(owner)?.methods ?: emptyList<Method>())
        .filter { method ->
            !method.isStatic() && method.hasShape(listOf("I"), "V") &&
                method.instructionList().let { steps -> steps.any { it.calls(SET_TINT) } && steps.any { it.calls(SET_HINT_COLOR) } }
        }
        .only(PATCH, "$screen's color method")
    val steps = colors.instructionList()
    val set = steps.indices.filter { steps[it].calls(SET_TINT) }.only(PATCH, "$screen's box tint")
    requireShape(PATCH, set >= 5, "$screen tints its box at the start of its method")
    val mutate = steps[set - 5]
    val mutated = steps[set - 4]
    val strength = steps[set - 3]
    val fade = steps[set - 2]
    val faded = steps[set - 1]
    requireShape(
        PATCH,
        mutate.calls(MUTATE) && mutated.opcode == Opcode.MOVE_RESULT_OBJECT &&
            strength.opcode == Opcode.CONST && (strength as NarrowLiteralInstruction).narrowLiteral == SEARCH_BOX_TINT &&
            fade.opcode == Opcode.INVOKE_STATIC && fade.methodRef()?.hasShape(listOf("I", "F"), "I") == true &&
            faded.opcode == Opcode.MOVE_RESULT,
        "$screen's box tint is no longer the text color at 20%",
    )
    val box = (mutated as OneRegisterInstruction).registerA
    val tint = (faded as OneRegisterInstruction).registerA
    val text = (fade as FiveRegisterInstruction).registerC
    val tinted = steps[set] as FiveRegisterInstruction
    requireShape(
        PATCH,
        tinted.registerCount == 2 && tinted.registerC == box && tinted.registerD == tint &&
            fade.registerCount == 2 && fade.registerD == (strength as OneRegisterInstruction).registerA,
        "$screen's box tint goes to another drawable",
    )
    requireShape(PATCH, setOf(box, tint, text).size == 3, "$screen's box, its tint and the text color share a register")
    requireShape(PATCH, box < 16 && tint < 16 && text < 16, "$screen's box tint sits past what the added call can name")
    val method = mutableOf(colors)
    for (at in set - 4..set) method.requireNoJumpTo(at, "the middle of $screen's box tint")
    return SearchBoxSite(method, set, box, text, tint)
}
