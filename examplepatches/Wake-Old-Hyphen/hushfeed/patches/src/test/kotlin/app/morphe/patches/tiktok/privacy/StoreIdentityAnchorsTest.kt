package app.morphe.patches.tiktok.privacy

import app.morphe.Fixtures
import app.morphe.takes
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * What "Look like the store app" rests on, held to each declared TikTok build.
 *
 * TikTok reads its own signing certificate through one cached self-package wrapper, and the patch
 * answers from the head of it. The wrapper carries an obfuscated name that moved between builds, so
 * the fingerprint matches on shape. This pins that the shape still finds exactly one method and that
 * the method has a local register for the entry hook's result.
 */
class StoreIdentityAnchorsTest {
    @Test
    fun `the self-package wrapper resolves to one method with a local on each build`() {
        Fixtures.forEachDeclared { apk ->
            val version = Fixtures.versionOf(apk)
            val matches = mutableListOf<Method>()
            val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
            container.dexEntryNames.forEach { entry ->
                container.getEntry(entry)!!.dexFile.classes.forEach { classDef ->
                    classDef.methods.forEach { method ->
                        if (SelfPackageInfoCacheFingerprint.takes(method, classDef)) matches += method
                    }
                }
            }

            assertEquals("$version: self-package wrappers matched", 1, matches.size)
            val wrapper = matches.single()
            val body = wrapper.implementation ?: error("$version: the wrapper has no body")
            val locals = body.registerCount - wrapper.parameterTypes.sumOf {
                if (it == "J" || it == "D") 2 else 1
            }
            assertTrue("$version: the wrapper has no local for the hook's result (locals=$locals)", locals >= 1)
        }
    }
}
