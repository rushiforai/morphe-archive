/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.theme

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.w3c.dom.Element
import javax.xml.parsers.DocumentBuilderFactory

class PureBlackTest {
    private val palette = "Lfixture/Palette;"
    private val extension = "Lapp/hushgram/extension/instagram/settings/Colors;"

    /**
     * A background Prism's black fills goes to the stock pure black; the light theme's text, a gray
     * sheet and another color stay.
     */
    @Test
    fun theStylesGetPureBlack() {
        val styles = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
            """
                <resources>
                    <style name="IgdsPrismGrayOverridesDark" parent="IgdsPrismSemanticColorsDark">
                        <item name="igds_color_primary_background">@color/igds_prism_black</item>
                        <item name="status_bar_background">@color/igds_prism_black</item>
                        <item name="igds_color_elevated_background">@color/igds_prism_gray_1500</item>
                    </style>
                    <style name="IgdsPrismSemanticColorsLight">
                        <item name="igds_color_primary_text">@color/igds_prism_black</item>
                        <item name="igds_color_media_background">@color/igds_prism_black</item>
                    </style>
                    <style name="IgdsSemanticColorsLight">
                        <item name="igds_color_primary_background">@color/bds_white</item>
                        <item name="igds_color_form_field_background_focussed_color">@color/igds_prism_black</item>
                    </style>
                </resources>
            """.trimIndent().byteInputStream(),
        )

        assertEquals(listOf("IgdsPrismGrayOverridesDark", "IgdsPrismSemanticColorsLight"), blackenStyles(styles))

        val items = styles.getElementsByTagName("item").let { list ->
            (0 until list.length).map { list.item(it) as Element }.map { it.getAttribute("name") to it.textContent }
        }
        assertEquals(
            listOf(
                "igds_color_primary_background" to PURE_BLACK_COLOR,
                "status_bar_background" to PURE_BLACK_COLOR,
                "igds_color_elevated_background" to "@color/igds_prism_gray_1500",
                "igds_color_primary_text" to PRISM_BLACK_COLOR,
                "igds_color_media_background" to PURE_BLACK_COLOR,
                "igds_color_primary_background" to "@color/bds_white",
                "igds_color_form_field_background_focussed_color" to PRISM_BLACK_COLOR,
            ),
            items,
        )
        assertEquals("a second pass finds nothing", emptyList<String>(), blackenStyles(styles))
    }

    /** Both literal forms go pure black on their own registers; other colors and the extension's own stay. */
    @Test
    fun theLiteralsGetPureBlack() {
        val patch = PatchContexts.of(listOf(
            classDef(palette, """
                const v0, 0xff0c1014
                const-wide v2, 0xff0c1014L
                const v4, 0xff25292e
                const-wide v2, 0xff25292eL
                return-void
            """),
            classDef(extension, """
                const v0, 0xff0c1014
                return-void
            """),
        ))

        assertEquals(listOf("$palette->colors"), patch.blackenLiterals())

        val code = patch.code(palette)
        assertEquals(Opcode.CONST, code[0].opcode)
        assertEquals(0, (code[0] as OneRegisterInstruction).registerA)
        assertEquals(PURE_BLACK.toInt(), (code[0] as WideLiteralInstruction).wideLiteral.toInt())
        assertEquals(Opcode.CONST_WIDE, code[1].opcode)
        assertEquals(2, (code[1] as OneRegisterInstruction).registerA)
        assertEquals(PURE_BLACK, (code[1] as WideLiteralInstruction).wideLiteral)
        assertEquals(0xff25292e.toInt(), (code[2] as WideLiteralInstruction).wideLiteral.toInt())
        assertEquals(0xff25292eL, (code[3] as WideLiteralInstruction).wideLiteral)
        assertTrue("the extension's own color", patch.code(extension).any(::isPrismBlack))
    }

    /** In each declared build, no Instagram method loads Prism's black any more, and the Compose palette was among them. */
    @Test
    fun eachDeclaredBuildLosesPrismBlack() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
                val classes = mutableListOf<ClassDef>()
                FixtureDex.forEach(bundle) { dex ->
                    for (classDef in dex.classes) {
                        if (classDef.methods.any { it.implementation?.instructions?.any(::isPrismBlack) == true }) {
                            classes += ImmutableClassDef.of(classDef)
                        }
                    }
                }
                val patch = PatchContexts.of(classes)

                val changed = patch.blackenLiterals()

                assertTrue("${bundle.name}: the Compose palette", changed.any { it.startsWith("$COMPOSE_PALETTE->") })
                for (classDef in classes) {
                    assertTrue("${bundle.name}: ${classDef.type}", patch.classDefBy(classDef.type).methods.none { method ->
                        method.implementation?.instructions?.any(::isPrismBlack) == true
                    })
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private fun app.morphe.patcher.patch.BytecodePatchContext.code(type: String): List<Instruction> =
        classDefBy(type).methods.single().implementation!!.instructions.toList()

    private fun classDef(type: String, body: String): ClassDef {
        val mutable = MutableMethod(
            ImmutableMethod(
                type, "colors", emptyList(), "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
                ImmutableMethodImplementation(6, emptyList(), null, null),
            ),
        )
        mutable.addInstructionsWithLabels(0, body.trimIndent())
        val method: Method = ImmutableMethod.of(mutable)
        return ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, emptyList(), listOf(method))
    }
}
