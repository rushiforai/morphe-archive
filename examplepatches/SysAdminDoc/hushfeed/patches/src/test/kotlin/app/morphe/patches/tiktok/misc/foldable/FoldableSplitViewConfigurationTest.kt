/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.misc.foldable

import app.morphe.Fixtures
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

private const val FEED_ACTIVITY = "Lcom/ss/android/ugc/aweme/main/MainActivity;"
private const val EXTENSION = "Lapp/morphe/extension/tiktok/foldable/FoldableSplitView;"

/** The feed activity's configuration change reaches the split view first (issue #26). */
class FoldableSplitViewConfigurationTest {
    @Test
    fun `47_0_3's feed activity hands its configuration change to the split view`() {
        val apks = Fixtures.apks().filter { it.name.contains("47.0.3") }
        assertEquals("one retained 47.0.3 fixture", 1, apks.size)
        val container = DexFileFactory.loadDexContainer(apks.single(), Opcodes.getDefault())
        val classes = HashMap<String, ClassDef>()
        container.dexEntryNames.forEach { entry ->
            container.getEntry(entry)!!.dexFile.classes.forEach { classes.putIfAbsent(it.type, it) }
        }

        val method = configurationChangeOf(FEED_ACTIVITY) { classes[it] }
        assertNotNull("nothing between the feed activity and Activity takes configuration changes", method)
        val chain = generateSequence(FEED_ACTIVITY) { classes[it]?.superclass }.toList()
        assertTrue("${method!!.definingClass} is not above the feed activity", method.definingClass in chain)

        val mutable = MutableMethod(method)
        val body = mutable.implementation!!.instructions.map { it.opcode }
        mutable.handConfigurationChangesToSplitView()
        assertHandsOverFirst(mutable, body)
    }

    @Test
    fun `the walk takes the nearest override that runs and skips what cannot take the change`() {
        val classes = mapOf(
            classOf("LX/Feed;", "LX/Static;"),
            classOf("LX/Static;", "LX/Abstract;", change(static = true)),
            classOf("LX/Abstract;", "LX/Base;", change(implemented = false)),
            classOf("LX/Base;", "Landroid/app/Activity;", change()),
        )
        val found = configurationChangeOf("LX/Feed;") { classes[it] }
        assertEquals("LX/Base;", found?.definingClass)

        val mutable = MutableMethod(found!!)
        val body = mutable.implementation!!.instructions.map { it.opcode }
        mutable.handConfigurationChangesToSplitView()
        assertHandsOverFirst(mutable, body)
    }

    @Test
    fun `a chain that leaves the app before any override finds nothing`() {
        val classes = mapOf(classOf("LX/Feed;", "Landroid/app/Activity;"))
        assertNull(configurationChangeOf("LX/Feed;") { classes[it] })
        // A damaged chain that loops ends too.
        val looped = mapOf(classOf("LX/A;", "LX/B;"), classOf("LX/B;", "LX/A;"))
        assertNull(configurationChangeOf("LX/A;") { looped[it] })
    }

    @Test
    fun `the patch hands the configuration change over`() {
        val root = File("src/main/kotlin").takeIf { it.isDirectory } ?: File("patches/src/main/kotlin")
        val source = File(root, "app/morphe/patches/tiktok/misc/foldable/FoldableSplitViewPatch.kt").readText()
        val execute = source.indexOf("execute {", source.indexOf("val foldableSplitViewPatch"))
        assertTrue("the patch has no execute block", execute >= 0)
        assertTrue("the patch no longer hands the feed activity's configuration change over",
            source.indexOf(".handConfigurationChangesToSplitView()", execute) > execute)
        assertTrue("the configuration change is no longer found before anything is written",
            source.indexOf("configurationChangeOf(FEED_ACTIVITY)", execute) in execute until
                source.indexOf(".addInstructions(", execute))
    }

    /** The call is a prefix: TikTok's own handler, `super` call included, still runs after it. */
    private fun assertHandsOverFirst(method: MutableMethod, originalBody: List<Opcode>) {
        val instructions = method.implementation!!.instructions.toList()
        assertEquals("the hook changed TikTok's own handler", originalBody, instructions.drop(1).map { it.opcode })
        val first = instructions.first()
        assertEquals(Opcode.INVOKE_STATIC_RANGE, first.opcode)
        val range = first as RegisterRangeInstruction
        assertEquals("the call does not take this and the configuration", 2, range.registerCount)
        assertEquals("the call does not start at p0", method.implementation!!.registerCount - 2, range.startRegister)
        val target = first.getReference<MethodReference>()!!
        assertEquals(EXTENSION, target.definingClass)
        assertEquals("onConfigurationChanged", target.name)
        assertEquals(listOf("Landroid/app/Activity;", "Landroid/content/res/Configuration;"),
            target.parameterTypes.map(CharSequence::toString))
    }

    private fun classOf(type: String, superclass: String, vararg methods: (String) -> Method): Pair<String, ClassDef> =
        type to ImmutableClassDef(
            type, AccessFlags.PUBLIC.value, superclass, null, null, null, emptyList(),
            methods.map { it(type) },
        )

    private fun change(static: Boolean = false, implemented: Boolean = true): (String) -> Method = { owner ->
        ImmutableMethod(
            owner, "onConfigurationChanged",
            listOf(ImmutableMethodParameter("Landroid/content/res/Configuration;", null, null)), "V",
            AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0) or
                (if (implemented) 0 else AccessFlags.ABSTRACT.value),
            null, null,
            if (implemented) {
                ImmutableMethodImplementation(if (static) 1 else 2, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), null, null)
            } else {
                null
            },
        )
    }
}
