/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.marketplaceonly

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.facebook.navigation.starttab.TAB_TAG
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Marketplace only over a stand-in tab bar state: which method counts as the builder of the shown
 * tabs, what the patch refuses, and the call it puts after the hidden-tab set's answer. Each rule
 * has a control that must fail it.
 */
class MarketplaceOnlyShapesTest {
    private val state = "Lfixture/TabBarState;"
    private val hiddenTabs = "Lfixture/HiddenTabs;"

    /**
     * The builder as both builds write it: the configured list in v7, each tab cast into v4, its id
     * in v2 and v3, the hidden set in v1, the answer in v0 and the builder in v8. Parts can change.
     */
    private fun builder(
        owner: String = state,
        static: Boolean = true,
        configuredField: String = "$NAVIGATION_CONFIG->A01:$IMMUTABLE_LIST",
        cast: String = TAB_TAG,
        asks: String = "Ljava/util/Set;->contains(Ljava/lang/Object;)Z",
        branch: String = "if-nez v0, :next",
        added: String = "v4",
        overwriteTab: Boolean = false,
        jumpToBranch: Boolean = false,
    ): MutableMethod = MutableMethod(
        ImmutableMethod(
            owner, "build", listOf(ImmutableMethodParameter(owner, null, null)), "V",
            AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0), null, null,
            ImmutableMethodImplementation(10, emptyList(), null, null),
        ),
    ).apply {
        addInstructionsWithLabels(
            0,
            """
                new-instance v8, $LIST_BUILDER
                invoke-direct { v8 }, $LIST_BUILDER-><init>()V
                invoke-virtual { p0 }, $owner->config()$NAVIGATION_CONFIG
                move-result-object v0
                iget-object v7, v0, $configuredField
                invoke-virtual { v7 }, Ljava/util/AbstractCollection;->size()I
                move-result v6
                const/4 v5, 0x0
                :loop
                if-ge v5, v6, :done
                invoke-interface { v7, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
                move-result-object v4
                check-cast v4, $cast
                iget-object v0, p0, $owner->hidden:$hiddenTabs
                iget-wide v2, v4, $TAB_TAG->A03:J
                iget-object v1, v0, $hiddenTabs->A03:Ljava/util/Set;
                ${if (overwriteTab) "const/4 v4, 0x0" else ""}
                invoke-static { v2, v3 }, Ljava/lang/String;->valueOf(J)Ljava/lang/String;
                move-result-object v0
                invoke-interface { v1, v0 }, $asks
                move-result v0
                ${if (jumpToBranch) ":check" else ""}
                $branch
                invoke-virtual { v8, $added }, $LIST_BUILDER->add(Ljava/lang/Object;)$LIST_BUILDER
                :next
                add-int/lit8 v5, v5, 0x1
                ${if (jumpToBranch) "if-eqz v5, :check" else ""}
                goto :loop
                :done
                return-void
            """,
        )
    }

    private fun classOf(method: Method, withConfig: Boolean = true): ClassDef = ImmutableClassDef(
        method.definingClass, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null,
        if (withConfig) listOf(ImmutableField(method.definingClass, "A00", NAVIGATION_CONFIG, AccessFlags.PUBLIC.value, null, null, null)) else emptyList(),
        listOf(method),
    )

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private val Instruction.reference: String get() = (this as ReferenceInstruction).reference.toString()

    @Test
    fun `the builder asks the hidden set about each configured tab before adding it`() {
        val filter = shownTabFilter(builder())!!
        assertEquals(TabFilter(result = 18, answer = 0, tab = 4, configured = 7, hidden = 1), filter)
        assertNull("an instance method", shownTabFilter(builder(static = false)))
        assertNull("another list", shownTabFilter(builder(configuredField = "$NAVIGATION_CONFIG->A01:Ljava/util/List;")))
        assertNull("no TabTag", shownTabFilter(builder(cast = "Lfixture/Other;")))
        assertNull("another question", shownTabFilter(builder(asks = "Ljava/util/Set;->remove(Ljava/lang/Object;)Z")))
        assertNull("a branch on another register", shownTabFilter(builder(branch = "if-nez v6, :next")))
        assertNull("a branch that adds the hidden ones", shownTabFilter(builder(branch = "if-eqz v0, :next")))
        assertNull("adds another object", shownTabFilter(builder(added = "v1")))
        assertNull("the tab is overwritten before the answer", shownTabFilter(builder(overwriteTab = true)))
    }

    @Test
    fun `the patch asks the extension right after the hidden set answers`() {
        val context = PatchContexts.of(listOf(classOf(builder()), ExtensionDex.classDef(SETTINGS_STATUS)))

        marketplaceOnlyPatch.execute(context)

        val body = context.mutableClassDefBy(state).methods.single().body()
        assertEquals(Opcode.MOVE_RESULT, body[18].opcode)
        val asks = body[19]
        assertEquals(Opcode.INVOKE_STATIC, asks.opcode)
        assertEquals(HIDES_TAB, asks.reference)
        assertEquals(listOf(0, 4, 7, 1), asks.callRegisters())
        assertEquals(Opcode.MOVE_RESULT, body[20].opcode)
        assertEquals(0, (body[20] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_NEZ, body[21].opcode)
        assertEquals(0, (body[21] as OneRegisterInstruction).registerA)

        val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "marketplaceOnly" }
        val answer = status.body().first { it is NarrowLiteralInstruction }
        assertEquals("the settings screen isn't told the patch is in", 1, (answer as NarrowLiteralInstruction).narrowLiteral)
    }

    @Test
    fun `a build whose tab bar builder can't be told apart is refused before anything changes`() {
        fun refusal(vararg classes: ClassDef): String {
            val context = PatchContexts.of(classes.toList() + ExtensionDex.classDef(SETTINGS_STATUS))
            return assertThrows(PatchException::class.java) { marketplaceOnlyPatch.execute(context) }.message!!
        }
        val none = refusal(classOf(builder(), withConfig = false))
        assertTrue(none, none.contains("found 0"))
        val two = refusal(classOf(builder()), classOf(builder(owner = "Lfixture/OtherState;")))
        assertTrue(two, two.contains("found 2"))

        val jumped = PatchContexts.of(listOf(classOf(builder(jumpToBranch = true)), ExtensionDex.classDef(SETTINGS_STATUS)))
        val refused = assertThrows(PatchException::class.java) { marketplaceOnlyPatch.execute(jumped) }
        assertTrue(refused.message, refused.message!!.contains("has a jump to the branch that skips a hidden tab"))
    }
}
