package app.morphe.patches.tiktok.misc.optimizer

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class OptimizerMethodContractsTest {
    @Test
    fun `Fresco selectors follow parameter shape across obfuscation`() {
        assertTrue(method("LIZJ", listOf("I", "Lcom/example/OldContext;", "Z"), "Lcom/example/OldFrame;").isIndexedFrameLookup())
        assertTrue(method("LIZLLL", listOf("I", "Lcom/example/NewContext;", "Z"), "Lcom/example/NewFrame;").isIndexedFrameLookup())
        assertTrue(method("LJ", listOf("Lcom/example/OldContext;", "Z"), "Lcom/example/OldFrame;").isDirectFrameLookup())
        assertTrue(method("LIZ", listOf("Lcom/example/NewContext;", "Z"), "Lcom/example/NewFrame;").isDirectFrameLookup())

        assertFalse(method("LIZJ", emptyList(), "Lcom/example/Frame;").isIndexedFrameLookup())
        assertFalse(method("LJ", listOf("Lcom/example/Context;", "Z"), "V").isDirectFrameLookup())
        assertTrue(method("LJ", listOf("Lcom/example/Context;", "Z"), "V").isRemovedDirectFrameLookup())
    }

    @Test
    fun `only reviewed splash service shapes are accepted`() {
        assertTrue(isReviewedSplashGateShape(listOf(4, 30, 4)))
        assertTrue(isReviewedSplashGateShape(listOf(4, 4)))
        assertFalse(isReviewedSplashGateShape(listOf(4, 30)))
        assertFalse(isReviewedSplashGateShape(listOf(4, 4, 30, 3)))
    }

    @Test
    fun `Fresco profile requires all behavior seen in one reviewed fixture`() {
        assertTrue(isReviewedFrescoProfile(42, 22, null))
        assertTrue(isReviewedFrescoProfile(66, 30, null))
        assertTrue(isReviewedFrescoProfile(66, null, 72))
        assertFalse(isReviewedFrescoProfile(66, null, null))
        assertFalse(isReviewedFrescoProfile(66, 22, 72))
    }

    private fun method(name: String, parameters: List<String>, returnType: String) = ImmutableMethod(
        "Lcom/facebook/fresco/animation/bitmap/cache/FrescoFrameCache;",
        name,
        parameters.map { ImmutableMethodParameter(it, null, null) },
        returnType,
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or AccessFlags.DECLARED_SYNCHRONIZED.value,
        null,
        null,
        null,
    )
}
