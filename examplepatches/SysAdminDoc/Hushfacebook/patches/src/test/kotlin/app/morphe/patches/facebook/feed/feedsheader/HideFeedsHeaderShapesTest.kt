/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.feedsheader

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The parts of Hide the Feeds header that need no Facebook build: what the patch reads out of a
 * stand-in Feeds fragment and the runnable its container controller posts, the shapes it refuses,
 * and the code it puts in.
 */
class HideFeedsHeaderShapesTest {
    private val container = "Lfixture/TabBarContainer;"
    private val controller = "Lfixture/FiltersController;"
    private val field = "$FEED_FILTERS_FRAGMENT->$FILTERS_FIELD:$container"
    private val frameInit = "Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V"
    private val controllerInit = "$controller-><init>(Landroid/content/Context;Lfixture/Session;$container)V"
    private val inView = "$FEED_FILTERS_FRAGMENT->$ON_CREATE_VIEW"
    private val containerController = "Lfixture/ContainerController;"
    private val topMargin = "Lfixture/TopMargin;"
    private val inRun = "$topMargin->run"

    private fun method(
        name: String,
        parameters: List<String>,
        returns: String,
        registers: Int,
        body: String,
        owner: String = FEED_FILTERS_FRAGMENT,
    ) = MutableMethod(
        ImmutableMethod(
            owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returns,
            AccessFlags.PUBLIC.value, null, null, ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, body.trimIndent()) }

    /** shouldInitializeNavBar as 580 writes it: the tab arguments' answer, or no without them. */
    private fun navBar(
        body: String = """
            invoke-static { }, Lfixture/NavBarArgs;->get()Lfixture/NavBarArgs;
            move-result-object p0
            if-eqz p0, :none
            invoke-virtual { p0 }, Lfixture/NavBarArgs;->shouldInitializeNavBar()Z
            move-result p0
            return p0
            :none
            const/4 p0, 0x0
            return p0
        """,
    ) = method(NAV_BAR_QUESTION, emptyList(), "Z", 1, body)

    /**
     * inflateFeedFiltersView cut down: the container made, built from the Context by FrameLayout's
     * constructor as R8 leaves it, stored, then hidden. [between] goes before the store.
     */
    private fun builder(
        name: String = "inflateFeedFiltersView",
        init: String = "invoke-direct { v1, p1 }, $frameInit",
        between: String = "",
    ) = method(
        name, listOf("Landroid/content/Context;"), container, 6,
        """
            new-instance v1, $container
            $init
            $between
            iput-object v1, p0, $field
            const/16 v0, 0x8
            invoke-virtual { v1, v0 }, Landroid/view/View;->setVisibility(I)V
            return-object v1
        """,
    )

    /**
     * onCreateView cut down to 580's hand-over: the Context and the session read, the container
     * read from the field and null-checked, then the controller made and handed all three. Parts
     * can change; [after] goes after the controller's own use and [tail] after the return.
     */
    private fun view(
        head: String = "",
        beforeInstance: String = "",
        call: String = "invoke-direct { v5, v1, v4, v0 }, $controllerInit",
        after: String = "",
        tail: String = "",
    ) = method(
        ON_CREATE_VIEW, ON_CREATE_VIEW_PARAMETERS, "Landroid/view/View;", 14,
        """
            $head
            invoke-virtual { p0 }, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;
            move-result-object v1
            invoke-static { }, Lfixture/Session;->get()Lfixture/Session;
            move-result-object v4
            iget-object v0, p0, $field
            invoke-virtual { v0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
            $beforeInstance
            new-instance v5, $controller
            $call
            invoke-static { v5 }, Lfixture/Filters;->keep(Ljava/lang/Object;)V
            $after
            const/4 v0, 0x0
            return-object v0
            $tail
        """,
    )

    /** Fields by name and type: the filters' container and the controller that puts the posts under them. */
    private fun fragment(
        navBar: Method? = navBar(),
        builder: Method? = builder(),
        view: Method? = view(),
        fields: Map<String, String> = mapOf(FILTERS_FIELD to container, CONTAINER_CONTROLLER_FIELD to containerController),
        more: List<Method> = emptyList(),
    ): ClassDef = ImmutableClassDef(
        FEED_FILTERS_FRAGMENT, AccessFlags.PUBLIC.value, "Landroidx/fragment/app/Fragment;", null, null, null,
        fields.map { (name, type) -> ImmutableField(FEED_FILTERS_FRAGMENT, name, type, AccessFlags.PUBLIC.value, null, null, null) },
        listOfNotNull(navBar, builder, view) + more,
    )

