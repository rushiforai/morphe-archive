package dev.jason.gboardpatches.patches.gboard.features.englishqwerty

import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardEnglishQwertyPointerPatchSourceTest {
    @Test
    fun pointerPatchUsesTargetOwnerAndCleanupBindings() {
        val source = readSource()

        assertTrue(source.contains("findMutableMethodOrThrow(GboardVersionBindings.pointerOwner)"))
        assertTrue(source.contains("findMutableMethodOrThrow(GboardVersionBindings.pointerCancel)"))
        assertTrue(source.contains("findMutableMethodOrThrow(GboardVersionBindings.pointerReset)"))
        assertTrue(source.contains("name = \"r\""))
        assertTrue(source.contains("name = \"ac\""))
        assertTrue(PRE_RESET_INSERTION.containsMatchIn(source))
        assertTrue(source.contains("pointerOwnerMethod.addInstructions(rCallIndex, \"nop\")"))
        assertTrue(
            Regex("""ExternalLabel\(\s*\x22jasondev_continue_english_pointer_owner\x22""")
                .containsMatchIn(source)
        )
        assertTrue(
            source.contains(
                "cancelMethod.addInstructions(0, CLEAR_ENGLISH_POINTER_ANCHOR_DELEGATE)"
            )
        )
        assertFalse(source.contains("cancelMethod.returnInstructionIndices()"))
        assertTrue(source.contains("resetMethod.addInstructions(0, CLEAR_ENGLISH_POINTER_ANCHOR_DELEGATE)"))
    }

    @Test
    fun pointerOwnerAnchorsOnlyInitialPatchedEnglishMetadataAndExactSlideUp() {
        val source = readSource()

        assertTrue(source.contains("name = \"jasondevShouldSuppressEnglishRetarget\""))
        assertTrue(source.contains("returnType = \"Z\""))
        assertTrue(source.contains("iget-object v1, p0, Lpbl;->m:"))
        assertTrue(source.contains("if-nez v1, :cond_return_false"))
        assertTrue(source.contains("GboardEnglishUppercaseToggleRuntime;"))
        assertTrue(source.contains("->isPatchedMetadata(Ljava/lang/Object;)Z"))
        assertTrue(source.contains("Lpbl;->jasondevEnglishAnchorKey:"))
        assertTrue(source.contains("Lpbl;->i()Loth;"))
        assertTrue(source.contains("Lpbl;->h(FFLoth;)Loth;"))
        assertTrue(source.contains("sget-object v3, Loth;->c:Loth;"))
        assertTrue(source.contains("Lowd;->h(Loth;)Lotk;"))
        assertFalse(source.contains("Lnxi;"))
        assertFalse(source.contains("Loaa;"))
    }

    @Test
    fun pointerSuppressionRunsBeforeTargetResetWhileTopRowStaysPostReset() {
        val source = readSource()
        val injection = source.substring(
            source.indexOf("private fun injectEnglishPointerOwner"),
            source.indexOf("private fun injectEnglishPointerCleanup")
        )

        assertTrue(injection.contains("rCallIndex < acCallIndex"))
        assertTrue(PRE_RESET_INSERTION.containsMatchIn(injection))
        assertFalse(injection.contains("topRowDelegateCallIndex"))

        val englishDelegate = tripleQuotedValue(
            source,
            "ENGLISH_POINTER_OWNER_PRE_RESET_DELEGATE"
        )
        assertTrue(englishDelegate.contains("jasondevShouldSuppressEnglishRetarget"))
        assertTrue(englishDelegate.contains("move-result v4"))
        assertTrue(englishDelegate.contains("if-eqz v4, :jasondev_continue_english_pointer_owner"))
        assertTrue(englishDelegate.contains("return-void"))
        assertFalse(englishDelegate.contains(":cond_continue_english_pointer_owner"))
        assertFalse(
            Regex("""(?m)^\s*:jasondev_continue_english_pointer_owner\s*$""")
                .containsMatchIn(englishDelegate)
        )

        val patchedTargetFixture = """
            move/from16 v0, p2
            move/from16 v1, p3
            iget-object v3, p0, Lpbl;->m:Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;
            $englishDelegate
            invoke-virtual {p0, v11, v12, v13}, Lpbl;->r(JI)V
            invoke-direct {p0}, Lpbl;->ac()V
            invoke-static {p0, p1, v3, v0, v1}, Ldev/jason/gboardpatches/extension/toprowswipe/GboardTopRowSwipeRuntime;->maybeArmAndResolveTopRowOwner(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;FF)Ljava/lang/Object;
        """.trimIndent()
        val englishIndex = patchedTargetFixture.indexOf("jasondevShouldSuppressEnglishRetarget")
        val finishIndex = patchedTargetFixture.indexOf("Lpbl;->r(JI)V")
        val resetIndex = patchedTargetFixture.indexOf("Lpbl;->ac()V")
        val topRowIndex = patchedTargetFixture.indexOf("maybeArmAndResolveTopRowOwner")

        assertTrue(englishIndex >= 0)
        assertTrue(englishIndex < finishIndex)
        assertTrue(finishIndex < resetIndex)
        assertTrue(resetIndex < topRowIndex)
    }

    private fun readSource(): String {
        val path = Path.of(
            "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/englishqwerty/" +
                "GboardEnglishQwertyPointerPatch.kt"
        )
        assertTrue("missing English pointer patch", Files.exists(path))
        return Files.readString(path).replace("\r\n", "\n")
    }

    private fun tripleQuotedValue(source: String, name: String): String =
        Regex(
            "(?:private|internal) val $name = " + "\"\"\"" + "(.*?)" + "\"\"\"",
            setOf(RegexOption.DOT_MATCHES_ALL)
        ).find(source)?.groupValues?.get(1) ?: error("$name body not found")

    private companion object {
        val PRE_RESET_INSERTION = Regex(
            """pointerOwnerMethod\.addInstructionsWithLabels\(\s*""" +
                """rCallIndex,\s*ENGLISH_POINTER_OWNER_PRE_RESET_DELEGATE,\s*""" +
                """ExternalLabel\(\s*\x22jasondev_continue_english_pointer_owner\x22"""
        )
    }
}
