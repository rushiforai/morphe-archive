/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.tabbar

import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.navigation.starttab.TAB_TAG
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/*
 * How Facebook decides that a page it opens is a tab, on the 577, 580 and 581 builds.
 *
 * A Menu shortcut, a link or a notification for a page that has a tab passes through three places
 * that ask whether the account has that tab, and all three look in NavigationConfig's configured
 * list, not in the shown list the tab bar filter trims:
 *
 * - The main activity's startActivity hands each intent to a static method of a Redex class
 *   (LX/9gG; on 577, LX/9E7; on 580, LX/9tO; on 581) that maps the intent's extra_launch_uri to a
 *   configured tab through an ImmutableMap keyed by each tab's URI. Given a tab, the activity
 *   switches to it in place and starts nothing. The immersive activity and the URI router ask it
 *   too.
 * - FriendsUriMapHelper, a class Redex keeps, walks the configured list for the Friends tab's id
 *   and, finding it, turns the link into a switch to that tab.
 * - FbMainTabActivityUriHelper, also kept, turns a target_tab_id link to a tab the configured list
 *   holds into a switch, and one to any other tab into that tab's page on its own screen.
 *
 * A tab Hide tabs or Hide the Reels tab takes off the bar is still configured, so each of these
 * switched to a tab the bar hasn't got and nothing opened: on 581 the Menu's Marketplace shortcut,
 * with Marketplace hidden, closed the Menu onto Home. MarketplaceTabUriMapHelper asks the shown
 * list and opens Marketplace on its own screen already, but the startActivity lookup then switched
 * that screen back to the tab. The tab links patch hands each answer to the extension's
 * TabBarFilter, which keeps it for every tab but one a switch took off the bar, so Facebook opens
 * that page on its own screen, as it does for a tab the account isn't configured with.
 */
internal const val TAB_LINKS = "Tab links"

private const val TAB_BAR_FILTER_CLASS = "$EXTENSION_PACKAGE/navigation/TabBarFilter;"

/** The extension's answer for the tab a started page belongs to. */
internal const val LAUNCHED_TAB = "$TAB_BAR_FILTER_CLASS->launchedTab(Ljava/lang/Object;)Ljava/lang/Object;"

/** The extension's answer for the Friends tab a Friends link found. */
internal const val FRIENDS_TAB = "$TAB_BAR_FILTER_CLASS->friendsTab(Ljava/lang/Object;)Ljava/lang/Object;"

/** The extension's answer to whether a target_tab_id link's tab is configured. */
internal const val CONFIGURES_TAB = "$TAB_BAR_FILTER_CLASS->configuresTab(ZLjava/lang/Object;)Z"

/** The helper Facebook's Friends links go through. Redex keeps the name. */
internal const val FRIENDS_URI_HELPER = "Lcom/facebook/friending/jewel/uri/FriendsUriMapHelper;"

/** The helper Facebook's links to the main activity, target_tab_id ones among them, go through. Redex keeps the name. */
internal const val MAIN_TAB_URI_HELPER = "Lcom/facebook/katana/activity/FbMainTabActivityUriHelper;"

internal const val EXTRA_LAUNCH_URI = "extra_launch_uri"
internal const val TARGET_TAB_ID = "target_tab_id"

private const val INTENT = "Landroid/content/Intent;"
private const val FB_USER_SESSION = "Lcom/facebook/auth/usersession/FbUserSession;"
private const val IMMUTABLE_MAP_GET = "Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;"

/** Where a tab hook goes, in front of the instruction at [at], and the register holding the tab there. */
internal data class TabHook(val at: Int, val tab: Int)

/** Where the configured-tab check's hook goes, in front of the instruction at [at], with the answer's register and the tab's. */
internal data class ConfiguredCheck(val at: Int, val answer: Int, val tab: Int)

private fun Instruction.loadsString(string: String) =
    (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) &&
        ((this as ReferenceInstruction).reference as StringReference).string == string

private fun Instruction.readsConfiguredList() =
    opcode == Opcode.IGET_OBJECT && ((this as ReferenceInstruction).reference as FieldReference).let {
        it.definingClass == NAVIGATION_CONFIG && it.type == IMMUTABLE_LIST
    }

