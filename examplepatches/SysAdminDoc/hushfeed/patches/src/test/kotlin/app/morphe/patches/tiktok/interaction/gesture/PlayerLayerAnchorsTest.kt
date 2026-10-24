package app.morphe.patches.tiktok.interaction.gesture

import app.morphe.Fixtures
import app.morphe.takes
import com.android.tools.smali.dexlib2.Opcodes
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The player layer hooks, held to each TikTok build the bundle declares: one static helper each,
 * the reparents taking the TTPlayerSurface, the parent layer and the buffer size (and the first
 * whether it shows), the recycle taking the player's id and then the TTPlayerSurface, which is the
 * order the extension reads its registers in.
 */
class PlayerLayerAnchorsTest {
    @Test
    fun `each player layer hook takes one static helper`() {
        Fixtures.forEachDeclared { apk ->
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val seen = HashSet<String>()
            val reparent = mutableListOf<String>()
            val shown = mutableListOf<String>()
            val detach = mutableListOf<String>()
            for (entry in container.dexEntryNames) {
                for (classDef in container.getEntry(entry)!!.dexFile.classes) {
                    if (!seen.add(classDef.type)) continue
                    for (method in classDef.methods) {
                        val name = "${classDef.type}->${method.name}${method.parameterTypes}"
                        if (PlayerLayerReparentFingerprint.takes(method, classDef)) reparent += name
                        if (PlayerLayerShownFingerprint.takes(method, classDef)) shown += name
                        if (PlayerLayerDetachFingerprint.takes(method, classDef)) detach += name
                    }
                }
            }
            assertEquals("reparent helpers taken: $reparent", 1, reparent.size)
            assertTrue(reparent[0], reparent[0].endsWith("[$PLAYER_SURFACE, Landroid/view/SurfaceControl;, I, I, Z, J]"))
            assertEquals("Android 13 reparent helpers taken: $shown", 1, shown.size)
            assertTrue(shown[0], shown[0].contains("[$PLAYER_SURFACE, Landroid/view/SurfaceControl;, I, I, J, "))
            assertEquals("recycle helpers taken: $detach", 1, detach.size)
            assertTrue(detach[0], detach[0].endsWith("[J, $PLAYER_SURFACE]"))
            assertTrue(
                "the three are one helper class's",
                setOf(reparent[0], shown[0], detach[0]).map { it.substringBefore("->") }.toSet().size == 1,
            )
        }
    }
}
