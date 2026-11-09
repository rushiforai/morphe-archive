/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.maintabs

import app.morphe.util.names.origString
import app.morphe.util.names.origDescriptor
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.addInstructions
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.ControlFlow
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.TelegramNames
import app.morphe.util.names.tgClassDefBy
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

internal const val SIDE_MENU = "$EXTENSION_PACKAGE/misc/SideMenu;"
internal const val SWIPE_STARTS = "$SIDE_MENU->swipeStarts(Ljava/lang/Object;Landroid/view/MotionEvent;Z)V"
internal const val MENU_BACK = "$SIDE_MENU->back(Ljava/lang/Object;Z)Z"
internal const val PROFILE_SCREEN = "Lorg/telegram/ui/ProfileActivity;"

/** The Profile page, fourth of the main screen's pages. SideMenu.PROFILE holds the same number. */
internal const val PROFILE = 3

/** Where the menu's rows go: Telegram's own screens, each opened from a link the main activity already handles. */
internal const val LAUNCHER = "Lorg/telegram/ui/LaunchActivity;"
internal val LINKS = listOf("tg:settings", "tg:calllog", "tg:openmessage", "new_dialog")

private const val USER_CONFIG = "Lorg/telegram/messenger/UserConfig;"
private const val USER = "Lorg/telegram/tgnet/TLRPC\$User;"
private const val GET_INSTANCE = "$USER_CONFIG->getInstance(I)$USER_CONFIG"
private const val CLIENT_ID = "$USER_CONFIG->getClientUserId()J"
private const val CURRENT_USER = "$USER_CONFIG->getCurrentUser()$USER"
private const val USER_NAME = "Lorg/telegram/messenger/UserObject;->getUserName($USER)Ljava/lang/String;"
private const val TELEGRAM_STRING = "Lorg/telegram/messenger/LocaleController;->getString(I)Ljava/lang/String;"
private const val STRING_IDS = "Lorg/telegram/messenger/R\$string;->"
private const val ADD_ACCOUNT = "${STRING_IDS}AddAccount:I"
private const val CLIENT_ACTIVATED = "$USER_CONFIG->isClientActivated()Z"
private const val VIEW = "Landroid/view/View;"

/**
 * Telegram's own words for the menu's rows, in SideMenu.Row's order: My Profile, New Message,
 * Contacts, Calls, Saved Messages and Settings.
 */
internal val LABELS = listOf("MyProfile", "NewMessageTitle", "Contacts", "Calls", "SavedMessages", "Settings")

/**
 * What the side menu needs from Telegram, or [missing], why this build can't have it.
 *
 * @property start the pager's start of a swipe, where [SWIPE_STARTS] goes first
 * @property back the main screen's answer to Back, where [MENU_BACK] goes first, borrowing [borrowed]
 * @property screenField the pager's field holding the screen it belongs to
 * @property backward the main screen pager's backward swipe question
 * @property accounts the main screen's account switcher, shown from a view
 * @property currentAccount the screen's account number
 */
internal class SideMenu(
    val start: MutableMethod?,
    val back: MutableMethod?,
    val borrowed: Int,
    val screenField: String,
    val backward: String,
    val accounts: String,
    val currentAccount: String,
    val plan: MainTabsPlan?,
    val missing: String?,
) {
    /** The same edits on copies, so a smali problem refuses before the app is touched. */
    fun rehearse() {
        if (missing != null) return
        insert(MutableMethod(ImmutableMethod.of(start!!)), MutableMethod(ImmutableMethod.of(back!!)))
    }

    fun apply(context: BytecodePatchContext) {
        if (missing != null) return
        context.writeSideMenuStubs(this)
        insert(start!!, back!!)
    }

    private fun insert(start: MutableMethod, back: MutableMethod) {
        // Every swipe the pager starts goes past the extension first, with the pager, the event and the way.
        val self = start.localRegisterCount()
        start.addInstructions(0, "invoke-static {v$self, v${self + 1}, v${self + 2}}, $SWIPE_STARTS")
        // Back closes an open menu before the main screen hears it; false is the screen's "handled".
        val screen = back.localRegisterCount()
        back.addInstructionsWithLabels(
            0,
            """
                invoke-static {v$screen, v${screen + 1}}, $MENU_BACK
                move-result v$borrowed
                if-eqz v$borrowed, :hush_stock
                const/4 v$borrowed, 0x0
                return v$borrowed
            """,
            ExternalLabel("hush_stock", back.getInstruction(0)),
        )
    }
}

/**
 * The side menu's places in Telegram. The main screen's pager starts each swipe in one method of its
 * base class, which turns down a backward swipe on the first page before asking anything: the hook
 * sees that swipe and asks the pager's own backward question, which the chat list answers yes to on
 * its first folder, the way Telegram's old drawer opened. Back reaches the main screen's own answer.
 * The rows open Telegram's screens: pages of the main screen, its account switcher, and links its
 * activity already handles.
 */
