/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.comments.fullheight

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.comments.summaries.descriptor
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.methodsHolding
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.extension.freeLocalsAt
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.facebook.misc.extension.requireStatusMethod
import app.morphe.patches.facebook.misc.extension.requireThisIntact
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Open comments at full height"

/**
 * The comment sheet's parameters, a kept class. The one constructor taking a float takes the
 * share of the screen's height the sheet opens to.
 */
internal const val POPOVER_PARAMS = "Lcom/facebook/ufiservices/flyout/params/PopoverParams;"

/** The kept factory building the Intent of Facebook's split-screen comments, the video above the sheet. */
internal const val SPLIT_SCREEN_FACTORY = "Lcom/facebook/feedback/splitscreen/SplitScreenFeedbackContainerFragmentFactory;"

/** The surface name the reel viewer's footer logs, held by the classes of two split-screen launchers. */
internal const val REEL_FOOTER = "fb_shorts_viewer_footer"

/** The reason the feed's split-screen launcher logs when the post's view has no size yet, held by its class. */
internal const val UNIT_NOT_MEASURED = "unit_view_not_measured"

/** The reason the two watch-and-comment launchers log when they don't open the split screen. */
internal const val NOT_ENTERED = "split_screen_not_entered"

private const val INTENT = "Landroid/content/Intent;"

/** Facebook's popover fragment, a kept class: its configuration change asks whether it fills the screen. */
internal const val SIMPLE_POPOVER = "Lcom/facebook/widget/popover/SimplePopoverFragment;"

/** The comment sheet's popover fragment, a kept class, holding the share of the screen's height it opens to. */
internal const val UFI_POPOVER = "Lcom/facebook/ufiservices/flyout/fragment/SimpleUFIPopoverFragment;"

/** The trace Facebook's comments helper opens while it sets up a comment sheet's views, held by that method. */
internal const val SET_COMMENT_VIEWS = "ComponentsCommentsHelper.setCommentViews"

internal const val FIND_VIEW = "Landroid/view/View;->findViewById(I)Landroid/view/View;"

/** The comment sheet's arguments, a kept class, which the comments helper's view setup is handed. */
internal const val FEEDBACK_PARAMS = "Lcom/facebook/ufiservices/flyout/params/FeedbackParams;"

/** What [FEEDBACK_PARAMS]'s toString prints before whether the sheet is a watch-and-comment one. */
internal const val WATCH_AND_COMMENT = ", isWatchAndCommentSurface="

internal const val FULL_HEIGHT_COMMENTS = "$EXTENSION_PACKAGE/comments/FullHeightComments;"
internal const val SHEET_HEIGHT = "$FULL_HEIGHT_COMMENTS->sheetHeight(F)F"
internal const val SKIP_SPLIT_SCREEN = "$FULL_HEIGHT_COMMENTS->skipSplitScreen()Z"
internal const val FILLS_SCREEN = "$FULL_HEIGHT_COMMENTS->fillsScreen(F)Z"
internal const val WATCH_HEADER = "$FULL_HEIGHT_COMMENTS->watchHeader(Landroid/view/View;IZ)V"

