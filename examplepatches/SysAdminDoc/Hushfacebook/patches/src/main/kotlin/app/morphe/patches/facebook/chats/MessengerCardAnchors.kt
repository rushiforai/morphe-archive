/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.chats

import app.morphe.patches.facebook.feed.holdsString
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

/**
 * Where the "Get the Messenger app" card in Facebook's own Chats comes from, on the 577 and 580
 * builds.
 *
 * Chats (`messaginginblue`'s InboxActivity) builds the rows above the chat list from a fixed list
 * of plugin objects. Each plugin answers two things: whether it shows (a boolean method over the
 * context, the user session, two helpers, the `ThreadListParams` of the list and the list's
 * state), and the component it shows. The top banners form one group, and the list takes the
 * first of them that says yes. The Messenger card is one of them. Its builder tags the banner
 * `mib-native-dismissible-top-banner` and hands back either the card with the "Get the %1$s app
 * for even more fun ways to connect with others" text and its Get Messenger button, or an older
 * design of the same card. No other method in either build loads that tag.
 *
 * Facebook already answers no when Messenger is installed, through a check that asks the package
 * manager for `com.facebook.orca` and keeps the answer only when `isSameSignature` says Messenger
 * is signed with Facebook's own key (`PackageManager.checkSignatures`). A re-signed Facebook
 * carries another key, so Messenger never counts and the card shows above the chat list for good.
 *
 * The plugin's class and both its methods are Redex names (`AfW` on 580, `Ahw` on 577), so the
 * question is found by the tag its sibling builder holds and by the kept types it takes.
 */
internal const val PATCH = "Hide the Get Messenger card"

/** The test tag the card's builder puts on the banner. */
internal const val TOP_BANNER_TAG = "mib-native-dismissible-top-banner"

internal const val THREAD_LIST_PARAMS = "Lcom/facebook/messaginginblue/inbox/model/params/threadlist/ThreadListParams;"
private const val CONTEXT = "Landroid/content/Context;"
private const val USER_SESSION = "Lcom/facebook/auth/usersession/FbUserSession;"

private fun Method.parameters(): List<String> = parameterTypes.map { it.toString() }

private fun Method.isInstanceWithBody(): Boolean =
    implementation != null && !AccessFlags.STATIC.isSet(accessFlags) && !AccessFlags.ABSTRACT.isSet(accessFlags)

/** The card's builder: an instance method taking the list's `ThreadListParams` that loads the banner's tag. */
internal fun isCardBuilder(method: Method): Boolean =
    method.isInstanceWithBody() && method.returnType.startsWith("L") &&
        THREAD_LIST_PARAMS in method.parameters() && holdsString(method, TOP_BANNER_TAG)

/**
 * The question a Chats plugin answers before it shows: an instance method answering a boolean over
 * the context, the user session, two renamed helpers, the list's `ThreadListParams` and the
 * renamed list state, in that order.
 */
internal fun isShowQuestion(method: Method): Boolean {
    val parameters = method.parameters()
    return method.isInstanceWithBody() && method.returnType == "Z" && parameters.size == 6 &&
        parameters[0] == CONTEXT && parameters[1] == USER_SESSION && parameters[4] == THREAD_LIST_PARAMS
}

/**
 * The Messenger card's question, when [owner] is the card's plugin: a class with one builder
 * loading the banner's tag and one show question. Null for any other class.
 */
internal fun cardQuestion(owner: ClassDef): Method? {
    if (owner.methods.count(::isCardBuilder) != 1) return null
    return owner.methods.filter(::isShowQuestion).singleOrNull()
}
