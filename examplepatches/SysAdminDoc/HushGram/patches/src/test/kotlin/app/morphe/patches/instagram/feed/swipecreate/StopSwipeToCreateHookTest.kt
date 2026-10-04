/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.feed.swipecreate

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.instagram.NeutralNativePath
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.util.BitSet
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class StopSwipeToCreateHookTest {
    private val container = SWIPE_CONTAINER
    private val config = POSITION_CONFIG
    private val spring = "Lfixture/Spring;"
    private val event = "Landroid/view/MotionEvent;"
    private val makeConfig = "$config-><init>(Ljava/lang/Object;JLjava/lang/String;FZ)V"

    /** The hook the patch writes is in the SwipeToCreate the bundle ships, public and static. */
    @Test
    fun theHookIsInTheExtension() {
        val declared = ExtensionDex.classDef(HOLD.substringBefore("->")).methods
            .filter { AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }
            .map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        assertTrue("$HOLD is not in the extension: $declared", HOLD.substringAfter("->") in declared)
        assertTrue("$ENABLED is not in the extension: $declared", ENABLED.substringAfter("->") in declared)
    }

    /**
     * In front of the animate flag's read, the hook gets the clamped target, where the panels are
     * and the config's reason, the field the drag handler's "swipe" goes in past a long parameter.
     * A 0 goes on to the flag's read, and a 1 sets the target and the flag to 0 and skips it.
     */
    @Test
    fun theMoveIsAskedAfterItsFlagAndEveryJumpStillLands() {
        val context = PatchContexts.of(classes())

        context.stop()

        val setter = context.setter()
        assertHeld("the stand-in", setter, target = 0, flag = 3, reasonField = "$config->reason:Ljava/lang/String;")
        val code = setter.code()
        val hold = code.indexOfFirst { it.referenceText() == HOLD }
        assertEquals("the stand-in: the target, the free local and the flag's register", listOf(0, 2, 3), code[hold].arguments())
        val rest = code.indexOfLast { it.opcode == Opcode.IF_EQZ && (it as OneRegisterInstruction).registerA == 3 }
        assertEquals("the flag's branch still goes to the at-rest move", "setAtRest", (code[setter.targetOf(rest)].reference() as MethodReference).name)
        assertEquals("one hook", 1, context.mutableClassDefBy(container).methods.sumOf { method -> method.code().count { it.referenceText() == HOLD } })
    }

    @Test
    fun disabledHookSkipsEveryAddedNativeReadAndKeepsTheWholeOriginalSetter() {
        val context = PatchContexts.of(classes())
        val before = context.setter().code().map { it.describe() }
        val original = NeutralNativePath(context.setter())
        context.stop()
        assertDisabledPath("stand-in", context.setter(), before)
        assertOriginalPath("stand-in", context.setter(), original)
    }

    private fun assertDisabledPath(what: String, setter: MutableMethod, before: List<String>) {
        val code = setter.code()
        val gate = code.indexOfFirst { it.referenceText() == ENABLED }
        assertTrue("$what: switch must be checked before any added native reads", gate >= 0)
        assertEquals("$what: switch answer", Opcode.MOVE_RESULT, code[gate + 1].opcode)
        val free = (code[gate + 1] as OneRegisterInstruction).registerA
        assertEquals("$what: disabled branch", Opcode.IF_EQZ, code[gate + 2].opcode)
        assertEquals("$what: disabled branch uses the switch answer", free,
            (code[gate + 2] as OneRegisterInstruction).registerA)
        val resume = setter.targetOf(gate + 2)
        assertEquals("$what: disabled skips the native getter, reason and hold logic", gate + 13, resume)
        assertEquals("$what: resumes at the stock animate read", Opcode.IGET_BOOLEAN, code[resume].opcode)
        assertEquals("$what: disabled leaves every original instruction in order", before,
            (code.take(gate) + code.drop(resume)).map { it.describe() })
        val getter = code.indexOfFirst { it.referenceText() == "$container->$CLAMPED_POSITION()F" }
        assertTrue("$what: added getter must be after the disabled branch", getter > gate + 2 && getter < resume)
    }

    private fun assertOriginalPath(what: String, setter: MutableMethod, original: NeutralNativePath) {
        val gate = setter.code().indexOfFirst { it.referenceText() == ENABLED }
        original.assertPreserved(what, setter, (gate until gate + 13).toSet())
    }

    /** A build the patch can't read fails at patch time, saying what it found, and nothing is changed. */
    @Test
    fun aBuildThePatchCantReadFailsBeforeAnythingChanges() {
        val run = "expected $container->$SET_POSITION to read and clamp its target and then read its animate flag once, found"
        val cases = listOf(
            classes(containerType = "Lfixture/OtherContainer;") to "$container isn't in this build",
            classes(configType = "Lfixture/OtherConfig;") to "$config isn't in this build",
            classes(setterName = "setPosition") to "expected one $SET_POSITION($config)V in $container, found 0",
            classes(clampedName = "getPosition") to "expected one $CLAMPED_POSITION()F in $container, found 0",
            classes(clampedPrivate = false) to "$container->$CLAMPED_POSITION isn't a private instance method",
            classes(scrollName = "onDrag") to "expected one $ON_SCROLL in $container, found 0",
            classes(drags = 0) to "expected $container->$ON_SCROLL to load \"$DRAG\" once, found 0",
            classes(drags = 2) to "expected $container->$ON_SCROLL to load \"$DRAG\" once, found 2",
            classes(makes = 0) to "expected $container->$ON_SCROLL to make one $config, found 0",
            classes(makes = 2) to "expected $container->$ON_SCROLL to make one $config, found 2",
            classes(dragHandedOver = false) to "doesn't hand \"$DRAG\" to the $config it makes",
            classes(stores = 0) to "expected $config's constructor to store the reason in one field, found 0",
            classes(stores = 2) to "expected $config's constructor to store the reason in one field, found 2",
            classes(runs = 0) to "$run 0",
            classes(runs = 2) to "$run 2",
            classes(jumpIntoRun = true) to "jumps into the read of its target and animate flag",
            classes(thisReplaced = true) to "writes over this",
            classes(configReplaced = true) to "writes over parameter 0",
            classes(busyLocals = true) to "needs 1",
            classes(flagIntoConfig = true) to "reads its animate flag into v5, which the hook needs for something else",
        )
        for ((classes, expected) in cases) {
            val context = PatchContexts.of(classes)
            val failure = assertThrows(expected, PatchException::class.java) { context.stop() }
            assertTrue("$expected: ${failure.message}", failure.message!!.contains(expected))
            for (original in classes) {
                val now = context.mutableClassDefBy(original.type).methods.associateBy { it.key() }
                for (method in original.methods) {
                    assertEquals(
                        "$expected: ${original.type}->${method.name} changed",
                        method.code().map { it.describe() }, now.getValue(method.key()).code().map { it.describe() },
                    )
                }
            }
        }
    }

    /** In each declared build the container's move is asked once, before its animate flag. */
    @Test
    fun eachDeclaredBuildAsksBeforeTheSpringMoves() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
                // Copied, and as the patcher reads an APK, a new object for an instruction on each read.
                for ((read, classesOf) in listOf("copied" to FixtureDex::classes, "as read" to FixtureDex::classesAsRead)) {
                    val what = "${bundle.name} ($read)"
                    val classes = classesOf(bundle, setOf(container, config)).values
                    assertEquals("$what: the container and its config", 2, classes.size)
                    val context = PatchContexts.of(classes)
                    val before = context.setter().code().map { it.describe() }
                    val original = NeutralNativePath(context.setter())

                    context.stop()

                    val written = context.mutableClassDefBy(container).methods.filter { method -> method.code().any { it.referenceText() == HOLD } }
                    assertEquals("$what: methods asking", listOf(SET_POSITION), written.map { it.name })
                    val setter = written.single()
                    val code = setter.code()
                    val hold = code.indexOfFirst { it.referenceText() == HOLD }
                    val flag = (code[hold + 6] as OneRegisterInstruction).registerA
                    val target = (code[hold - 8] as OneRegisterInstruction).registerA
                    val reason = code[hold - 1].reference() as FieldReference
                    assertEquals("$what: the reason's class", config, reason.definingClass)
                    assertHeld(what, setter, target, flag, reason.toString())
                    assertEquals("$what: what comes after the flag's read", Opcode.INVOKE_DIRECT, code[hold + 7].opcode)
                    assertDisabledPath(what, setter, before)
                    assertOriginalPath(what, setter, original)
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    /**
     * A fling from Home is held too, since on each declared build every move a finger makes says
     * [DRAG], letting go included. onFling moves nothing itself: it keeps the fling's velocity in a
     * field. The one method that reads that field hands it to the release, the method that settles
     * the panels when the finger lifts, which the end of a nested scroll runs as well. The release
     * makes its move with [DRAG] in the reason the hook reads, or with a tap's own reason when a
     * partly shown panel was tapped, and a nested scroll's steps say [DRAG] too. The only other way
     * into the setter is setPosition, which buttons and links call with their own configs.
     */
    @Test
    fun aFlingFromHomeSaysSwipeToo() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
                val what = bundle.name
                val classes = FixtureDex.classes(bundle, setOf(container, config)).values
                val site = PatchContexts.of(classes).findSwipeToCreate()
                val methods = classes.single { it.type == container }.methods
                val slot = classes.single { it.type == config }.methods.single { it.name == "<init>" }.parameterStoredIn(site.reasonField)

                val fling = methods.single { it.name == "onFling" && it.parameterTypes.map(CharSequence::toString) == listOf(event, event, "F", "F") }
                assertTrue("$what: onFling makes or hands on a config", fling.code().none { it.handlesAConfig() })
                val kept = fling.code().filter { it.opcode == Opcode.IPUT }.map { it.reference() as FieldReference }
                    .filter { it.definingClass == container && it.type == "F" }
                assertEquals("$what: what onFling keeps", 1, kept.size)
                val velocity = "field ${kept.single()}"

                val handOffs = methods.flatMap { method ->
                    val code = method.code()
                    code.indices.mapNotNull { at ->
                        val called = code[at].reference() as? MethodReference
                        val floats = called?.takeIf { it.definingClass == container }?.parameterTypes?.indices
                            ?.filter { called.parameterTypes[it].toString() == "F" }.orEmpty()
                        if (floats.any { velocity in method.valuesReaching(at, code[at].argumentFor(called!!, it)) }) method.name to called!! else null
                    }
                }
                assertEquals("$what: what hands the fling on", listOf("onTouchEvent"), handOffs.map { it.first })
                val release = handOffs.single().second
                assertEquals("$what: the release's shape", listOf(event, "F", "J"), release.parameterTypes.map(CharSequence::toString))
                assertEquals(
                    "$what: what runs the release",
                    setOf("onTouchEvent", "onStopNestedScroll"),
                    methods.filter { m -> m.code().any { it.referenceText() == release.toString() } }.map { it.name }.toSet(),
                )

                val movers = methods.filter { m -> m.code().any { (it.reference() as? MethodReference)?.name == SET_POSITION } }
                assertEquals(
                    "$what: what moves the panels",
                    setOf(ON_SCROLL, "onNestedPreScroll", "onNestedScroll", release.name, "setPosition"),
                    movers.map { it.name }.toSet(),
                )
                assertEquals(
                    "$what: the reason each move is made with",
                    mapOf(
                        ON_SCROLL to listOf(setOf("\"$DRAG\"")),
                        "onNestedPreScroll" to listOf(setOf("\"$DRAG\"")),
                        "onNestedScroll" to listOf(setOf("\"$DRAG\"")),
                        release.name to listOf(setOf("\"$DRAG\"", "\"tap_partially_visible_panel\"")),
                        "setPosition" to emptyList(),
                    ),
                    movers.associate { it.name to it.reasonsMade(slot) },
                )
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    /**
     * The clamped target, then the hook: where the panels are, the reason read from the config into
     * the flag's register, the call with the target, the answer, a skip on 0 to the flag's read, and
     * otherwise the target and the flag set to 0 and a jump past the read.
     */
    private fun assertHeld(what: String, setter: MutableMethod, target: Int, flag: Int, reasonField: String) {
        val code = setter.code()
        val holds = code.indices.filter { code[it].referenceText() == HOLD }
        assertEquals("$what: asks", 1, holds.size)
        val hold = holds.single()
        val self = setter.implementation!!.registerCount - 2
        val configRegister = self + 1
        assertEquals("$what: the clamp", Opcode.INVOKE_DIRECT, code[hold - 9].opcode)
        assertEquals("$what: the clamp's answer", Opcode.MOVE_RESULT, code[hold - 8].opcode)
        assertEquals("$what: the target", target, (code[hold - 8] as OneRegisterInstruction).registerA)
        assertEquals("$what: where the panels are", "$container->$CLAMPED_POSITION()F", code[hold - 4].referenceText())
        assertEquals("$what: read on this", listOf(self), code[hold - 4].arguments())
        assertEquals("$what: its answer", Opcode.MOVE_RESULT, code[hold - 3].opcode)
        val current = (code[hold - 3] as OneRegisterInstruction).registerA
        assertEquals("$what: the config moved", Opcode.MOVE_OBJECT_FROM16, code[hold - 2].opcode)
        assertEquals("$what: the config moved into the flag's register", listOf(flag, configRegister), code[hold - 2].twoRegisters())
        assertEquals("$what: the reason read", Opcode.IGET_OBJECT, code[hold - 1].opcode)
        assertEquals("$what: the reason read", listOf(flag, flag), code[hold - 1].twoRegisters())
        assertEquals("$what: the reason's field", reasonField, code[hold - 1].referenceText())
        assertEquals("$what: the call", listOf(target, current, flag), code[hold].arguments())
        assertEquals("$what: the answer", Opcode.MOVE_RESULT, code[hold + 1].opcode)
        assertEquals("$what: the answer's register", current, (code[hold + 1] as OneRegisterInstruction).registerA)
        assertEquals("$what: the skip", Opcode.IF_EQZ, code[hold + 2].opcode)
        assertEquals("$what: the skip's register", current, (code[hold + 2] as OneRegisterInstruction).registerA)
        assertEquals("$what: the skip lands on the flag's read", hold + 6, setter.targetOf(hold + 2))
        for ((offset, register) in listOf(3 to target, 4 to flag)) {
            assertEquals("$what: a 0 into v$register", Opcode.CONST_16, code[hold + offset].opcode)
            assertEquals("$what: a 0 into v$register", register, (code[hold + offset] as OneRegisterInstruction).registerA)
            assertEquals("$what: a 0 into v$register", 0, (code[hold + offset] as NarrowLiteralInstruction).narrowLiteral)
        }
        assertEquals("$what: the jump past the read", Opcode.GOTO, code[hold + 5].opcode)
        assertEquals("$what: the jump past the read", hold + 7, setter.targetOf(hold + 5))
        assertEquals("$what: the flag's read", Opcode.IGET_BOOLEAN, code[hold + 6].opcode)
        assertEquals("$what: the flag's read", listOf(flag, configRegister), code[hold + 6].twoRegisters())
        assertTrue("$what: the borrowed register fits an invoke", current <= 15)
        assertTrue("$what: the borrowed register is neither the target nor the flag", current != target && current != flag)
        assertNotEquals("$what: the flag isn't the target", target, flag)
        assertFalse("$what: a jump lands inside the hook", (hold - 6..hold + 5).any { it in setter.jumpTargets() })
    }

    private fun BytecodePatchContext.stop() = stopSwipeToCreate(findSwipeToCreate())

    private fun BytecodePatchContext.setter(): MutableMethod =
        mutableClassDefBy(container).methods.single { it.name == SET_POSITION }

    // ---- stand-ins shaped like Instagram 449's -------------------------------------------------

    /**
     * The container, whose move copies the config's reason, reads and clamps its target, reads its
     * animate flag and then moves the spring, animated or at rest; its private read of where the
     * panels are; and its drag handler, which makes a config with "swipe" as its reason. The
     * config's constructor stores that parameter, which comes after a long, in its reason field.
     */
    private fun classes(
        containerType: String = container,
        configType: String = config,
        setterName: String = SET_POSITION,
        clampedName: String = CLAMPED_POSITION,
        clampedPrivate: Boolean = true,
        scrollName: String = ON_SCROLL,
        drags: Int = 1,
        makes: Int = 1,
        dragHandedOver: Boolean = true,
        stores: Int = 1,
        runs: Int = 1,
        jumpIntoRun: Boolean = false,
        thisReplaced: Boolean = false,
        configReplaced: Boolean = false,
        busyLocals: Boolean = false,
        flagIntoConfig: Boolean = false,
    ): List<ClassDef> {
        val run = """
            iget v0, p1, $config->target:F
            invoke-direct { p0, v0 }, $container->clamp(F)F
            move-result v0
            iget-boolean ${if (flagIntoConfig) "p1" else "v3"}, p1, $config->animate:Z
        """
        val setter = method(containerType, setterName, listOf(config), "V", 4, private = true, body = """
            ${if (jumpIntoRun) "if-eqz p1, :flag" else ""}
            iget-object v0, p1, $config->reason:Ljava/lang/String;
            iput-object v0, p0, $container->lastReason:Ljava/lang/String;
            ${if (thisReplaced) "move-object p0, p1" else ""}
            ${if (configReplaced) "const/4 p1, 0x0" else ""}
            ${if (runs == 0) "iget v0, p1, $config->target:F\nmove v3, v0" else run.replace("iget-boolean", if (jumpIntoRun) ":flag\niget-boolean" else "iget-boolean")}
            ${if (runs > 1) run else ""}
            ${if (busyLocals) "invoke-static { v1, v2 }, $spring->use(II)V" else ""}
            invoke-direct { p0 }, $container->getSpring()$spring
            move-result-object v2
            float-to-double v0, v0
            if-eqz v3, :rest
            invoke-virtual { v2, v0, v1 }, $spring->animateTo(D)V
            :done
            return-void
            :rest
            invoke-virtual { v2, v0, v1 }, $spring->setAtRest(D)V
            goto :done
        """)
        val clamped = method(containerType, clampedName, emptyList(), "F", 1, private = clampedPrivate, body = """
            const/4 v0, 0x0
            return v0
        """)
        val clamp = method(containerType, "clamp", listOf("F"), "F", 0, private = true, body = "return p1")
        val getSpring = method(containerType, "getSpring", emptyList(), spring, 1, private = true, body = """
            const/4 v0, 0x0
            return-object v0
        """)
        val make = """
            new-instance v0, $config
            const/4 v1, 0x0
            const-wide/16 v2, 0x0
            ${if (dragHandedOver) "" else "const/4 v4, 0x0"}
            const/4 v5, 0x0
            const/4 v6, 0x0
            invoke-direct/range { v0 .. v6 }, $makeConfig
        """
        val scroll = method(containerType, scrollName, listOf(event, event, "F", "F"), "Z", 8, body = """
            ${(0 until drags).joinToString("\n") { "const-string v4, \"$DRAG\"" }}
            ${(0 until makes).joinToString("\n") { make }}
            invoke-direct { p0, v0 }, $container->$setterName($config)V
            const/4 v0, 0x1
            return v0
        """)
        val containerClass = classDef(
            containerType, listOf(setter, clamped, clamp, getSpring, scroll),
            fields = listOf("lastReason" to "Ljava/lang/String;"),
        )
        val construct = method(configType, "<init>", listOf("Ljava/lang/Object;", "J", "Ljava/lang/String;", "F", "Z"), "V", 0, body = """
            invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
            iput p5, p0, $config->target:F
            iput-boolean p6, p0, $config->animate:Z
            ${(0 until stores).joinToString("\n") { if (it == 0) "iput-object p4, p0, $config->reason:Ljava/lang/String;" else "iput-object p4, p0, $config->other:Ljava/lang/String;" }}
            return-void
        """)
        val configClass = classDef(
            configType, listOf(construct),
            fields = listOf("target" to "F", "animate" to "Z", "reason" to "Ljava/lang/String;", "other" to "Ljava/lang/String;"),
        )
        return listOf(containerClass, configClass)
    }

    private fun method(
        owner: String,
        name: String,
        parameters: List<String>,
        returns: String,
        registers: Int,
        private: Boolean = false,
        body: String,
    ): Method {
        var flags = if (private) AccessFlags.PRIVATE.value else AccessFlags.PUBLIC.value
        if (name == "<init>") flags = flags or AccessFlags.CONSTRUCTOR.value
        val total = registers + 1 + parameters.sumOf { if (it == "J" || it == "D") 2L else 1L }.toInt()
        val mutable = MutableMethod(
            ImmutableMethod(
                owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returns, flags, null, null,
                ImmutableMethodImplementation(total, emptyList(), null, null),
            ),
        )
        mutable.addInstructionsWithLabels(0, body.trimIndent())
        return ImmutableMethod.of(mutable)
    }

    private fun classDef(type: String, methods: List<Method>, fields: List<Pair<String, String>> = emptyList()): ClassDef =
        ImmutableClassDef(
            type, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Ljava/lang/Object;", null, null, null,
            fields.map { (name, fieldType) -> ImmutableField(type, name, fieldType, AccessFlags.PUBLIC.value, null, null, null) },
            methods,
        )

    private fun MutableMethod.jumpTargets(): Set<Int> =
        implementation!!.instructions.filterIsInstance<BuilderOffsetInstruction>().map { it.target.location.index }.toSet()

    private fun MutableMethod.targetOf(index: Int): Int =
        (implementation!!.instructions[index] as BuilderOffsetInstruction).target.location.index

    /** The index of the parameter this constructor stores in [field]. */
    private fun Method.parameterStoredIn(field: String): Int {
        val stores = code().filter { it.opcode == Opcode.IPUT_OBJECT && it.referenceText() == field }
        assertEquals("$definingClass's stores to $field", 1, stores.size)
        val register = (stores.single() as TwoRegisterInstruction).registerA
        var at = implementation!!.registerCount - parameterTypes.sumOf { it.toString().width() }
        parameterTypes.forEachIndexed { index, type ->
            if (at == register) return index
            at += type.toString().width()
        }
        error("$field is stored from v$register, which isn't a parameter")
    }

    /** For each config this method makes, every value that can reach the constructor's parameter [slot]. */
    private fun Method.reasonsMade(slot: Int): List<Set<String>> {
        val code = code()
        return code.indices.filter { code[it].referenceText()?.startsWith("$config-><init>") == true }
            .map { at -> valuesReaching(at, code[at].argumentFor(code[at].reference() as MethodReference, slot)) }
    }

    /** The register an invoke hands [called]'s parameter [index] in, past `this` on an instance call. */
    private fun Instruction.argumentFor(called: MethodReference, index: Int): Int {
        val self = if (opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE) 0 else 1
        return arguments()[self + called.parameterTypes.take(index).sumOf { it.toString().width() }]
    }

    /** Whether this makes a config or hands one to a method. */
    private fun Instruction.handlesAConfig(): Boolean {
        val called = reference() as? MethodReference ?: return false
        return called.definingClass == config || called.parameterTypes.any { it.toString() == config }
    }

    private fun String.width(): Int = if (this == "J" || this == "D") 2 else 1

    /**
     * What [register] can hold as the instruction at [index] runs, walking back along every path to
     * what last wrote it: a loaded string in quotes, a field read as `field <reference>`, a move
     * followed to its source, `entry` for what it held as the method began, and anything else by
     * its opcode. A handler is reached from an instruction that threw before writing anything.
     */
    private fun Method.valuesReaching(index: Int, register: Int): Set<String> {
        val flow = ControlFlow.of(this)
        val code = flow.instructions
        val normalIn = Array(code.size) { mutableListOf<Int>() }
        val thrownIn = Array(code.size) { mutableListOf<Int>() }
        flow.normal.forEachIndexed { from, to -> to.forEach { normalIn[it] += from } }
        flow.exceptional.forEachIndexed { from, to -> to.forEach { thrownIn[it] += from } }
        val values = sortedSetOf<String>()
        val seen = BitSet()
        val pending = ArrayDeque(listOf(index))
        while (pending.isNotEmpty()) {
            val at = pending.removeFirst()
            if (seen[at]) continue
            seen.set(at)
            if (at == 0) values += "entry"
            for (from in normalIn[at]) {
                val instruction = code[from]
                val written = (instruction as? OneRegisterInstruction)?.registerA
                val writes = instruction.opcode.setsRegister() && written != null &&
                    (written == register || (instruction.opcode.setsWideRegister() && written + 1 == register))
                if (writes) values += valueWritten(from, instruction) else pending += from
            }
            pending += thrownIn[at]
        }
        return values
    }

    private fun Method.valueWritten(at: Int, instruction: Instruction): Set<String> = when (instruction.opcode) {
        Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO -> setOf("\"${((instruction.reference()) as StringReference).string}\"")
        Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16, Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16 ->
            valuesReaching(at, (instruction as TwoRegisterInstruction).registerB)
        Opcode.IGET, Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN, Opcode.SGET, Opcode.SGET_OBJECT -> setOf("field ${instruction.referenceText()}")
        else -> setOf(instruction.opcode.name)
    }

    private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Method.key(): String = name + parameterTypes.joinToString(prefix = "(", postfix = ")")

    private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference

    private fun Instruction.referenceText(): String? = reference()?.toString()

    private fun Instruction.twoRegisters(): List<Int> = (this as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) }

    private fun Instruction.arguments(): List<Int> = when (this) {
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        else -> emptyList()
    }

    /** An instruction as text: its opcode, registers, literal and reference, enough to see a change. */
    private fun Instruction.describe(): String = buildString {
        append(opcode.name)
        if (this@describe is OneRegisterInstruction) append(" v$registerA")
        if (this@describe is TwoRegisterInstruction) append(" v$registerB")
        append(arguments().joinToString(prefix = " {", postfix = "}") { "v$it" })
        if (this@describe is NarrowLiteralInstruction) append(" #$narrowLiteral")
        referenceText()?.let { append(" $it") }
    }
}