private fun Instruction.castsToTab(register: Int) =
    opcode == Opcode.CHECK_CAST && (this as OneRegisterInstruction).registerA == register &&
        ((this as ReferenceInstruction).reference as TypeReference).type == TAB_TAG

/**
 * Where [method] picks the configured tab a page being started belongs to, or null when it
 * doesn't.
 *
 * The method is static, takes an Intent and an FbUserSession and returns a TabTag. It reads the
 * configured list, loads "extra_launch_uri" and calls ImmutableMap.get once, keeping the answer
 * with a `move-result-object` that's cast to TabTag right after. The hook goes in front of the
 * cast, so the answer is the extension's before it's cast and returned.
 */
internal fun launchedTabLookup(method: Method): TabHook? {
    if (!AccessFlags.STATIC.isSet(method.accessFlags) || method.returnType != TAB_TAG) return null
    if (method.parameterTypes.map { it.toString() } != listOf(INTENT, FB_USER_SESSION)) return null
    val code = method.implementation?.instructions?.toList() ?: return null
    if (code.none { it.loadsString(EXTRA_LAUNCH_URI) } || code.none { it.readsConfiguredList() }) return null
    val get = code.indices.filter { code[it].call?.signature() == IMMUTABLE_MAP_GET }.singleOrNull() ?: return null
    val result = code.getOrNull(get + 1) ?: return null
    if (result.opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val tab = (result as OneRegisterInstruction).registerA
    if (code.getOrNull(get + 2)?.castsToTab(tab) != true) return null
    return TabHook(get + 2, tab)
}

/**
 * Where [method], one of FriendsUriMapHelper's, turns a Friends link into a switch to the Friends
 * tab, or null when it doesn't.
 *
 * The method reads the configured list and makes one call that takes an Intent and a TabTag and
 * returns an Intent: the switch. The tab it hands over was cast to TabTag right before an `if-eqz`
 * on it, and nothing between that check and the call writes it. The hook goes between the cast and
 * the check, where only a tab found in the list arrives.
 */
internal fun friendsTabMatch(method: Method): TabHook? {
    val code = method.implementation?.instructions?.toList() ?: return null
    if (code.none { it.readsConfiguredList() }) return null
    val switches = code.indices.filter { index ->
        code[index].call?.let {
            it.returnType == INTENT && it.parameterTypes.map(CharSequence::toString) == listOf(INTENT, TAB_TAG)
        } == true
    }
    val switch = switches.singleOrNull() ?: return null
    if (code[switch].opcode != Opcode.INVOKE_VIRTUAL) return null
    val tab = code[switch].callRegisters().getOrNull(2) ?: return null
    val check = (switch - 1 downTo 1).firstOrNull {
        code[it].opcode == Opcode.IF_EQZ && (code[it] as OneRegisterInstruction).registerA == tab
    } ?: return null
    if (!code[check - 1].castsToTab(tab)) return null
    if (code.subList(check, switch).any { writes(it, tab) }) return null
    return TabHook(check, tab)
}

/**
 * Where [method], one of FbMainTabActivityUriHelper's, checks whether a target_tab_id link's tab
 * is configured, or null when it doesn't.
 *
 * The method loads "target_tab_id". The check reads the configured list into a register, asks
 * that list's `contains` about the tab right after, and keeps the answer with a `move-result` in a
 * register other than the tab's. The hook goes after the `move-result`.
 */
internal fun configuredTabCheck(method: Method): ConfiguredCheck? {
    val code = method.implementation?.instructions?.toList() ?: return null
    if (code.none { it.loadsString(TARGET_TAB_ID) }) return null
    val checks = code.indices.filter { index ->
        val read = code[index]
        val asks = code.getOrNull(index + 1)?.takeIf { next ->
            next.call?.let {
                it.name == "contains" && it.returnType == "Z" &&
                    it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;")
            } == true
        }
        read.readsConfiguredList() && asks != null &&
            asks.callRegisters().firstOrNull() == (read as TwoRegisterInstruction).registerA
    }
    val check = checks.singleOrNull() ?: return null
    val result = code.getOrNull(check + 2) ?: return null
    if (result.opcode != Opcode.MOVE_RESULT) return null
    val answer = (result as OneRegisterInstruction).registerA
    val tab = code[check + 1].callRegisters().getOrNull(1) ?: return null
    if (answer == tab) return null
    return ConfiguredCheck(check + 3, answer, tab)
}