    /**
     * The container controller's A00(Z) as 580 writes it, cut down: a runnable made with whether
     * the filters show, then posted. [makes] are the types it makes, the framework's Handler among
     * them, which no app dex carries.
     */
    private fun controllerClass(makes: List<String> = listOf("Landroid/os/Handler;", topMargin)): ClassDef {
        val body = makes.joinToString("\n") { type ->
            """
                new-instance v0, $type
                invoke-direct { v0, p0, p1 }, $type-><init>(${containerController}Z)V
                invoke-static { v0 }, Lfixture/Main;->post(Ljava/lang/Object;)V
            """.trimIndent()
        } + "\nreturn-void"
        return ImmutableClassDef(
            containerController, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, emptyList(),
            listOf(method("A00", listOf("Z"), "V", 3, body, owner = containerController)),
        )
    }

    /**
     * run() as 580's FeedFiltersFragmentContainerController$setViewPagerTopMargin$1 writes it, cut
     * down: the posts' margins read, then whether the filters show, branched on right away to
     * either the filters' height or none. [before] goes before that read.
     */
    private fun run(
        before: String = "",
        read: String = "iget-boolean v0, p0, $topMargin->A01:Z",
        branch: String = "if-eqz v0, :none",
    ) = method(
        "run", emptyList(), "V", 5,
        """
            iget-object v1, p0, $topMargin->A00:$containerController
            iget-object v3, v1, $containerController->A0B:Landroid/view/View;
            invoke-static { v3 }, Lfixture/Margins;->of(Landroid/view/View;)Ljava/lang/Object;
            move-result-object v2
            $before
            $read
            $branch
            const/16 v1, 0x73
            :apply
            invoke-static { v2, v1 }, Lfixture/Margins;->top(Ljava/lang/Object;I)V
            return-void
            :none
            const/4 v1, 0x0
            goto :apply
        """,
        owner = topMargin,
    )

    /** The runnable, with the name Redex keeps for it in [name] when there is one. */
    private fun topMarginClass(type: String = topMargin, name: String? = ROOM_RUNNABLE, run: Method? = run()): ClassDef =
        ImmutableClassDef(
            type, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Ljava/lang/Object;", listOf("Ljava/lang/Runnable;"),
            null, null,
            listOfNotNull(
                name?.let {
                    ImmutableField(
                        type, "__redex_internal_original_name", "Ljava/lang/String;",
                        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value,
                        ImmutableStringEncodedValue(it), null, null,
                    )
                },
                ImmutableField(type, "A00", containerController, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, null),
                ImmutableField(type, "A01", "Z", AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, null),
            ),
            listOfNotNull(run),
        )

    private fun pool(vararg classes: ClassDef): (String) -> ClassDef? = classes.associateBy { it.type }::get

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private val Instruction.reference: String get() = (this as ReferenceInstruction).reference.toString()

    private fun Instruction.register(): Int = (this as OneRegisterInstruction).registerA

    /** The index of the instruction the branch at [index] jumps to. */
    private fun targetOf(code: List<Instruction>, index: Int): Int {
        val addresses = code.runningFold(0) { at, instruction -> at + instruction.codeUnits }
        return addresses.indexOf(addresses[index] + (code[index] as OffsetInstruction).codeOffset)
    }

    private fun instanceOf(code: List<Instruction>) =
        code.indexOfFirst { it.opcode == Opcode.NEW_INSTANCE && it.reference == controller }

    @Test
    fun `the answers are the question's returns and the hand-over is the controller made right before it gets the container`() {
        val answers = navBarAnswers(fragment())
        assertEquals(NAV_BAR_QUESTION, answers.method.name)
        assertEquals(listOf(5 to 0, 7 to 0), answers.returns)

        val handOver = filtersHandOver(fragment())
        assertEquals(ON_CREATE_VIEW, handOver.method.name)
        assertEquals(instanceOf(view().body()), handOver.index)
        assertEquals("the controller's and the container's registers", 5 to 0,
            handOver.controllerRegister to handOver.containerRegister)
        assertEquals(container, handOver.type)
        assertEquals("the constructor the fragment builds its own container with", frameInit, handOver.constructor.toString())
    }

