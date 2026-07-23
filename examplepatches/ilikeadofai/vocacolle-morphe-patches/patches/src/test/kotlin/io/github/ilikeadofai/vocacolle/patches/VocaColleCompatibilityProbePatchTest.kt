package io.github.ilikeadofai.vocacolle.patches

import app.morphe.patcher.patch.ApkFileType
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNotNull

class VocaColleCompatibilityProbePatchTest {
    @Test
    fun `declares an opt-in compatibility probe for VocaColle 7_40_0`() {
        val patch = vocacolleCompatibilityProbePatch

        assertEquals("VocaColle compatibility probe", patch.name)
        assertFalse(patch.default)

        val compatibility = assertNotNull(patch.compatibility).single()
        assertEquals("VocaColle", compatibility.name)
        assertEquals("jp.nicovideo.nicobox", compatibility.packageName)
        assertEquals(ApkFileType.APK, compatibility.apkFileType)
        assertEquals(listOf("7.40.0"), compatibility.targets.map { it.version })
    }
}