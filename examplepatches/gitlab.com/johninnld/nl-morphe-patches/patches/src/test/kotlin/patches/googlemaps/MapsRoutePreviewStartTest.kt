package org.ungoogled.patches.maps.car

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.HiddenApiRestriction
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableAnnotation
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock
import com.android.tools.smali.dexlib2.immutable.debug.ImmutableDebugItem
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31i
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Assume.assumeNotNull
import org.junit.Test

class MapsRoutePreviewStartTest {
    private val ids = MAPS_ROUTE_PREVIEW_START_IDS
    private val wide = 0x7f0b0906
    private val narrow = 0x7f0b0909

    /** A stand-in for Maps' car footer builder: one `a()` returning a view tree that mentions the given ids. */
    private fun footer(vararg literals: Int, returns: String = "Lbhjq;", name: String = "a"): ClassDef {
        val instructions = literals.mapIndexed { index, literal ->
            ImmutableInstruction31i(Opcode.CONST, index % 8, literal) as ImmutableInstruction
        } + ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)
        val method = ImmutableMethod(
            "Lsnl;", name, emptyList<ImmutableMethodParameter>(), returns, AccessFlags.PUBLIC.value,
            emptySet<ImmutableAnnotation>(), emptySet<HiddenApiRestriction>(),
            ImmutableMethodImplementation(8, instructions, emptyList<ImmutableTryBlock>(), emptyList<ImmutableDebugItem>()),
        )
        return ImmutableClassDef(
            "Lsnl;", AccessFlags.PUBLIC.value, "Lbhgs;", emptyList<String>(), null,
            emptyList<ImmutableAnnotation>(), emptyList<ImmutableField>(), listOf(method),
        )
    }

    @Test fun theNamesAreTheExtensionsOwnListInTheSameOrder() {
        val source = generateSequence(File(System.getProperty("user.dir")).absoluteFile) { it.parentFile }
            .map { File(it, "extensions/maps-gearslip/src/main/java/patches/maps/gearslip/NativeRoutePreview.java") }
            .first { it.isFile }.readText()
        val list = Regex("START_NAMES\\s*=\\s*\\{(.*?)\\}", RegexOption.DOT_MATCHES_ALL).find(source)!!.groupValues[1]
        val names = Regex("\"([a-z0-9_]+)\"").findAll(list).map { it.groupValues[1] }.toList()
        assertTrue("The extension lists the Start views", names.isNotEmpty())
        assertEquals("One list of names: the patch only adds each name's id", names, ids.keys.toList())
    }

    @Test fun aFooterThatStillBuildsEveryStartViewIsAccepted() {
        validateMapsRoutePreviewStart({ footer(wide, narrow, 0x7f0b0907, 0x7f0b0ad6) })
        validateMapsRoutePreviewStart({ footer(narrow, wide) })
    }

    @Test fun aFooterThatNoLongerUsesAStartIdIsRefusedByName() {
        val error = assertThrows(IllegalStateException::class.java) { validateMapsRoutePreviewStart({ footer(wide, 0x7f0b0907) }) }
        assertTrue(error.message, error.message!!.endsWith("place_details_navigation_footer_spinner_or_action_icon"))
        val other = assertThrows(IllegalStateException::class.java) { validateMapsRoutePreviewStart({ footer(narrow) }) }
        assertTrue(other.message, other.message!!.endsWith("place_details_navigation_footer_action_button"))
    }

    @Test fun aMissingOrDifferentlyShapedBuilderIsRefused() {
        assertThrows(IllegalStateException::class.java) { validateMapsRoutePreviewStart({ footer(wide, narrow, name = "b") }) }
        assertThrows(IllegalStateException::class.java) { validateMapsRoutePreviewStart({ footer(wide, narrow, returns = "Landroid/view/View;") }) }
    }

    @Test fun anEmptyListOfStartViewsIsRefusedHonestly() {
        // Until a Start view is identified the patch must say so, not pass a check with nothing to check.
        val error = assertThrows(IllegalStateException::class.java) { validateMapsRoutePreviewStart({ footer(wide, narrow) }, emptyMap()) }
        assertTrue(error.message, error.message!!.contains("not identified"))
    }

    @Test fun theRealMapsFooterBuilderUsesEveryStartIdAndRefusesAnIdItDoesNotUse() {
        val path = System.getenv("MAPS_CAR_ORIGINAL_APK"); assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.forApi(29))
        val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.associateBy { it.type }
        validateMapsRoutePreviewStart({ classes.getValue(it) })
        assertThrows(IllegalStateException::class.java) {
            validateMapsRoutePreviewStart({ classes.getValue(it) }, mapOf("place_details_navigation_footer_action_button" to 0x7f0bffff))
        }
    }
}
