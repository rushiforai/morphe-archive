/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.bottomtabbar

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The parts of Tab bar at the bottom that need no Facebook build: the key field it takes from the
 * override's name, the reads it accepts and the ones it refuses, a write it leaves alone, and where
 * its hook goes.
 */
class BottomTabBarShapesTest {
    private val holder = "Lfixture/TabsOverride;"
    private val keyType = "Lfixture/PrefKey;"
    private val key = ImmutableFieldReference(holder, "A01", keyType)

    private fun method(body: String, name: String = "A06", returnType: String = "Z", static: Boolean = false,
                       definingClass: String = "Lfixture/TabBarGate;", registers: Int = 20) = MutableMethod(
        ImmutableMethod(
            definingClass, name, emptyList(), returnType,
            if (static) AccessFlags.STATIC.value else AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null, null, ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, body.trimIndent()) }

    private fun classOf(type: String, vararg methods: Method): ClassDef = ImmutableClassDef(
        type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, emptyList(), methods.toList(),
    )

    /** The override's class as 577 and 580 have it: its <clinit> builds the key from the name and stores it. */
    private fun keyHolder(type: String = holder, name: String = OVERRIDE_KEY) = classOf(
        type,
        method(
            """
                const-string v0, "$name"
                new-instance v1, $keyType
                invoke-direct { v1, v0 }, $keyType-><init>(Ljava/lang/String;)V
                sput-object v1, $type->A01:$keyType
                return-void
            """,
            name = "<clinit>", returnType = "V", static = true, definingClass = type,
        ),
    )

    /**
     * The tab bar gate as 577 and 580 have it: the key read from FbSharedPreferences as a TriState,
     * its ordinal kept in v[result], and YES, ordinal 0, answering true for the bottom. Each
     * argument changes one step of that. The branch is an if-eqz, which names any register up to
     * v255, where the two-register compares 577 and 580 use stop at v15.
     */
    private fun gate(
        name: String = "A06",
        result: Int = 2,
        read: String = "invoke-interface { v1, v0 }, $FB_SHARED_PREFERENCES->B2w($keyType)$TRI_STATE",
        afterRead: String = "move-result-object v0",
        ordinal: String = "invoke-virtual { v0 }, Ljava/lang/Enum;->ordinal()I",
        afterOrdinal: String = "move-result v$result",
        branchLabel: String = "",
        tail: String = "",
    ) = method(
        """
            sget-object v0, $holder->A01:$keyType
            $read
            $afterRead
            $ordinal
            $afterOrdinal
            $branchLabel
            const/4 v1, 0x1
            if-eqz v$result, :bottom
            const/4 v0, 0x0
            return v0
            :bottom
            return v1
            $tail
        """,
        name = name,
    )

    /** Facebook's tab menu: it stores the flipped answer under the key, through [store], and reads nothing. */
    private fun menuWrite(store: String = "invoke-static { v0, v1, v2 }, Lfixture/Editor;->A1F(Lfixture/Editor;${keyType}Z)V") = method(
        """
            const/4 v2, 0x1
            sget-object v1, $holder->A01:$keyType
            $store
            return-void
        """,
        name = "A0H", returnType = "V", static = true, definingClass = "Lfixture/TabMenu;",
    )

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private fun reason(block: () -> Unit): String {
        val message = assertThrows(PatchException::class.java) { block() }.message!!
        assertTrue(message, message.startsWith("$PATCH: "))
        return message
    }

    @Test
    fun `the key is the field the override's class stores after loading its name`() {
        assertEquals(key, overrideKeyField(listOf(keyHolder())))
        assertTrue(reason { overrideKeyField(emptyList()) }.contains("expected one static field set from \"$OVERRIDE_KEY\", found 0"))
        val two = listOf(keyHolder(), keyHolder(type = "Lfixture/OtherOverride;"))
        assertTrue(reason { overrideKeyField(two) }.contains("found 2"))
        // A class that holds the name but stores another class's field keeps no key of its own.
        val elsewhere = classOf(
            holder,
            method(
                """
                    const-string v0, "$OVERRIDE_KEY"
                    sput-object v0, Lfixture/Elsewhere;->A01:Ljava/lang/String;
                    return-void
                """,
                name = "<clinit>", returnType = "V", static = true, definingClass = holder,
            ),
        )
        assertTrue(reason { overrideKeyField(listOf(elsewhere)) }.contains("found 0"))
    }

