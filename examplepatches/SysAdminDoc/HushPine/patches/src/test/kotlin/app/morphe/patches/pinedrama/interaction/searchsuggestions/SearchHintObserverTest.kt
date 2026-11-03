package app.morphe.patches.pinedrama.interaction.searchsuggestions

import app.morphe.Fixtures
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcodes
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class SearchHintObserverTest {
    /**
     * The observers that put the trending word in the search box are one for the shared search page
     * and one for the drama search page, each with a local beyond its parameters for the guard's
     * own answer.
     */
    @Test
    fun `both search hint observers stay on every declared build`() = Fixtures.forEachDeclared { apk ->
        val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
        val observers = container.dexEntryNames.asSequence()
            .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }
            .flatMap { it.methods.asSequence() }
            .filter(::isSearchHintObserver).toList()
        assertEquals("search hint observers ${observers.map { "${it.definingClass}->${it.name}" }}", 2, observers.size)
        observers.forEach { observer ->
            val parameterRegisters = observer.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 } +
                if (AccessFlags.STATIC.isSet(observer.accessFlags)) 0 else 1
            assertTrue("${observer.definingClass}->${observer.name} has no local for the guard",
                observer.implementation!!.registerCount - parameterRegisters >= 1)
        }
    }

    /**
     * The method that puts a word in the search box and the one that answers PineDrama's own
     * placeholder are each one method in the search fragment, and the hint they share can be built
     * from the placeholder alone, which is what the patch hands the box instead.
     */
    @Test
    fun `the search box hint applier and its default stay one method each on every declared build`() =
        Fixtures.forEachDeclared { apk ->
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val classes = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }.toList()
            val methods = classes.flatMap { it.methods }
            val appliers = methods.filter(::isSearchHintApplier)
            assertEquals("search hint appliers ${appliers.map { it.name }}", 1, appliers.size)
            val defaults = methods.filter(::isDefaultSearchHint)
            assertEquals("default search hints ${defaults.map { it.name }}", 1, defaults.size)
            val applier = appliers.single()
            assertTrue("${applier.name} has fewer than two locals for the swap",
                applier.implementation!!.registerCount - 2 >= 2)
            val hintModel = applier.parameterTypes.single().toString()
            assertTrue("$hintModel has no one-word constructor", classes.single { it.type == hintModel }.methods.any {
                it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;")
            })
        }
}
