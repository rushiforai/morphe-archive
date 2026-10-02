/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.reels.cleanup

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.instagram.misc.extension.PURGE_MARKER
import app.morphe.patches.instagram.misc.extension.markers
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class CleanUpReelsHookTest {
    private val scope = "Lfixture/ComponentScope;"
    private val component = "Lfixture/Component;"

    /** The hooks the patch writes are in the ReelDeclutter the bundle ships, public and static. */
    @Test
    fun theHooksAreInTheExtension() {
        for (hook in listOf(HIDE_FOLLOW_BUTTON, HIDE_CHIPS, HIDE_SOCIAL_FOOTER, HIDE_SOCIAL_CONTEXT)) {
            val declared = ExtensionDex.classDef(hook.substringBefore("->")).methods
                .filter { AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }
                .map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
            assertTrue("$hook is not in the extension: $declared", hook.substringAfter("->") in declared)
        }
    }

    /** Each part's method asks its hook first; the Legacy Follow button of the suggested accounts' cards stays. */
    @Test
    fun eachPartAsksItsHookFirst() {
        val context = PatchContexts.of(classes())

        context.hideReelParts()

        REEL_PARTS.forEach { part ->
            val method = context.mutableClassDefBy(owner(part.marker)).methods.single()
            assertGuardFirst(part.marker, part, method)
        }
        val legacy = context.mutableClassDefBy(owner("ClipsFollowButtonComponentLegacy_render")).methods.single()
        assertEquals("the Legacy Follow button was touched", 3, legacy.instructions().size)
        assertBubblesGuarded("stand-in", context.mutableClassDefBy(BUBBLES).methods.single(), "$NO_BUBBLES->A00:$NO_BUBBLES")
        assertLineGuarded("stand-in", context.mutableClassDefBy(VIEW_UTIL).methods.single(), 4, "$LINE->type:$LINE_TYPE")
    }

    @Test
    fun aBubblesUseCaseWithoutItsOwnNoneStateFailsThePatch() {
        val context = PatchContexts.of(classes(noneOfItsOwn = false))
        val failure = assertThrows(PatchException::class.java) { context.hideReelParts() }
        assertTrue(failure.message!!, failure.message!!.contains(FLOATING_BUBBLES))
    }

    /** A check whose type names neither Followed by nor Liked by isn't the social context line's. */
    @Test
    fun aLineTypeNamingNeitherFailsThePatch() {
        val context = PatchContexts.of(classes(typeNames = listOf("FOLLOWER_COUNT")))
        val failure = assertThrows(PatchException::class.java) { context.hideReelParts() }
        assertTrue(failure.message!!, failure.message!!.contains("FOLLOWED_BY"))
    }

    /** The hook reads the line before the check runs, so the check must read the parameter itself. */
    @Test
    fun aCheckReadingAnotherLineFailsThePatch() {
        val context = PatchContexts.of(classes(overwritesLine = true))
        assertThrows(PatchException::class.java) { context.hideReelParts() }
    }

    @Test
    fun aMissingPartFailsThePatch() {
        val context = PatchContexts.of(classes(leaveOut = "ClipsMetaAiPillComponent_render"))
        val failure = assertThrows(PatchException::class.java) { context.hideReelParts() }
        assertTrue(failure.message!!, failure.message!!.contains("ClipsMetaAiPillComponent_render"))
    }

    @Test
    fun aMarkerInTwoMethodsFailsThePatch() {
        val copy = render("Lfixture/Copy;", "ClipsFollowButtonComponent_render")
        val context = PatchContexts.of(classes() + copy)
        assertThrows(PatchException::class.java) { context.hideReelParts() }
    }

    @Test
    fun aRenderOfAnotherShapeFailsThePatch() {
        val context = PatchContexts.of(classes(staticRender = "ClipsFriendlyViewerComponent_render"))
        assertThrows(PatchException::class.java) { context.hideReelParts() }
    }

    @Test
    fun aCheckThatIsNotABooleanFailsThePatch() {
        val context = PatchContexts.of(classes(checkReturns = "I"))
        assertThrows(PatchException::class.java) { context.hideReelParts() }
    }

    /**
     * In each declared build every part is one method of its shape, and each gets its hook first,
     * and so do the floating bubbles use case and the social context check.
     */
    @Test
    fun eachDeclaredBuildHidesEveryPart() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        val markers = CLEANUP_MARKERS.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
                val classes = mutableListOf<ClassDef>()
                FixtureDex.forEach(bundle) { dex ->
                    val holds = dex.stringSection.any { string ->
                        string.startsWith("android_purge_") && PURGE_MARKER.find(string)?.groupValues?.get(1) in markers
                    }
                    if (!holds) return@forEach
                    for (classDef in dex.classes) {
                        if (classDef.methods.any { method -> method.markers().any { it in markers } }) {
                            classes += ImmutableClassDef.of(classDef)
                        }
                    }
                }
                val check = classes.flatMap { it.methods }.single { SOCIAL_CONTEXT_CHECK in it.markers() }
                val typeRead = check.instructions().zipWithNext().single { (read, asked) ->
                    read.opcode == Opcode.IGET_OBJECT &&
                        ((asked as? ReferenceInstruction)?.reference as? MethodReference)?.name == "ordinal"
                }.first
                val typeField = (typeRead as ReferenceInstruction).reference as FieldReference
                classes += FixtureDex.classes(bundle, setOf(typeField.type)).values.map { ImmutableClassDef.of(it) }
                val context = PatchContexts.of(classes.distinctBy { it.type })

                context.hideReelParts()

                fun after(before: Method) = context.mutableClassDefBy(before.definingClass).methods.single {
                    it.name == before.name && it.parameterTypes.map(Any::toString) == before.parameterTypes.map(Any::toString)
                }
                REEL_PARTS.forEach { part ->
                    val before = classes.flatMap { it.methods }.single { part.marker in it.markers() }
                    val after = after(before)
                    assertEquals("${bundle.name}: ${part.marker} size", before.instructions().size + 5, after.instructions().size)
                    assertGuardFirst("${bundle.name}: ${part.marker}", part, after)
                }
                val bubbles = classes.flatMap { it.methods }.single { FLOATING_BUBBLES in it.markers() }
                val none = bubbles.instructions().zipWithNext().first { (read, answer) ->
                    read.opcode == Opcode.SGET_OBJECT && answer.opcode == Opcode.RETURN_OBJECT
                }.first
                assertEquals("${bundle.name}: bubbles size", bubbles.instructions().size + 5, after(bubbles).instructions().size)
                assertBubblesGuarded("${bundle.name}: bubbles", after(bubbles), (none as ReferenceInstruction).reference.toString())
                assertEquals("${bundle.name}: line check size", check.instructions().size + 7, after(check).instructions().size)
                assertLineGuarded("${bundle.name}: line check", after(check), (typeRead as TwoRegisterInstruction).registerB, typeField.toString())
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    /** The no-bubbles state answered first, when the hook says to hide, before the use case's own code. */
    private fun assertBubblesGuarded(what: String, method: Method, none: String) {
        val code = method.instructions()
        assertEquals(
            "$what: the guard's opcodes",
            listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.SGET_OBJECT, Opcode.RETURN_OBJECT),
            code.take(5).map { it.opcode },
        )
        assertEquals("$what: the hook called", HIDE_SOCIAL_FOOTER, (code[0] as ReferenceInstruction).reference.toString())
        assertEquals("$what: the state answered", none, (code[3] as ReferenceInstruction).reference.toString())
        val jump = code[2] as OffsetInstruction
        assertEquals("$what: the branch lands on the method's own code", code.subList(2, 5).sumOf { it.codeUnits }, jump.codeOffset)
    }

    /**
     * The line's type read off the parameter the check reads it from, handed to the hook before any
     * branch, and yes answered when the hook says so. The branch lands on the check's own first
     * instruction.
     */
    private fun assertLineGuarded(what: String, method: Method, line: Int, type: String) {
        val code = method.instructions()
        assertEquals(
            "$what: the guard's opcodes",
            listOf(
                Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC,
                Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN,
            ),
            code.take(7).map { it.opcode },
        )
        assertEquals("$what: the line moved in", line, (code[0] as TwoRegisterInstruction).registerB)
        assertEquals("$what: the type read", type, (code[1] as ReferenceInstruction).reference.toString())
        assertEquals("$what: the hook called", HIDE_SOCIAL_CONTEXT, (code[2] as ReferenceInstruction).reference.toString())
        val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        assertEquals("$what: the branch lands on the check's own code", addresses[7], addresses[4] + (code[4] as OffsetInstruction).codeOffset)
    }

    private fun assertGuardFirst(what: String, part: ReelPart, method: Method) {
        val code = method.instructions()
        val answer = if (part.check) Opcode.RETURN else Opcode.RETURN_OBJECT
        assertEquals(
            "$what: the guard's opcodes",
            listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, answer),
            code.take(5).map { it.opcode },
        )
        assertEquals("$what: the hook called", part.hook, (code[0] as ReferenceInstruction).reference.toString())
        val jump = code[2] as OffsetInstruction
        assertEquals("$what: the branch lands on the method's own code", code.subList(2, 5).sumOf { it.codeUnits }, jump.codeOffset)
    }

    private fun owner(marker: String) = "Lfixture/${marker.substringBefore('_')};"

    /**
     * Stand-ins shaped like Instagram 449's: a render per part and the Legacy Follow button's, each
     * the one method of its class loading its marker first, the bubbles check, a static method
     * taking three objects, the bubbles use case answering its no-bubbles state or another, and the
     * social context check asking its line's type for its ordinal.
     */
    private fun classes(
        leaveOut: String? = null,
        staticRender: String? = null,
        checkReturns: String = "Z",
        noneOfItsOwn: Boolean = true,
        typeNames: List<String> = listOf("FOLLOWED_BY", "LIKED_BY", "FOLLOWER_COUNT"),
        overwritesLine: Boolean = false,
    ): List<ClassDef> {
        val renders = (REEL_PARTS.filter { !it.check }.map { it.marker } + "ClipsFollowButtonComponentLegacy_render")
            .filter { it != leaveOut }
            .map { render(owner(it), it, static = it == staticRender) }
        val checks = REEL_PARTS.filter { it.check && it.marker != leaveOut }.map { check(owner(it.marker), it.marker, checkReturns) }
        val none = if (noneOfItsOwn) "$NO_BUBBLES->A00:$NO_BUBBLES" else "$BUBBLES->none:$NO_BUBBLES"
        val bubbles = classOf(
            BUBBLES, "Ljava/lang/Object;",
            method(
                BUBBLES, "A00", listOf("Lfixture/Item;"), BUBBLES_STATE, 3,
                """
                    const-string v0, "android_purge_26_q3_$FLOATING_BUBBLES"
                    if-eqz p1, :none
                    const/4 v0, 0x0
                    return-object v0
                    :none
                    sget-object v0, $none
                    return-object v0
                """,
                static = false,
            ),
        )
        val overwrite = if (overwritesLine) "move-object/from16 p2, p1" else ""
        val lineCheck = classOf(
            VIEW_UTIL, "Ljava/lang/Object;",
            method(
                VIEW_UTIL, "A06", listOf("Lfixture/Item;", LINE, "Ljava/lang/String;"), "Z", 6,
                """
                    const-string v0, "android_purge_26_q3_$SOCIAL_CONTEXT_CHECK"
                    $overwrite
                    iget-object v1, p2, $LINE->type:$LINE_TYPE
                    invoke-virtual { v1 }, Ljava/lang/Enum;->ordinal()I
                    move-result v0
                    if-eqz v0, :keep
                    const/4 v0, 0x1
                    return v0
                    :keep
                    const/4 v0, 0x0
                    return v0
                """,
                static = false,
            ),
        )
        val names = typeNames.joinToString("\n") { "const-string v0, \"$it\"" }
        val lineType = classOf(
            LINE_TYPE, "Ljava/lang/Enum;",
            method(LINE_TYPE, "<clinit>", emptyList(), "V", 1, "$names\nreturn-void", constructor = true),
        )
        val line = ImmutableClassDef(
            LINE, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Ljava/lang/Object;", null, null, null,
            listOf(ImmutableField(LINE, "type", LINE_TYPE, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, null)),
            null,
        )
        return renders + checks + bubbles + lineCheck + lineType + line
    }

    private fun method(
        type: String, name: String, parameters: List<String>, returns: String, registers: Int, body: String,
        static: Boolean = true, constructor: Boolean = false,
    ): Method {
        val flags = AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else AccessFlags.FINAL.value) or
            (if (constructor) AccessFlags.CONSTRUCTOR.value else 0)
        return ImmutableMethod.of(
            MutableMethod(
                ImmutableMethod(
                    type, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returns, flags, null, null,
                    ImmutableMethodImplementation(registers, emptyList(), null, null),
                ),
            ).apply { addInstructionsWithLabels(0, body.trimIndent()) },
        )
    }

    private fun classOf(type: String, superclass: String, vararg methods: Method): ClassDef = ImmutableClassDef(
        type, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, superclass, null, null, null, null, methods.toList(),
    )

    private fun render(type: String, marker: String, static: Boolean = false): ClassDef {
        val flags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or (if (static) AccessFlags.STATIC.value else 0)
        return ImmutableClassDef(
            type, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Lfixture/KComponent;", null, null, null, null,
            listOf(
                ImmutableMethod(
                    type, "A0m", listOf(ImmutableMethodParameter(scope, null, null)), component, flags, null, null,
                    ImmutableMethodImplementation(
                        3,
                        listOf(
                            ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference("android_purge_26_q3_$marker")),
                            ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                            ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
                        ),
                        null, null,
                    ),
                ),
            ),
        )
    }

    private fun check(type: String, marker: String, returns: String): ClassDef = ImmutableClassDef(
        type, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Ljava/lang/Object;", null, null, null, null,
        listOf(
            ImmutableMethod(
                type, "A01", listOf("Lfixture/A;", "Lfixture/B;", "Lfixture/C;").map { ImmutableMethodParameter(it, null, null) },
                returns, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value, null, null,
                ImmutableMethodImplementation(
                    5,
                    listOf(
                        ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference("android_purge_26_q3_$marker")),
                        ImmutableInstruction11n(Opcode.CONST_4, 0, 1),
                        ImmutableInstruction11x(Opcode.RETURN, 0),
                    ),
                    null, null,
                ),
            ),
        ),
    )

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private companion object {
        const val BUBBLES = "Lfixture/FloatingBubblesUseCase;"
        const val BUBBLES_STATE = "Lfixture/BubblesState;"
        const val NO_BUBBLES = "Lfixture/NoBubbles;"
        const val VIEW_UTIL = "Lfixture/MediaSocialContextViewUtil;"
        const val LINE = "Lfixture/SocialContext;"
        const val LINE_TYPE = "Lfixture/SocialContextType;"
    }
}
