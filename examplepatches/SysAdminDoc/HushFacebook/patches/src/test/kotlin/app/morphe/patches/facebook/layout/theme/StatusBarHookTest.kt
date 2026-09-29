/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.parameterRegisterNumber
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

private const val GET_CONTEXT = "Landroid/view/Window;->getContext()Landroid/content/Context;"

private fun Instruction.calls(method: String) = (this as? ReferenceInstruction)?.reference?.toString() == method

private val COPIES = setOf(
    Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16, Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16,
)

/**
 * Throws unless [method] starts with the status bar hook and then runs [original], its own body,
 * unchanged: the colour parameter goes through [target] (AmoledTheme.statusBar unless named) with
 * what [darkCheck] answers for the window's context, and the answer is back in the colour parameter
 * before the method's first instruction reads it. Each value is traced to the instruction that
 * wrote it, so the test holds for any choice of scratch registers. The navigation bar's painter
 * takes the same hook on its second and third parameters, [windowParameter] and [colourParameter],
 * and [hooks] are the calls of which exactly one is there.
 */
internal fun assertStatusBarHook(
    label: String,
    method: Method,
    darkCheck: String,
    original: List<Instruction>,
    target: String = STATUS_BAR,
    windowParameter: Int = 0,
    colourParameter: Int = 1,
    hooks: Set<String> = setOf(STATUS_BAR, STATUS_BAR_YOU),
) {
    val body = method.implementation!!.instructions.toList()
    val window = method.parameterRegisterNumber(windowParameter)
    val colour = method.parameterRegisterNumber(colourParameter)

    /** The instruction before [at] that last wrote [register]. The hook runs straight through. */
    fun writer(register: Int, at: Int): Int = (at - 1 downTo 0).firstOrNull {
        body[it].opcode.setsRegister() && (body[it] as? OneRegisterInstruction)?.registerA == register
    } ?: -1

    /** True when [register] holds parameter [parameter] at [at]: it is that register, or a copy of it. */
    fun holds(register: Int, parameter: Int, at: Int): Boolean {
        if (register == parameter && writer(register, at) < 0) return true
        val copy = body.getOrNull(writer(register, at)) ?: return false
        return copy.opcode in COPIES && (copy as TwoRegisterInstruction).registerB == parameter
    }

    val call = body.indexOfFirst { it.calls(target) }
    assertTrue("$label: nothing calls $target", call >= 0)
    assertEquals("$label: the colour goes through more than one bar hook", 1,
        body.count { instruction -> hooks.any { instruction.calls(it) } })
    assertEquals("$label: the hook is all in front of the method's own code", body.size - original.size, call + 2)
    assertEquals("$label: the method's own code changed",
        original.map { it.opcode }, body.drop(call + 2).map { it.opcode })

    val answer = body[call + 1]
    assertEquals("$label: the answer isn't taken", Opcode.MOVE_RESULT, answer.opcode)
    assertEquals("$label: the answer doesn't go back into the colour", colour, (answer as OneRegisterInstruction).registerA)

    val arguments = body[call] as FiveRegisterInstruction
    assertTrue("$label: statusBar doesn't get the colour", holds(arguments.registerC, colour, call))

    val dark = writer(arguments.registerD, call)
    assertTrue("$label: statusBar's second argument isn't the dark check's answer",
        dark > 0 && body[dark].opcode == Opcode.MOVE_RESULT && body[dark - 1].calls(darkCheck))
    val context = writer((body[dark - 1] as FiveRegisterInstruction).registerC, dark - 1)
    assertTrue("$label: the dark check doesn't get the window's context",
        context > 0 && body[context].opcode == Opcode.MOVE_RESULT_OBJECT && body[context - 1].calls(GET_CONTEXT) &&
            holds((body[context - 1] as FiveRegisterInstruction).registerC, window, context - 1))
}

/**
 * The status bar half of the AMOLED theme without a Facebook build: which method of StatusBarUtil
 * takes the hook, what the hook does to the colour it paints, and every shape that stops the patch
 * instead of hooking the wrong method or none. The navigation bar's painter takes the same hook.
 */
class StatusBarHookTest {
    private val darkCheck = "Lfixture/Resolver;->dark(Landroid/content/Context;)Z"

    /** Reads the window's colour cache, then paints the colour in parameter 1. */
    private val paints = """
        sget-object v0, $STATUS_BAR_UTIL->colours:Ljava/util/WeakHashMap;
        invoke-virtual/range { p0 .. p1 }, $SET_STATUS_BAR_COLOR
        return-void
    """

