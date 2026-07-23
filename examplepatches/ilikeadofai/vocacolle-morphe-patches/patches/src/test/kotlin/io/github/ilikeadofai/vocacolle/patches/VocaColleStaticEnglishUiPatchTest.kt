package io.github.ilikeadofai.vocacolle.patches

import app.morphe.patcher.patch.ApkFileType
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

class VocaColleStaticEnglishUiPatchTest {
    @Test
    fun `declares one default-enabled English UI patch for VocaColle 7_40_0`() {
        val patch = vocacolleEnglishUiPatch

        assertEquals("English UI", patch.name)
        assertTrue(patch.default)
        assertEquals(
            setOf(
                vocacolleStaticEnglishUiPatch,
                vocacolleHardcodedKoreanUiPatch,
                vocacolleServerUiKoreanPatch
            ),
            patch.dependencies
        )

        val compatibility = assertNotNull(patch.compatibility).single()
        assertEquals("jp.nicovideo.nicobox", compatibility.packageName)
        assertEquals(ApkFileType.APK, compatibility.apkFileType)
        assertEquals(listOf("7.40.0"), compatibility.targets.map { it.version })
    }
}