    @Test
    fun `a read goes straight from the key to FbSharedPreferences, a TriState and its ordinal`() {
        val read = overrideReads(gate(), key).single()
        assertEquals(4 to 2, read.resultIndex to read.register)
        // An ordinal kept past v15 and a TriState's own ordinal() read the same way.
        val wide = overrideReads(gate(result = 17, ordinal = "invoke-virtual { v0 }, $TRI_STATE->ordinal()I"), key).single()
        assertEquals(4 to 17, wide.resultIndex to wide.register)
        val range = gate(read = "invoke-interface/range { v0 .. v1 }, $FB_SHARED_PREFERENCES->B2w($keyType)$TRI_STATE")
        assertEquals(1, overrideReads(range, key).size)
        // A TriState kept past v15 has its ordinal taken by a range call, which names any register.
        val kept = gate(result = 17, afterRead = "move-result-object v17",
            ordinal = "invoke-virtual/range { v17 .. v17 }, Ljava/lang/Enum;->ordinal()I")
        assertEquals(4 to 17, overrideReads(kept, key).single().let { it.resultIndex to it.register })
        assertEquals("the tab menu's write is no read", emptyList<OverrideRead>(), overrideReads(menuWrite(), key))
        val triStateWrite = menuWrite("invoke-interface { v0, v1, v3 }, Lfixture/Editor;->put(${keyType}$TRI_STATE)V")
        assertEquals("a write of a TriState is no read", emptyList<OverrideRead>(), overrideReads(triStateWrite, key))
    }

    /** Each shape changes one step of [gate] or [menuWrite], and has to be refused for that step. */
    @Test
    fun `a read that answers no TriState, or doesn't take its ordinal right away, is refused`() {
        val noOrdinal = "doesn't take the ordinal of the override's TriState right after reading it"
        val shapes = mapOf(
            "a read answering a boolean" to
                (gate(read = "invoke-interface { v1, v0 }, $FB_SHARED_PREFERENCES->BAN($keyType)Z") to "doesn't answer a TriState"),
            "the TriState read as a boolean" to
                (gate(ordinal = "invoke-virtual { v0 }, $TRI_STATE->asBoolean()Z") to noOrdinal),
            "the TriState left unkept" to (gate(afterRead = "nop") to noOrdinal),
            "the ordinal of another register" to (gate(ordinal = "invoke-virtual { v3 }, Ljava/lang/Enum;->ordinal()I") to noOrdinal),
            "the ordinal unkept" to (gate(afterOrdinal = "nop") to noOrdinal),
            "the TriState read again past its ordinal" to
                (gate(afterOrdinal = "move-result v2\ninvoke-static { v0 }, Lfixture/Log;->tri($TRI_STATE)V") to
                    "uses the override's TriState past its ordinal"),
            "the key handed to a helper that answers a TriState" to
                (gate(read = "invoke-static { v1, v0 }, Lfixture/Prefs;->tri($FB_SHARED_PREFERENCES$keyType)$TRI_STATE") to
                    "Lfixture/TabBarGate;->A06 hands the override's key at 0 to neither a read nor a write"),
            "the key stored in a field" to
                (menuWrite("sput-object v1, Lfixture/Cache;->key:$keyType") to "hands the override's key at 1 to neither"),
            "the key put to a call that answers something" to
                (menuWrite("invoke-static { v0, v1, v2 }, Lfixture/Editor;->A1F(Lfixture/Editor;${keyType}Z)Z") to
                    "to neither a read nor a write"),
            "the key written, then handed to a helper that reads it" to
                (menuWrite("invoke-static { v0, v1, v2 }, Lfixture/Editor;->A1F(Lfixture/Editor;${keyType}Z)V\n" +
                    "invoke-static { v3, v1 }, Lfixture/Prefs;->tri($FB_SHARED_PREFERENCES$keyType)$TRI_STATE") to
                    "Lfixture/TabMenu;->A0H uses the override's key loaded at 1 past the call it goes into"),
            "another key's way into the read" to
                (gate(read = ":read\ninvoke-interface { v1, v0 }, $FB_SHARED_PREFERENCES->B2w($keyType)$TRI_STATE",
                    tail = "sget-object v0, Lfixture/OtherOverride;->A01:$keyType\ngoto :read") to
                    "in Lfixture/TabBarGate;->A06 the read of the override at 1 can be reached from [0, 11], not only from the key's load"),
            "a handler at the read" to
                (gate().apply {
                    implementation!!.apply {
                        addCatch("Ljava/lang/Exception;", newLabelForIndex(0), newLabelForIndex(1), newLabelForIndex(1))
                    }
                } to "the read of the override at 1 can be reached from [0, 0], not only from the key's load"),
            "another TriState's way into the ordinal" to
                (gate(ordinal = ":ordinal\ninvoke-virtual { v0 }, Ljava/lang/Enum;->ordinal()I",
                    tail = "sget-object v0, Lfixture/Tri;->NO:$TRI_STATE\ngoto :ordinal") to
                    "in Lfixture/TabBarGate;->A06 the override's ordinal at 3 can be reached from [2, 11], not only from its read"),
            "a handler at the ordinal" to
                (gate().apply {
                    implementation!!.apply {
                        addCatch("Ljava/lang/Exception;", newLabelForIndex(0), newLabelForIndex(1), newLabelForIndex(3))
                    }
                } to "the override's ordinal at 3 can be reached from [2, 0], not only from its read"),
            "the key read a second time from one load" to
                (gate(afterRead = "move-result-object v3", ordinal = "invoke-virtual { v3 }, Ljava/lang/Enum;->ordinal()I",
                    afterOrdinal = "move-result v2\ninvoke-interface { v1, v0 }, $FB_SHARED_PREFERENCES->B2w($keyType)$TRI_STATE") to
                    "Lfixture/TabBarGate;->A06 uses the override's key loaded at 0 past the call it goes into"),
        )
        for ((shape, case) in shapes) {
            val (method, expected) = case
            val message = reason { overrideReads(method, key) }
            assertTrue("$shape: $message", expected in message)
        }
    }

