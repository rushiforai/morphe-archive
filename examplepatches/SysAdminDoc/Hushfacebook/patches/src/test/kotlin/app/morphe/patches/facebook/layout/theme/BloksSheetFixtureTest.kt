/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Issue #37's account switcher sheet on each declared build: one Bloks sheet container, a
 * FrameLayout built from two ColorData, whose background builder and corner view constructors each
 * hand their colour parameter to the extension first thing, on the parameter's own register.
 */
class BloksSheetFixtureTest {
    private val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()

    private fun bundles(version: String) = Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }

    private val cornerViewParameters = listOf("Landroid/content/Context;", "[F", "F", "I")

    private fun Method.parameterNames() = parameterTypes.map(CharSequence::toString)

    /** The register `p[parameter]` names, for a method whose parameters are all one register wide. */
    private fun Method.parameterRegister(parameter: Int) = implementation!!.registerCount - (parameterTypes.size + 1) + parameter

    private fun assertHooked(name: String, method: Method, parameter: Int) {
        val body = method.implementation!!.instructions.toList()
        val register = method.parameterRegister(parameter)
        assertEquals("$name: ${method.definingClass}->${method.name} calls the extension first", SHEET_BACKGROUND, (body[0] as ReferenceInstruction).reference.toString())
        assertEquals("$name: on p$parameter", register, (body[0] as RegisterRangeInstruction).startRegister)
        assertEquals("$name: then reads it back", Opcode.MOVE_RESULT, body[1].opcode)
        assertEquals("$name: into the same register", register, (body[1] as OneRegisterInstruction).registerA)
    }

    @Test
    fun `the Bloks sheet's background and corner views send their colour to the extension`() {
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in bundles(version)) {
                val name = bundle.name
                val classes = mutableListOf<ClassDef>()
                FixtureDex.forEach(bundle) { dex ->
                    for (classDef in dex.classes) {
                        val cornerView = classDef.methods.any { it.name == "<init>" && it.parameterNames() == cornerViewParameters }
                        if (cornerView || isBloksSheetContainer(classDef)) classes += ImmutableClassDef.of(classDef)
                    }
                }
                val containers = classes.filter(::isBloksSheetContainer)
                assertEquals("$name: one Bloks sheet container (${containers.map { it.type }})", 1, containers.size)
                val container = containers.single()
                val builder = sheetBackgroundBuilder(container)
                val corners = sheetCornerViews(container)
                assertTrue("$name: the container builds a corner view", corners.isNotEmpty())

                val context = PatchContexts.of(classes)
                assertEquals("$name: the builder and each corner view", 1 + corners.size, with(context) { hookBloksSheetBackground() })
                val hooked = context.mutableClassDefBy(container.type).methods.single { it.name == builder.name && it.parameterNames() == listOf("I") }
                assertHooked(name, hooked, 1)
                for (corner in corners) {
                    val constructor = context.mutableClassDefBy(corner.definingClass).methods
                        .single { it.name == "<init>" && it.parameterNames() == cornerViewParameters }
                    assertHooked(name, constructor, cornerViewParameters.size)
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
