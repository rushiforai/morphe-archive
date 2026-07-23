package io.github.ilikeadofai.vocacolle.patches

import app.morphe.patcher.patch.ApkFileType
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

class VocaColleMorpheSettingsPatchTest {
    @Test
    fun `declares a default-enabled native Morphe settings patch for VocaColle 7_40_0`() {
        val patch = vocacolleMorpheSettingsPatch

        assertEquals("VocaColle Morphe settings", patch.name)
        assertTrue(patch.default)

        val compatibility = assertNotNull(patch.compatibility).single()
        assertEquals("jp.nicovideo.nicobox", compatibility.packageName)
        assertEquals(ApkFileType.APK, compatibility.apkFileType)
        assertEquals(listOf("7.40.0"), compatibility.targets.map { it.version })
    }

    @Test
    fun `targets only the AppInfo UI version literal`() {
        assertEquals(
            "Ljp/nicovideo/nicobox/ui/setting/appinfo/AppInfoFragment;",
            appInfoVersionFingerprint.definingClass
        )
        assertEquals("h2", appInfoVersionFingerprint.name)
        assertEquals(listOf("7.40.0"), appInfoVersionFingerprint.strings)
    }

    @Test
    fun `fingerprints the exact 7_40_0 application lifecycle before injecting locale apply`() {
        assertEquals(
            "Ljp/nicovideo/nicobox/ui/NicoboxApplication;",
            applicationOnCreateFingerprint.definingClass
        )
        assertEquals("onCreate", applicationOnCreateFingerprint.name)
        assertEquals("V", applicationOnCreateFingerprint.returnType)
        assertEquals(emptyList(), applicationOnCreateFingerprint.parameters)
        assertNotNull(applicationOnCreateFingerprint.custom)
    }

    @Test
    fun `fingerprints the native Compose settings screen for Morphe row injection`() {
        assertEquals("Llj/j0;", settingScreenFingerprint.definingClass)
        assertEquals("c", settingScreenFingerprint.name)
        assertEquals("V", settingScreenFingerprint.returnType)
        assertNotNull(settingScreenFingerprint.custom)
    }

}
