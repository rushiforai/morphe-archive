# Implementation

Target: original `com.android.chrome` 153.0.8010.53, version code 801005304, ARM64.
The version gate runs inside each feature patch even if Morphe compatibility is forced. Stable strings locate host code;
exact descriptors, call counts and resource IDs validate the supported artifact. These are not cross-version hooks.

## Settings and state

A resource patch adds a native Preference entry to MainSettings, opening a private, non-exported MorpheSettingsActivity.
The feature switches use one SharedPreferences file, `chrome_patch`. The old `incognito_default` choice migrates to
`remember_last_mode`, preserving an explicit opt-out. `last_mode_incognito` stores only a mode bit.
Black mode is controlled only from Morphe settings. Hiding the toolbar button never hides the settings entry.

The application hook initializes only the browser's main process. Application context is retained, activities are weakly
tracked, and appearance changes recreate an existing activity on return so native backgrounds/layout can be restored.
Native authentication state and secure-window flags are not modified.

## Browsing modes

The mode button calls Chrome's native menu action for an empty collection and TabModelSelector for existing tabs.
Incognito availability uses Chrome's native profile policy check. Remembered-mode routing covers MAIN/LAUNCHER and external
HTTP(S) full-browser intents, preserving trusted internal regular-tab choices and CustomTabActivity routing.

The full-browser activity records the selected mode on pause, including native tab-view selections, and after a toolbar
mode switch. It waits for native tab-state initialization before recording or restoring, so the transient startup regular
model cannot replace the remembered choice. Launcher restoration selects an existing native model or uses Chrome's native
new-tab command when the destination is empty. A newer intent cancels pending launcher restoration. With no saved mode,
Chrome keeps its native startup choice. Custom Tabs do not update the remembered full-browser mode; disabling the setting
restores native routing. Incognito tab persistence and authentication remain Chrome's responsibility.

Toolbar inflation is hooked immediately after the native super call: later R8 code reuses the receiver register and can
jump straight to a return. Branch-target external-link instructions are replaced rather than inserting a skippable prefix.
The button reads final model state before drawing; a disabled button uses GONE so the address field reclaims its width.

Closing the last Incognito tab in the Hub retains the focused empty Incognito pane and its native new-tab control.
Its coordinator is still destroyed, releasing the closed session's UI resources. Native tab removal, model selection,
profile destruction and unfocused-pane cleanup remain intact. The empty pane does not retain a hidden tab or a live
private tab model. Remembered mode reads the focused pane while the Hub is visible, and the current model otherwise.
This separates the user's choice of empty pane from Chrome's session lifetime. The empty-pane behavior is independent
of the remembered-launch-mode toggle.