    /** Sets the bar's light or dark icons and paints nothing. */
    private val iconsOnly = """
        invoke-virtual/range { p0 .. p0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
        return-void
    """

    private fun method(
        name: String,
        registers: Int,
        smali: String,
        parameters: List<String> = listOf("Landroid/view/Window;", "I"),
        static: Boolean = true,
        owner: String = STATUS_BAR_UTIL,
    ): Method = MutableMethod(
        ImmutableMethod(
            owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, "V",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or (if (static) AccessFlags.STATIC.value else 0),
            null, null, ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, smali) }.let(ImmutableMethod::of)

    private fun statusBarUtil(vararg methods: Method, type: String = STATUS_BAR_UTIL) =
        ImmutableClassDef(type, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Ljava/lang/Object;",
            null, null, null, null, methods.toList())

    /** Runs the hook over [methods] and answers each method's body afterwards, by name. */
    private fun hook(vararg methods: Method): Map<String, Method> {
        val context = PatchContexts.of(listOf(statusBarUtil(*methods)))
        with(context) { hookStatusBarColour(darkCheck) }
        return context.mutableClassDefBy(STATUS_BAR_UTIL).methods.associateBy { it.name }
    }

    private fun Method.body() = implementation!!.instructions.toList()

    @Test
    fun `the painter takes the hook first thing and paints what the extension answers`() {
        val painter = method("paint", 13, paints)
        val icons = method("icons", 5, iconsOnly)
        val hooked = hook(icons, painter)

        assertStatusBarHook("paint", hooked.getValue("paint"), darkCheck, painter.body())
        assertEquals("the method that paints nothing is left alone",
            icons.body().map { it.opcode }, hooked.getValue("icons").body().map { it.opcode })
    }

    /** `invoke-static` names its registers in four bits; parameters past v15 are copied down first. */
    @Test
    fun `a painter whose parameters sit above v15 still takes it`() {
        val painter = method("paint", 20, paints)
        assertStatusBarHook("paint", hook(painter).getValue("paint"), darkCheck, painter.body())
    }

    @Test
    fun `a second painter stops the patch`() {
        val refused = assertThrows(PatchException::class.java) {
            hook(method("paint", 13, paints), method("paintAgain", 13, paints))
        }
        assertTrue(refused.message, refused.message.orEmpty().contains("2 static (Window, int) methods"))
    }

    /** Negative controls: the painter moved to an instance method, or takes a boxed colour. */
    @Test
    fun `a painter of another shape stops the patch`() {
        for (painter in listOf(
            method("paint", 13, paints, static = false),
            method("paint", 13, paints, parameters = listOf("Landroid/view/Window;", "Ljava/lang/Integer;")),
            method("paint", 13, iconsOnly),
        )) {
            val refused = assertThrows(PatchException::class.java) { hook(painter) }
            assertTrue(refused.message, refused.message.orEmpty().contains("0 static (Window, int) methods"))
        }
    }

    /** Material You without AMOLED in the build: its own hook, the same shape, first thing in the painter. */
    @Test
    fun `Material You hooks the painter itself when AMOLED isn't in the build`() {
        val painter = method("paint", 13, paints)
        val context = PatchContexts.of(listOf(statusBarUtil(painter, method("icons", 5, iconsOnly))))
        with(context) { hookMaterialYouStatusBar(darkCheck) }
        val hooked = context.mutableClassDefBy(STATUS_BAR_UTIL).methods.associateBy { it.name }

        assertStatusBarHook("paint", hooked.getValue("paint"), darkCheck, painter.body(), STATUS_BAR_YOU)
        assertEquals("the method that paints nothing is left alone", 2, hooked.getValue("icons").body().size)
    }