    /** The controller makes a Handler too, which no app dex carries, and a runnable of another name is passed over. */
    @Test
    fun `the room is the runnable's read of whether the filters show, right before its branch`() {
        val other = "Lfixture/Other;"
        val classes = pool(
            fragment(), controllerClass(listOf("Landroid/os/Handler;", other, topMargin)),
            topMarginClass(other, name = "FeedFiltersFragmentContainerController\$hideFilters\$1"), topMarginClass(),
        )
        val room = filtersRoom(fragment(), classes)
        assertEquals(topMargin, room.runnable.type)
        assertEquals("run", room.method.name)
        assertEquals("the read of whether the filters show and its register", 4 to 0, room.index to room.register)
    }

    /** A long before the container takes two registers, so the container is the argument after them. */
    @Test
    fun `a wide argument before the container counts as two registers`() {
        val wide = view(
            head = "const-wide/16 v2, 0x0",
            call = "invoke-direct { v5, v1, v2, v3, v0 }, $controller-><init>(Landroid/content/Context;J$container)V",
        )
        val handOver = filtersHandOver(fragment(view = wide))
        assertEquals(5 to 0, handOver.controllerRegister to handOver.containerRegister)
    }

    @Test
    fun `the patch asks before the controller is made and hands it a container of its own on a yes`() {
        val context = PatchContexts.of(
            listOf(fragment(), controllerClass(), topMarginClass(), ExtensionDex.classDef(SETTINGS_STATUS)),
        )
        hideFeedsHeaderPatch.execute(context)
        val patched = context.mutableClassDefBy(FEED_FILTERS_FRAGMENT)

        val code = patched.methods.single { it.name == ON_CREATE_VIEW }.body()
        val at = instanceOf(view().body())
        assertEquals("seven instructions for the hook", view().body().size + 7, code.size)
        assertEquals(Opcode.INVOKE_STATIC, code[at].opcode)
        assertEquals(HIDES_FILTERS, code[at].reference)
        assertEquals("the container handed over", listOf(0), code[at].namedRegisters())
        assertEquals(Opcode.MOVE_RESULT, code[at + 1].opcode)
        assertEquals("the answer goes in the controller's register", 5, code[at + 1].register())
        assertEquals(Opcode.IF_EQZ, code[at + 2].opcode)
        assertEquals(5, code[at + 2].register())
        assertEquals("a no goes on to Facebook's new-instance", at + 7, targetOf(code, at + 2))
        assertEquals(GET_CONTEXT, code[at + 3].reference)
        assertEquals(listOf(0), code[at + 3].namedRegisters())
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[at + 4].opcode)
        assertEquals(5, code[at + 4].register())
        assertEquals(Opcode.NEW_INSTANCE, code[at + 5].opcode)
        assertEquals("a new container of the field's type", container, code[at + 5].reference)
        assertEquals(0, code[at + 5].register())
        assertEquals(Opcode.INVOKE_DIRECT, code[at + 6].opcode)
        assertEquals(frameInit, code[at + 6].reference)
        assertEquals("built from the Context of Facebook's container", listOf(0, 5), code[at + 6].namedRegisters())
        assertEquals("Facebook's new-instance after the hook", controller, code[at + 7].reference)
        assertEquals(controllerInit, code[at + 8].reference)
        assertEquals("the controller gets what's in the container's register", listOf(5, 1, 4, 0), code[at + 8].namedRegisters())

        val question = patched.methods.single { it.name == NAV_BAR_QUESTION }.body()
        assertEquals("two instructions for each answer", navBar().body().size + 4, question.size)
        for (answer in listOf(5, 9)) {
            assertEquals(Opcode.INVOKE_STATIC_RANGE, question[answer].opcode)
            assertEquals(NAV_BAR, question[answer].reference)
            assertEquals("the answer handed over", listOf(0), question[answer].namedRegisters())
            assertEquals(Opcode.MOVE_RESULT, question[answer + 1].opcode)
            assertEquals("the extension's answer is returned", 0, question[answer + 1].register())
            assertEquals(Opcode.RETURN, question[answer + 2].opcode)
        }
        assertEquals("no without the arguments still goes to its own line", Opcode.CONST_4, question[targetOf(question, 2)].opcode)

