// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.inbox

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

internal const val MAIN_ACTIVITY_DESCRIPTOR = "Lcom/onelouder/baconreader/ui/main/MainActivity;"
internal const val DRAWER_HANDLER_DESCRIPTOR = "Lcom/onelouder/baconreader/DrawerHandler;"
internal const val LINK_PROCESSOR_DESCRIPTOR = "Lcom/onelouder/baconreader/LinkProcessor;"
private const val LISTING_DESCRIPTOR = "Lcom/onelouder/baconreader/reddit/Listing;"

/**
 * The drawer's items, just before they show: updateDrawer builds the list, then hands it to the adapter with
 * DrawerAdapter.setItems(items).
 */
internal object UpdateDrawerFingerprint : Fingerprint(
    definingClass = DRAWER_HANDLER_DESCRIPTOR,
    name = "updateDrawer",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(definingClass = "Lcom/onelouder/baconreader/adapters/DrawerAdapter;", name = "setItems"),
    ),
)

/** The drawer's item click listener, onItemClick(parent, view, position, id), which switches on the item's tag. */
internal object DrawerItemClickFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/DrawerHandler\$1;",
    name = "onItemClick",
    returnType = "V",
    parameters = listOf("Landroid/widget/AdapterView;", "Landroid/view/View;", "I", "J"),
)

internal object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY_DESCRIPTOR,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        methodCall(name = "onCreate", parameters = listOf("Landroid/os/Bundle;")),
    ),
)

/** Opens the feed of MainActivity.linksetKey: on start, and when the subreddit, sort or query changes. */
internal object MainActivityOpenLinksetFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY_DESCRIPTOR,
    name = "openLinkset",
    returnType = "V",
    parameters = listOf(),
)

internal object MainActivityOnResumeFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY_DESCRIPTOR,
    name = "onResume",
    returnType = "V",
    parameters = listOf(),
)

internal object MainActivityOnPauseFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY_DESCRIPTOR,
    name = "onPause",
    returnType = "V",
    parameters = listOf(),
)

internal object MainActivityOnDestroyFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY_DESCRIPTOR,
    name = "onDestroy",
    returnType = "V",
    parameters = listOf(),
)

internal object MainActivityOnBackPressedFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY_DESCRIPTOR,
    name = "onBackPressed",
    returnType = "V",
    parameters = listOf(),
)

/** Shows or hides the toolbar's menu items, then returns super.onPrepareOptionsMenu(menu). */
internal object MainActivityOnPrepareOptionsMenuFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY_DESCRIPTOR,
    name = "onPrepareOptionsMenu",
    returnType = "Z",
    parameters = listOf("Landroid/view/Menu;"),
    filters = listOf(
        methodCall(name = "onPrepareOptionsMenu", parameters = listOf("Landroid/view/Menu;")),
    ),
)

internal object MainActivityOnOptionsItemSelectedFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY_DESCRIPTOR,
    name = "onOptionsItemSelected",
    returnType = "Z",
    parameters = listOf("Landroid/view/MenuItem;"),
)

/** Delivers the result of the chat's file chooser, which the activity started. */
internal object MainActivityOnActivityResultFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY_DESCRIPTOR,
    name = "onActivityResult",
    returnType = "V",
    parameters = listOf("I", "I", "Landroid/content/Intent;"),
)

/** The intent of a link BaconReader opens, from the comments, posts and LinkDispatcher. */
internal object LinkProcessorGetIntentFingerprint : Fingerprint(
    definingClass = LINK_PROCESSOR_DESCRIPTOR,
    name = "getIntent",
    returnType = "Landroid/content/Intent;",
    parameters = listOf(),
)

/**
 * The unread messages of the app's background message check, which notifies of them and sets the inbox envelope:
 * listing.getChildren(Message.class).
 */
internal object CheckMessagesOnMessagesReceivedFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/services/workmanager/CheckMessagesExecutor;",
    name = "onMessagesReceived",
    returnType = "V",
    parameters = listOf(LISTING_DESCRIPTOR),
    filters = listOf(
        methodCall(definingClass = LISTING_DESCRIPTOR, name = "getChildren"),
    ),
)

/** A page of messages the inbox loads, on any of its tabs: listing.getChildren(Message.class). */
internal object InboxAdapterOnCompleteFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/adapters/InboxAdapter\$1;",
    name = "onComplete",
    returnType = "V",
    parameters = listOf(LISTING_DESCRIPTOR),
    filters = listOf(
        methodCall(definingClass = LISTING_DESCRIPTOR, name = "getChildren"),
    ),
)