internal fun BytecodePatchContext.resolveSideMenu(plan: MainTabsPlan): SideMenu {
    controlHook(SIDE_MENU, "swipeStarts", listOf("Ljava/lang/Object;", "Landroid/view/MotionEvent;", "Z"), "V")
    controlHook(SIDE_MENU, "back", listOf("Ljava/lang/Object;", "Z"), "Z")
    fun missing(why: String) = SideMenu(null, null, 0, "", "", "", "", null, why)

    // The swipe start: a method of the pager's base class that reads the page showing and turns a
    // backward swipe down with false before it calls anything.
    val base = plan.swipeStart.substringBefore("->")
    val start = tgMutableClassDefBy(base).methods.singleOrNull { signatureOf(it) == plan.swipeStart }
        ?: return missing("the pager's swipe start is gone")
    val opening = start.controlBody().takeWhile { ((it as? ReferenceInstruction)?.reference is MethodReference).not() }
    if (opening.none { it.opcode == Opcode.IGET && it.controlRef() == plan.position } || opening.none { it.opcode == Opcode.RETURN }) {
        return missing("the pager no longer turns down a swipe back from the first page")
    }
    if (start.localRegisterCount() + 2 > 15) return missing("the pager's swipe start keeps its parameters out of a call's reach")

    // The pager's way back to its screen: the field its backward question reads and casts to the screen.
    val gate = plan.gates.single { !it.forward }.method
    val holder = tgClassDefBy(plan.screen).superclass ?: return missing("the main screen has no superclass")
    val gateBody = gate.controlBody()
    val screenFields = gateBody.indices.filter { at ->
        gateBody[at].opcode == Opcode.IGET_OBJECT && gateBody[at].controlField()?.origType == holder &&
            gateBody.getOrNull(at + 1)?.let { it.opcode == Opcode.CHECK_CAST && it.controlRef() == plan.screen } == true
    }.map { gateBody[it].controlRef()!! }.distinct()
    if (screenFields.size != 1) return missing("the pager no longer knows its screen (${screenFields.size})")
    val backward = signatureOf(gate)

    // The Profile page, which the menu's first row turns to.
    val screen = tgClassDefBy(plan.screen)
    if (pageBuilt(screen, PROFILE_SCREEN) != PROFILE) return missing("the Profile page is no longer the fourth page")

    // The account switcher Telegram shows on a long press of the Profile tab.
    val switchers = screen.methods.filter { m ->
        !AccessFlags.STATIC.isSet(m.accessFlags) && m.origReturnType == "V" && m.origParameterTypes == listOf(VIEW) &&
            m.controlBody().let { body -> body.any { it.controlRef() == ADD_ACCOUNT } && body.any { it.controlRef() == CLIENT_ACTIVATED } }
    }
    if (switchers.size != 1) return missing("the main screen's account switcher is missing or ambiguous (${switchers.size})")
    val accounts = signatureOf(switchers.single())

    // Back: the main screen's own answer, with a local free at its start for the menu's answer.
    val backs = tgMutableClassDefBy(plan.screen).methods.filter { m ->
        m.origName == "onBackPressed" && !AccessFlags.STATIC.isSet(m.accessFlags) && m.origReturnType == "Z" &&
            m.origParameterTypes == listOf("Z") && m.controlBody().isNotEmpty()
    }
    if (backs.size != 1) return missing("the main screen no longer answers Back itself (${backs.size})")
    val back = backs.single()
    if (back.localRegisterCount() + 1 > 15) return missing("the main screen's Back keeps its parameters out of a call's reach")
    if (ControlFlow.of(back).normal.any { 0 in it }) return missing("something jumps back to the start of the main screen's Back")
    // A Back with no local to spare leaves the menu out, never the rest of the patch.
    val borrowed = try {
        back.freeLocalsAt("Hide Contacts tab", 0, 1).single()
    } catch (full: PatchException) {
        return missing("the main screen's Back has no local to spare")
    }

    // The screen's account number, from the fragment class every screen extends.
    val accountGetters = superclassChain(plan.screen).mapNotNull { type -> tgClassDefByOrNull(type) }.flatMap { cls ->
        cls.methods.filter { m ->
            m.origName == "getCurrentAccount" && !AccessFlags.STATIC.isSet(m.accessFlags) && m.origReturnType == "I" && m.parameterTypes.isEmpty() &&
                AccessFlags.PUBLIC.isSet(m.accessFlags) && AccessFlags.PUBLIC.isSet(cls.accessFlags)
        }.map { signatureOf(it) }
    }
    val currentAccount = accountGetters.firstOrNull() ?: return missing("Telegram's screens no longer give their account number")

    // The links the rows open, handled by Telegram's main activity.
    val launcher = tgClassDefByOrNull(LAUNCHER) ?: return missing("Telegram's main activity is gone")
    val handled = launcher.methods.flatMap { m -> m.controlBody().mapNotNull { it.controlString() } }.toSet()
    LINKS.firstOrNull { it !in handled }?.let { return missing("Telegram's main activity no longer opens $it") }

    // Everything the stubs name, reachable from the extension.
    val reachable = listOf(
        plan.position to false, screenFields.single() to false, backward to false, accounts to false, currentAccount to false,
        GET_INSTANCE to true, CLIENT_ID to false, CURRENT_USER to false, USER_NAME to true, TELEGRAM_STRING to true,
    ) + LABELS.map { "$STRING_IDS$it:I" to true }
    reachable.firstOrNull { (reference, static) -> !reaches(reference, static) }?.let { return missing("${it.first} isn't reachable") }

    return SideMenu(start, back, borrowed, screenFields.single(), backward, accounts, currentAccount, plan, null)
}

