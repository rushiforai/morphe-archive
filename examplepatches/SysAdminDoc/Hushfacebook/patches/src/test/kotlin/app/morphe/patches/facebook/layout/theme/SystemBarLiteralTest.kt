/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Test

/**
 * Route three and the system bars. Facebook's Video tab keeps a dark surface in light mode too, and
 * writes its bars' #252728 into code: the colour it paints the status bar with, puts in the tab's
 * SystemBarsController config and paints the navigation bar with, in both themes. The painters'
 * hooks know which theme is on, route three doesn't, so a colour a method hands to a system bar
 * stays as Facebook wrote it and the painter's hook decides. Any other dark literal is still
 * rewritten.
 */
class SystemBarLiteralTest {
    private val window = "Landroid/view/Window;"
    private val navigationBarUtil = "Lfixture/NavigationBarUtil;"
    private val config = "Lfixture/SystemBarsConfig;"
    private val videoTab = "Lfixture/VideoTab;"

    /** The Video tab's bar colour, #252728, as a signed int. */
    private val videoGrey = -0xdad8d8
    private val black = -0x1000000

    private val statusPainter = "$STATUS_BAR_UTIL->paint(${window}I)V"
    private val navigationPainter = "$navigationBarUtil->paint(Landroid/app/Activity;${window}I)V"
    private val navigationForward = "$navigationBarUtil->forward(${window}I)V"

    @Before
    @After
    fun forgetMatches() {
        NavigationBarPainterFingerprint.clearMatch()
    }

    private fun method(owner: String, name: String, parameters: List<String>, returnType: String, smali: String): Method =
        MutableMethod(
            ImmutableMethod(
                owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returnType,
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value,
                null, null, ImmutableMethodImplementation(4, emptyList(), null, null),
            ),
        ).apply { addInstructionsWithLabels(0, smali) }.let(ImmutableMethod::of)

    private fun classDef(type: String, vararg methods: Method, fields: List<ImmutableField> = emptyList()): ClassDef =
        ImmutableClassDef(type, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Ljava/lang/Object;",
            null, null, null, fields, methods.toList())

    /** StatusBarUtil, SystemBarsController, the navigation bar's util, the Video tab and the extension's fields. */
    private fun app(): BytecodePatchContext = PatchContexts.of(listOf(
        classDef(STATUS_BAR_UTIL, method(STATUS_BAR_UTIL, "paint", listOf(window, "I"), "V", """
            invoke-virtual { p0, p1 }, $SET_STATUS_BAR_COLOR
            return-void
        """)),
        classDef(SYSTEM_BARS_CONTROLLER, method(SYSTEM_BARS_CONTROLLER, "apply", listOf(window, config), "V", """
            const/4 v0, 0x0
            invoke-static { p0, v0 }, $statusPainter
            return-void
        """)),
        classDef(navigationBarUtil,
            method(navigationBarUtil, "paint", listOf("Landroid/app/Activity;", window, "I"), "V", """
                invoke-virtual { p1, p2 }, Landroid/view/Window;->setNavigationBarColor(I)V
                return-void
            """),
            method(navigationBarUtil, "forward", listOf(window, "I"), "V", """
                const/4 v0, 0x0
                invoke-static { v0, p0, p1 }, $navigationPainter
                return-void
            """),
        ),
        classDef(videoTab,
            method(videoTab, "statusBar", listOf(window), "V", """
                const v0, $videoGrey
                invoke-static { p0, v0 }, $statusPainter
                return-void
            """),
            method(videoTab, "navigationBar", listOf(window), "V", """
                const v0, $videoGrey
                invoke-static { p0, v0 }, $navigationForward
                return-void
            """),
            method(videoTab, "config", emptyList(), config, """
                new-instance v0, $config
                const v1, $videoGrey
                invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                return-object v0
            """),
            method(videoTab, "card", emptyList(), "I", """
                const v0, $videoGrey
                return v0
            """),
        ),
        classDef(MATERIAL_YOU, fields = SURFACE_FIELDS.values.map {
            ImmutableField(MATERIAL_YOU, it, "I", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, null)
        }),
    ))

    /** What the first colour instruction of the Video tab's [name] writes: a `const`'s value, or the field it reads. */
    private fun BytecodePatchContext.written(name: String): String {
        val first = mutableClassDefBy(videoTab).methods.single { it.name == name }.implementation!!.instructions
            .first { it.opcode == Opcode.CONST || it.opcode == Opcode.SGET }
        return if (first.opcode == Opcode.CONST) {
            "const %08X".format((first as NarrowLiteralInstruction).narrowLiteral)
        } else {
            "read ${(first as ReferenceInstruction).reference}"
        }
    }

    private val facebooks = "const FF252728"
    private val bars = listOf("statusBar", "navigationBar", "config")

    @Test
    fun `AMOLED's route three leaves the colours a method hands to a system bar`() {
        val app = app()
        assertEquals("literals rewritten", 1, with(app) { blackenColourLiterals() })
        for (bar in bars) assertEquals(bar, facebooks, app.written(bar))
        assertEquals("the control", "const FF000000", app.written("card"))
    }

    @Test
    fun `Material You's route three leaves the colours a method hands to a system bar`() {
        val app = app()
        assertEquals("literals read from the extension", 1, with(app) { readSurfaceLiterals() })
        for (bar in bars) assertEquals(bar, facebooks, app.written(bar))
        assertEquals("the control", "read $MATERIAL_YOU->DARK_252728:I", app.written("card"))
    }

    @Test
    fun `with both themes in the build the bar colours still reach the painters as Facebook wrote them`() {
        val app = app()
        with(app) {
            blackenColourLiterals()
            readSurfaceLiterals()
        }
        for (bar in bars) assertEquals(bar, facebooks, app.written(bar))
        assertEquals("the control", "const FF000000", app.written("card"))
    }
}
