/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.maintabs

import app.morphe.util.names.origString
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireParameterIntact
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.branchTarget
import app.morphe.util.call
import app.morphe.util.definitionReaches
import app.morphe.util.namedRegisters
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

private const val PATCH = "Hide Contacts tab"
internal const val MAIN_TABS = "$EXTENSION_PACKAGE/misc/MainTabs;"
private const val STRINGS = "Lorg/telegram/messenger/R\$string;->"
internal const val CONTACTS_LABEL = "${STRINGS}MainTabsContacts:I"
internal const val CALLS_LABEL = "${STRINGS}MainTabsCalls:I"
internal const val SHOW_CALLS_TAB = "Lorg/telegram/messenger/UserConfig;->showCallsTab:Z"
internal const val CONTACTS_SCREEN = "Lorg/telegram/ui/ContactsActivity;"
internal const val MOTION_EVENT = "Landroid/view/MotionEvent;"
private const val CONTEXT = "Landroid/content/Context;"
private const val VIEW = "Landroid/view/View;"
private const val OBJECT = "Ljava/lang/Object;"
internal const val TABS_SHOWN = "$MAIN_TABS->tabsShown(Ljava/lang/Object;Z)V"
internal const val BLOCKS_SWIPE = "$MAIN_TABS->blocksSwipe(IZ)Z"

/** The Contacts page and its tab, both second on the main screen. MainTabs.CONTACTS holds the same number. */
internal const val CONTACTS = 1

/** How far past Telegram's own Calls switch it turns the pager away from a page it hid. */
private const val LEAVE_WITHIN = 12

internal val CONSTANTS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16)

@Suppress("unused")
val hideContactsTabPatch = bytecodePatch(
    name = PATCH,
    description = "Removes the Contacts tab from the bar at the bottom of the main screen, and swiping doesn't open its page " +
        "either. The Calls or Settings tab stays as Telegram has it, and the chat list's new message button still opens your " +
        "contacts. A second switch, Compact bottom bar, makes that bar shorter and only as wide as its tabs need. A third, " +
        "Side menu, brings back a menu that slides in when you swipe right on the chat list. All three start off. Turn them " +
        "on in HushTelegram settings > Chat list.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val plan = resolveMainTabs()
        requireStatusMethod("compactTabBar")
        requireStatusMethod("sideMenu")
        requireStatusMethod("hideNewMessage")
        val compact = resolveCompactBar(plan)
        val side = resolveSideMenu(plan)
        val newMessage = resolveNewMessageButton()
        // Assembled on copies first, so a refusal leaves the app untouched.
        plan.insert { target, apply -> apply(MutableMethod(ImmutableMethod.of(target))) }
        compact.rehearse()
        side.rehearse()
        newMessage.rehearse()
        writeMainTabsStubs(plan)
        plan.insert { target, apply -> apply(target) }
        // Each extra switch's own targets: a build where one changed keeps the Contacts switch.
        if (compact.missing == null) {
            compact.apply()
            enableCapability("compactTabBar")
        } else {
            patchLog.warning("$PATCH: ${compact.missing}. The patch goes on without the compact bar.")
        }
        if (side.missing == null) {
            side.apply(this)
            enableCapability("sideMenu")
        } else {
            patchLog.warning("$PATCH: ${side.missing}. The patch goes on without the side menu.")
        }
        if (newMessage.missing == null) {
            newMessage.apply()
            enableCapability("hideNewMessage")
        } else {
            patchLog.warning("$PATCH: ${newMessage.missing}. The patch goes on without the new message switch.")
        }
        enableStatus("hideContactsTab")
    }
}

/**
 * One of the pager's two swipe questions, overridden for the main screen: [method] answers whether
 * the page showing lets a swipe go [forward] (or back). [position] and [direction] are locals
 * nothing reads before the method's own first instruction writes them.
 */
internal class SwipeGate(val method: MutableMethod, val forward: Boolean, val position: Int, val direction: Int)

