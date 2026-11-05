package app.template.patches.firefoxfocus.addons

import app.morphe.patcher.Fingerprint

internal const val EXTENSION_CLASS_DESCRIPTOR = "Lapp/template/extension/firefoxfocus/FocusAddons;"

internal const val WEB_EXTENSION_CONTROLLER = "Lorg/mozilla/geckoview/WebExtensionController;"
internal const val PROMPT_DELEGATE = "Lorg/mozilla/geckoview/WebExtensionController\$PromptDelegate;"
internal const val WEB_EXTENSION_ACTION = "Lorg/mozilla/geckoview/WebExtension\$Action;"
internal const val GECKO_RESULT = "Lorg/mozilla/geckoview/GeckoResult;"
internal const val FOCUS_APPLICATION = "Lorg/mozilla/focus/FocusApplication;"
internal const val BROWSER_MENU = "Lorg/mozilla/focus/menu/browser/BrowserMenu;"
internal const val MENU_MIDDLEWARE = "Lorg/mozilla/focus/menu/MenuMiddleware;"
internal const val BROWSER_STATE = "Lmozilla/components/browser/state/state/BrowserState;"

// Focus is built with -dontobfuscate and GeckoView's consumer rules keep org.mozilla.geckoview.**
// with their names, so these class and method names are stable anchors (verified in 158.0; the
// menu anchors in 159.0.1).

// WebExtensionController.setPromptDelegate(PromptDelegate): Android Components' GeckoEngine
// registers its prompt delegate here from FocusApplication.onCreate (WebExtensionSupport.initialize).
object SetPromptDelegateFingerprint : Fingerprint(
    definingClass = WEB_EXTENSION_CONTROLLER,
    name = "setPromptDelegate",
    returnType = "V",
    parameters = listOf(PROMPT_DELEGATE),
)

object FocusApplicationOnCreateFingerprint : Fingerprint(
    definingClass = FOCUS_APPLICATION,
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

// BrowserMenu.menuGroupsFor(BrowserState, Drawable): builds the groups of Focus's Compose browser
// menu (159 replaced Android Components' WebExtensionBrowserMenuBuilder with it), for the first
// state and on every BrowserState change. R8 narrows its List return type, so it is not pinned.
object BrowserMenuGroupsFingerprint : Fingerprint(
    definingClass = BROWSER_MENU,
    name = "menuGroupsFor",
    parameters = listOf(BROWSER_STATE, "Landroid/graphics/drawable/Drawable;"),
)

// MenuMiddleware.invoke(Store, Function1, MenuAction): the browser menu's middleware, which sees
// every tap (MenuItemTapped) first. 159.0.1 keeps only the erased Function3 bridge
// (Object, Object, Object)Object, so the parameter types are not pinned, only their count.
object MenuMiddlewareInvokeFingerprint : Fingerprint(
    definingClass = MENU_MIDDLEWARE,
    name = "invoke",
    custom = { method, _ -> method.parameterTypes.size == 3 && method.implementation != null },
)

// WebExtension$Action.openPopup(GeckoResult<GeckoSession>, String popupUri): both popup paths end
// here (the action click's onTogglePopup and the controller's OpenPopup message).
object ActionOpenPopupFingerprint : Fingerprint(
    definingClass = WEB_EXTENSION_ACTION,
    name = "openPopup",
    returnType = "V",
    parameters = listOf(GECKO_RESULT, "Ljava/lang/String;"),
)
