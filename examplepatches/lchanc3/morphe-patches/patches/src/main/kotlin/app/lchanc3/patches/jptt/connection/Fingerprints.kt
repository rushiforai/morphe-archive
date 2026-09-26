package app.lchanc3.patches.jptt.connection

import app.lchanc3.patches.jptt.shared.Constants.ARTICLE_FRAGMENT_CLASS
import app.lchanc3.patches.jptt.shared.Constants.CONTENT_PAGER_ADAPTER_CLASS
import app.lchanc3.patches.jptt.shared.Constants.JSOCKET_CLASS
import app.lchanc3.patches.jptt.shared.Constants.MAIN_ACTIVITY_CLASS
import app.morphe.patcher.Fingerprint

/**
 * `MainActivity.onResume()`, which runs after `onStart()` has set
 * `activityIsActive`, so the reconnect the hook triggers is allowed to proceed.
 */
internal object MainActivityOnResumeFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY_CLASS,
    name = "onResume",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * `onFinish()` of the countdown `MainActivity.setDisconnected()` starts, which
 * reconnects when it runs out. An anonymous class, and the only CountDownTimer
 * MainActivity has, so it is found by what it extends rather than by its `$29`.
 */
internal object ReconnectCountdownFinishFingerprint : Fingerprint(
    name = "onFinish",
    returnType = "V",
    parameters = emptyList(),
    custom = { _, classDef ->
        classDef.superclass == "Landroid/os/CountDownTimer;" &&
            classDef.type.startsWith(MAIN_ACTIVITY_CLASS.removeSuffix(";") + "\$")
    },
)

/**
 * `MainActivity.notifyNotConnected()`, which blinks the 斷線了 banner. JPTT calls
 * it wherever something needed a connection that was not there.
 */
internal object NotifyNotConnectedFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY_CLASS,
    name = "notifyNotConnected",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * `ContentPagerAdapter.onPageSelected(int)`, which runs on every change of the
 * screen in the content pane: opening an article, going back, swiping back.
 */
internal object ContentPageSelectedFingerprint : Fingerprint(
    definingClass = CONTENT_PAGER_ADAPTER_CLASS,
    name = "onPageSelected",
    returnType = "V",
    parameters = listOf("I"),
)

/**
 * The listener MainActivity puts on its sliding pane, which holds the sidebar
 * (J熱門, 我的最愛 and the rest) over the content pane. An article opened from the
 * sidebar is the only page of the content pane, so going back from it slides
 * the sidebar open instead of changing the page.
 */
private fun sidebarPaneListener(method: String) = object : Fingerprint(
    name = method,
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    custom = { _, classDef ->
        classDef.type.startsWith(MAIN_ACTIVITY_CLASS.removeSuffix(";") + "\$") &&
            "Landroidx/slidingpanelayout/widget/SlidingPaneLayout\$PanelSlideListener;" in classDef.interfaces
    },
) {}

internal val SidebarOpenedFingerprint = sidebarPaneListener("onPanelOpened")
internal val SidebarClosedFingerprint = sidebarPaneListener("onPanelClosed")

/** `ArticleFragment.getMorePush(Runnable)`, behind the 檢查有無新推文 row. */
internal object ArticleGetMorePushFingerprint : Fingerprint(
    definingClass = ARTICLE_FRAGMENT_CLASS,
    name = "getMorePush",
    returnType = "V",
    parameters = listOf("Ljava/lang/Runnable;"),
)

/**
 * `JSocket.processReadCharacter(char)`, which reads the login screens and
 * answers them. Found by the one login refusal it already knows.
 */
internal object ProcessReadCharacterFingerprint : Fingerprint(
    definingClass = JSOCKET_CLASS,
    name = "processReadCharacter",
    returnType = "Z",
    parameters = listOf("C"),
    strings = listOf("登入太頻繁"),
)