/**
 * Open comments at full height (#179).
 *
 * The comment sheet is a popover whose parameters, [POPOVER_PARAMS], carry a share of the screen's
 * height from the one constructor taking a float to the sheet's fragment (583 `PopoverParams.A00`,
 * read into `SimpleUFIPopoverFragment.A02`). One, the default the class builds for itself, makes
 * a phone's sheet full screen; anything less sizes the dialog's window to that share of the
 * screen's height at the bottom. Reels ask for two thirds, and videos and some posts for a share a
 * server value sets. First thing in that constructor, the extension is handed the share and its
 * answer goes back into the same register, so with the switch on a share below one becomes one.
 * Post, video, reel and story comment sheets all build their parameters there.
 *
 * A reel's or a feed video's Comment button first tries Facebook's split screen, the video on top
 * and the comments under it, through five launchers that each answer whether they opened it. Each
 * already answers false when its server gate is off, and the button then opens the regular sheet.
 * Three are found as the boolean methods building [SPLIT_SCREEN_FACTORY]'s Intent in the classes
 * holding [REEL_FOOTER] or [UNIT_NOT_MEASURED] (583 `LX/Xv5;->A00`, `LX/XRV;->A00`,
 * `LX/4Uk;->A08`), and two as the boolean methods holding [NOT_ENTERED] (583 `LX/Xv4;->A00`,
 * `LX/Xys;->A01`). First thing in each, the extension is asked, and a yes answers false.
 *
 * A share of one doesn't always fill the screen: [UFI_POPOVER]'s answer to [SIMPLE_POPOVER]'s
 * "fill the screen?" question (583 `A0F`) can still say no from a screen size against a server
 * value, and the window then opens as a centered box 80% of the screen tall, which on the S22 kept
 * a reel's comments at about two thirds. The question is found as the one no-argument boolean call
 * to [SIMPLE_POPOVER] in its `onConfigurationChanged`, and [UFI_POPOVER]'s override of it reads
 * the share from its one float field. First thing in that override, the extension is handed the
 * share, and a yes answers that the sheet fills the screen, the way Facebook draws a post's comments.
 * 584 has no override: Redex folded it into [SIMPLE_POPOVER]'s own final `A0D`, which answers yes
 * for any other popover and casts itself to [UFI_POPOVER] for the sheet's checks. There the hook
 * goes right after that one cast, the share read off the cast fragment into a free local.
 *
 * A full-screen reel sheet still shows the reel in the sheet's header, a LithoView above the
 * comment list, so the list starts a third of the way down. The header either holds the video or,
 * on the Reels tab, where the sheet is a watch-and-comment one, is a see-through tap area over the
 * reel still playing behind the sheet (the S25 on 583, 2026-10-18: no TextureView in the sheet's
 * window, `isWatchAndCommentSurface=true` in its [FEEDBACK_PARAMS]). The method holding
 * [SET_COMMENT_VIEWS] (583 arm64 `LX/A7c;->A0A(View, View, FeedbackParams)`) finds that header by
 * an id in its first [FIND_VIEW] call on the sheet's views, its first parameter, and is handed the
 * sheet's [FEEDBACK_PARAMS], whose watch-and-comment boolean is the one its toString prints after
 * [WATCH_AND_COMMENT] (583 arm64 `A0l`). First thing in it, the extension is handed those views,
 * that id and that boolean, and hides the header of a watch-and-comment sheet, or one holding a
 * video. A post's header, its reactions, is neither and stays. The same hook tells Pause reels while
 * comments are open (#266) that a sheet opened, whatever the full-height switch says; it pauses the
 * reel through Tap to play's player bridge and plays it on once the sheet's views leave the window.
 *
 * In the default selection with its switch off, so nothing changes until it's turned on.
 */
