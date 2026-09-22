package app.morphe.patches.tiktok.interaction.quickactions

import app.morphe.Fixtures
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import org.junit.Assert.assertEquals
import org.junit.Test

/** Contract for the 47.0.3 component that owns automatic comment sticker suggestions. */
class CommentTypingStickerSuggestionsFixturesTest {
    @Test
    fun `typing recommendation component has one boolean visibility boundary on 47 0 3`() {
        val apk = Fixtures.apks().single { it.name.contains("47.0.3") }
        val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
        val components = container.dexEntryNames.flatMap { entry ->
            container.getEntry(entry)!!.dexFile.classes.filter {
                it.type == COMMENT_TYPING_STICKER_RECOMMEND_ASSEM
            }
        }
        assertEquals("one typing recommendation component", 1, components.size)

        val component = components.single()
        val visibilityMethods = component.methods.filter { method ->
            method.returnType == "V" &&
                method.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
                method.implementation != null
        }
        assertEquals("one boolean visibility boundary", 1, visibilityMethods.size)

        val viewBindings = component.methods.sumOf { method ->
            method.implementation?.instructions?.count { instruction ->
                (instruction as? NarrowLiteralInstruction)?.narrowLiteral ==
                    TYPING_STICKER_RECOMMEND_VIEW_ID ||
                    (instruction as? WideLiteralInstruction)?.wideLiteral ==
                    TYPING_STICKER_RECOMMEND_VIEW_ID.toLong()
            } ?: 0
        }
        assertEquals("one typing sticker recommendation view binding", 1, viewBindings)
    }
}

private const val TYPING_STICKER_RECOMMEND_VIEW_ID = 0x7f0a9680
