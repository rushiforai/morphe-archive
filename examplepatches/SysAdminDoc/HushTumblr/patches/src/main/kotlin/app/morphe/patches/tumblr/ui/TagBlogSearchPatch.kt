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
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
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
import app.morphe.patches.tumblr.lookup.sameAs
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.localRegisterCount
import app.morphe.patches.tumblr.misc.extension.parameterRegisterNumber
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.requireThisIntact
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val PATCH = "Tags open the blog's tag search"
internal const val BLOG_TAGS = "$EXTENSION_PACKAGE/ui/BlogTags;"
internal const val BLOG_SCREEN_HOOK = "$BLOG_TAGS->blogScreen(ILjava/lang/Object;)Z"

/** What Tumblr's tag listener is given while patching, so the extension can ask it for the posting blog. */
internal const val HUSH_TAG_BLOG = "$EXTENSION_PACKAGE/ui/HushTagBlog;"
internal const val TAG_BLOG_NAME = "hushTagBlogName"

/** Tumblr's blog model. Parcelable and named in its activities' extras, so R8 keeps its name. */
internal const val TAG_BLOG_INFO = "Lcom/tumblr/bloginfo/BlogInfo;"

/** The screen a view was opened from, kept by name for analytics. */
internal const val TAG_NAVIGATION = "Lcom/tumblr/analytics/NavigationState;"
internal const val TAG_SCREEN_TYPE = "Lcom/tumblr/analytics/ScreenType;"

/** The activity behind a blog's search, blog.tumblr.com/tagged/tag in the app. A manifest entry, so its name is kept. */
internal const val BLOG_TAG_SEARCH = "Lcom/tumblr/ui/activity/GraywaterBlogSearchActivity;"

private const val TAG_CLICK_LISTENER = "Landroid/view/View\$OnClickListener;"
private const val TAG_VIEW = "Landroid/view/View;"
private const val TAG_CONTEXT = "Landroid/content/Context;"
private const val TAG_STRING = "Ljava/lang/String;"

/**
 * Makes a tag tapped under a post open the posting blog's own search for the tag, the screen
 * blog.tumblr.com/tagged/tag shows, while the switch is on.
 *
 * [WRAPPED_TAGS] gives each tag it draws a click listener built with the screen it's on and the
 * blog that posted the post (Tumblr's `af1.D()` for a post card, an empty blog for anything
 * else). The listener's `onClick` asks a static question of the screen type: whether it belongs to
 * a blog. Yes opens [BLOG_TAG_SEARCH] for the listener's blog; no opens Tumblr's search of every
 * blog, or a community's tag filter for a community's post. `BlogTags.blogScreen` goes right after
 * that question and may answer yes in its place, so every post card's tags follow Tumblr's own
 * blog path: the dashboard, other feeds, search and tag pages, and a post opened by itself.
 *
 * The listener gets [HUSH_TAG_BLOG], answering its blog's name, or null exactly when Tumblr's own
 * blog path would find no blog (its `BlogInfo` emptiness test), so a post with no blog name keeps
 * Tumblr's search. The listener is the one class [WRAPPED_TAGS] creates that is a click listener
 * built from a navigation state and a blog. Found by reading Tumblr 47.0.0.108 (2026-11-13), where
 * it is `t$b`, the question `pv2.j` and the emptiness test `BlogInfo.F0`.
 */
@Suppress("unused")
val tagBlogSearchPatch = bytecodePatch(
    name = PATCH,
    description = "Tapping a tag under a post opens that blog's own search for the tag, like blog.tumblr.com/tagged," +
        " in place of a search of all of Tumblr. Works on posts in the dashboard, other feeds and a post opened by itself." +
        " Starts off. Turn it on in Tumblr settings > HushTumblr > Posts.",
    default = true,
) {
    category("Navigation")
    dependsOn(settingsPatch, tumblrExtensionPatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("tagBlogSearch")
        requireStatusMethod("tagBlogLinks")
        // Found and checked before any edit, so a refusal leaves the APK as it was.
        val plan = resolveTagBlogSearch()
        mutableClassDefBy(plan.listener).apply {
            interfaces.add(HUSH_TAG_BLOG)
            methods.add(plan.bridge)
        }
        plan.click.addInstructions(
            plan.hookAt,
            """
                invoke-static {v${plan.answer}, v${plan.self}}, $BLOG_SCREEN_HOOK
                move-result v${plan.answer}
            """,
        )
        enableCapability("tagBlogLinks")
        enableStatus("tagBlogSearch")
    }
}

/**
 * Where the hook goes: [hookAt] in [click], the tag listener's `onClick`, right after the screen
 * question's answer lands in [answer]; `this` is in [self]. [bridge] is the listener's answer to
 * [HUSH_TAG_BLOG].
 */
