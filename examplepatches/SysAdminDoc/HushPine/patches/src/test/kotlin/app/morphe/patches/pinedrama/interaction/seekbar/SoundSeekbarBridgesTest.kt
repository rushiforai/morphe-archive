/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.interaction.seekbar

import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The patch finds each sound preview bridge in the extension's SoundSeekbar by name and signature
 * and fails the apply when one is missing (#185). This holds the extension's declarations to the
 * patch's list, so a renamed or retyped stub fails here rather than on a build.
 */
class SoundSeekbarBridgesTest {
    @Test
    fun `the extension declares every bridge the patch rewrites`() {
        val root = File("../extensions").takeIf { it.isDirectory } ?: File("extensions")
        val source = File(root, "pinedrama/src/main/java/app/morphe/extension/pinedrama/seekbar/SoundSeekbar.java").readText()
        val java = mapOf("Ljava/lang/Object;" to "Object", "Ljava/lang/String;" to "String", "Z" to "boolean", "I" to "int")
        for ((name, signature) in SOUND_PREVIEW_BRIDGES) {
            val (parameters, returnType) = signature
            val declared = Regex("""static ${java.getValue(returnType)} $name\(([^)]*)\)""").findAll(source).toList()
            assertEquals("SoundSeekbar.java's static ${java.getValue(returnType)} $name", 1, declared.size)
            val types = declared.single().groupValues[1].split(',').map { it.trim().substringBeforeLast(' ') }
            assertEquals(name, parameters.map(java::getValue), types)
        }
        assertTrue(source.contains("public static void onCoverView(@Nullable Object assem, @Nullable View root)"))
    }
}