/**
 * What the main screen is made of, by the shapes that find it.
 *
 * @property screen the main screen's class
 * @property tabs its array of tab views, Contacts second
 * @property bar its tab bar
 * @property setTab the bar's call that shows or hides one tab view, with or without animation
 * @property shown the screen's method that sets which of Calls and Settings the bar shows, and
 *   [shownReturn] its one return, where the hook goes
 * @property pager the screen's pager, a field of its superclass
 * @property position the pager's page showing now
 * @property slide the pager's animated turn to a page
 * @property set the pager's plain setter of the page, which the screen uses while it builds
 * @property mark the screen's marking of the selected tab
 * @property swipeStart the pager's start of a swipe, which takes the event and whether it goes forward
 */
internal class MainTabsPlan(
    val screen: String,
    val tabs: String,
    val bar: String,
    val setTab: String,
    val shown: MutableMethod,
    val shownReturn: Int,
    val pager: String,
    val position: String,
    val slide: String,
    val set: String,
    val mark: String,
    val gates: List<SwipeGate>,
    val swipeStart: String,
) {
    /** Hands each method that gets code to [change] with the edit that does it, copy or real. */
    fun insert(change: (MutableMethod, (MutableMethod) -> Unit) -> Unit) {
        change(shown) { tabsShown(it, shownReturn) }
        gates.forEach { gate -> change(gate.method) { swipeGate(it, gate, position) } }
    }
}

/**
 * At the end of the method that sets Calls or Settings, on every way out of it: the extension
 * gets the screen and whether Telegram animates the change, and hides Contacts the same way.
 */
private fun tabsShown(target: MutableMethod, at: Int) {
    val self = target.localRegisterCount()
    target.addInstructionsAtControlFlowLabel(at, "invoke-static {v$self, v${target.parameterRegisterNumber(1)}}, $TABS_SHOWN")
}

/**
 * In front of a swipe question: the page showing and the way the swipe goes, to the extension.
 * On true the question answers no, as it does when the page in view turns a swipe down; on false
 * Telegram asks the page as it always did.
 */
private fun swipeGate(target: MutableMethod, gate: SwipeGate, position: String) {
    val self = target.localRegisterCount()
    target.addInstructionsWithLabels(
        0,
        """
            iget v${gate.position}, v$self, $position
            const/4 v${gate.direction}, ${if (gate.forward) "0x1" else "0x0"}
            invoke-static {v${gate.position}, v${gate.direction}}, $BLOCKS_SWIPE
            move-result v${gate.position}
            if-eqz v${gate.position}, :hush_stock
            const/4 v${gate.position}, 0x0
            return v${gate.position}
        """,
        ExternalLabel("hush_stock", target.getInstruction(0)),
    )
}

/**
 * Telegram's main screen builds its bar from five tab views it keeps in an array, labelled Chats,
 * Contacts, Settings, Calls and Profile, and shows one of Settings and Calls by a method it calls
 * with the user's Calls choice. Its pages sit in a pager its superclass holds, a subclass of
 * Telegram's swipeable pager that asks the page in view before a swipe goes on or back.
 */