internal class TagBlogSearchPlan(
    val listener: String,
    val click: MutableMethod,
    val hookAt: Int,
    val answer: Int,
    val self: Int,
    val bridge: MutableMethod,
)

/** The tag listener, its screen question and its blog, throwing when this build has none, several, or a changed shape. */
internal fun BytecodePatchContext.resolveTagBlogSearch(): TagBlogSearchPlan {
    requireExtensionHook(PATCH, BLOG_SCREEN_HOOK)
    val face = classDefByOrNull(HUSH_TAG_BLOG)
    requireShape(
        PATCH,
        face != null && AccessFlags.INTERFACE.isSet(face.accessFlags) && face.methods.count() == 1 &&
            face.methods.single().let {
                it.name == TAG_BLOG_NAME && it.parameterTypes.isEmpty() && it.returnType == TAG_STRING &&
                    AccessFlags.ABSTRACT.isSet(it.accessFlags)
            },
        "the extension's tag blog interface is missing or changed",
    )
    val tags = classDefByOrNull(WRAPPED_TAGS) ?: throw PatchException("$PATCH: Tumblr's $WRAPPED_TAGS wasn't found")
    val listener = tags.methods
        .flatMap { method -> method.instructionList().filter { it.opcode == Opcode.NEW_INSTANCE } }
        .mapNotNull { ((it as ReferenceInstruction).reference as? TypeReference)?.type }
        .distinct()
        .mapNotNull { classDefByOrNull(it) }
        .filter { type -> TAG_CLICK_LISTENER in type.interfaces && type.blogConstructor() != null }
        .only(PATCH, "the click listener a post's tags are built with")
    requireShape(
        PATCH,
        HUSH_TAG_BLOG !in listener.interfaces && listener.methods.none { it.name == TAG_BLOG_NAME },
        "the tag listener is already bridged",
    )
    val blog = listener.blogField()
    val click = listener.methods
        .filter { !it.isStatic() && it.name == "onClick" && it.parameterTypes.map(CharSequence::toString) == listOf(TAG_VIEW) && it.returnType == "V" }
        .only(PATCH, "the tag listener's onClick")
    val body = click.instructionList()
    val question = body.indices
        .mapNotNull { at -> body.screenQuestionAt(click, at) }
        .only(PATCH, "the tag listener's question whether its screen belongs to a blog")
    val hookAt = question.callAt + 2
    requireShape(PATCH, !click.isJumpTarget(hookAt), "a branch lands where the tag hook would go")
    val self = click.localRegisterCount()
    requireShape(PATCH, question.answer <= 15 && self <= 15, "the tag listener's answer or this is past what the added call can name")
    click.requireThisIntact(PATCH, listOf(hookAt))

    // Tumblr's own blog path tests the listener's blog for emptiness before its blog search.
    val empty = (question.branchAt + 1 until question.searchAt)
        .filter { at ->
            val test = body[at]
            val loaded = body[at - 1]
            test.opcode == Opcode.INVOKE_STATIC && test.methodRef()?.let {
                it.definingClass == TAG_BLOG_INFO && it.hasShape(listOf(TAG_BLOG_INFO), "Z")
            } == true && loaded.opcode == Opcode.IGET_OBJECT && loaded.fieldRef()?.let {
                it.definingClass == listener.type && it.name == blog.name
            } == true && (loaded as TwoRegisterInstruction).registerA == (test as FiveRegisterInstruction).registerC
        }
        .map { body[it].methodRef()!! }
        .distinctBy { "${it.name}${it.parameterTypes.joinToString("")}" }
        .only(PATCH, "the test Tumblr makes of the tag listener's blog")
    val name = classDefByOrNull(TAG_BLOG_INFO)?.blogName(empty)
        ?: throw PatchException("$PATCH: Tumblr's $TAG_BLOG_INFO wasn't found")

    val bridge = ImmutableMethod(
        listener.type, TAG_BLOG_NAME, emptyList(), TAG_STRING, AccessFlags.PUBLIC.value, null, null,
        MutableMethodImplementation(3),
    ).toMutable().apply {
        addInstructions(
            0,
            """
                iget-object v0, p0, ${listener.type}->${blog.name}:$TAG_BLOG_INFO
                invoke-static {v0}, $empty
                move-result v1
                if-nez v1, :none
                invoke-virtual {v0}, $name
                move-result-object v0
                return-object v0
                :none
                const/4 v0, 0x0
                return-object v0
            """,
        )
    }
    return TagBlogSearchPlan(listener.type, mutableOf(click), hookAt, question.answer, self, bridge)
}

/** The listener's constructor taking a navigation state and a blog, or null. */
private fun ClassDef.blogConstructor(): Method? = methods.singleOrNull {
    it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(TAG_NAVIGATION, TAG_BLOG_INFO)
}

