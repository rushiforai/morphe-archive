/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.starttab

import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/*
 * How Facebook picks the tab its main screen opens on, on the 577 and 580 builds.
 *
 * The launcher icon starts com.facebook.katana.activity.FbMainTabActivity, through the manifest's
 * LoginActivity alias. Its tabs are subclasses of com.facebook.navigation.tabbar.state.model.TabTag
 * (FeedTab, WatchTab, FriendRequestsTab, MarketplaceTab, NotificationsTab, BookmarkTab, FeedsTab
 * and more), names Redex keeps, and each hands TabTag's constructor a long: the tab's bookmark id,
 * 1606854132932955 for Marketplace on both builds. The extension's FacebookTabs holds the ids.
 *
 * One method picks the start tab from the launching intent. It takes the context, the intent and
 * the user session and answers a tab id. When the intent carries the extra "target_tab_id" and the
 * tab bar has that tab, that's the answer. When the bar doesn't have it, the answer is the bar's
 * first tab, Home. With no such extra, the answer comes from Facebook's own rules (Home, or the
 * last tab under some configurations). Facebook's start-up code asks it about the main screen's
 * own intent, and so does the kept com.facebook.startup.destination.StartupDestinationRouter, which
 * predicts the destination to fetch for early. Facebook's own tab shortcuts and notifications reach
 * a tab by putting its id in that extra, and a link or notification also carries the extras
 * "tabbar_target_intent" or "extra_launch_uri" the main screen routes by.
 *
 * So the patch never touches the picker. It checks that the picker is still there, and gives the
 * main screen, as it's created from the launcher icon, a copy of its intent asking for the chosen
 * tab. Everything that picks a tab after that point sees the request, and Facebook's own check
 * that the tab bar has the tab stays in charge.
 */
internal const val PATCH = "Open on a chosen tab"

/** The intent extra Facebook's main screen opens a tab by. */
internal const val TARGET_TAB_ID = "target_tab_id"

internal const val INTENT = "Landroid/content/Intent;"

/** The extension's hook, first thing in every Facebook activity's onCreate. */
internal const val ROUTE =
    "$EXTENSION_PACKAGE/navigation/StartTabRoute;->onActivityCreate(Landroid/app/Activity;Landroid/os/Bundle;)V"

/** The base class of every tab. Redex keeps the name. */
internal const val TAB_TAG = "Lcom/facebook/navigation/tabbar/state/model/TabTag;"

/** The router that predicts a start's destination, and asks the picker about the main screen's. */
internal const val STARTUP_DESTINATION_ROUTER = "Lcom/facebook/startup/destination/StartupDestinationRouter;"

private fun Method.calls(definingClass: String, name: String, parameters: List<String>, returnType: String) =
    implementation?.instructions?.any { instruction ->
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@any false
        call.definingClass == definingClass && call.name == name && call.returnType == returnType &&
            call.parameterTypes.map { it.toString() } == parameters
    } == true

/**
 * Whether [method] is Facebook's start tab picker: it answers a long, takes an intent, loads
 * "target_tab_id", asks the intent whether it has that extra and reads it as a long. The
 * extension's own classes, which load the same literal to write it, don't count.
 */
internal fun picksStartTab(method: Method): Boolean =
    !method.definingClass.startsWith(EXTENSION_PACKAGE) &&
        method.returnType == "J" &&
        method.parameterTypes.any { it.toString() == INTENT } &&
        holdsString(method, TARGET_TAB_ID) &&
        method.calls(INTENT, "hasExtra", listOf("Ljava/lang/String;"), "Z") &&
        method.calls(INTENT, "getLongExtra", listOf("Ljava/lang/String;", "J"), "J")
