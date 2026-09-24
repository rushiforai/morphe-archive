# Settings follow-up: 1.3.2

API profiles now contains only the saved choices and Add profile. Cancel replaces Close.
Tap to activate; long-press any choice for a named Rename/Delete context dialog without
activating it. Accessibility exposes the long-click action. A new profile is prefilled with
the first unused API N name and can be saved unchanged; a blank new name uses that default.

The scoped clear-key action is a normal API-category row immediately below Test API.
Confirmation captures the profile ID. Other profiles and non-key configuration remain intact.
The final-profile retention rule and existing encrypted storage are unchanged.

Translation-requirements help was duplicated by feeding localized XML through a second
Chinese-prefix translation pass. Summaries are now displayed directly, with shorter help
in every supported language. Defaults follow UI language; custom content remains unchanged.

Keyboard changes retain a valid bound EditText when ListView requests getView(null) during
relayout, rather than rebuilding the focused input connection. Native touch handling precedes
the explicit IME request; pending requests wait for window focus. Android 11+ uses the inset
controller as well. Viewport updates observe pre-draw, not only layout. After requesting a
visible rectangle, the code checks screen-space overlap and scrolls the actual ListView if
necessary. Whole fields are revealed when they fit, otherwise the caret line is revealed.
The host's system-bar listener is not replaced, and no blanket adjustPan workaround is used.

References consulted: Android keyboard visibility documentation, Morphe 1.43.0
ToolbarPreferenceFragment, and public android/compose-samples issues 234 and 784 (including
its resize-versus-pan discussion). Community reports are analogous, not proof of this app's
root cause. The implementation uses framework View APIs rather than Compose code.

Tests cover first-tap IME requests, stable focused views across relayout, actual list scrolling,
pre-draw inset detection, exact localized help, default names, long-press operations on inactive
profiles, and existing profile/security regressions. Composition checks use YouTube 21.07.247,
official Morphe 1.43.0, and all three addon roots. Generated settings and DEX are audited.

No physical-device/OEM-keyboard visual acceptance is claimed. The automated tests use
Robolectric; full official theme integration is checked structurally in the composed APK.
No paid API calls or changes to translation budgets, retry policy, or caption ownership.
Diagnostic revision: source-phrase-132. Release through the existing GitHub workflow only.
