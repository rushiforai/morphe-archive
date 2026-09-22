package app.morphe.patches.tiktok.feedfilter

import app.morphe.Fixtures
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** The series playlist bar is suppressed at its own availability predicate. */
class PlaylistBottomBarFixturesTest {
    @Test
    fun `playlist bar availability remains unique and guardable on every retained fixture`() {
        for (apk in Fixtures.apks()) {
            val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
            val matches = container.dexEntryNames.flatMap { entry ->
                container.getEntry(entry)!!.dexFile.classes.filter { classDef ->
                    classDef.type.endsWith("/InteractPlayListBottomBarAssem;")
                }.flatMap { classDef ->
                    classDef.methods.filter { method ->
                        method.returnType == "Z" && method.parameterTypes.map(CharSequence::toString) ==
                            listOf("Lcom/ss/android/ugc/aweme/feed/model/VideoItemParams;") &&
                            !AccessFlags.STATIC.isSet(method.accessFlags) && method.implementation != null
                    }
                }
            }
            assertEquals("${apk.name}: playlist bar availability predicate", 1, matches.size)
            assertTrue(
                "${apk.name}: playlist predicate needs one local for the setting guard",
                matches.single().implementation!!.registerCount >= 3,
            )
        }
    }
}