internal fun BytecodePatchContext.resolveMainTabs(): MainTabsPlan {
    requireStatusMethod("hideContactsTab")
    controlHook(MAIN_TABS, "tabsShown", listOf(OBJECT, "Z"), "V")
    controlHook(MAIN_TABS, "blocksSwipe", listOf("I", "Z"), "Z")
    controlHook(MAIN_TABS, "hideContacts", listOf(OBJECT, "Z"), "Z")
    controlHook(MAIN_TABS, "page", listOf(OBJECT), "I")
    controlHook(MAIN_TABS, "showChats", listOf(OBJECT, "Z"), "V")

    // The main screen: the one view that labels the Contacts and Calls tabs and reads the Calls choice.
    val screens = mutableListOf<String>()
    forEachClassMentioning(Mention.allReferences(listOf(CONTACTS_LABEL, CALLS_LABEL, SHOW_CALLS_TAB))) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        if (cls.methods.any { m -> isBuild(m) && m.controlBody().let { body ->
                listOf(CONTACTS_LABEL, CALLS_LABEL, SHOW_CALLS_TAB).all { ref -> body.any { it.controlRef() == ref } } } }) {
            screens += cls.type
        }
    }
    shape(screens.size == 1, "the main screen is missing or ambiguous (${screens.size})")
    val screenType = screens.single()
    val screen = tgMutableClassDefBy(screenType)
    val build = screen.methods.single(::isBuild)
    val body = build.controlBody()
    val flow = ControlFlow.of(build)

    // Its tab views: the array it makes and keeps, the Contacts tab stored second.
    val kept = body.indices.mapNotNull { i ->
        val array = body[i]
        val store = body.getOrNull(i + 1) ?: return@mapNotNull null
        val field = store.controlField()
        if (array.opcode == Opcode.NEW_ARRAY && store.opcode == Opcode.IPUT_OBJECT && field?.origDefiningClass == screenType &&
            field.origType == array.controlRef() && store.namedRegisters()[0] == array.namedRegisters()[0]) field.toString() else null
    }.distinct()
    shape(kept.size == 1, "the main screen no longer keeps one array of tabs (${kept.size})")
    val tabs = kept.single()
    val tabType = tabs.substringAfter(":[")
    val contactsReads = body.indices.filter { body[it].controlRef() == CONTACTS_LABEL }
    shape(contactsReads.size == 1, "the main screen labels Contacts more than once")
    val label = contactsReads.single()
    val stored = (label + 1 until body.size).firstOrNull { body[it].opcode == Opcode.APUT_OBJECT }
        ?: throw shapeError("the Contacts tab is no longer stored with the tabs")
    shape((label + 1 until stored).none { body[it].controlRef()?.startsWith(STRINGS) == true },
        "another tab is labelled before the Contacts tab is stored")
    val (tab, array, index) = body[stored].namedRegisters()
    val labelRegister = body[label].namedRegisters()[0]
    val result = defined(flow, stored, tab)
    shape(result != null && body[result].opcode == Opcode.MOVE_RESULT_OBJECT && result > label + 1 &&
        labelRegister in body[result - 1].namedRegisters() && flow.definitionReaches(label, result - 1, labelRegister),
        "the tab stored after the Contacts label isn't the one made with it")
    val tabsRead = defined(flow, stored, array)
    shape(tabsRead != null && body[tabsRead].opcode == Opcode.IGET_OBJECT && body[tabsRead].controlRef() == tabs,
        "the Contacts tab no longer goes into the kept tabs")
    shape(constant(body, flow, stored, index) == CONTACTS, "the Contacts tab is no longer the second tab")

    // The page Telegram builds for Contacts is the second too.
    shape(contactsPage(screen) == CONTACTS, "the Contacts page is no longer the second page")

    // The method that shows Calls or Settings, called with the user's choice once the bar is built.
    val choices = body.indices.filter { body[it].opcode == Opcode.IGET_BOOLEAN && body[it].controlRef() == SHOW_CALLS_TAB }
    val shownCalls = choices.flatMap { read ->
        val choice = body[read].namedRegisters()[0]
        (read + 1 until minOf(body.size, read + 4)).filter { at ->
            body[at].opcode == Opcode.INVOKE_VIRTUAL && body[at].call()?.let { c ->
                c.origDefiningClass == screenType && c.origParameterTypes == listOf("Z", "Z") && c.origReturnType == "V"
            } == true && body[at].namedRegisters().getOrNull(1) == choice
        }.map { body[it].controlRef()!! }
    }.distinct()
    shape(shownCalls.size == 1, "the main screen no longer shows Calls or Settings by the user's choice (${shownCalls.size})")
    val shownRef = shownCalls.single()
    val shown = screen.methods.single { signature(it) == shownRef }
    shape(!AccessFlags.STATIC.isSet(shown.accessFlags), "Calls or Settings is shown by a static method")
    val shownBody = shown.controlBody()
    val shownFlow = ControlFlow.of(shown)
    val returns = shownBody.indices.filter { shownBody[it].opcode == Opcode.RETURN_VOID }
    shape(returns.size == 1 && returns.single() == shownBody.lastIndex, "the Calls or Settings method has more than one way out")
    val shownReturn = returns.single()

    // In it, the bar shows or hides each of the two tabs, a tab view taken from the kept array.
    val toggles = shownBody.indices.filter { at ->
        shownBody[at].opcode == Opcode.INVOKE_VIRTUAL && shownBody[at].call()?.let { c ->
            c.origParameterTypes == listOf(VIEW, "Z", "Z") && c.origReturnType == "V"
        } == true
    }
    shape(toggles.size == 2 && toggles.map { shownBody[it].controlRef() }.distinct().size == 1,
        "the Calls or Settings method no longer shows one tab and hides the other")
    val setTab = shownBody[toggles.first()].controlRef()!!
    val bars = toggles.map { at ->
        val (receiver, view) = shownBody[at].namedRegisters()
        val viewRead = defined(shownFlow, at, view)
        val arrayRead = if (viewRead != null && shownBody[viewRead].opcode == Opcode.AGET_OBJECT) {
            defined(shownFlow, viewRead, shownBody[viewRead].namedRegisters()[1])
        } else null
        shape(arrayRead != null && shownBody[arrayRead].opcode == Opcode.IGET_OBJECT && shownBody[arrayRead].controlRef() == tabs,
            "the Calls or Settings tab no longer comes from the kept tabs")
        val barRead = defined(shownFlow, at, receiver) ?: throw shapeError("the tabs are no longer shown by one bar")
        shape(shownBody[barRead].opcode == Opcode.IGET_OBJECT && shownBody[barRead].controlField()?.origDefiningClass == screenType,
            "the tabs are no longer shown by the screen's own bar")
        shownBody[barRead].controlRef()!!
    }.distinct()
    shape(bars.size == 1, "the Calls and Settings tabs are shown by different bars")
    val bar = bars.single()
    val barType = bar.substringAfter(":")
    shape(setTab.substringBefore("->") in superclassChain(barType).toList(), "the tab bar can't show or hide its tabs")
    val self = shown.localRegisterCount()
    val animated = shown.parameterRegisterNumber(1)
    shape(self <= 15 && animated <= 15, "the Calls or Settings method's registers are out of a call's reach")
    shown.requireThisIntact(PATCH, listOf(shownReturn))
    shown.requireParameterIntact(PATCH, 1, listOf(shownReturn))

    // The pager: the superclass's one field whose type answers the two swipe questions for this screen.
    val superType = screen.superclass ?: throw shapeError("the main screen has no superclass")
    val holder = tgClassDefByOrNull(superType) ?: throw shapeError("the main screen's superclass is missing")
    val pagers = holder.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.origType.startsWith("L") }.mapNotNull { field ->
        val type = tgClassDefByOrNull(field.type) ?: return@mapNotNull null
        val base = type.superclass?.let(::classDefByOrNull) ?: return@mapNotNull null
        val turn = swipeTurn(base) ?: return@mapNotNull null
        val own = listOf(turn.forward, turn.backward).map { name -> type.methods.singleOrNull { gateShape(it, name) } }
        if (own.any { it == null }) null else Triple(field, type, turn)
    }
    shape(pagers.size == 1, "the main screen's pager is missing or ambiguous (${pagers.size})")
    val (pagerField, pagerClass, turn) = pagers.single()
    val pager = "${pagerField.definingClass}->${pagerField.name}:${pagerField.type}"
    val pagerChain = superclassChain(pagerClass.type).toList()

    val gates = listOf(true to turn.forward, false to turn.backward).map { (forward, name) ->
        val method = tgMutableClassDefBy(pagerClass.type).methods.single { gateShape(it, name) }
        val what = "the pager's ${if (forward) "forward" else "backward"} swipe question"
        // Only the main screen's pages answer it, which makes it the main screen's pager alone.
        shape(method.controlBody().any { it.opcode == Opcode.CHECK_CAST && it.controlRef() == screenType },
            "$what no longer belongs to the main screen")
        shape(ControlFlow.of(method).normal.none { 0 in it }, "something jumps back to the start of $what")
        val gateSelf = method.localRegisterCount()
        shape(gateSelf <= 15, "$what keeps this out of a field read's reach")
        val (position, direction) = method.freeLocalsAt(PATCH, 0, 2)
        SwipeGate(method, forward, position, direction)
    }

    // Telegram's own way off a page it hides: right after the Calls switch, a slide to the first
    // page and the mark on its tab, both with the same page.
    val notified = screen.methods.filter { m ->
        m.origName == "didReceivedNotification" && !AccessFlags.STATIC.isSet(m.accessFlags) &&
            m.origParameterTypes == listOf("I", "I", "[Ljava/lang/Object;")
    }
    shape(notified.size == 1, "the main screen no longer hears Telegram's notifications")
    val heard = notified.single().controlBody()
    val leaves = heard.indices.filter { heard[it].controlRef() == shownRef }.mapNotNull { switched ->
        val window = switched + 1 until minOf(heard.size, switched + LEAVE_WITHIN)
        val slideAt = window.firstOrNull { at ->
            heard[at].opcode == Opcode.INVOKE_VIRTUAL && heard[at].call()?.let { c ->
                c.origDefiningClass in pagerChain && c.origParameterTypes == listOf("I") && c.origReturnType == "Z"
            } == true
        } ?: return@mapNotNull null
        val markAt = (slideAt + 1 until window.last + 1).firstOrNull { at ->
            heard[at].opcode == Opcode.INVOKE_VIRTUAL && heard[at].call()?.let { c ->
                c.origDefiningClass == screenType && c.origParameterTypes == listOf("I", "Z") && c.origReturnType == "V"
            } == true
        } ?: return@mapNotNull null
        if (heard[slideAt].namedRegisters()[1] != heard[markAt].namedRegisters()[1]) return@mapNotNull null
        heard[slideAt].controlRef()!! to heard[markAt].controlRef()!!
    }.distinct()
    shape(leaves.size == 1, "Telegram no longer turns the main screen away from a tab it hides (${leaves.size})")
    val (slide, mark) = leaves.single()

    // The pager's plain page setter: the superclass sets the first page with it while it builds the view.
    val holderBuild = holder.methods.filter(::isBuild)
    shape(holderBuild.size == 1, "the main screen's superclass no longer builds the pager")
    val holderBody = holderBuild.single().controlBody()
    val sets = holderBody.indices.filter { at ->
        val c = holderBody[at].call()
        holderBody[at].opcode == Opcode.INVOKE_VIRTUAL && c != null && c.origDefiningClass in pagerChain &&
            c.origParameterTypes == listOf("I") && c.origReturnType == "V" &&
            holderBody.getOrNull(at - 1)?.let { read ->
                read.opcode == Opcode.IGET && read.controlField()?.let { it.origDefiningClass == superType && it.origType == "I" } == true &&
                    read.namedRegisters()[0] == holderBody[at].namedRegisters()[1]
            } == true
    }.map { holderBody[it].controlRef()!! }.distinct()
    shape(sets.size == 1, "the pager's first page is no longer set while the screen builds (${sets.size})")
    val set = sets.single()

    // Everything the extension's stubs name has to be reachable from it.
    listOf(tabs, bar, pager, turn.position).forEach { requireReachable(it, static = false) }
    listOf(setTab, slide, set, mark).forEach { requireReachable(it, static = false) }
    shape(tgClassDefByOrNull(tabType)?.let { AccessFlags.PUBLIC.isSet(it.accessFlags) } == true, "the tab views are inaccessible")

    return MainTabsPlan(screenType, tabs, bar, setTab, shown, shownReturn, pager, turn.position, slide, set, mark, gates, turn.start)
}