/** The stubs' bodies: the pager's screen and backward question, a page turn, the account switcher and Telegram's words. */
internal fun BytecodePatchContext.writeSideMenuStubs(menu: SideMenu) {
    val plan = menu.plan!!
    val pagerType = plan.pager.substringAfter(":")
    writeStub(SIDE_MENU, "screen", 3, """
        instance-of v0, p0, $pagerType
        if-eqz v0, :hush_none
        check-cast p0, $pagerType
        iget-object v0, p0, ${menu.screenField}
        instance-of v1, v0, ${plan.screen}
        if-eqz v1, :hush_none
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """)
    writeStub(SIDE_MENU, "mayOpen", 3, """
        check-cast p0, $pagerType
        invoke-virtual {p0, p1}, ${menu.backward}
        move-result v0
        return v0
    """)
    writeStub(SIDE_MENU, "turnTo", 4, """
        check-cast p0, ${plan.screen}
        iget-object v0, p0, ${plan.pager}
        if-eqz v0, :hush_done
        invoke-virtual {v0, p1}, ${plan.slide}
        const/4 v1, 0x1
        invoke-virtual {p0, p1, v1}, ${plan.mark}
        :hush_done
        return-void
    """)
    writeStub(SIDE_MENU, "accounts", 2, """
        check-cast p0, ${plan.screen}
        invoke-virtual {p0, p1}, ${menu.accounts}
        return-void
    """)
    writeStub(SIDE_MENU, "labels", 3, buildString {
        appendLine("const/16 v0, ${LABELS.size}")
        appendLine("new-array v0, v0, [Ljava/lang/String;")
        LABELS.forEachIndexed { i, key ->
            appendLine("sget v1, $STRING_IDS$key:I")
            appendLine("invoke-static {v1}, $TELEGRAM_STRING")
            appendLine("move-result-object v1")
            appendLine("const/16 v2, $i")
            appendLine("aput-object v1, v0, v2")
        }
        appendLine("return-object v0")
    })
    writeStub(SIDE_MENU, "selfId", 3, """
        check-cast p0, ${plan.screen}
        invoke-virtual {p0}, ${menu.currentAccount}
        move-result v0
        invoke-static {v0}, $GET_INSTANCE
        move-result-object v0
        invoke-virtual {v0}, $CLIENT_ID
        move-result-wide v0
        return-wide v0
    """)
    // The user and the name stay in separate registers: one register holding the user on the
    // null path and the name on the other merges to Object, which ART refuses to return as a
    // String, and that failed the whole SideMenu class on the first swipe.
    writeStub(SIDE_MENU, "selfName", 3, """
        check-cast p0, ${plan.screen}
        invoke-virtual {p0}, ${menu.currentAccount}
        move-result v0
        invoke-static {v0}, $GET_INSTANCE
        move-result-object v0
        invoke-virtual {v0}, $CURRENT_USER
        move-result-object v1
        if-eqz v1, :hush_none
        invoke-static {v1}, $USER_NAME
        move-result-object v0
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """)
}

/** Whether [reference], a method or a field, is public on a public class, and static or not as [static] says. */
private fun BytecodePatchContext.reaches(reference: String, static: Boolean): Boolean {
    // A resource id 13.2 inlined has no field left; the stub's read of it becomes that number.
    if (static && TelegramNames.current().resourceOf(reference) != null) return true
    val owner = tgClassDefByOrNull(reference.substringBefore("->")) ?: return false
    val member = reference.substringAfter("->")
    if (!AccessFlags.PUBLIC.isSet(owner.accessFlags)) return false
    return if ('(' in member) {
        // A method may be inherited, so the whole chain counts.
        superclassChain(owner.type).mapNotNull { tgClassDefByOrNull(it) }.any { cls ->
            cls.methods.any { "${it.origName}${it.origDescriptor}" == member &&
                AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == static }
        }
    } else {
        owner.fields.any { "${it.origName}:${it.origType}" == member && AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == static }
    }
}

private fun signatureOf(m: Method) = m.origString()
