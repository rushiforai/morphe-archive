package io.github.ilikeadofai.vocacolle.patches

import app.morphe.patcher.patch.ApkFileType
import java.nio.file.Path
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertTrue

class VocaColleServerUiKoreanPatchTest {
    @Test
    fun `keeps the native server UI implementation hidden as a dependency`() {
        val patch = vocacolleServerUiKoreanPatch

        assertNull(patch.name)
        assertTrue(patch.default)

        val compatibility = assertNotNull(patch.compatibility).single()
        assertEquals("jp.nicovideo.nicobox", compatibility.packageName)
        assertEquals(ApkFileType.APK, compatibility.apkFileType)
        assertEquals(listOf("7.40.0"), compatibility.targets.map { it.version })
    }

    @Test
    fun `replaces return instructions so branch targets cannot bypass translation`() {
        val patchSource = Path.of(
            "src/main/kotlin/io/github/ilikeadofai/vocacolle/patches/" +
                "VocaColleServerUiKoreanPatch.kt",
        ).toFile().readText()
        assertContains(patchSource, "replaceInstruction(")
        assertContains(patchSource, "addInstructions(")
        assertContains(patchSource, "index + 1")
        assertContains(patchSource, "return-object v\$register")
        assertContains(patchSource, "UiLanguageTranslator;")
        assertFalse(patchSource.contains("addInstructions(index"))
    }
}