/** The stubs' bodies: hide the Contacts tab, read the page showing, and turn the screen to Chats. */
internal fun BytecodePatchContext.writeMainTabsStubs(plan: MainTabsPlan) {
    writeStub(MAIN_TABS, "hideContacts", 6, """
        check-cast p0, ${plan.screen}
        iget-object v0, p0, ${plan.bar}
        if-eqz v0, :hush_none
        iget-object v1, p0, ${plan.tabs}
        if-eqz v1, :hush_none
        array-length v2, v1
        const/4 v3, $CONTACTS
        if-le v2, v3, :hush_none
        aget-object v1, v1, v3
        if-eqz v1, :hush_none
        const/4 v2, 0x0
        invoke-virtual {v0, v1, v2, p1}, ${plan.setTab}
        const/4 v0, 0x1
        return v0
        :hush_none
        const/4 v0, 0x0
        return v0
    """)
    writeStub(MAIN_TABS, "page", 2, """
        check-cast p0, ${plan.screen}
        iget-object v0, p0, ${plan.pager}
        if-eqz v0, :hush_none
        iget v0, v0, ${plan.position}
        return v0
        :hush_none
        const/4 v0, -0x1
        return v0
    """)
    writeStub(MAIN_TABS, "showChats", 4, """
        check-cast p0, ${plan.screen}
        iget-object v0, p0, ${plan.pager}
        if-eqz v0, :hush_done
        const/4 v1, 0x0
        if-eqz p1, :hush_still
        invoke-virtual {v0, v1}, ${plan.slide}
        goto :hush_mark
        :hush_still
        invoke-virtual {v0, v1}, ${plan.set}
        :hush_mark
        invoke-virtual {p0, v1, p1}, ${plan.mark}
        :hush_done
        return-void
    """)
}

