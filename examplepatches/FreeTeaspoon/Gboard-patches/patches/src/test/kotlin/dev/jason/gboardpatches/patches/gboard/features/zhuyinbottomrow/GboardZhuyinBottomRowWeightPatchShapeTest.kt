package dev.jason.gboardpatches.patches.gboard.features.zhuyinbottomrow

import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardZhuyinBottomRowWeightPatchShapeTest {
    @Test
    fun `softkey patch uses exact 1803 shared bind descriptor`() {
        assertEquals(
            "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;->" +
                "r(Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;J)Z",
            GboardVersionBindings.softKeyBind.reference,
        )
    }

    @Test
    fun `softkey patch delegates after bind work to runtime helper`() {
        assertTrue(
            ZHUYIN_BOTTOM_ROW_AFTER_BIND_DELEGATE.contains(
                "invoke-static {p0}, $ZHUYIN_BOTTOM_ROW_RUNTIME_CLASS->afterSoftKeyBound(Ljava/lang/Object;)V"
            )
        )
    }

    @Test
    fun `softkey patch contributes only the after phase to the family composer`() {
        val source = String(
            Files.readAllBytes(
                Path.of(
                    "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/" +
                        "zhuyinbottomrow/GboardZhuyinBottomRowWeightSoftKeyPatch.kt"
                )
            ),
            StandardCharsets.UTF_8
        )

        assertTrue(source.contains("GboardSoftKeyFamilyFeature.ZHUYIN_BOTTOM_ROW"))
        assertTrue(source.contains("afterDelegate()"))
        assertFalse(source.contains("addInstructions"))
    }
}
