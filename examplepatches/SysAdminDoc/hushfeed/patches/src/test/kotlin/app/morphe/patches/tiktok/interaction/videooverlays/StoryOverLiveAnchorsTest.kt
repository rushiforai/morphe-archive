/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.interaction.videooverlays

import app.morphe.BridgeTypeFlow
import app.morphe.Fixtures
import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.takes
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import kotlinx.coroutines.runBlocking
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder

private const val AVATAR_VIEW = "Lcom/ss/android/ugc/aweme/avatar/AvatarComponentView;"
private const val BUSINESS = "LX/07WQ;"

/**
 * What the Story first switch (#233) hooks, held to each declared build: exactly one tap on the
 * profile picture that checks the picture's map for LIVE, with the ask to StoryOverLive right in
 * front of that check and TikTok's own check left behind it for a no.
 */
class StoryOverLiveAnchorsTest {
    @get:Rule val temporary = TemporaryFolder()

    @Test
    fun `each declared build has one profile picture tap that checks for LIVE first`() {
        Fixtures.forEachDeclared { apk ->
            val version = Fixtures.versionOf(apk)
            val taken = mutableListOf<Method>()
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            for (entry in container.dexEntryNames) {
                for (classDef in container.getEntry(entry)!!.dexFile.classes) {
                    for (method in classDef.methods) {
                        if (ProfileAvatarClickFingerprint.takes(method, classDef)) taken += method
                    }
                }
            }
            assertEquals("$version: profile picture taps ${taken.map { it.definingClass + "->" + it.name }}", 1, taken.size)
        }
    }

    @Test
    fun `the hook assembles on each declared build and asks ahead of TikToks LIVE check`() {
        val hookOpcodes = listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID)
        Fixtures.forEachDeclared { apk ->
            val version = Fixtures.versionOf(apk)
            var checked = false
            val probe = bytecodePatch(name = "story over live probe") {
                execute {
                    val method = ProfileAvatarClickFingerprint.method
                    val site = storyOverLiveSite(method)!!
                    val stock = method.implementation!!.instructions.toList()
                    val load = stock[site.index]
                    assertEquals("$version: the hook sits on the LIVE key", "LIVE", load.getReference<FieldReference>()!!.name)
                    assertTrue(
                        "$version: something in TikTok's code jumps onto the LIVE check, past the hook",
                        stock.none { (it as? BuilderOffsetInstruction)?.target?.location?.instruction === load },
                    )
                    val kept = stock.take(site.index).count { it.opcode != Opcode.NOP }
                    val before = stock.filter { it.opcode != Opcode.NOP }.map { it.opcode }
                    val stockProblems = BridgeTypeFlow.check(method).map { it.message }

                    assertTrue("$version: the hook went in", hookStoryOverLive(version))

                    val after = method.implementation!!.instructions.toList()
                    val at = after.indexOf(load)
                    val hook = after.subList(at - hookOpcodes.size, at)
                    assertEquals("$version: the ask", hookOpcodes, hook.map { it.opcode })
                    assertEquals("$version: the tapped view goes in", site.view, (hook[0] as TwoRegisterInstruction).registerB)
                    val ask = hook[1].getReference<MethodReference>()!!
                    assertEquals(
                        "Lapp/morphe/extension/tiktok/feed/StoryOverLive;->openStory(Ljava/util/Map;Landroid/view/View;)Z",
                        "${ask.definingClass}->${ask.name}(${ask.parameterTypes.joinToString("")})${ask.returnType}",
                    )
                    val call = hook[1] as FiveRegisterInstruction
                    assertEquals("$version: with the picture's map", site.map, call.registerC)
                    assertEquals("$version: and the view", site.scratch, call.registerD)
                    assertSame("$version: a no runs TikTok's LIVE check", load, (hook[3] as BuilderOffsetInstruction).target.location.instruction)
                    assertEquals(
                        "$version: TikTok's own code around the hook",
                        before.take(kept) + hookOpcodes + before.drop(kept),
                        after.filter { it.opcode != Opcode.NOP }.map { it.opcode },
                    )
                    assertEquals("$version: the hook types as TikTok's code did", stockProblems, BridgeTypeFlow.check(method).map { it.message })
                    checked = true
                }
            }
            ProfileAvatarClickFingerprint.clearMatch()
            Patcher(PatcherConfig(apk, temporary.newFolder())).use { patcher ->
                patcher += setOf(probe)
                runBlocking { patcher().collect { result -> result.exception?.let { throw it } } }
            }
            ProfileAvatarClickFingerprint.clearMatch()
            assertTrue("$version: the probe never ran", checked)
        }
    }

    @Test
    fun `only a static tap that checks the pictures map for LIVE with the view untouched is taken`() {
        val site = storyOverLiveSite(tap())!!
        assertEquals("the LIVE key's load", 2, site.index)
        assertEquals("the map", 5, site.map)
        assertEquals("the load's own register", 0, site.scratch)
        assertEquals("the view, the last parameter", 7, site.view)

        assertNull("an instance method", storyOverLiveSite(tap(static = false)))
        assertNull("no view last", storyOverLiveSite(tap(lastParameter = "Ljava/lang/Object;")))
        assertNull("a map from elsewhere", storyOverLiveSite(tap(mapFrom = "getBusinessCache")))
        assertNull("the STORY check", storyOverLiveSite(tap(key = "STORY")))
        assertNull("the view written first", storyOverLiveSite(tap(viewWritten = true)))
    }

    /**
     * The tap cut down to its LIVE check: the picture's map, then `map.containsKey(LIVE)`. Six
     * locals and two parameters, the listener in v6 and the view in v7.
     */
    private fun tap(
        static: Boolean = true,
        lastParameter: String = "Landroid/view/View;",
        mapFrom: String = "getCurrentActiveBusiness",
        key: String = "LIVE",
        viewWritten: Boolean = false,
    ): Method {
        val code = mutableListOf<Instruction>(
            ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 1, 0, 0, 0, 0,
                ImmutableMethodReference(AVATAR_VIEW, mapFrom, listOf(), "Ljava/util/Map;")),
            ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 5),
            ImmutableInstruction21c(Opcode.SGET_OBJECT, 0, ImmutableFieldReference(BUSINESS, key, BUSINESS)),
            ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 2, 5, 0, 0, 0, 0,
                ImmutableMethodReference("Ljava/util/Map;", "containsKey", listOf("Ljava/lang/Object;"), "Z")),
            ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        )
        if (viewWritten) code.add(0, ImmutableInstruction11n(Opcode.CONST_4, 7, 0))
        val flags = AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0)
        return ImmutableMethod(
            "LY/ACListener;", "onClick\$124",
            listOf("LY/ACListener;", lastParameter).map { ImmutableMethodParameter(it, null, null) }, "V",
            flags, null, null,
            ImmutableMethodImplementation(8, code, null, null),
        )
    }
}
