package app.morphe.patches.tiktok.interaction.cleardisplay

import app.morphe.Fixtures
import app.morphe.takes
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * With Keep Clear display across videos off, a clear by hand ends as a swipe lets go (#232). That
 * moment is the video pager telling its listeners about the new video, held here to every declared
 * build: one method on the pager, an instance method, and the one that calls their onPageSelected.
 */
class FeedPagerPageSelectedAnchorsTest {
    @Test
    fun `the pager's selection dispatch is one instance method that tells the listeners`() {
        Fixtures.forEachDeclared { apk ->
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val taken = container.dexEntryNames.flatMap { entry ->
                container.getEntry(entry)!!.dexFile.classes.flatMap { classDef ->
                    classDef.methods.filter { FeedPagerPageSelectedFingerprint.takes(it, classDef) }
                }
            }
            assertEquals("${apk.name}: ${taken.map { "${it.definingClass}->${it.name}" }}", 1, taken.size)
            val dispatch = taken.single()
            assertFalse("${apk.name}: the dispatch is static", AccessFlags.STATIC.isSet(dispatch.accessFlags))
            val tells = dispatch.implementation!!.instructions.any { instruction ->
                instruction.opcode == Opcode.INVOKE_INTERFACE &&
                    ((instruction as ReferenceInstruction).reference as? MethodReference)?.let {
                        it.name == "onPageSelected" && it.parameterTypes.map(CharSequence::toString) == listOf("I")
                    } == true
            }
            assertTrue("${apk.name}: ${dispatch.name} doesn't call onPageSelected", tells)
        }
    }

    @Test
    fun `the patch hands the pager, the position and the dispatch flag to the extension`() {
        val root = File("src/main/kotlin").takeIf { it.isDirectory } ?: File("patches/src/main/kotlin")
        val source = File(root, "app/morphe/patches/tiktok/interaction/cleardisplay/RememberClearDisplayPatch.kt").readText()
        assertTrue(source.contains("{ p0 .. p2 }, \$EXTENSION->onFeedPageSelected(Ljava/lang/Object;IZ)V"))
    }
}