        val margin = context.mutableClassDefBy(topMargin).methods.single { it.name == "run" }.body()
        assertEquals("two instructions for the room's hook", run().body().size + 2, margin.size)
        assertEquals("Facebook's read stays first", Opcode.IGET_BOOLEAN, margin[4].opcode)
        assertEquals(Opcode.INVOKE_STATIC_RANGE, margin[5].opcode)
        assertEquals(ROOM, margin[5].reference)
        assertEquals("whether the filters show handed over", listOf(0), margin[5].namedRegisters())
        assertEquals(Opcode.MOVE_RESULT, margin[6].opcode)
        assertEquals("the extension's answer goes where Facebook's was", 0, margin[6].register())
        assertEquals("Facebook's branch on it after the hook", Opcode.IF_EQZ, margin[7].opcode)
        assertEquals(0, margin[7].register())
        assertEquals("a no still goes to no room", Opcode.CONST_4, margin[targetOf(margin, 7)].opcode)

        val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "feedsHeader" }
        assertEquals("SettingsStatus.feedsHeader() isn't switched on", 1, (status.body()[0] as NarrowLiteralInstruction).narrowLiteral)
    }

    /** A jump to a return lands on the hook, so an answer reached that way is asked about too. */
    @Test
    fun `a jump to an answer goes through the hook`() {
        val method = navBar(
            """
                invoke-static { }, Lfixture/NavBarArgs;->wanted()Z
                move-result p0
                if-nez p0, :answer
                const/4 p0, 0x0
                :answer
                return p0
            """,
        )
        val answers = navBarAnswers(fragment(navBar = method))
        assertEquals(listOf(4 to 0), answers.returns)
        method.hookNavBarAnswers(answers)
        val code = method.body()
        assertEquals(NAV_BAR, code[4].reference)
        assertEquals("the jump lands on the hook", 4, targetOf(code, 2))
        assertEquals(Opcode.RETURN, code[6].opcode)
    }

    /**
     * The hook takes each return's label, a try block's edges with it, so a try block over a
     * return or starting there would take the hook's call in. Both are refused, and so is one
     * ending there. One that ends an instruction short still applies.
     */
    @Test
    fun `a try block at or over an answer is refused`() {
        // In navBar() the answer's call is at 3, its move at 4 and the returns at 5 and 7.
        fun caught(from: Int, to: Int) = navBar().apply {
            implementation!!.apply {
                addCatch("Ljava/lang/Exception;", newLabelForIndex(from), newLabelForIndex(to), newLabelForIndex(6))
            }
        }
        val shapes = mapOf(
            "a try block over the call and the return" to caught(3, 6),
            "a try block ending at the return" to caught(3, 5),
            "a try block starting at the return" to caught(5, 6),
        )
        for ((shape, method) in shapes) {
            val refusal = assertThrows(shape, PatchException::class.java) { navBarAnswers(fragment(navBar = method)) }.message!!
            assertTrue("$shape: $refusal", "$FEED_FILTERS_FRAGMENT->$NAV_BAR_QUESTION returns at [5] in a try block or at one's edge" in refusal)
        }
        assertEquals(listOf(5 to 0, 7 to 0), navBarAnswers(fragment(navBar = caught(3, 4))).returns)
    }

    @Test
    fun `fragments the patch can't follow are refused`() {
        val shapes = mapOf(
            "no question" to (fragment(navBar = null) to "has no $NAV_BAR_QUESTION()Z"),
            "a question that never answers" to (
                fragment(
                    navBar = navBar(
                        """
                            new-instance p0, Ljava/lang/IllegalStateException;
                            invoke-direct { p0 }, Ljava/lang/IllegalStateException;-><init>()V
                            throw p0
                        """,
                    ),
                ) to "never returns an answer"
            ),
            "no container field" to (
                fragment(fields = mapOf(CONTAINER_CONTROLLER_FIELD to containerController)) to "has no field $FILTERS_FIELD"
            ),
            "the container stored twice" to (
                fragment(more = listOf(builder(name = "rebuild"))) to "expected one write of $FEED_FILTERS_FRAGMENT->$FILTERS_FIELD, found 2"
            ),
            "the container stored after something else" to (
                fragment(builder = builder(between = "const/4 v0, 0x0")) to
                    "doesn't make and build the $FILTERS_FIELD container from a Context right before storing it"
            ),
            "the container built from more than a Context" to (
                fragment(
                    builder = builder(
                        init = "invoke-direct { v1, p1, v0 }, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;" +
                            "Landroid/util/AttributeSet;)V",
                    ),
                ) to "doesn't make and build the $FILTERS_FIELD container"
            ),
            "no onCreateView" to (fragment(view = null) to "has no $ON_CREATE_VIEW"),
            "a controller that takes the container as a plain View" to (
                fragment(
                    view = view(call = "invoke-direct { v5, v1, v4, v0 }, $controller-><init>(Landroid/content/Context;" +
                        "Lfixture/Session;Landroid/view/View;)V"),
                ) to "expected one constructor in $inView handed $FILTERS_FIELD, found 0"
            ),
            "two controllers handed the container" to (
                fragment(view = view(after = "new-instance v6, $controller\ninvoke-direct { v6, v1, v4, v0 }, $controllerInit")) to
                    "expected one constructor in $inView handed $FILTERS_FIELD, found 2"
            ),
            "the controller made before something else" to (
                fragment(view = view(call = "const/4 v2, 0x0\ninvoke-direct { v5, v1, v4, v0 }, $controllerInit")) to
                    "the $controller handed $FILTERS_FIELD isn't made right before its constructor"
            ),
            "the container read again after the call" to (
                fragment(view = view(after = "invoke-virtual { v0 }, Landroid/view/View;->requestLayout()V")) to
                    "after it's handed to $controller"
            ),
            "a jump to the new-instance" to (
                fragment(view = view(beforeInstance = "if-eqz v1, :make\nconst/4 v2, 0x0\n:make")) to
                    "the $controller's new-instance can be reached from"
            ),
        )
        for ((shape, case) in shapes) {
            val (fragment, reason) = case
            val refusal = assertThrows(shape, PatchException::class.java) {
                navBarAnswers(fragment)
                filtersHandOver(fragment)
            }.message!!
            assertTrue("$shape: $refusal", refusal.startsWith("$PATCH: "))
            assertTrue("$shape: $refusal", reason in refusal)
        }
    }

    /**
     * The hook goes in between the runnable's read and its branch, so anything else there, or any
     * other way to the branch, would leave Facebook's answer standing on some path. A try block
     * over the branch or at its edge could take the hook's call in, though one that ends at the
     * read still applies.
     */
    @Test
    fun `rooms the patch can't follow are refused`() {
        val second = "Lfixture/SecondTopMargin;"
        val reads = "expected $inRun to read one boolean of its own"
        val branched = "in $inRun the boolean read at 4 isn't branched on right after"
        val caught = "in $inRun the branch on whether the filters show is in a try block or at one's edge"
        fun withRun(run: Method) = listOf(controllerClass(), topMarginClass(run = run))
        // In run() the read is at 4, the branch at 5 and the way to no room at 9.
        fun caughtRun(from: Int, to: Int, handler: Int = 9) = run().apply {
            implementation!!.apply {
                addCatch("Ljava/lang/Exception;", newLabelForIndex(from), newLabelForIndex(to), newLabelForIndex(handler))
            }
        }
        val handlerAtBranch = caughtRun(2, 3, handler = 5)
        val shapes = mapOf(
            "no controller field" to Triple(
                fragment(fields = mapOf(FILTERS_FIELD to container)), listOf(controllerClass(), topMarginClass()),
                "has no field $CONTAINER_CONTROLLER_FIELD",
            ),
            "no controller class" to Triple(
                fragment(), listOf(topMarginClass()),
                "this build has no $containerController, the type of $FEED_FILTERS_FRAGMENT->$CONTAINER_CONTROLLER_FIELD",
            ),
            "no runnable made" to Triple(
                fragment(), listOf(controllerClass(listOf("Landroid/os/Handler;")), topMarginClass()),
                "expected $containerController to make one $ROOM_RUNNABLE, found 0",
            ),
            "a runnable of another name" to Triple(
                fragment(),
                listOf(controllerClass(), topMarginClass(name = "FeedFiltersFragmentContainerController\$hideFilters\$1")),
                "found 0",
            ),
            "a runnable Redex left no name on" to Triple(fragment(), listOf(controllerClass(), topMarginClass(name = null)), "found 0"),
            "two runnables of that name" to Triple(
                fragment(), listOf(controllerClass(listOf(topMargin, second)), topMarginClass(), topMarginClass(second)),
                "expected $containerController to make one $ROOM_RUNNABLE, found 2",
            ),
            "no run()" to Triple(fragment(), listOf(controllerClass(), topMarginClass(run = null)), "$topMargin has no run()V"),
            "a read of another object's boolean" to Triple(
                fragment(), withRun(run(read = "iget-boolean v0, v1, $topMargin->A01:Z")), "$reads, found 0",
            ),
            "a read of a boolean another class declares" to Triple(
                fragment(), withRun(run(read = "iget-boolean v0, p0, $containerController->A02:Z")), "$reads, found 0",
            ),
            "two reads of its own" to Triple(
                fragment(), withRun(run(before = "iget-boolean v0, p0, $topMargin->A01:Z")), "$reads, found 2",
            ),
            "something between the read and the branch" to Triple(
                fragment(), withRun(run(branch = "nop\nif-eqz v0, :none")), branched,
            ),
            "the branch the other way" to Triple(fragment(), withRun(run(branch = "if-nez v0, :none")), branched),
            "the branch on another register" to Triple(fragment(), withRun(run(branch = "if-eqz v2, :none")), branched),
            "a jump to the branch" to Triple(
                fragment(), withRun(run(before = "if-nez v2, :branch", branch = ":branch\nif-eqz v0, :none")),
                "the branch on whether the filters show can be reached from [4, 5], not only from its read",
            ),
            "a handler at the branch" to Triple(fragment(), withRun(handlerAtBranch), "can be reached from [4, 2]"),
            "a try block over the read and the branch" to Triple(fragment(), withRun(caughtRun(4, 6)), caught),
            "a try block ending at the branch" to Triple(fragment(), withRun(caughtRun(4, 5)), caught),
            "a try block starting at the branch" to Triple(fragment(), withRun(caughtRun(5, 6)), caught),
        )
        for ((shape, case) in shapes) {
            val (fragment, classes, reason) = case
            val refusal = assertThrows(shape, PatchException::class.java) {
                filtersRoom(fragment, pool(fragment, *classes.toTypedArray()))
            }.message!!
            assertTrue("$shape: $refusal", refusal.startsWith("$PATCH: "))
            assertTrue("$shape: $refusal", reason in refusal)
        }
        val plain = fragment()
        assertEquals(4, filtersRoom(plain, pool(plain, *withRun(caughtRun(2, 4)).toTypedArray())).index)
    }

    /**
     * dexlib2 keeps a try block's edges on the new-instance the hook goes in above. A try block
     * over it or ending at it would take the hook's calls in, so both are refused, and so is one
     * starting there. A handler there is one more way to it. A try block that ends an instruction
     * short still applies.
     */
    @Test
    fun `a try block at or over the controller's new-instance is refused`() {
        val tail = "move-exception v2\nthrow v2"
        val at = instanceOf(view(tail = tail).body())
        fun caught(from: Int, to: Int, handler: Int? = null) = view(tail = tail).apply {
            val thrown = handler ?: body().indexOfFirst { it.opcode == Opcode.MOVE_EXCEPTION }
            implementation!!.apply {
                addCatch("Ljava/lang/Exception;", newLabelForIndex(from), newLabelForIndex(to), newLabelForIndex(thrown))
            }
        }
        val shapes = mapOf(
            "a try block over the new-instance and the call" to (caught(at, at + 2) to "new-instance is in a try block or at one's edge"),
            "a try block ending at the new-instance" to (caught(at - 1, at) to "new-instance is in a try block or at one's edge"),
            "a try block starting at the new-instance" to (caught(at, at + 1) to "new-instance is in a try block or at one's edge"),
            "a handler at the new-instance" to (caught(at - 2, at - 1, handler = at) to "new-instance can be reached from [${at - 1}, ${at - 2}]"),
        )
        for ((shape, case) in shapes) {
            val (view, reason) = case
            val refusal = assertThrows(shape, PatchException::class.java) { filtersHandOver(fragment(view = view)) }.message!!
            assertTrue("$shape: $refusal", reason in refusal)
        }
        assertEquals(at, filtersHandOver(fragment(view = caught(at - 2, at - 1))).index)
    }
}