The exact-target [IncognitoTabSwitcherPane](https://github.com/chromium/chromium/blob/153.0.8010.53/chrome/android/features/tab_ui/java/src/org/chromium/chrome/browser/tasks/tab_management/IncognitoTabSwitcherPane.java)
source explains pane cleanup. [ChromeNextTabPolicySupplier](https://github.com/chromium/chromium/blob/153.0.8010.53/chrome/android/java/src/org/chromium/chrome/browser/app/tabmodel/ChromeNextTabPolicySupplier.java)
provides the native Hub-visible check. Shipped bytecode validates each hook; source names alone are not patch fingerprints.

## Bottom positioning

The native toolbar controller retains its IME, tab-switcher and Find-in-page transitions. Runtime gates suppress its
new-tab/focus-to-top decisions only with True bottom enabled. That setting also overrides the native top preference;
choosing Top in Chrome's address-bar settings disables True bottom. Disabling the extension restores native decisions.

The suggestions container uses the available space above the actual toolbar. NTP morph hooks preserve a real editable
bottom field. HubToolbarView keeps its native controls/listeners; its wrapper anchors at the bottom and the tab grid
reserves the measured toolbar/search height. Layout changes recalculate that reservation for rotation and pane changes. The separate SearchActivity translates its field above the visible keyboard without changing its native wrap-content measurement, and removes the native below-toolbar anchor from its result container, reserving the space above the field. Keeping measurement at the original position prevents a portrait margin from collapsing the field when the window becomes shorter in landscape.

## Tab picker

`TabPickerPatch` connects a horizontal Android view inside the native toolbar resource container to the current
`TabModel`. It stores no tab metadata on disk and performs no favicon network requests. Favicons come from Chrome's
`TabFavicon.getBitmapWithFallback`; unavailable icons use a local fallback. Selection and closure resolve IDs in the
current model at click time, using native `setIndex(FROM_USER)` and `TabRemover.closeTabs` with dialogs allowed.
Native group protections and regular-tab Undo remain in that path. The last private close first focuses the native Hub;
a bounded pre-draw callback completes it only while the same model is still current and unlocked. Native empty-pane
handling then retains the viewer without retaining a private session.

The picker inserts a 48dp margin above ToolbarPhone before native container measurement. The native measured-height
supplier feeds the bottom-controls stack, reserving page space and moving the entire captured toolbar when scrolling.
Chrome temporarily hides its Android toolbar while showing the compositor texture; this must not remove the picker's
measured height. Active-tab outlines are inset 6dp vertically without shrinking the 48dp tap targets. The native hairline
is invisible only while the picker is present and is restored when the picker hides. The picker disallows parent
touch interception on the initial down event, including events directed to tab children, so horizontal gestures scroll
the row rather than invoking Chrome's toolbar tab-switch gesture. Explicit pressed/focused backgrounds avoid an
extra selected-state underline on the S26 while retaining the accessibility selection state.

The opt-in `tab_picker` choice requires `true_bottom`. Settings disables the switch while True bottom is off without
changing the saved choice. Only full ChromeTabbedActivity receives the picker. It hides for the Hub, address entry,
paused/unfocused activities, a native top-position transition and native pending/showing Incognito authentication.
Private metadata is cleared on pause or hiding. Native title/favicon/order changes invalidate the view; count and active
index are checked before draw without a timer. Activity references are weak, and rows retain IDs rather than native Tabs.

The exact-target [ToolbarControlContainer](https://github.com/chromium/chromium/blob/153.0.8010.53/chrome/browser/ui/android/toolbar/java/src/org/chromium/chrome/browser/toolbar/top/ToolbarControlContainer.java),
[TabRemover](https://github.com/chromium/chromium/blob/153.0.8010.53/chrome/browser/tabmodel/android/java/src/org/chromium/chrome/browser/tabmodel/TabRemover.java)
and [TabFavicon](https://github.com/chromium/chromium/blob/153.0.8010.53/chrome/android/java/src/org/chromium/chrome/browser/tab/TabFavicon.java)
sources explain these native boundaries; shipped bytecode validates the descriptors.

## Black theme

Black chooses Chrome's existing dark configuration plus an independent palette flag. Chrome's Theme screen retains
its original System default, Light and Dark choices. Selecting a native theme clears the Black flag so native theme
choices remain effective. The Morphe switch is the sole Black-mode control.

Dark neutral backgrounds map to #000000, including translucent fills composited over black; accent colors, text colors and rendered websites are not globally
recolored. Hooks cover native background/tint setters and ToolbarPhone's background palette, with a layout pass for
XML-created background drawables. FeedItemDecoration paints suggested article card backgrounds separately beneath the article content. Its standard and staggered layout background draw calls receive the same surface mapping; article text, images and layout retain their native rendering. Super dispatch is preserved to avoid recursively re-entering overridden setters.
Stateful background palettes retain their state specifications and ordering using the validated [Android 16 ColorStateList parcel format](https://github.com/aosp-mirror/platform_frameworks_base/blob/android16-release/core/java/android/content/res/ColorStateList.java); an unrecognized format is left unchanged. PopupWindow, ListPopupWindow and Dialog surfaces are normalized through their own content tree because they are outside the Activity decor tree. The flag gates all transforms; activity recreation restores original drawables when disabled.

## Account integration

The optional MicroG patch replaces Chrome's account-provider lookup and token
service transport, retaining its native account IDs, callback protocol, scopes,
consent handling and error recovery. Android account creation and repair use the
MicroG account type. A separate, narrowly scoped Trusted Vault client override
routes encryption-key recovery through MicroG without changing the security
domain or the verification UI. See [MicroG](MICROG.md) for setup and boundaries.

## Packaging and provenance

The separate installation keeps original component/JNI class names but rewrites package identity, permissions,
provider authorities and selected identity strings. The local test key stays outside the repository. No browser data
is copied from stock Chrome. The installed .53 update has its own libchrome.so and is not the factory Trichrome package.

Prototype build setup was explored with Morphe's patch template. This publication checkout contains independently
written patch/runtime code and project files; template sample patches and helper implementations are not included.
Gradle wrapper files retain their Apache notices. See NOTICE for third-party tooling attribution.

Build tool versions: Morphe Patcher 1.14.1, Morphe Gradle plugin 1.3.4, Gradle 9.7.1, JDK 21, Android SDK 36.