@Suppress("unused")
val fullHeightCommentsPatch = bytecodePatch(
    // The README table check reads this literal; PATCH carries the same text for the messages.
    name = "Open comments at full height",
    description = "Opens the comment sheet at the full height of the screen instead of part way up, on posts, " +
        "videos, reels and stories. On reels and videos, Comment opens that sheet instead of the split view. " +
        "A second switch pauses a reel while its comments are open. Both start off. Turn them on in " +
        "Hushfacebook settings > Comments and writing.",
) {
    category("Comments")
    dependsOn(settingsPatch, facebookExtensionPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        // Everything is found before anything changes, so a build missing one part is left as it was.
        requireStatusMethod("fullHeightComments")
        val params = classDefByOrNull(POPOVER_PARAMS) ?: refuse("$POPOVER_PARAMS isn't in this build")
        val sheet = sheetConstructor(params)
        val height = floatRegister(sheet)
        val launchers = splitScreenLaunchers(
            (holders(REEL_FOOTER) + holders(UNIT_NOT_MEASURED)).distinctBy { it.type },
            holders(NOT_ENTERED),
        )
        val popover = classDefByOrNull(SIMPLE_POPOVER) ?: refuse("$SIMPLE_POPOVER isn't in this build")
        val ufiPopover = classDefByOrNull(UFI_POPOVER) ?: refuse("$UFI_POPOVER isn't in this build")
        val fills = fillsScreenSite(popover, ufiPopover)
        val share = shareField(fills.method)
        val views = commentViewsSetup(holders(SET_COMMENT_VIEWS))
        val header = headerId(views)
        val feedbackParams = classDefByOrNull(FEEDBACK_PARAMS) ?: refuse("$FEEDBACK_PARAMS isn't in this build")
        val watchAndComment = watchAndCommentField(feedbackParams)

        mutableClassDefBy(POPOVER_PARAMS).methods.single { it.descriptor() == sheet.descriptor() }
            .raiseSheet(height)
        for (launcher in launchers) {
            mutableClassDefBy(launcher.definingClass).methods.single { it.descriptor() == launcher.descriptor() }
                .skipSplitScreen()
        }
        mutableClassDefBy(fills.method.definingClass).methods.single { it.descriptor() == fills.method.descriptor() }
            .fillScreen(fills, share)
        mutableClassDefBy(views.definingClass).methods.single { it.descriptor() == views.descriptor() }
            .watchHeader(header, feedbackParamsRegister(views), watchAndComment)
        enableStatus("fullHeightComments")
    }
}

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")

private fun BytecodePatchContext.holders(string: String) =
    classDefByStrings(string, StringComparisonType.EQUALS).filterNot { it.type.startsWith(EXTENSION_CLASSES) }

/** The one constructor of [params], the comment sheet's parameters, that takes a float: the sheet's height. */
internal fun sheetConstructor(params: ClassDef): Method {
    val constructors = params.methods.filter { method ->
        method.name == "<init>" && method.parameterTypes.count { it.toString() == "F" } == 1
    }
    return constructors.singleOrNull()
        ?: refuse("expected one constructor of ${params.type} taking one float, found ${constructors.size}")
}

private fun width(type: String) = if (type == "J" || type == "D") 2 else 1

/**
 * The register [method]'s one float parameter arrives in. The parameters fill the last registers,
 * after `this`, so the first one sits as far from the end as the parameters are wide.
 */
internal fun floatRegister(method: Method): Int {
    val types = method.parameterTypes.map(CharSequence::toString)
    val registers = method.implementation?.registerCount ?: refuse("${method.descriptor()} has no code")
    var register = registers - types.sumOf(::width)
    for (type in types) {
        if (type == "F") return register
        register += width(type)
    }
    refuse("${method.descriptor()} takes no float")
}

/** Whether [method] answers with a boolean and builds the Intent of [SPLIT_SCREEN_FACTORY]. */
internal fun buildsSplitScreen(method: Method): Boolean =
    method.returnType == "Z" && method.implementation?.instructions?.any { instruction ->
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode.name.startsWith("invoke") && call?.definingClass == SPLIT_SCREEN_FACTORY &&
            call.returnType == INTENT
    } == true

/**
 * The five split-screen launchers: the three boolean methods among [factoryHolders], the classes
 * holding [REEL_FOOTER] or [UNIT_NOT_MEASURED], that build the factory's Intent, and the two
 * boolean methods among [notEnteredHolders] that hold [NOT_ENTERED]. Each needs a local register
 * for the hook.
 */
