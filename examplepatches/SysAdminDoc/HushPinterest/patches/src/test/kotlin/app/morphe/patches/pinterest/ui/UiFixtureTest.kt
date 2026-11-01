/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.misc.extension.PatchLogCapture
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

private const val ARRAY_LIST = "Ljava/util/ArrayList;"

@Category(FixtureTests::class)
class UiFixtureTest {
    private val patches = listOf(
        hideScreenshotSharePatch, hideAssistantPatch, hideSearchHistoryPatch, hideNavigationButtonsPatch, hideHeaderButtonsPatch,
        hidePinMenuItemsPatch, hideCommentsPatch, quietEmailReminderPatch, disableUpdateNagPatch, amoledBlackPatch,
    )
    private val flags = listOf(
        "hideScreenshotShare" to "screenshotShare", "hideAssistant" to "assistantEntries", "hideSearchHistory" to "searchHistory",
        "hideNavigationButtons" to "navigationButtons", "hideHeaderButtons" to "headerButtons",
        "hidePinMenuItems" to "pinMenuItems", "hideComments" to "comments",
        "quietEmailReminder" to "emailReminder", "disableUpdateNag" to "updateNag",
        "amoledBlack" to "blackBottomBar", "amoledBlack" to "blackComments", "amoledBlack" to "blackPinMenu",
        "hideSearchHistory" to "recentSearchRows", "hideSearchHistory" to "recentSearchHeading",
        "hideComments" to "suggestedReplies",
    )