    /**
     * The hook goes right after the ordinal's move-result, a range call naming the ordinal's
     * register whatever its number, with the extension's answer put back where the branches read
     * it. Facebook's own code around it stays as it was.
     */
    @Test
    fun `the hook sits after the ordinal and hands the answer back to the same register`() {
        for (result in listOf(2, 17)) {
            val method = gate(result = result)
            val before = method.body()
            method.hookOverrideReads(overrideReads(method, key))
            val after = method.body()
            assertEquals(before.size + 2, after.size)
            assertEquals(before.take(5).map { it.opcode }, after.take(5).map { it.opcode })
            val call = after[5]
            assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
            assertEquals(OVERRIDE, (call as ReferenceInstruction).reference.toString())
            assertEquals(result to 1, (call as RegisterRangeInstruction).startRegister to call.registerCount)
            assertEquals(Opcode.MOVE_RESULT, after[6].opcode)
            assertEquals(result, (after[6] as OneRegisterInstruction).registerA)
            assertEquals("Facebook's branch follows the hook", 1, (after[7] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(before.drop(5).map { it.opcode }, after.drop(7).map { it.opcode })
        }
    }

    @Test
    fun `a jump to the instruction after the ordinal is refused`() {
        val method = gate(branchLabel = ":branch", tail = "goto :branch")
        val message = reason { method.hookOverrideReads(overrideReads(method, key)) }
        assertTrue(message, "has a jump to the instruction after the override's ordinal" in message)
    }

    @Test
    fun `the patch hooks every read, leaves the write alone and refuses a build that never reads the key`() {
        val gate = classOf("Lfixture/TabBarGate;", gate(), gate(name = "A09"))
        val menu = classOf("Lfixture/TabMenu;", menuWrite())
        val context = PatchContexts.of(listOf(keyHolder(), gate, menu, ExtensionDex.classDef(SETTINGS_STATUS)))
        bottomTabBarPatch.execute(context)
        for (name in listOf("A06", "A09")) {
            val patched = context.mutableClassDefBy("Lfixture/TabBarGate;").methods.single { it.name == name }.body()
            assertEquals("$name: the call after the ordinal", OVERRIDE, (patched[5] as ReferenceInstruction).reference.toString())
        }
        assertEquals("the tab menu's write is untouched", menuWrite().body().size,
            context.mutableClassDefBy("Lfixture/TabMenu;").methods.single().body().size)
        val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "bottomTabBar" }
        assertEquals("SettingsStatus.bottomTabBar() isn't switched on", 1,
            (status.body()[0] as NarrowLiteralInstruction).narrowLiteral)

        val unread = PatchContexts.of(listOf(keyHolder(), classOf("Lfixture/TabMenu;", menuWrite()), ExtensionDex.classDef(SETTINGS_STATUS)))
        val message = reason { bottomTabBarPatch.execute(unread) }
        assertTrue(message, "nothing reads $key from FbSharedPreferences" in message)
    }

    @Test
    fun `every call the patch writes is in the extension`() {
        val extension = ExtensionDex.classDef(BOTTOM_TAB_BAR)
        val calls = extension.methods
            .filter { AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) }
            .map { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        assertTrue("$OVERRIDE isn't a public static method of the extension: $calls", OVERRIDE in calls)
    }
}