/**
 * The two swipe questions Telegram's pager asks before a swipe moves a page, where it keeps the page
 * showing, and [start], the method that asks them.
 */
internal class SwipeTurn(val forward: String, val backward: String, val position: String, val start: String)

/**
 * The pager's start of a swipe takes the event and whether it goes forward. It refuses at either
 * end, comparing the page showing with the page count less one, then asks one question before a
 * forward swipe and another before a backward one.
 */
private fun swipeTurn(base: ClassDef): SwipeTurn? {
    val starts = base.methods.filter { m ->
        !AccessFlags.STATIC.isSet(m.accessFlags) && m.origReturnType == "Z" &&
            m.origParameterTypes == listOf(MOTION_EVENT, "Z") && m.controlBody().isNotEmpty()
    }
    val found = starts.mapNotNull { start ->
        val body = start.controlBody()
        val way = start.parameterRegisterNumber(1)
        fun asked(test: Opcode) = body.indices.filter { at ->
            at > 0 && body[at - 1].opcode == test && body[at - 1].namedRegisters() == listOf(way) &&
                body[at].opcode == Opcode.INVOKE_VIRTUAL && body[at].call()?.let { c ->
                    c.origDefiningClass == base.origType && c.origParameterTypes == listOf(MOTION_EVENT) && c.origReturnType == "Z"
                } == true
        }
        val forward = asked(Opcode.IF_EQZ).singleOrNull() ?: return@mapNotNull null
        val backward = asked(Opcode.IF_NEZ).singleOrNull() ?: return@mapNotNull null
        val flow = ControlFlow.of(start)
        val positions = body.indices.filter { it < forward && body[it].opcode == Opcode.IF_EQ }.mapNotNull { at ->
            val (shown, last) = body[at].namedRegisters()
            val read = defined(flow, at, shown)?.let { body[it] }
            val less = defined(flow, at, last)?.let { body[it] }
            val field = read?.controlField()
            val lessOne = when (less?.opcode) {
                Opcode.SUB_INT_2ADDR -> less.namedRegisters()[0] == last
                Opcode.ADD_INT_LIT8, Opcode.ADD_INT_LIT16 -> (less as NarrowLiteralInstruction).narrowLiteral == -1
                else -> false
            }
            if (read?.opcode == Opcode.IGET && field?.origDefiningClass == base.origType && field.origType == "I" && lessOne) field.toString() else null
        }.distinct()
        val position = positions.singleOrNull() ?: return@mapNotNull null
        SwipeTurn(body[forward].call()!!.name, body[backward].call()!!.name, position, signature(start))
    }
    return found.singleOrNull()
}