    /**
     * With AMOLED in the build its hook is already first in the painter. Material You's goes in its
     * place, reading the same registers, and runs AMOLED's rule itself, so the colour goes through
     * one hook in AMOLED-then-Material You order.
     */
    @Test
    fun `Material You takes over AMOLED's call when AMOLED went first`() {
        for (registers in listOf(13, 20)) {
            val painter = method("paint", registers, paints)
            val context = PatchContexts.of(listOf(statusBarUtil(painter)))
            with(context) { hookStatusBarColour(darkCheck) }
            val amoled = context.mutableClassDefBy(STATUS_BAR_UTIL).methods.single().body()
            with(context) { hookMaterialYouStatusBar(darkCheck) }
            val hooked = context.mutableClassDefBy(STATUS_BAR_UTIL).methods.single()

            assertStatusBarHook("paint in $registers", hooked, darkCheck, painter.body(), STATUS_BAR_YOU)
            val call = amoled.indexOfFirst { it.calls(STATUS_BAR) }
            assertEquals("only AMOLED's call changed", amoled.filterIndexed { index, _ -> index != call }.map { it.opcode },
                hooked.body().filterIndexed { index, _ -> index != call }.map { it.opcode })
            val before = amoled[call] as FiveRegisterInstruction
            val after = hooked.body()[call] as FiveRegisterInstruction
            assertEquals("the call reads other registers", listOf(before.registerC, before.registerD),
                listOf(after.registerC, after.registerD))
        }
    }

    @Test
    fun `a painter with one local stops the patch and keeps its body`() {
        val context = PatchContexts.of(listOf(statusBarUtil(method("paint", 3, paints))))
        val refused = assertThrows(PatchException::class.java) { with(context) { hookStatusBarColour(darkCheck) } }
        assertTrue(refused.message, refused.message.orEmpty().contains("has 1 local register(s), needs 2"))
        assertEquals("nothing went in", 3, context.mutableClassDefBy(STATUS_BAR_UTIL).methods.single().body().size)
    }

    private val navigationBarUtil = "Lfixture/NavigationBarUtil;"
    private val navigationParameters = listOf("Landroid/app/Activity;", "Landroid/view/Window;", "I")
    private val navigationHooks = setOf(NAVIGATION_BAR, NAVIGATION_BAR_YOU)

    /** Paints the navigation bar with the colour in parameter 2, as SystemNavigationBarUtil's painter does. */
    private val paintsNavigation = """
        invoke-virtual/range { p1 .. p2 }, Landroid/view/Window;->setNavigationBarColor(I)V
        return-void
    """

    @Before
    @After
    fun forgetMatches() {
        NavigationBarPainterFingerprint.clearMatch()
    }

    private fun navigationPainter(registers: Int, name: String = "paint") =
        method(name, registers, paintsNavigation, navigationParameters, owner = navigationBarUtil)

    /** Runs [hooks] over the navigation bar's util holding [methods] and answers the painter's body afterwards. */
    private fun hookNavigation(vararg methods: Method, hooks: BytecodePatchContext.() -> Unit): Method {
        val context = PatchContexts.of(listOf(statusBarUtil(*methods, type = navigationBarUtil)))
        context.hooks()
        return context.mutableClassDefBy(navigationBarUtil).methods.single { it.name == "paint" }
    }

    /** The navigation bar's painter takes the same hook, on its window and colour: its second and third parameters. */
    @Test
    fun `the navigation bar's painter takes the hook first thing and paints what the extension answers`() {
        for (registers in listOf(6, 20)) {
            forgetMatches()
            val painter = navigationPainter(registers)
            val hooked = hookNavigation(painter) { hookNavigationBarColour(darkCheck) }
            assertStatusBarHook("paint in $registers", hooked, darkCheck, painter.body(), NAVIGATION_BAR, 1, 2, navigationHooks)
        }
    }

    /** Material You's navigation bar hook: in place of AMOLED's call when AMOLED went first, its own without. */
    @Test
    fun `Material You takes over AMOLED's navigation bar call, or hooks the painter itself`() {
        for (amoled in listOf(false, true)) {
            forgetMatches()
            val painter = navigationPainter(6)
            val hooked = hookNavigation(painter) {
                if (amoled) hookNavigationBarColour(darkCheck)
                hookMaterialYouNavigationBar(darkCheck)
            }
            assertStatusBarHook("after AMOLED: $amoled", hooked, darkCheck, painter.body(), NAVIGATION_BAR_YOU, 1, 2, navigationHooks)
        }
    }

    @Test
    fun `a second navigation bar painter stops the patch`() {
        val refused = assertThrows(PatchException::class.java) {
            hookNavigation(navigationPainter(6), navigationPainter(6, "paintAgain")) { hookNavigationBarColour(darkCheck) }
        }
        assertTrue(refused.message, refused.message.orEmpty().contains("2 static (Activity, Window, int) methods"))
    }
}