    @Test fun `every interface family matches each supported vendor build without a warning`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val commentsModules = classes.filter { it.isCommentsModule() }
            assertEquals("${build.name}: dedicated comments module count", 2, commentsModules.size)
            val unifiedComments = commentsModules.single { it.fields.any { field -> field.type == COMMENT_PREVIEW } }
            val rejectedComments = PatchContexts.of(ExtensionDex.classes() + classes)
            rejectedComments.mutableClassDefBy(unifiedComments.type).fields.removeAll { it.type == COMMENT_PREVIEW }
            val wrongScope = assertThrows(PatchException::class.java) { hideCommentsPatch.execute(rejectedComments) }
            assertTrue(wrongScope.message, wrongScope.message.orEmpty().contains("dedicated layout"))
            assertFlag(rejectedComments, "hideComments", false)
            assertFlag(rejectedComments, "comments", false)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val warnings = PatchLogCapture.warnings { patches.forEach { it.execute(context) } }
            assertEquals("${build.name} warnings", emptyList<String>(), warnings)
            for ((family, capability) in flags) {
                assertFlag(context, family, true)
                assertFlag(context, capability, true)
            }
            for (type in SEARCH_HISTORY_VIEWS + COMMENT_PREVIEW + commentsModules.map { it.type }) {
                val view = context.mutableClassDefBy(type)
                for (name in listOf("setVisibility", "onMeasure")) {
                    val own = view.methods.single { it.name == name && it.returnType == "V" }
                    assertTrue("${build.name}: $type->$name has no extension hook",
                        own.calls().any { it.definingClass == UI_HOOKS })
                }
            }
            // The suggested replies by the comment box fold through their own hooks, so Hide comments
            // and Hide suggested replies never turn each other on.
            for (type in listOf(COMMENT_PREVIEW) + commentsModules.map { it.type }) {
                assertTrue("${build.name}: $type answers to the suggested replies switch", context.mutableClassDefBy(type).methods
                    .none { method -> method.calls().any { it.definingClass == UI_HOOKS && it.name.startsWith("suggestedReplies") } })
            }
            val wasReplies = classes.single { it.type == COMMENTS_QUICK_REPLIES }
            val replies = context.mutableClassDefBy(COMMENTS_QUICK_REPLIES)
            assertEquals("${build.name}: the suggested replies row gained two overrides, nothing else",
                wasReplies.methods.count() + 2, replies.methods.size)
            for ((name, hooks) in listOf("setVisibility" to listOf("suggestedRepliesVisibility"),
                    "onMeasure" to listOf("suggestedRepliesMeasureSpec", "suggestedRepliesMeasureSpec"))) {
                val body = replies.methods.single { it.name == name }.instructions()
                assertEquals("${build.name}: the suggested replies row's $name runs the hooks, then its superclass's",
                    hooks.flatMap { listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT) } + listOf(Opcode.INVOKE_SUPER_RANGE, Opcode.RETURN_VOID),
                    body.map { it.opcode })
                assertEquals(build.name, hooks.map { "$UI_HOOKS->$it(I)I" },
                    body.filter { it.opcode == Opcode.INVOKE_STATIC_RANGE }.map { (it as ReferenceInstruction).reference.toString() })
                assertEquals("${build.name}: the suggested replies row still runs its superclass's $name", wasReplies.superclass,
                    ((body[body.size - 2] as ReferenceInstruction).reference as MethodReference).definingClass)
            }
            for (method in replies.methods.filter { it.name != "setVisibility" && it.name != "onMeasure" }) {
                assertTrue("${build.name}: the suggested replies row's ${method.name} changed",
                    method.calls().none { it.definingClass == UI_HOOKS })
            }
            val closeups = classes.filter { owner ->
                owner.methods.any { "unifiedCommentsModulePresenterFactory" in it.strings() } ||
                    owner.type == "Lcom/pinterest/activity/pin/view/modules/PinCloseupVideoModule;"
            }
            assertTrue("${build.name}: missing closeup controls", closeups.size >= 2)
            for (original in closeups) {
                val closeup = context.mutableClassDefBy(original.type)
                assertEquals("${build.name}: ${original.type} method count changed", original.methods.count(), closeup.methods.size)
                assertTrue("${build.name}: ${original.type} must keep pin media and non-comment modules visible",
                    closeup.methods.none { it.calls().any { call -> call.definingClass == UI_HOOKS } })
            }
            // The typing screen's row draws recent searches and typed suggestions alike. Its bind hands
            // the hook the flag that gives only a recent search its clear button.
            val wasRow = classes.single { it.type == TYPEAHEAD_ROW }
            val row = context.mutableClassDefBy(TYPEAHEAD_ROW)
            val bind = row.methods.single { method -> method.calls().any { it.definingClass == UI_HOOKS } && method.name != "onMeasure" }
            assertEquals("${build.name}: the hooked bind takes the text and the flag", RECENT_ROW_BIND, bind.parameters())
            val wasBind = wasRow.methods.single { it.name == bind.name && it.parameters() == RECENT_ROW_BIND }
            val rowBind = bind.instructions()
            assertEquals("${build.name}: the row hook runs first", RECENT_ROW_HOOK, (rowBind[0] as ReferenceInstruction).reference.toString())
            val self = wasBind.implementation!!.registerCount - 3
            assertEquals("${build.name}: the row hook takes the row and the flag", listOf(self, self + 2),
                (rowBind[0] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD).take(it.registerCount) })
            assertEquals("${build.name}: the bind gained its hook, nothing else", wasBind.instructions().map { it.opcode },
                rowBind.drop(1).map { it.opcode })
            val measured = row.methods.single { it.name == "onMeasure" }.instructions()
            assertEquals("${build.name}: the row measures through the hook, then as before", listOf(Opcode.INVOKE_STATIC,
                Opcode.MOVE_RESULT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.INVOKE_SUPER_RANGE, Opcode.RETURN_VOID),
                measured.map { it.opcode })
            for ((at, spec) in listOf(0 to 1, 2 to 2)) {
                assertEquals(build.name, RECENT_ROW_MEASURE_HOOK, (measured[at] as ReferenceInstruction).reference.toString())
                assertEquals("${build.name}: the row and its spec", listOf(0, spec),
                    (measured[at] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) })
                assertEquals("${build.name}: the answer replaces the spec", spec, (measured[at + 1] as OneRegisterInstruction).registerA)
            }
            assertEquals("${build.name}: the row still measures through its own superclass", wasRow.superclass,
                ((measured[4] as ReferenceInstruction).reference as MethodReference).definingClass)
            // The search page's Recent searches block holds the heading over the cells, so it folds with them
            // through the cells' own hooks, or the heading stays on the page with nothing under it.
            val blockType = recentSearchBlockType(classes)
            val wasBlock = classes.single { it.type == blockType }
            assertTrue("${build.name}: the block holds the heading", wasBlock.fields.any { it.type == GESTALT_TEXT })
            val block = context.mutableClassDefBy(wasBlock.type)
            assertEquals("${build.name}: the block gained two overrides, nothing else", wasBlock.methods.count() + 2, block.methods.size)
            for ((name, hooks) in listOf("setVisibility" to listOf("searchHistoryVisibility"),
                    "onMeasure" to listOf("searchHistoryMeasureSpec", "searchHistoryMeasureSpec"))) {
                val body = block.methods.single { it.name == name }.instructions()
                assertEquals("${build.name}: the block's $name runs the hooks, then its superclass's",
                    hooks.flatMap { listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT) } + listOf(Opcode.INVOKE_SUPER_RANGE, Opcode.RETURN_VOID),
                    body.map { it.opcode })
                assertEquals(build.name, hooks.map { "$UI_HOOKS->$it(I)I" },
                    body.filter { it.opcode == Opcode.INVOKE_STATIC_RANGE }.map { (it as ReferenceInstruction).reference.toString() })
                assertEquals("${build.name}: the block still runs its superclass's $name", wasBlock.superclass,
                    ((body[body.size - 2] as ReferenceInstruction).reference as MethodReference).definingClass)
            }
            val header = context.mutableClassDefBy(HEADER_BAR).methods.single { it.name == "onMeasure" }
            assertTrue(header.calls().any { it.definingClass == INTERFACE_CONTROLS && it.name == "headerButtons" })
            val menuType = context.classDefBy(PIN_MENU).fields.single { it.name == "modalView" }.type
            val menu = context.mutableClassDefBy(menuType).methods.single { it.name == "<init>" }
            assertTrue("${build.name} pin-menu entry hooks",
                menu.calls().count { it.definingClass == INTERFACE_CONTROLS && it.name == "pinMenuItem" } >= 4)
            assertTrue(menu.strings().containsAll(FILTERABLE_PIN_MENU_TITLES))
            assertDistinctArguments("${build.name} pin-menu", menu.instructions(), "pinMenuItem")
            val navType = classes.single { owner ->
                owner.methods.any { "BottomNavBar tab insertion out of range" in it.strings() }
            }.type
            val nav = context.mutableClassDefBy(navType)
            val bound = nav.methods.filter { method ->
                method.calls().any { it.definingClass == INTERFACE_CONTROLS && it.name == "bindNavigation" }
            }
            assertEquals("${build.name}: the tab binding and the tab replacement each bind once", 2, bound.sumOf { method ->
                method.calls().count { it.definingClass == INTERFACE_CONTROLS && it.name == "bindNavigation" }
            })
            val swap = bound.single { method -> method.calls().any { it.name == "removeViewAt" } }
            val body = swap.instructions()
            val hook = body.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "bindNavigation" }
            assertEquals("${build.name}: the replacement binds right after the new view's ID", "setId",
                ((body[hook - 3] as ReferenceInstruction).reference as MethodReference).name)
            assertEquals(Opcode.INVOKE_INTERFACE, body[hook - 2].opcode)
            // 0.0.4's first replacement hook took v3 as scratch while v3 still held the new view, and
            // ART then refused the whole bar class, so the bar never appeared.
            bound.forEach { assertDistinctArguments("${build.name} ${it.name}", it.instructions(), "bindNavigation") }
            assertTrue(nav.methods.single { it.name == "onMeasure" }.calls().any {
                it.definingClass == INTERFACE_CONTROLS && it.name == "refreshNavigation"
            })
            // Its own dispatchDraw, so it can't share the onMeasure prefix Hide navigation buttons adds.
            val drawn = context.mutableClassDefBy(BOTTOM_BAR).methods.single {
                it.name == "dispatchDraw" && it.parameters() == listOf("Landroid/graphics/Canvas;")
            }.instructions()
            val paint = (drawn[0] as ReferenceInstruction).reference as MethodReference
            assertEquals("${build.name}: the bar paints before it draws its tab row", AMOLED_BLACK to "bottomBar",
                paint.definingClass to paint.name)
            assertEquals(listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.INVOKE_SUPER_RANGE, Opcode.RETURN_VOID), drawn.map { it.opcode })
            assertEquals("${build.name}: the bar still draws through its own superclass",
                classes.single { it.type == BOTTOM_BAR }.superclass,
                ((drawn[1] as ReferenceInstruction).reference as MethodReference).definingClass)
            // Glass tabs have no fill to recolor, so the glass asks for its wash color right where it used it.
            val isCall = { instruction: Instruction, owner: String, name: String ->
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                    ?.let { it.definingClass == owner && it.name == name } == true
            }
            val wasGlass = classes.single { it.type == BLUR_VIEW }.methods.single { it.name == "draw" }
            val glass = context.mutableClassDefBy(BLUR_VIEW).methods.single { it.name == "draw" }.instructions()
            val asked = glass.indexOfFirst { isCall(it, AMOLED_BLACK, "blurFill") }
            assertEquals("${build.name}: the glass asks for its color where it washed",
                wasGlass.instructions().indexOfFirst { isCall(it, "Landroid/graphics/Canvas;", "drawColor") }, asked)
            assertEquals("${build.name}: the glass gained the question and its answer, nothing else",
                wasGlass.instructions().size + 2, glass.size)
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.INVOKE_VIRTUAL), glass.subList(asked, asked + 3).map { it.opcode })
            assertTrue("${build.name}: the wash comes right after the answer", isCall(glass[asked + 2], "Landroid/graphics/Canvas;", "drawColor"))
            val question = glass[asked] as FiveRegisterInstruction
            val color = (glass[asked + 2] as FiveRegisterInstruction).registerD
            assertEquals("${build.name}: the glass hands over itself", wasGlass.implementation!!.registerCount - 2, question.registerC)
            assertEquals("${build.name}: the glass hands over the color it was about to use", color, question.registerD)
            assertEquals("${build.name}: the answer lands where the wash reads its color", color,
                (glass[asked + 1] as OneRegisterInstruction).registerA)
            // The comments screen and the pin menu's sheet are each handed over by the method that builds them.
            val builders = listOf(
                "comments" to classes.flatMap { it.methods }.single { method ->
                    method.name == "onCreateView" && method.fields().any { it.name == COMMENTS_SCREEN_ID }
                },
                "pinMenu" to classes.single { it.type == PIN_MENU }.methods.single { it.name == "createModalView" },
            )
            for ((hook, was) in builders) {
                val answer = was.instructions().indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
                val view = (was.instructions()[answer] as OneRegisterInstruction).registerA
                val built = context.mutable(was).instructions()
                assertEquals("${build.name}: $hook goes in where the view was answered", answer,
                    built.indexOfFirst { isCall(it, AMOLED_BLACK, hook) })
                assertEquals("${build.name}: the $hook builder gained its hook, nothing else", was.instructions().size + 1, built.size)
                assertEquals("${build.name}: the $hook builder still answers once", 1, built.count { it.opcode == Opcode.RETURN_OBJECT })
                val handed = built[answer] as RegisterRangeInstruction
                assertEquals("${build.name}: $hook takes the answered view and nothing else", view to 1,
                    handed.startRegister to handed.registerCount)
                assertEquals("${build.name}: the $hook builder answers the same view right after", Opcode.RETURN_OBJECT to view,
                    built[answer + 1].opcode to (built[answer + 1] as OneRegisterInstruction).registerA)
            }
            val original = classes.flatMap { it.methods }.single { "inAppUpdateManager" in it.strings() }
            val modified = context.mutable(original)
            assertEquals("the shared coroutine's other task must keep its dispatcher", original.instructions()[0].opcode,
                modified.instructions()[0].opcode)
            assertEquals(1, modified.calls().count { it.definingClass == UI_HOOKS && it.name == "disableUpdateNag" })
            val called = modified.instructions().map { ((it as? ReferenceInstruction)?.reference as? MethodReference) }
            val guard = called.indexOfFirst { it?.definingClass == UI_HOOKS && it.name == "disableUpdateNag" }
            val prompt = called.indexOfFirst { it?.definingClass?.startsWith(PLAY_CORE_UPDATES) == true }
            assertTrue("${build.name}: the update hook runs before Play Core's update call ($guard, $prompt)",
                guard >= 0 && prompt > guard)
        }
    }

    private fun asksForAssistant(method: Method) = method.returnType == "Z" && method.parameterTypes.isEmpty() &&
        !AccessFlags.STATIC.isSet(method.accessFlags) && "ai_fwd_android_assistant_ask_mode" in method.strings()

    @Test fun `the Assistant's availability answers no only when the switch says so and keeps its own body`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val stock = classes.flatMap { it.methods }.single { asksForAssistant(it) }
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            hideAssistantPatch.execute(context)
            assertFlag(context, "hideAssistant", true)
            assertFlag(context, "assistantEntries", true)
            val body = context.mutableClassDefBy(stock.definingClass).methods.single { asksForAssistant(it) }.instructions()
            assertEquals("${build.name}: the guard's shape",
                listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN), body.take(5).map { it.opcode })
            val hook = (body[0] as ReferenceInstruction).reference as MethodReference
            assertEquals("${build.name}: the hook", UI_HOOKS to "hideAssistant", hook.definingClass to hook.name)
            assertEquals("${build.name}: the enabled branch answers no", 0, (body[3] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals("${build.name}: the rest is Pinterest's own check", stock.instructions().map { it.opcode }, body.drop(5).map { it.opcode })
        }
    }

    @Test fun `a second Assistant availability check refuses before any change`() {
        val classes = read(Fixtures.declaredBuilds().first())
        val owner = classes.single { candidate -> candidate.methods.any { asksForAssistant(it) } }
        val stock = owner.methods.single { asksForAssistant(it) }
        val twin = ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile, owner.annotations,
            owner.fields, owner.methods.toList() + ImmutableMethod(owner.type, stock.name + "Twin", listOf(), "Z", stock.accessFlags, null, null,
                ImmutableMethodImplementation.of(stock.implementation)))
        val context = PatchContexts.of(ExtensionDex.classes() + classes.filter { it.type != owner.type } + twin)
        val refused = assertThrows(PatchException::class.java) { hideAssistantPatch.execute(context) }
        assertTrue(refused.message, refused.message.orEmpty().contains("Assistant availability"))
        assertFlag(context, "hideAssistant", false)
        assertFlag(context, "assistantEntries", false)
    }

    @Test fun `a missing family status refuses before changing any vendor method`() {
        for ((index, patch) in patches.withIndex()) {
            val context = PatchContexts.of(ExtensionDex.classes())
            val family = flags[index].first
            context.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == family }
            val failure = assertThrows(PatchException::class.java) { patch.execute(context) }
            assertTrue(failure.message, failure.message.orEmpty().contains(family))
            assertFlag(context, flags[index].second, false)
        }
    }

    @Test fun `an update anchor that no longer comes before Play Core's call refuses with the coroutine untouched`() {
        val classes = read(Fixtures.declaredBuilds().last())
        val owner = classes.single { type -> type.methods.any { "inAppUpdateManager" in it.strings() } }
        val coroutine: (Method) -> Boolean = { "inAppUpdateManager" in it.strings() }
        val isPrompt: (Instruction) -> Boolean = {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass?.startsWith(PLAY_CORE_UPDATES) == true
        }
        // Retargeting a call keeps its size, so every branch offset still holds.
        fun retarget(instruction: Instruction, owner: String): Instruction {
            val call = ((instruction as ReferenceInstruction).reference as MethodReference)
            val moved = ImmutableMethodReference(owner, call.name, call.parameterTypes, call.returnType)
            return when (instruction) {
                is FiveRegisterInstruction -> ImmutableInstruction35c(instruction.opcode, instruction.registerCount,
                    instruction.registerC, instruction.registerD, instruction.registerE, instruction.registerF,
                    instruction.registerG, moved)
                is RegisterRangeInstruction -> ImmutableInstruction3rc(instruction.opcode, instruction.startRegister,
                    instruction.registerCount, moved)
                else -> throw AssertionError("unexpected call format ${instruction.opcode}")
            }
        }
        // A build that reaches Play Core before it reads the update manager. Branches are relative, so
        // they survive the shift; the try ranges don't, and the patch must refuse before reading them.
        val earlyPrompt = replace(owner, coroutine, keepTries = false) { body ->
            listOf(ImmutableInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0,
                ImmutableMethodReference("${PLAY_CORE_UPDATES}Moved;", "prompt", emptyList(), "V"))) + body
        }
        val noPrompt = replace(owner, coroutine) { body ->
            body.map { if (isPrompt(it)) retarget(it, "Lhush/test/NotPlayCore;") else it }
        }
        for ((reason, changed) in listOf("Play Core called before the anchor" to earlyPrompt, "no Play Core call" to noPrompt)) {
            val context = PatchContexts.of(ExtensionDex.classes() + classes.filter { it.type != owner.type } + changed)
            val failure = assertThrows(reason, PatchException::class.java) { disableUpdateNagPatch.execute(context) }
            assertTrue("$reason: ${failure.message}", failure.message.orEmpty().contains("no longer comes before"))
            assertEquals(reason, 0, context.mutableClassDefBy(owner.type).methods.single(coroutine).calls()
                .count { it.definingClass == UI_HOOKS })
            assertFlag(context, "disableUpdateNag", false)
        }
    }

    @Test fun `a recent-search view the patch can't pin down refuses before any change`() {
        val classes = read(Fixtures.declaredBuilds().last())
        val row = classes.single { it.type == TYPEAHEAD_ROW }
        val pill = classes.single { it.type == RECENT_SEARCH_PILL }
        val face = classes.single { it.type in row.interfaces && it.methods.any { method -> method.parameters() == RECENT_ROW_BIND } }
        val builder = classes.single { owner -> owner.methods.any { it.buildsRecentSearchCell() } }
        val blockType = recentSearchBlockType(classes)
        val block = classes.single { it.type == blockType }
        fun copy(owner: ClassDef, interfaces: List<String> = owner.interfaces, methods: List<Method> = owner.methods.toList()) =
            ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, interfaces, owner.sourceFile, owner.annotations,
                owner.fields, methods)
        fun measuring(owner: ClassDef) = copy(owner, methods = owner.methods + ImmutableMethod(owner.type, "onMeasure",
            listOf(ImmutableMethodParameter("I", null, null), ImmutableMethodParameter("I", null, null)), "V", AccessFlags.PUBLIC.value,
            null, null, ImmutableMethodImplementation(3, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), null, null)))
        val parameters = RECENT_ROW_BIND.map { ImmutableMethodParameter(it, null, null) }
        val twoBinds = copy(face, methods = face.methods + ImmutableMethod(face.type, "bindAgain", parameters, "V",
            AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value, null, null, null))
        val unshared = copy(pill, interfaces = pill.interfaces - face.type)
        val secondBuilder = "Lhush/test/SecondCellBuilder;"
        val twoBuilders = ImmutableClassDef(secondBuilder, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", listOf(), null, setOf(),
            listOf(), listOf(ImmutableMethod(secondBuilder, "build", listOf(), "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null, null, ImmutableMethodImplementation(1, listOf(
                    ImmutableInstruction21c(Opcode.NEW_INSTANCE, 0, ImmutableTypeReference(RECENT_SEARCH_CELL)),
                    ImmutableInstruction10x(Opcode.RETURN_VOID)), null, null))))
        val headless = ImmutableClassDef(block.type, block.accessFlags, block.superclass, block.interfaces, block.sourceFile,
            block.annotations, block.fields.filter { it.type != GESTALT_TEXT }, block.methods)
        fun with(swap: ClassDef) = classes.map { if (it.type == swap.type) swap else it }
        // Each case and the refusal it has to give, so none passes on another check's account.
        val cases = linkedMapOf(
            "no typing-screen row" to (classes - row to "no typing-screen row"),
            "two binds on the row's interface" to (with(twoBinds) to "recent search bind on the row's interface: expected one exact target, found 2"),
            "the pill no longer shares the row's interface" to (with(unshared) to "recent search bind on the row's interface: expected one exact target, found 0"),
            "the row measures itself" to (with(measuring(row)) to "typing-screen row ${row.type} measures itself"),
            "nothing builds recent-search cells" to (classes - builder to "the method that builds recent-search cells: expected one exact target, found 0"),
            "two methods build recent-search cells" to (classes + twoBuilders to "the method that builds recent-search cells: expected one exact target, found 2"),
            "the block measures itself" to (with(measuring(block)) to "recent searches block ${block.type} measures itself"),
            "the block holds no heading" to (with(headless) to "recent searches block ${block.type} holds no heading text"),
        )
        for ((reason, case) in cases) {
            val (input, message) = case
            val context = PatchContexts.of(ExtensionDex.classes() + input)
            val refusal = assertThrows(reason, PatchException::class.java) { hideSearchHistoryPatch.execute(context) }
            assertTrue("$reason refused for another reason: ${refusal.message}", refusal.message.orEmpty().contains(message))
            for (type in SEARCH_HISTORY_VIEWS + TYPEAHEAD_ROW + block.type) {
                if (input.none { it.type == type }) continue
                assertTrue("$reason left a hook in $type", context.mutableClassDefBy(type).methods.none { method ->
                    method.calls().any { it.definingClass == UI_HOOKS }
                })
            }
            assertFlag(context, "hideSearchHistory", false)
            assertFlag(context, "searchHistory", false)
            assertFlag(context, "recentSearchRows", false)
            assertFlag(context, "recentSearchHeading", false)
        }
    }

    @Test fun `a list on a class that isn't a view doesn't count as the recent searches block`() {
        val classes = read(Fixtures.declaredBuilds().last())
        val blockType = recentSearchBlockType(classes)
        val builder = classes.single { owner -> owner.methods.any { it.buildsRecentSearchCell() } }
        val plain = "Lhush/test/PlainListHolder;"
        val holder = ImmutableClassDef(plain, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", listOf(), null, setOf(),
            listOf(ImmutableField(plain, "list", ARRAY_LIST, AccessFlags.PUBLIC.value, null, setOf(), null)), listOf())
        val reading = replace(builder, { it.buildsRecentSearchCell() }, keepTries = false) { body ->
            listOf(ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 0, ImmutableFieldReference(plain, "list", ARRAY_LIST))) + body
        }
        val context = PatchContexts.of(ExtensionDex.classes() + classes.map { if (it.type == builder.type) reading else it } + holder)
        hideSearchHistoryPatch.execute(context)
        assertFlag(context, "recentSearchHeading", true)
        assertTrue("the real block folds", context.mutableClassDefBy(blockType).methods.any { method ->
            method.name == "onMeasure" && method.calls().any { it.definingClass == UI_HOOKS }
        })
        assertTrue("the plain list holder is left alone", context.mutableClassDefBy(plain).methods.isEmpty())
    }

    @Test fun `a suggested replies row the patch can't pin down leaves Hide comments in and its own switch out`() {
        val classes = read(Fixtures.declaredBuilds().last())
        val replies = classes.single { it.type == COMMENTS_QUICK_REPLIES }
        fun copy(owner: ClassDef, superclass: String? = owner.superclass, methods: List<Method> = owner.methods.toList()) =
            ImmutableClassDef(owner.type, owner.accessFlags, superclass, owner.interfaces, owner.sourceFile, owner.annotations,
                owner.fields, methods)
        val buildsChips: (Method) -> Boolean = { method ->
            method.instructions().any {
                it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == SMALL_PRIMARY_BUTTON
            }
        }
        assertEquals("the row builds its chips in one method", 1, replies.methods.count(buildsChips))
        val secondBuilder = ImmutableMethod(replies.type, "buildAgain", listOf(), "V", AccessFlags.PUBLIC.value, null, null,
            ImmutableMethodImplementation(2, listOf(
                ImmutableInstruction21c(Opcode.NEW_INSTANCE, 0, ImmutableTypeReference(SMALL_PRIMARY_BUTTON)),
                ImmutableInstruction10x(Opcode.RETURN_VOID)), null, null))
        // Each template read, pointed at a field of another name. Same size, so the branches and try ranges hold.
        val untemplated = replace(replies, { true }) { body ->
            body.map { instruction ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                if (field == null || !field.name.startsWith("comment_templates_")) instruction
                else ImmutableInstruction21c(instruction.opcode, (instruction as OneRegisterInstruction).registerA,
                    ImmutableFieldReference(field.definingClass, "unrelated_" + field.name.removePrefix("comment_templates_"), field.type))
            }
        }
        fun with(swap: ClassDef) = classes.map { if (it.type == swap.type) swap else it }
        // Each case and the warning it has to give, so none passes on another check's account.
        val cases = linkedMapOf(
            "no suggested replies row" to (classes - replies to "no suggested replies row"),
            "the row isn't a LinearLayout" to (with(copy(replies, superclass = "Landroid/widget/FrameLayout;")) to
                "builds on Landroid/widget/FrameLayout;"),
            "nothing builds the chips" to (with(copy(replies, methods = replies.methods.filterNot(buildsChips))) to
                "the suggested replies chip builder: expected one exact target, found 0"),
            "two methods build chips" to (with(copy(replies, methods = replies.methods + secondBuilder)) to
                "the suggested replies chip builder: expected one exact target, found 2"),
            "no comment template strings" to (with(untemplated) to "reads no comment_templates_ strings"),
        )
        for ((reason, case) in cases) {
            val (input, message) = case
            val context = PatchContexts.of(ExtensionDex.classes() + input)
            val warnings = PatchLogCapture.warnings { hideCommentsPatch.execute(context) }
            assertEquals("$reason: $warnings", 1, warnings.size)
            assertTrue("$reason warned for another reason: $warnings", warnings.single().contains(message))
            assertTrue("$reason: $warnings", warnings.single().endsWith("Hide suggested replies isn't in this build."))
            if (input.any { it.type == COMMENTS_QUICK_REPLIES }) {
                assertTrue("$reason left a hook in the suggested replies row", context.mutableClassDefBy(COMMENTS_QUICK_REPLIES).methods
                    .none { method -> method.calls().any { it.definingClass == UI_HOOKS } })
            }
            assertTrue("$reason took Hide comments out with it", context.mutableClassDefBy(COMMENT_PREVIEW).methods.any { method ->
                method.name == "onMeasure" && method.calls().any { it.definingClass == UI_HOOKS && it.name == "commentsMeasureSpec" }
            })
            assertFlag(context, "hideComments", true)
            assertFlag(context, "comments", true)
            assertFlag(context, "suggestedReplies", false)
        }
    }

    /** The view whose ArrayList the one method building the search page's recent-search cells reads. */
    private fun recentSearchBlockType(classes: List<ClassDef>) = classes.flatMap { it.methods }.single { it.buildsRecentSearchCell() }
        .fields().filter { it.type == ARRAY_LIST }.map { it.definingClass }.distinct().single()

    private fun Method.buildsRecentSearchCell() = definingClass != RECENT_SEARCH_CELL && instructions().any {
        it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == RECENT_SEARCH_CELL
    }

    private fun replace(owner: ClassDef, which: (Method) -> Boolean, keepTries: Boolean = true,
                        change: (List<Instruction>) -> List<Instruction>) =
        ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
            owner.annotations, owner.fields, owner.methods.map { method ->
                val implementation = method.implementation
                if (!which(method) || implementation == null) method else ImmutableMethod(method.definingClass, method.name,
                    method.parameters, method.returnType, method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                    ImmutableMethodImplementation(implementation.registerCount, change(implementation.instructions.toList()),
                        if (keepTries) implementation.tryBlocks else null, null))
            })

    private fun read(build: File): List<ClassDef> {
        val anchors = setOf("sg_android_new_screenshot_api_14", "ai_fwd_android_assistant_ask_mode", "BottomNavTabModel(type=",
            "BottomNavBar tab insertion out of range", "confirmEmailButton", "inAppUpdateManager",
            "unifiedCommentsModulePresenterFactory", "CommentsZone(isVisible=")
        val required = (SEARCH_HISTORY_VIEWS + TYPEAHEAD_ROW + COMMENT_PREVIEW + COMMENTS_QUICK_REPLIES + HEADER_BAR + BOTTOM_BAR +
            BLUR_VIEW + PIN_MENU + "Lcom/pinterest/activity/pin/view/modules/PinCloseupVideoModule;").toSet()
        val found = mutableMapOf<String, ClassDef>()
        FixtureDex.forEach(build) { dex ->
            for (owner in dex.classes) {
                val match = owner.type in required || owner.isCommentsModule() || owner.methods.any { it.buildsRecentSearchCell() } ||
                    (owner.superclass == "Ljava/lang/Enum;" && owner.fields.map { it.name }
                        .containsAll(listOf("HOME", "PROFILE", "CREATE", "NOTIFICATIONS"))) ||
                    owner.methods.any { method -> method.strings().any { it in anchors } ||
                        method.fields().any { it.name in FILTERABLE_PIN_MENU_TITLES ||
                            it.name == "email_verification_reminder_title" || it.name == COMMENTS_SCREEN_ID } }
                if (match) found[owner.type] = ImmutableClassDef.of(owner)
            }
        }
        // The interfaces the typing-screen row shares with the recent-search pill name its recent search bind.
        found += FixtureDex.classes(build, listOfNotNull(found[TYPEAHEAD_ROW], found[RECENT_SEARCH_PILL])
            .flatMap { it.interfaces }.toSet() - found.keys)
        // The search page's Recent searches block is the view whose cell list the cell builder reads.
        found += FixtureDex.classes(build, found.values.flatMap { it.methods }.filter { it.buildsRecentSearchCell() }
            .flatMap { it.fields() }.filter { it.type == ARRAY_LIST }.map { it.definingClass }.toSet() - found.keys)
        // Include every application superclass so final inherited methods are checked before an override is added.
        // The sheet a pin's menu is built into comes along too, so the patch can tell it's a view.
        val sheets = found[PIN_MENU]?.methods?.filter { it.name == "createModalView" }?.map { it.returnType }.orEmpty()
        var parents = (found.values.mapNotNull { it.superclass } + sheets).toSet() - found.keys
        while (parents.isNotEmpty()) {
            val loaded = FixtureDex.classes(build, parents)
            found += loaded
            parents = loaded.values.mapNotNull { it.superclass }.toSet() - found.keys
        }
        assertFalse("${build.name}: no vendor targets", found.isEmpty())
        return found.values.toList()
    }

    /** Each hook gets the original view and a separate value; one register twice means a scratch replaced the view. */
    private fun assertDistinctArguments(what: String, body: List<Instruction>, hook: String) {
        val sites = body.filter { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                ?.let { it.definingClass == INTERFACE_CONTROLS && it.name == hook } == true
        }
        assertTrue("$what: no $hook call", sites.isNotEmpty())
        for (site in sites) {
            val call = site as FiveRegisterInstruction
            assertTrue("$what: $hook passes v${call.registerC} twice", call.registerC != call.registerD)
        }
    }

    private fun assertFlag(context: BytecodePatchContext, name: String, enabled: Boolean) {
        val first = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.instructions().first()
        assertEquals(name, Opcode.CONST_4, first.opcode)
        assertEquals(name, if (enabled) 1 else 0, (first as NarrowLiteralInstruction).narrowLiteral)
    }
}