/** The listener's own final blog field, the one its constructor fills from its blog parameter. */
private fun ClassDef.blogField(): Field {
    val field = fields
        .filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == TAG_BLOG_INFO }
        .only(PATCH, "the tag listener's blog field")
    requireShape(PATCH, AccessFlags.FINAL.isSet(field.accessFlags), "the tag listener's blog can change after it's built")
    val constructor = blogConstructor()!!
    val parameter = constructor.parameterRegisterNumber(1)
    val stored = constructor.instructionList().filter { it.opcode == Opcode.IPUT_OBJECT && it.fieldRef()?.name == field.name }
    requireShape(
        PATCH,
        stored.size == 1 && (stored.single() as TwoRegisterInstruction).registerA == parameter,
        "the tag listener's constructor doesn't keep the blog it's given",
    )
    return field
}

/**
 * The name getter [empty] reads: the one instance method of the blog returning a String that it
 * calls, a plain getter of the field `BlogInfo(String)` keeps its name in.
 */
private fun ClassDef.blogName(empty: MethodReference): MethodReference {
    val test = methods.singleOrNull { it.sameAs(empty) }
        ?: throw PatchException("$PATCH: the blog emptiness test $empty wasn't found")
    requireShape(PATCH, test.isStatic(), "the blog emptiness test isn't static")
    val getter = test.instructionList()
        .filter { it.opcode == Opcode.INVOKE_VIRTUAL }
        .mapNotNull { it.methodRef() }
        .filter { it.definingClass == type && it.hasShape(emptyList(), TAG_STRING) }
        .distinctBy { it.name }
        .only(PATCH, "the blog name the emptiness test reads")
    val named = methods.singleOrNull { it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(TAG_STRING) }
        ?: throw PatchException("$PATCH: the blog has no constructor from a name")
    val kept = named.instructionList().filter { instruction ->
        instruction.opcode == Opcode.IPUT_OBJECT &&
            (instruction as TwoRegisterInstruction).registerA == named.parameterRegisterNumber(0)
    }.mapNotNull { it.fieldRef() }.only(PATCH, "the field a blog keeps its name in")
    val read = methods.singleOrNull { it.sameAs(getter) }?.instructionList().orEmpty()
    requireShape(
        PATCH,
        read.size == 2 && read[0].opcode == Opcode.IGET_OBJECT && read[0].fieldRef()?.name == kept.name &&
            read[0].fieldRef()?.definingClass == type && read[1].opcode == Opcode.RETURN_OBJECT,
        "the blog name the emptiness test reads isn't the name the blog is built with",
    )
    return getter
}

/** Where `onClick` asks its screen question and branches on it to Tumblr's blog search. */
private class ScreenQuestion(val callAt: Int, val answer: Int, val branchAt: Int, val searchAt: Int)

/**
 * The screen question at [at], or null: a static call taking a screen type and answering a
 * boolean, its answer moved into a register, and an `if-eqz` on that register before anything
 * else writes it, whose fall-through reaches a static call opening [BLOG_TAG_SEARCH] with a
 * context, the tag, a blog and a flag before the branch's own target.
 */
private fun List<Instruction>.screenQuestionAt(method: Method, at: Int): ScreenQuestion? {
    val call = this[at]
    if (call.opcode != Opcode.INVOKE_STATIC || call.methodRef()?.hasShape(listOf(TAG_SCREEN_TYPE), "Z") != true) return null
    val moved = getOrNull(at + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT } as? OneRegisterInstruction ?: return null
    val answer = moved.registerA
    var branch = at + 2
    while (branch < size) {
        val next = this[branch]
        if (next.opcode == Opcode.IF_EQZ && (next as OneRegisterInstruction).registerA == answer) break
        if (next is OffsetInstruction || !next.opcode.canContinue() || next.writes(answer)) return null
        branch++
    }
    if (branch >= size) return null
    val target = method.jumpTargetOf(branch)
    val search = (branch + 1 until target).firstOrNull { index ->
        this[index].opcode == Opcode.INVOKE_STATIC && this[index].methodRef()?.let {
            it.definingClass == BLOG_TAG_SEARCH && it.hasShape(listOf(TAG_CONTEXT, TAG_STRING, TAG_BLOG_INFO, "Z"), "V")
        } == true
    } ?: return null
    return ScreenQuestion(at, answer, branch, search)
}

/** Whether the instruction puts a value in [register]. */
private fun Instruction.writes(register: Int): Boolean =
    opcode.setsRegister() && (this as? OneRegisterInstruction)?.registerA?.let {
        it == register || (opcode.setsWideRegister() && it + 1 == register)
    } == true

/** The index of the instruction the branch at [index] jumps to. */
private fun Method.jumpTargetOf(index: Int): Int {
    val body = instructionList()
    val addresses = body.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    return addresses.indexOf(addresses[index] + (body[index] as OffsetInstruction).codeOffset)
}
