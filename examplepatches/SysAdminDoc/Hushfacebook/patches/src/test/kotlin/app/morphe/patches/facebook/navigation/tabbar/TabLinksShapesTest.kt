/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.tabbar

import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.navigation.starttab.TAB_TAG
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The tab links over stand-ins for the three places Facebook asks its configured tabs about a link:
 * which method counts as each, what the patch refuses, and the calls it puts in. Each rule has a
 * control that must fail it.
 */
class TabLinksShapesTest {
    private val lookupOwner = "Lfixture/Links;"
    private val state = "Lfixture/State;"
    private val session = "Lfixture/Session;"
    private val configuredList = "$NAVIGATION_CONFIG->A01:$IMMUTABLE_LIST"

    private fun method(owner: String, name: String, parameters: List<String>, returns: String, static: Boolean,
                       registers: Int, smali: String): MutableMethod = MutableMethod(
        ImmutableMethod(
            owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returns,
            AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0), null, null,
            ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, smali) }

    /**
     * The launched tab lookup as the builds write it: the configured tabs mapped by URI into v2, the
     * launch URI in v4, the map's answer kept in v0 and cast to TabTag where the no-URI path joins.
     */
    private fun lookup(
        owner: String = lookupOwner,
        static: Boolean = true,
        returns: String = TAB_TAG,
        string: String = EXTRA_LAUNCH_URI,
        list: String = configuredList,
        secondGet: Boolean = false,
        cast: String = TAB_TAG,
    ) = method(
        owner, "A00", listOf("Landroid/content/Intent;", "Lcom/facebook/auth/usersession/FbUserSession;"), returns, static, 8,
        """
            const/4 v0, 0x0
            invoke-static { p1 }, $state->of(Lcom/facebook/auth/usersession/FbUserSession;)$state
            move-result-object v1
            invoke-virtual { v1 }, $state->config()$NAVIGATION_CONFIG
            move-result-object v1
            iget-object v1, v1, $list
            invoke-static { v1 }, Lfixture/Maps;->byUri(Ljava/util/List;)Lcom/google/common/collect/ImmutableMap;
            move-result-object v2
            const-string v3, "$string"
            invoke-virtual { p0, v3 }, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v4
            if-eqz v4, :none
            ${if (secondGet) "invoke-virtual { v2, v4 }, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;" else ""}
            invoke-virtual { v2, v4 }, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            :none
            check-cast v0, $cast
            return-object v0
        """,
    )

    /**
     * FriendsUriMapHelper's switch as the builds write it: each configured tab cast into v3, an
     * empty list joining the null check with v3 cleared, and the switch reading the link in p2 and
     * the tab in v3.
     */
    private fun friends(
        owner: String = FRIENDS_URI_HELPER,
        list: String = configuredList,
        cast: String = TAB_TAG,
        overwriteTab: Boolean = false,
        secondSwitch: Boolean = false,
    ) = method(
        owner, "A03", listOf("Landroid/content/Context;", "Landroid/content/Intent;", session), "Landroid/content/Intent;",
        false, 10,
        """
            invoke-static { p3 }, $state->of($session)$state
            move-result-object v3
            invoke-virtual { v3 }, $state->config()$NAVIGATION_CONFIG
            move-result-object v0
            iget-object v0, v0, $list
            invoke-virtual { v0 }, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;
            move-result-object v4
            invoke-interface { v4 }, Ljava/util/Iterator;->hasNext()Z
            move-result v0
            if-eqz v0, :missing
            invoke-interface { v4 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v3
            check-cast v3, $cast
            :check
            if-eqz v3, :plain
            ${if (overwriteTab) "const/4 v3, 0x0" else ""}
            iget-object v0, p0, $owner->switcher:Lfixture/Switcher;
            ${if (secondSwitch) "invoke-virtual { v0, p2, v3 }, Lfixture/Switcher;->A01(Landroid/content/Intent;$TAB_TAG)Landroid/content/Intent;" else ""}
            invoke-virtual { v0, p2, v3 }, Lfixture/Switcher;->A00(Landroid/content/Intent;$TAB_TAG)Landroid/content/Intent;
            move-result-object v0
            return-object v0
            :missing
            const/4 v3, 0x0
            goto :check
            :plain
            return-object p2
        """,
    )

    /**
     * FbMainTabActivityUriHelper's target_tab_id check as the builds write it: the link's tab in
     * v1, the configured list read into v0 and asked about it, the answer kept in [answer].
     */
    private fun mainHelper(
        owner: String = MAIN_TAB_URI_HELPER,
        string: String = TARGET_TAB_ID,
        list: String = configuredList,
        answer: Int = 0,
        secondCheck: Boolean = false,
    ) = method(
        owner, "A03", listOf("Landroid/content/Context;", "Landroid/content/Intent;", session), "Landroid/content/Intent;",
        false, 7,
        """
            const-string v0, "$string"
            const-wide/16 v1, 0x0
            invoke-virtual { p2, v0, v1, v2 }, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J
            move-result-wide v1
            invoke-static { v1, v2 }, Lfixture/Tabs;->byId(J)$TAB_TAG
            move-result-object v1
            if-eqz v1, :plain
            invoke-static { p3 }, $state->of($session)$state
            move-result-object v0
            invoke-virtual { v0 }, $state->config()$NAVIGATION_CONFIG
            move-result-object v0
            ${if (secondCheck) "iget-object v2, v0, $list" else ""}
            ${if (secondCheck) "invoke-virtual { v2, v1 }, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z" else ""}
            iget-object v0, v0, $list
            invoke-virtual { v0, v1 }, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z
            move-result v$answer
            if-nez v$answer, :plain
            invoke-static { v1 }, Lfixture/Tabs;->page($TAB_TAG)Landroid/content/Intent;
            move-result-object v0
            return-object v0
            :plain
            return-object p2
        """,
    )

    private fun classOf(vararg methods: Method): ClassDef = ImmutableClassDef(
        methods.first().definingClass, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, emptyList(),
        methods.toList(),
    )

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private val Instruction.reference: String get() = (this as ReferenceInstruction).reference.toString()

    @Test
    fun `the launched tab lookup maps the launch URI to a configured tab and casts it`() {
        assertEquals(TabHook(at = 14, tab = 0), launchedTabLookup(lookup()))
        assertNull("an instance method", launchedTabLookup(lookup(static = false)))
        assertNull("returns something else", launchedTabLookup(lookup(returns = "Ljava/lang/Object;")))
        assertNull("no launch URI", launchedTabLookup(lookup(string = "extra_other_uri")))
        assertNull("another list", launchedTabLookup(lookup(list = "$NAVIGATION_CONFIG->A01:Ljava/util/List;")))
        assertNull("two lookups in the map", launchedTabLookup(lookup(secondGet = true)))
        assertNull("no TabTag", launchedTabLookup(lookup(cast = "Lfixture/Other;")))
    }

    @Test
    fun `the Friends link switches only to a tab it found in the configured list`() {
        assertEquals(TabHook(at = 13, tab = 3), friendsTabMatch(friends()))
        assertNull("another list", friendsTabMatch(friends(list = "$NAVIGATION_CONFIG->A01:Ljava/util/List;")))
        assertNull("no TabTag", friendsTabMatch(friends(cast = "Lfixture/Other;")))
        assertNull("the tab is overwritten before the switch", friendsTabMatch(friends(overwriteTab = true)))
        assertNull("two switches", friendsTabMatch(friends(secondSwitch = true)))
    }

    @Test
    fun `the target_tab_id check asks the configured list about the link's tab`() {
        assertEquals(ConfiguredCheck(at = 14, answer = 0, tab = 1), configuredTabCheck(mainHelper()))
        assertNull("no target_tab_id", configuredTabCheck(mainHelper(string = "target_other_id")))
        assertNull("another list", configuredTabCheck(mainHelper(list = "$NAVIGATION_CONFIG->A01:Ljava/util/List;")))
        assertNull("the answer over the tab", configuredTabCheck(mainHelper(answer = 1)))
        assertNull("two checks", configuredTabCheck(mainHelper(secondCheck = true)))
    }

    @Test
    fun `the patch asks the extension at each of the three`() {
        val context = PatchContexts.of(listOf(classOf(lookup()), classOf(friends()), classOf(mainHelper())))

        tabLinksPatch.execute(context)

        val launched = context.mutableClassDefBy(lookupOwner).methods.single().body()
        assertEquals(LAUNCHED_TAB, launched[14].reference)
        assertEquals(listOf(0), launched[14].callRegisters())
        assertEquals(Opcode.MOVE_RESULT_OBJECT, launched[15].opcode)
        assertEquals(Opcode.CHECK_CAST, launched[16].opcode)
        assertEquals("Facebook's own cast still follows", Opcode.CHECK_CAST, launched[17].opcode)

        val friends = context.mutableClassDefBy(FRIENDS_URI_HELPER).methods.single().body()
        assertEquals(Opcode.CHECK_CAST, friends[12].opcode)
        assertEquals(FRIENDS_TAB, friends[13].reference)
        assertEquals(listOf(3), friends[13].callRegisters())
        assertEquals(3, (friends[14] as OneRegisterInstruction).registerA)
        assertEquals(TAB_TAG, friends[15].reference)
        assertEquals("the null check still follows", Opcode.IF_EQZ, friends[16].opcode)

        val main = context.mutableClassDefBy(MAIN_TAB_URI_HELPER).methods.single().body()
        assertEquals(Opcode.MOVE_RESULT, main[13].opcode)
        assertEquals(CONFIGURES_TAB, main[14].reference)
        assertEquals(listOf(0, 1), main[14].callRegisters())
        assertEquals(Opcode.MOVE_RESULT, main[15].opcode)
        assertEquals(0, (main[15] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_NEZ, main[16].opcode)
    }

    @Test
    fun `a build whose links can't be told apart is refused`() {
        fun refusal(vararg classes: ClassDef): String {
            val context = PatchContexts.of(classes.toList())
            return assertThrows(PatchException::class.java) { tabLinksPatch.execute(context) }.message!!
        }
        val none = refusal(classOf(friends()), classOf(mainHelper()))
        assertTrue(none, none.contains("found 0"))
        val two = refusal(classOf(lookup()), classOf(lookup(owner = "Lfixture/OtherLinks;")), classOf(friends()), classOf(mainHelper()))
        assertTrue(two, two.contains("found 2"))
        val noFriends = refusal(classOf(lookup()), classOf(mainHelper()))
        assertTrue(noFriends, noFriends.contains("has no $FRIENDS_URI_HELPER"))
        val noSwitch = refusal(classOf(lookup()), classOf(friends(cast = "Lfixture/Other;")), classOf(mainHelper()))
        assertTrue(noSwitch, noSwitch.contains("Friends link"))
        val noCheck = refusal(classOf(lookup()), classOf(friends()), classOf(mainHelper(string = "target_other_id")))
        assertTrue(noCheck, noCheck.contains(TARGET_TAB_ID))
    }
}