internal fun splitScreenLaunchers(factoryHolders: List<ClassDef>, notEnteredHolders: List<ClassDef>): List<Method> {
    val built = factoryHolders.flatMap { it.methods }.filter(::buildsSplitScreen).distinctBy { it.descriptor() }
    if (built.size != 3) {
        refuse(
            "expected three boolean methods building $SPLIT_SCREEN_FACTORY's Intent beside \"$REEL_FOOTER\" or " +
                "\"$UNIT_NOT_MEASURED\", found ${built.size}: ${built.joinToString { it.descriptor() }}",
        )
    }
    val logged = notEnteredHolders.flatMap { methodsHolding(it, NOT_ENTERED) }
        .filter { it.returnType == "Z" }.distinctBy { it.descriptor() }
    if (logged.size != 2) {
        refuse(
            "expected two boolean methods logging \"$NOT_ENTERED\", found ${logged.size}: " +
                logged.joinToString { it.descriptor() },
        )
    }
    val launchers = (built + logged).distinctBy { it.descriptor() }
    if (launchers.size != 5) refuse("the split-screen launchers overlap: ${launchers.joinToString { it.descriptor() }}")
    for (launcher in launchers) {
        if (launcher.localRegisterCount() < 1) refuse("${launcher.descriptor()} has no local register for the hook")
    }
    return launchers
}

/**
 * First thing in the sheet's constructor: hand the extension the height in [register] and keep its
 * answer there. The call takes it as a range, so any register number works.
 */
internal fun MutableMethod.raiseSheet(register: Int) {
    addInstructions(
        0,
        """
            invoke-static/range { v$register .. v$register }, $SHEET_HEIGHT
            move-result v$register
        """,
    )
}

/**
 * Where the comment sheet answers the "fill the screen?" question: instruction [index] of [method],
 * with the sheet's fragment in [fragment] and [answer] a local the hook may write there.
 */
internal data class FillsScreenSite(val method: Method, val index: Int, val fragment: Int, val answer: Int)

/**
 * Where [ufiPopover] answers [popover]'s "fill the screen?" question, the one no-argument boolean
 * method of [popover] that its `onConfigurationChanged` calls. Through 583 that's the first
 * instruction of [ufiPopover]'s override, the fragment in `this`. Without an override (584) it's
 * the instruction right after [popover]'s own body tests `this` with one instance-of
 * [UFI_POPOVER], skips the rest on false and casts it, an instruction nothing else jumps to.
 * Either way the fragment's register and a free local both have to fit the hook's `iget`.
 */