/** A swipe question as a subclass answers it: an instance method of [name] taking the event and answering a boolean. */
private fun gateShape(m: Method, name: String) = m.origName == name && !AccessFlags.STATIC.isSet(m.accessFlags) &&
    m.origReturnType == "Z" && m.origParameterTypes == listOf(MOTION_EVENT) && m.controlBody().isNotEmpty()

/** The number of the page the screen builds Contacts for. */
private fun contactsPage(screen: ClassDef): Int? = pageBuilt(screen, CONTACTS_SCREEN)

/**
 * The number of the page the screen builds a [type] screen for: the constant its page builder
 * compares the page with last before making it, or null when that isn't plain.
 */
internal fun pageBuilt(screen: ClassDef, type: String): Int? {
    val builders = screen.methods.filter { m ->
        !AccessFlags.STATIC.isSet(m.accessFlags) && m.origParameterTypes == listOf("I") &&
            m.origReturnType.startsWith("L") && m.controlBody().any { it.opcode == Opcode.NEW_INSTANCE && it.controlRef() == CONTACTS_SCREEN }
    }
    if (builders.size != 1) return null
    val builder = builders.single()
    val body = builder.controlBody()
    val flow = ControlFlow.of(builder)
    val page = builder.parameterRegisterNumber(0)
    val makes = body.indices.filter { body[it].opcode == Opcode.NEW_INSTANCE && body[it].controlRef() == type }
    if (makes.size != 1) return null
    val made = makes.single()
    // The test that leads there: the page against a constant, jumping past the Contacts page when they differ.
    val test = (made - 1 downTo 0).firstOrNull { body[it].opcode == Opcode.IF_NE && page in body[it].namedRegisters() } ?: return null
    try {
        builder.requireParameterIntact(PATCH, 0, listOf(test))
    } catch (overwritten: PatchException) {
        return null
    }
    if (body.branchTarget(test) { throw shapeError(it) } <= made) return null
    val other = body[test].namedRegisters().singleOrNull { it != page } ?: return null
    return constant(body, flow, test, other)
}

