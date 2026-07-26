package dev.jason.gboardpatches.patches.gboard.features.zhuyintraditionalsimplifiedtoggle

import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardZhuyinTraditionalSimplifiedTogglePatchShapeTest {
    @Test
    fun `softkey and dispatch use exact generated 1777 descriptors`() {
        assertEquals(
            "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;",
            GboardVersionBindings.softKeyBind.classType
        )
        assertEquals("q", GboardVersionBindings.softKeyBind.name)
        assertEquals(listOf("Lowd;", "J"), GboardVersionBindings.softKeyBind.parameterTypes)
        assertEquals("Z", GboardVersionBindings.softKeyBind.returnType)
        assertEquals("Lpbj;", GboardVersionBindings.gestureDispatch.classType)
        assertEquals("f", GboardVersionBindings.gestureDispatch.name)
        assertEquals(
            listOf("Lpbl;", "Loth;", "Loud;", "Lowd;", "J", "Z", "Z", "I", "Z", "J", "I"),
            GboardVersionBindings.gestureDispatch.parameterTypes
        )
    }

    @Test
    fun `softkey delegates copy incoming metadata and track the bound view`() {
        val source = readSource(
            "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                "zhuyintraditionalsimplifiedtoggle/" +
                "GboardZhuyinTraditionalSimplifiedToggleSoftKeyPatch.kt"
        )

        assertTrue(source.contains("patchIncomingSoftKeyMetadata"))
        assertTrue(source.contains("afterSoftKeyBound"))
        assertTrue(source.contains("mutableMethod.addInstructions(0,"))
        assertTrue(source.contains("val returnIndices = mutableMethod.returnInstructionIndices()"))
        assertTrue(source.contains("check(returnIndices.isNotEmpty())"))
        assertTrue(Regex("""returnIndices\s*\.asReversed\(\)""").containsMatchIn(source))
        assertTrue(ZHUYIN_TOGGLE_PATCH_INCOMING_METADATA_DELEGATE.contains("move-result-object p1"))
        assertTrue(ZHUYIN_TOGGLE_PATCH_INCOMING_METADATA_DELEGATE.contains("check-cast p1, Lowd;"))
        assertTrue(source.contains("dependsOn(gboardPatchesExtensionCarrierPatch)"))
    }

    @Test
    fun `shared pbj helper tries toggle before exact stock delegate`() {
        val source = readRuntimePatchSource()
        val helperStart = source.indexOf("internal val TARGET_GESTURE_DISPATCH_OR_TOGGLE_BODY")
        val helperEnd = source.indexOf("context(context: BytecodePatchContext)", helperStart)
        assertTrue(helperStart >= 0 && helperEnd > helperStart)
        val helper = source.substring(helperStart, helperEnd)

        val toggle = helper.indexOf("maybeToggle(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z")
        val stock = helper.indexOf("Lpbh;->o(Lpbl;Loth;Loud;Lowd;JZZIZJI)V")
        assertTrue(toggle >= 0)
        assertTrue(stock > toggle)
        assertTrue(helper.contains("if-nez v0, :cond_return"))
        assertTrue(helper.contains("iget-object p0, p0, Lpbj;->o:Lpbh;"))
        assertFalse(helper.contains("Lofi;"))
        assertFalse(helper.contains("Lofk;Lnxi;Lnyf;Loaa;"))
    }

    @Test
    fun `popup patches exact 1777 action before stock and has no old z path`() {
        val source = readRuntimePatchSource()

        assertTrue(source.contains("name = \"b\""))
        assertTrue(source.contains("returnType = \"Loud;\""))
        assertTrue(source.contains("\"Lotk;\""))
        assertTrue(source.contains("patchPopupAction"))
        assertTrue(source.contains("move-result-object p5"))
        assertTrue(source.contains("check-cast p5, Lotk;"))
        assertTrue(source.contains("dependsOn(gboardPatchesExtensionCarrierPatch)"))
        assertFalse(source.contains("SoftKeyboardView;->z"))
        assertFalse(source.contains("name = \"z\""))
        assertFalse(source.contains("jasondevPatchTogglePopupMetadata"))
    }

    @Test
    fun `toggle production sources contain no legacy 17010 descriptors or ids`() {
        val combined = readSource(
            "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                "zhuyintraditionalsimplifiedtoggle/" +
                "GboardZhuyinTraditionalSimplifiedToggleSoftKeyPatch.kt"
        ) + readRuntimePatchSource() + readSource(
            "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/toprowswipe/" +
                "GboardTopRowSwipeGesturePatch.kt"
        )

        listOf(
            "Loaa;", "Loql;", "Lnzv;", "Lnxj;", "Lnxi;", "Lnye;", "Lnxl;", "Lnyf;",
            "0x7f0b23fd", "0x7f140969", "Lofi;", "Lofk;"
        ).forEach { stale ->
            assertFalse("Found stale toggle token $stale", combined.contains(stale))
        }
        val legacyOwnerIdentifier = Regex("""\b[A-Za-z_][A-Za-z0-9_]*\b""")
            .findAll(combined)
            .map { match -> match.value }
            .firstOrNull { identifier -> identifier.contains("ofi", ignoreCase = true) }
        assertTrue(
            "Found active legacy owner identifier $legacyOwnerIdentifier",
            legacyOwnerIdentifier == null
        )
    }

    @Test
    fun `public patch keeps slide top row carrier and toggle composition`() {
        val registry = readSource(
            "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/registry/" +
                "GboardPatchRegistry.kt"
        )
        val patchStart = registry.indexOf("val gboardZhuyinQuickTraditionalSimplifiedTogglePatch")
        val patchEnd = registry.indexOf("val gboardCustomSymbolsPatch", patchStart)
        assertTrue(patchStart >= 0 && patchEnd > patchStart)
        val block = registry.substring(patchStart, patchEnd)

        assertTrue(block.contains("gboardZhuyinSlideInputPatch"))
        assertTrue(block.contains("gboardTopRowSwipeGesturePatch"))
        assertTrue(block.contains("gboardZhuyinTraditionalSimplifiedToggleSoftKeyPatch"))
        assertTrue(block.contains("gboardZhuyinTraditionalSimplifiedToggleRuntimePatch"))

        val topRow = readSource(
            "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/toprowswipe/" +
                "GboardTopRowSwipeGesturePatch.kt"
        )
        assertTrue(topRow.contains("maybeConsumeTopRowSwipe"))
        assertTrue(topRow.contains("maybeConsumeQuickJsTopRowPress"))
        assertTrue(topRow.contains("jasondevDispatchOrToggle"))
        assertTrue(
            topRow.indexOf("maybeConsumeTopRowSwipe") <
                topRow.indexOf("maybeConsumeQuickJsTopRowPress")
        )
        assertTrue(
            topRow.indexOf("maybeConsumeQuickJsTopRowPress") <
                topRow.indexOf("jasondevDispatchOrToggle")
        )
    }

    private fun readRuntimePatchSource(): String = readSource(
        "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
            "zhuyintraditionalsimplifiedtoggle/" +
            "GboardZhuyinTraditionalSimplifiedToggleRuntimePatch.kt"
    )

    private fun readSource(path: String): String =
        Files.readString(Path.of(path)).replace("\r\n", "\n")
}