internal fun fillsScreenSite(popover: ClassDef, ufiPopover: ClassDef): FillsScreenSite {
    val changed = popover.methods.singleOrNull {
        it.name == "onConfigurationChanged" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/res/Configuration;")
    } ?: refuse("$SIMPLE_POPOVER has no onConfigurationChanged(Configuration)")
    val asked = changed.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        .filter { it.definingClass == SIMPLE_POPOVER && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        .distinctBy { it.name }
    val question = asked.singleOrNull()
        ?: refuse("expected one no-argument boolean call in $SIMPLE_POPOVER's onConfigurationChanged, found ${asked.size}")
    val override = ufiPopover.methods.singleOrNull {
        it.name == question.name && it.parameterTypes.isEmpty() && it.returnType == "Z" && it.implementation != null
    }
    val site = if (override != null) {
        if (override.localRegisterCount() < 1) refuse("${override.descriptor()} has no local register for the hook")
        FillsScreenSite(override, 0, override.localRegisterCount(), 0)
    } else {
        val folded = popover.methods.singleOrNull {
            it.name == question.name && it.parameterTypes.isEmpty() && it.returnType == "Z" && it.implementation != null
        } ?: refuse("$UFI_POPOVER doesn't override ${question.name}()Z, and $SIMPLE_POPOVER has no body for it")
        foldedSite(folded)
    }
    if (site.fragment > 15 || site.answer > 15) {
        refuse("${site.method.descriptor()} keeps the fragment in v${site.fragment}, past what the hook's iget can name")
    }
    return site
}

/**
 * The instruction after [method]'s one `instance-of vX, this, UFI` / `if-eqz vX` / `check-cast
 * this, UFI`, where `this` holds the comment sheet's fragment, as its [FillsScreenSite].
 */
private fun foldedSite(method: Method): FillsScreenSite {
    val code = method.implementation!!.instructions.toList()
    val self = method.localRegisterCount()
    fun names(instruction: Instruction, opcode: Opcode) = instruction.opcode == opcode &&
        ((instruction as ReferenceInstruction).reference as? TypeReference)?.type == UFI_POPOVER
    val casts = (0 until code.size - 3).filter { at ->
        val test = code[at]
        val skip = code[at + 1]
        val cast = code[at + 2]
        names(test, Opcode.INSTANCE_OF) && (test as TwoRegisterInstruction).registerB == self &&
            skip.opcode == Opcode.IF_EQZ && (skip as OneRegisterInstruction).registerA == test.registerA &&
            names(cast, Opcode.CHECK_CAST) && (cast as OneRegisterInstruction).registerA == self
    }
    val at = casts.singleOrNull()
        ?: refuse("expected ${method.descriptor()} to test and cast this to $UFI_POPOVER once, found ${casts.size}")
    val index = at + 3
    val flow = ControlFlow.of(method)
    val jumps = flow.instructions.indices.filter { it != at + 2 && (index in flow.normal[it] || index in flow.exceptional[it]) }
    if (jumps.isNotEmpty()) refuse("${method.descriptor()} jumps to the instruction after its cast from ${jumps.joinToString()}")
    method.requireThisIntact(PATCH, listOf(at))
    return FillsScreenSite(method, index, self, method.freeLocalsAt(PATCH, index, 1).single())
}

/** The one float field of [UFI_POPOVER] that [fills] reads: the share of the screen's height. */
internal fun shareField(fills: Method): FieldReference {
    val read = fills.implementation!!.instructions.filter { it.opcode == Opcode.IGET }
        .mapNotNull { (it as ReferenceInstruction).reference as? FieldReference }
        .filter { it.definingClass == UFI_POPOVER && it.type == "F" }
        .distinctBy { it.name }
    return read.singleOrNull() ?: refuse("expected ${fills.descriptor()} to read one float of its own, found ${read.size}")
}

/**
 * Where [site] says the sheet's "fill the screen?" answer starts: hand the extension the share from
 * [share], read off the fragment, and answer yes when it says so.
 */
internal fun MutableMethod.fillScreen(site: FillsScreenSite, share: FieldReference) {
    val answer = site.answer
    addInstructionsWithLabels(
        site.index,
        """
            iget v$answer, v${site.fragment}, $share
            invoke-static { v$answer }, $FILLS_SCREEN
            move-result v$answer
            if-eqz v$answer, :facebook
            return v$answer
        """,
        ExternalLabel("facebook", getInstruction(site.index)),
    )
}

/**
 * The method setting up a comment sheet's views: the one method among [holders] holding
 * [SET_COMMENT_VIEWS], an instance method taking the sheet's views first and its [FEEDBACK_PARAMS]
 * once, with four local registers for the hook.
 */
internal fun commentViewsSetup(holders: List<ClassDef>): Method {
    val found = holders.flatMap { methodsHolding(it, SET_COMMENT_VIEWS) }.distinctBy { it.descriptor() }
    val setup = found.singleOrNull()
        ?: refuse("expected one method holding \"$SET_COMMENT_VIEWS\", found ${found.size}: ${found.joinToString { it.descriptor() }}")
    if (AccessFlags.STATIC.isSet(setup.accessFlags) || setup.parameterTypes.firstOrNull()?.toString() != VIEW) {
        refuse("${setup.descriptor()} doesn't take the sheet's views first")
    }
    if (setup.parameterTypes.count { it.toString() == FEEDBACK_PARAMS } != 1) {
        refuse("${setup.descriptor()} doesn't take the sheet's $FEEDBACK_PARAMS once")
    }
    if (setup.localRegisterCount() < 4) refuse("${setup.descriptor()} has no four local registers for the hook")
    return setup
}

/**
 * The p register holding [setup]'s [FEEDBACK_PARAMS], counted the way smali counts them: p0 is the
 * instance, and a long or a double takes two.
 */
internal fun feedbackParamsRegister(setup: Method): Int {
    val types = setup.parameterTypes.map { it.toString() }
    return 1 + types.take(types.indexOf(FEEDBACK_PARAMS)).sumOf { width(it) }
}

/**
 * The boolean [params] prints right after [WATCH_AND_COMMENT] in its toString: whether the sheet is
 * a watch-and-comment one, the reel playing on behind it and seen through the sheet's header.
 */
internal fun watchAndCommentField(params: ClassDef): FieldReference {
    val toString = params.methods.singleOrNull { it.name == "toString" && it.parameterTypes.isEmpty() }
        ?: refuse("$FEEDBACK_PARAMS has no toString")
    val instructions = toString.implementation!!.instructions.toList()
    val label = instructions.indexOfFirst {
        it.opcode in STRINGS && ((it as ReferenceInstruction).reference as StringReference).string == WATCH_AND_COMMENT
    }
    if (label < 0) refuse("$FEEDBACK_PARAMS's toString doesn't print \"$WATCH_AND_COMMENT\"")
    // Only what the toString reads before printing its next label is this one's value.
    val value = instructions.drop(label + 1).takeWhile { it.opcode !in STRINGS }
        .filter { it.opcode == Opcode.IGET_BOOLEAN }
    val field = (value.singleOrNull() as? ReferenceInstruction)?.reference as? FieldReference
        ?: refuse("$FEEDBACK_PARAMS's toString reads ${value.size} booleans after \"$WATCH_AND_COMMENT\", expected one")
    if (field.definingClass != FEEDBACK_PARAMS) refuse("$FEEDBACK_PARAMS's toString prints $field after \"$WATCH_AND_COMMENT\"")
    return field
}

private val STRINGS = setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO)

