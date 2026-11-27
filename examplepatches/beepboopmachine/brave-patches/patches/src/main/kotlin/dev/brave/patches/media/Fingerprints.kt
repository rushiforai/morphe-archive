package dev.brave.patches.media

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

internal object ToolbarPhoneInflateFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/toolbar/top/ToolbarPhone;",
    name = "onFinishInflate",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("ToolbarPhone.onFinishInflate")
    )
)

internal object ToolbarTintFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/toolbar/top/ToggleTabStackButton;",
    name = "i",
    returnType = "V",
    parameters = listOf("I"),
    filters = listOf(
        methodCall(returnType = "Landroid/content/res/ColorStateList;")
    )
)

internal object ToolbarUrlFocusFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/toolbar/top/ToolbarPhone;",
    name = "d3",
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        string("ToolbarPhone.triggerUrlFocusAnimation")
    )
)

internal object ToolbarPhoneDispatchDrawFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/toolbar/top/ToolbarPhone;",
    name = "dispatchDraw",
    returnType = "V",
    parameters = listOf("Landroid/graphics/Canvas;")
)

internal object ActiveTabSwitchFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/ActivityTabProvider;",
    name = "k",
    returnType = "V",
    parameters = listOf("Lorg/chromium/chrome/browser/tab/Tab;")
)

internal object NavigationStartFingerprint : Fingerprint(
    definingClass = "Lr1k;",
    name = "didStartNavigationInPrimaryMainFrame",
    returnType = "V",
    parameters = listOf("Lorg/chromium/content_public/browser/NavigationHandle;")
)

internal object NavigationFinishFingerprint : Fingerprint(
    definingClass = "Lr1k;",
    name = "didFinishNavigationInPrimaryMainFrame",
    returnType = "V",
    parameters = listOf("Lorg/chromium/content_public/browser/NavigationHandle;")
)

internal object TabDestroyFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/tab/TabImpl;",
    name = "destroyInternal",
    returnType = "I",
    parameters = listOf("Z")
)

internal object ClassLoaderMismatchFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("ClassLoader mismatch detected.\nA: ")
    )
)