/** Whether [m] is a view's build: an instance `createView` taking a context. */
internal fun isBuild(m: Method) = m.origName == "createView" && !AccessFlags.STATIC.isSet(m.accessFlags) && m.origReturnType == VIEW &&
    m.origParameterTypes == listOf(CONTEXT) && m.controlBody().isNotEmpty()

/** The one instruction before [use] whose write of [register] reaches it on every path, or null. */
internal fun defined(flow: ControlFlow, use: Int, register: Int): Int? = (use - 1 downTo 0).firstOrNull { at ->
    val instruction = flow.instructions[at]
    val destination = instruction.namedRegisters().firstOrNull()
    instruction.opcode.setsRegister() && (destination == register || instruction.opcode.setsWideRegister() && destination?.plus(1) == register)
}?.takeIf { flow.definitionReaches(it, use, register) }

/** The constant [register] holds at [use], when one plain constant is all that reaches it. */
internal fun constant(body: List<Instruction>, flow: ControlFlow, use: Int, register: Int): Int? {
    val at = defined(flow, use, register) ?: return null
    return if (body[at].opcode in CONSTANTS) (body[at] as NarrowLiteralInstruction).narrowLiteral else null
}

private fun signature(m: Method) = m.origString()

private fun shapeError(what: String) = PatchException("$PATCH: $what (before editing)")

private fun shape(ok: Boolean, what: String) {
    if (!ok) throw shapeError(what)
}