/**
 * The id of the sheet's header: the literal [setup] loads right before its first [FIND_VIEW] call,
 * into that call's id register, the call made on [setup]'s first parameter.
 */
internal fun headerId(setup: Method): Int {
    val instructions = setup.implementation!!.instructions.toList()
    val at = instructions.indexOfFirst {
        it.opcode == Opcode.INVOKE_VIRTUAL && (it as ReferenceInstruction).reference.toString() == FIND_VIEW
    }
    if (at < 1) refuse("${setup.descriptor()} makes no $FIND_VIEW call after loading an id")
    val call = instructions[at] as FiveRegisterInstruction
    val views = setup.implementation!!.registerCount - setup.parameterTypes.sumOf { width(it.toString()) }
    if (call.registerC != views) refuse("${setup.descriptor()}'s first $FIND_VIEW call isn't on its first parameter")
    val load = instructions[at - 1]
    if (load.opcode !in CONSTS || (load as OneRegisterInstruction).registerA != call.registerD) {
        refuse("${setup.descriptor()} doesn't load its first $FIND_VIEW call's id right before it")
    }
    return (load as NarrowLiteralInstruction).narrowLiteral
}

private const val VIEW = "Landroid/view/View;"

private val CONSTS = setOf(Opcode.CONST, Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST_HIGH16)

/**
 * First thing in the setup of a comment sheet's views: hand the extension the sheet's views, the
 * first parameter, the header's [id] and the [watchAndComment] flag of the sheet's parameters in p
 * register [params], false when there are none, through four locals, which hold nothing yet.
 */
internal fun MutableMethod.watchHeader(id: Int, params: Int, watchAndComment: FieldReference) {
    addInstructionsWithLabels(
        0,
        """
            move-object/from16 v1, p1
            const v0, $id
            move-object/from16 v2, p$params
            const/4 v3, 0x0
            if-eqz v2, :watch
            iget-boolean v3, v2, $watchAndComment
            :watch
            invoke-static { v1, v0, v3 }, $WATCH_HEADER
        """,
    )
}

/** First thing in a split-screen launcher: while the extension says so, answer that it didn't open. */
internal fun MutableMethod.skipSplitScreen() {
    addInstructionsWithLabels(
        0,
        """
            invoke-static {}, $SKIP_SPLIT_SCREEN
            move-result v0
            if-eqz v0, :launch
            const/4 v0, 0x0
            return v0
        """,
        ExternalLabel("launch", getInstruction(0)),
    )
}
