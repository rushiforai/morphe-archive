/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.starttab

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.facebook.misc.settings.MAIN_TAB_ACTIVITY
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The route Open on a chosen tab asks by, on every Facebook build the bundle declares: one method
 * picks the main screen's start tab from an intent's "target_tab_id", checks the tab bar has it
 * and otherwise answers a tab of the bar's own; the kept start-up router asks it about the main
 * screen; each tab the extension offers is the kept TabTag subclass whose constructor hands TabTag
 * the id the extension asks for; and what the landing check reads is there under the names it
 * reads. Then the patch itself, run on the build's own main screen classes. Reads the fixture
 * bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class StartTabFixtureTest {
    private val facebookTabs = "Lapp/morphe/extension/facebook/navigation/FacebookTabs;"
    private val fragmentActivity = "Lcom/facebook/base/activity/FbFragmentActivity;"
    private val delegate = "Lcom/facebook/katana/activity/FbMainTabActivityDelegate;"
    private val navigationConfig = "Lcom/facebook/navigation/tabbar/state/model/NavigationConfig;"
    private val bundle = "Landroid/os/Bundle;"
    private val wideConstants = setOf(Opcode.CONST_WIDE, Opcode.CONST_WIDE_16, Opcode.CONST_WIDE_32, Opcode.CONST_WIDE_HIGH16)

    /** The tabs the extension offers, by the class Facebook keeps, with the id it asks for. */
    private val offered: Map<String, Long> by lazy {
        fun descriptor(javaName: String) = "L" + javaName.replace('.', '/') + ";"
        val tabs = listOf("HOME", "FEEDS", "VIDEO", "FRIENDS", "MARKETPLACE", "NOTIFICATIONS", "MENU").associate { tab ->
            descriptor(ExtensionDex.stringConstant(facebookTabs, "${tab}_CLASS")) to
                ExtensionDex.longConstant(facebookTabs, "${tab}_ID")
        }
        tabs + (descriptor(ExtensionDex.stringConstant(facebookTabs, "MOST_RECENT_CLASS")) to
            ExtensionDex.longConstant(facebookTabs, "FEEDS_ID"))
    }

    private val Instruction.call: MethodReference?
        get() = (this as? ReferenceInstruction)?.reference as? MethodReference

    /** The registers a call reads, in order, whether it's written as a range or not. */
    private fun Instruction.registers(): List<Int> = when (this) {
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        else -> emptyList()
    }

    private fun code(method: Method) = method.implementation!!.instructions.toList()

    /**
     * Whether [tab]'s constructor hands TabTag's constructor [id] as the tab's id: the one long
     * TabTag takes is loaded with it, into the registers the call passes the long in.
     */
    private fun handsItsId(tab: ClassDef, id: Long): Boolean = tab.methods.filter { it.name == "<init>" }.any { init ->
        val body = code(init)
        body.any { instruction ->
            val call = instruction.call ?: return@any false
            if (call.definingClass != TAB_TAG || call.name != "<init>") return@any false
            val types = call.parameterTypes.map { it.toString() }
            if (types.count { it == "J" } != 1) return@any false
            val at = 1 + types.takeWhile { it != "J" }.map { if (it == "D") 2 else 1 }.sum()
            val register = instruction.registers().getOrNull(at) ?: return@any false
            body.any {
                it.opcode in wideConstants && (it as OneRegisterInstruction).registerA == register &&
                    (it as WideLiteralInstruction).wideLiteral == id
            }
        }
    }

    @Test
    fun `each declared build opens the tab an intent's target_tab_id names, and the patch goes in on its main screen`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        assertEquals("the tabs the extension offers", 8, offered.size)
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (fixture in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = fixture.name

                // One picker, shaped (context, intent, session) -> tab id.
                val pickers = FixtureDex.methodsWhere(fixture, { dex -> dex.stringSection.any { it == TARGET_TAB_ID } }, ::picksStartTab)
                assertEquals("$name: start tab pickers", 1, pickers.size)
                val picker = pickers.single()
                assertEquals(
                    "$name: the picker's parameters",
                    listOf("Landroid/content/Context;", INTENT, "Lcom/facebook/auth/usersession/FbUserSession;"),
                    picker.parameterTypes.map { it.toString() },
                )
                val pickerCode = code(picker)
                // When the extra names a tab the bar hasn't got, the answer is a tab of the bar's
                // own, by TabTag's id: the picker reads that long off a TabTag.
                assertTrue(
                    "$name: the picker answers no TabTag's id",
                    pickerCode.any { instruction ->
                        instruction.opcode == Opcode.IGET_WIDE &&
                            ((instruction as ReferenceInstruction).reference as FieldReference).let {
                                it.definingClass == TAB_TAG && it.type == "J"
                            }
                    },
                )

                val kept = setOf(MAIN_TAB_ACTIVITY, fragmentActivity, delegate, navigationConfig, TAB_TAG,
                    STARTUP_DESTINATION_ROUTER, picker.definingClass) + offered.keys
                val classes = FixtureDex.classes(fixture, kept)
                assertEquals("$name: classes missing", emptySet<String>(), kept - classes.keys)

                // The router Facebook keeps predicts the main screen's destination by asking the picker.
                val router = classes.getValue(STARTUP_DESTINATION_ROUTER).methods.single { it.name == "getDestination" }
                assertTrue(
                    "$name: getDestination doesn't ask the picker",
                    code(router).any { it.call?.let { c -> c.definingClass == picker.definingClass && c.name == picker.name } == true },
                )

                // Every tab the extension offers, by the id it asks for.
                offered.forEach { (type, id) ->
                    val tab = classes.getValue(type)
                    assertEquals("$name: $type extends", TAB_TAG, tab.superclass)
                    assertTrue("$name: $type doesn't hand TabTag the id $id", handsItsId(tab, id))
                }

                // What the landing check reads: TabTag's one long, the screen's current tab, the
                // delegate's lazy tab bar state, and the configuration's list.
                val tabTag = classes.getValue(TAB_TAG)
                assertEquals("$name: TabTag's longs", 1,
                    tabTag.fields.count { it.type == "J" && !AccessFlags.STATIC.isSet(it.accessFlags) })
                assertTrue(
                    "$name: FbMainTabActivity keeps no getCurrentTab()",
                    classes.getValue(MAIN_TAB_ACTIVITY).methods.any {
                        it.name == "getCurrentTab" && it.parameterTypes.isEmpty() && it.returnType == TAB_TAG
                    },
                )
                assertTrue(
                    "$name: the delegate keeps no tab bar state",
                    classes.getValue(delegate).fields.any { it.name == "tabBarStateManager\$delegate" },
                )
                assertTrue(
                    "$name: NavigationConfig holds no list",
                    classes.getValue(navigationConfig).fields.any { it.type == "Lcom/google/common/collect/ImmutableList;" },
                )

                // The patch, on this build's main screen classes and picker.
                val context = PatchContexts.of(
                    listOf(classes.getValue(MAIN_TAB_ACTIVITY), classes.getValue(fragmentActivity),
                        classes.getValue(picker.definingClass), ExtensionDex.classDef(SETTINGS_STATUS)),
                )
                openOnChosenTabPatch.execute(context)
                assertTrue(
                    "$name: the main screen declares an onCreate of its own",
                    classes.getValue(MAIN_TAB_ACTIVITY).methods.none { it.name == "onCreate" },
                )
                val onCreate = context.mutableClassDefBy(fragmentActivity).methods.single {
                    it.name == "onCreate" && it.parameterTypes.map(CharSequence::toString) == listOf(bundle)
                }
                val first = onCreate.implementation!!.instructions.first()
                assertEquals("$name: the hook's call", ROUTE, (first as ReferenceInstruction).reference.toString())
                val registers = onCreate.implementation!!.registerCount
                assertEquals("$name: the hook reads this and the saved state", (registers - 2) to 2,
                    (first as RegisterRangeInstruction).startRegister to first.registerCount)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
