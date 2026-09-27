/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.settings

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.facebook.misc.extension.FACEBOOK_APPLICATION
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.util.zip.ZipFile
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Assume.assumeTrue
import org.junit.Test

/**
 * Meta's Facebook builds for Android 9 and 8 keep all but their startup code in a compressed
 * archive the patcher can't read. The settings patch, which every feature patch waits on, says so
 * before it changes anything, instead of stopping on the first method it can't find.
 */
class CompressedBuildTest {
    private val application = SettingsPatchHosts.appAndMainTab().single { it.type == FACEBOOK_APPLICATION }
    private val mainTab = SettingsPatchHosts.appAndMainTab().single { it.type == MAIN_TAB_ACTIVITY }

    /** What the settings patch says of [classes], or null when it goes through. */
    private fun refusal(classes: List<ClassDef>): String? = try {
        settingsPatch.execute(PatchContexts.of(classes))
        null
    } catch (refused: PatchException) {
        refused.message
    }

    private fun assertNamesTheCompressedBuild(message: String?) {
        assertNotNull("the patch went on", message)
        for (says in listOf("FbMainTabActivity", "Android 9 or older", "compressed archive",
                "assets/secondary-program-dex-jars/store-0.dex.spo", "(arm64-v8a) (Android 11+)")) {
            assertTrue("\"$says\" is missing from: $message", message!!.contains(says))
        }
        assertFalse(message, message!!.contains("declares onCreate"))
    }

    @Test
    fun `a build with the application and no main tab activity is refused before anything changes`() {
        val context = PatchContexts.of(listOf(application))
        val message = try {
            settingsPatch.execute(context)
            null
        } catch (refused: PatchException) {
            refused.message
        }
        assertNamesTheCompressedBuild(message)
        val onCreate = context.mutableClassDefBy(FACEBOOK_APPLICATION).methods.single { it.name == "onCreate" }
        assertEquals("the application's onCreate changed before the refusal", 1, onCreate.implementation!!.instructions.count())
    }

    /** A main tab activity the dex names but whose code isn't there counts as missing too. */
    @Test
    fun `a main tab activity with no code in the dex is refused the same way`() {
        val empty = ImmutableClassDef(
            MAIN_TAB_ACTIVITY, AccessFlags.PUBLIC.value, "Landroid/app/Activity;", null, null, null, null,
            mainTab.methods.map {
                ImmutableMethod(it.definingClass, it.name, it.parameters, it.returnType,
                    AccessFlags.PUBLIC.value or AccessFlags.NATIVE.value, null, null, null)
            },
        )
        assertNamesTheCompressedBuild(refusal(listOf(application, empty)))
    }

    /** The control: the build the stand-ins model goes through, and so does a readable main tab. */
    @Test
    fun `a build whose main tab activity is there goes through`() {
        assertNull(refusal(SettingsPatchHosts.all()))
        assertNull(compressedCodeRefusal(true, mainTab))
        // Without FacebookApplication it isn't this build at all, and the other checks name what's missing.
        assertNull(compressedCodeRefusal(false, null))
    }

    /**
     * Facebook 580.0.0.51.74 for Android 9, when the fixture folder has it: its readable dex holds
     * the application and not the main tab activity, the rest is in the Superpack archive, and the
     * refusal is what the settings patch says of it. Skips without that file, since it's no build
     * the bundle declares.
     */
    @Test
    fun `Facebook's own Android 9 build gets this refusal`() {
        val builds = Fixtures.files { it.isFile }.filter { it.name.endsWith("-minapi28.apk") }
        assumeTrue("no Facebook build for Android 9 in the fixture folder", builds.isNotEmpty())
        for (apk in builds) {
            ZipFile(apk).use { zip ->
                assertNotNull("${apk.name} has no Superpack archive",
                    zip.getEntry("assets/secondary-program-dex-jars/store-0.dex.spo"))
            }
            val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
            val found = mutableMapOf<String, ClassDef>()
            for (entry in container.dexEntryNames) {
                for (classDef in container.getEntry(entry)!!.dexFile.classes) {
                    if (classDef.type == FACEBOOK_APPLICATION || classDef.type == MAIN_TAB_ACTIVITY) {
                        found.putIfAbsent(classDef.type, classDef)
                    }
                }
            }
            if (FACEBOOK_APPLICATION !in found) fail("${apk.name}: no FacebookApplication in its readable dex")
            assertNamesTheCompressedBuild(compressedCodeRefusal(true, found[MAIN_TAB_ACTIVITY]))
        }
    }
}
