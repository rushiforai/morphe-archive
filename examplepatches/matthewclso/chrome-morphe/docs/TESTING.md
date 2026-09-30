# Device acceptance

Target: Chrome 153.0.8010.53 (801005304), unrooted Galaxy S26 SM-S942U1, Android 16/API 36,
ARM64, 4096-byte pages, Gboard. Test package: `app.matthew.chrome.test`.
Stock Chrome and the Samsung Internet default-browser role are not fixtures.

## Tab picker, September 29, 2026

Source 0.5.0 was developed and checked on the same S26, with final build v61 installed
using the existing signing key. Its APK signature and 4 KB alignment pass.

- The picker switch is disabled with True bottom off. Re-enabling True bottom restores its saved choice and the row.
- Native favicons and a local fallback are shown beside ellipsized titles and individual close controls. The current tab has an inset blue outline, with no divider above the address bar; final-build regular-fixture screenshots verify the appearance.
- Final v61 horizontal swipes scroll the row without switching the active page; tapping a tab still selects it. Explicit pressed/focused feedback removes the S26's extra selected-state underline.
- Tab selection, automatic scrolling to newly selected tabs, closing active/inactive tabs, regular-tab Undo, and title/favicon changes were exercised with disposable fixtures during development.
- Portrait and landscape checks on v59 show the row above the address bar with reserved page space. Address entry hides it in both orientations.
- An early candidate removed the row height while Chrome temporarily hid its Android toolbar for compositor scrolling, leaving a captured row at the bottom. It was rejected. Final v61 screenshots confirm both bars disappear on downward scrolling and return on upward scrolling.
- On v59, closing the final private tab through the picker leaves the empty Incognito viewer. A new private session has empty cookies and localStorage after writing and closing a disposable private marker through the picker.
- On v59, the user enabled Chrome's native Incognito lock and confirmed the picker remains hidden until authentication. The subsequent v60/v61 changes only refine horizontal gesture dispatch and selection feedback.
- On v59, a native Custom Tab has its ordinary close control and no picker or mode switch. Returning leaves the full-browser viewer intact.

All fixture tabs are disposable; no account credentials are used. The tab-picker fixture
at `tests/tab_picker_server.py` serves distinct tab titles/icons, title/icon updates, new-tab
links and a long page with a bottom target on port 8766. Use ADB reverse for that port.
Use `tests/storage_server.py` on port 8765 to repeat private-session cleanup. Restore rotation
preferences and remove the test sender/ADB reverse rules after testing.

Native group close confirmations are retained through TabRemover, but shared-group dialogs,
very large tab collections and other devices were not exercised. Account sync and Android
autofill hooks were not changed; their earlier acceptance below is not a fresh provider test.

Tested patch bundle SHA-256:
`3b4550d4af8991331495ab2d4d85d6fdc7a6858b15b21ade9eb206d4d4a7d0ea`.
Device APK SHA-256:
`0c49dd5afafc51a907ac815db4dfebbecd8409936f138a02541eb554bfbd19fa`.

## Remembered mode and empty Incognito viewer, September 29, 2026

Source 0.4.0, final device build v54, was installed with the existing signing key.
The APK signature and 4 KB alignment pass. On the S26:

- Closing the final private tab by its X, swiping it away, and **Close all Incognito tabs** each leave the private viewer selected with zero tabs.
- The empty viewer's **New Incognito tab** control creates a private tab. Switching manually to the regular viewer and back remains possible.
- A warm launcher reopen preserves the empty private viewer. Warm/cold reopening retains regular mode after a native regular-pane choice; cold reopening retains private mode after native **New Incognito tab**. Cold checks backgrounded the app fully before force-stopping it.
- Full-browser links from the separate fixture app follow the last-used mode. After closing all private tabs, a new external link opens privately with empty cookie and localStorage values. Regular fixture storage remains separate.
- Embedded Custom Tabs retain their regular storage and native controls, without changing the remembered full-browser mode.

An early candidate retained private session storage and was discarded. The final
patch retains the pane while destroying its coordinator. Shipped bytecode for
native tab removal and model destruction matches the original APK; it does not
keep a hidden tab or override private model lifetime. Native authentication is
unchanged. This run did not repeat the earlier biometric/password-provider tests.

Tested patch bundle SHA-256:
`6fa32f1325c12c874986f1e47e9fdb0eb39d24d269aff4adf3d9e271256b49b1`.
Device APK SHA-256:
`9e310abe1cb58ba17fe1516e9220aeb792cbc7a7c988a8d97ca37f50f4ad7b9e`.

## Android autofill acceptance, September 28, 2026

Source 0.3.0 adds an optional Android autofill route. On the same S26, a
disposable login was saved through stock Google Play Services and filled into
both regular-tab fields while retaining MicroG sign-in. A different hostname
did not receive that login. An initial private save-prompt regression was
blocked by disabling the Android provider for off-the-record profiles. The user
confirmed the guarded build did not offer to save in Incognito; the Android
framework recorded no requests during that private test or after backgrounding.
Regular filling still worked afterward.

The Chrome Password Manager button reached Google's native viewer through
Android's provider settings. The user confirmed password viewing and deleted
the disposable entry. See [full setup, scope and evidence](ANDROID_AUTOFILL.md).
These results supersede the password limitation in the historical 0.2.0
acceptance below. Incognito autofill remains unavailable.

## MicroG acceptance, September 28, 2026

- The initial failure was reproduced in Chrome's own process: stock Google Play
  Services rejected the renamed package and replacement signing certificate.
- The account adapter builds and patches the exact target. Device installation
  uses the same signing key as the preceding installed Chrome Morphe, with `-r`
  and no uninstall or data clear.
- Morphe settings exposes the account permission flow only when the optional
  MicroG patch is selected. The user granted access and confirmed successful
  Chrome sign-in through MicroG 6.1.1.
- Sign-in persisted through subsequent Chrome Morphe updates. The remaining
  account error was traced to Trusted Vault's `KeyRetrieval.API`, which still
  used stock Google Play Services. MicroG 6.1.1 did not export this service.
- The Trusted Vault client now uses MicroG's package/action and direct service
  lookup. With 6.1.1, the error became `API_UNAVAILABLE`, rather than the Google
  certificate `DEVELOPER_ERROR`, confirming the changed transport boundary.
- With user approval, MicroG was updated in place to 7.1.1 after checking the
  APK signature matched the installed MicroG certificate. Android now resolves
  the required key-retrieval service. The user completed verification, confirmed
  the account error cleared, and confirmed existing bookmarks appeared.
- Sign-in and successful verification persisted after a cold restart; the account
  settings page no longer showed the verification error.
- The installed candidate's APK signature and 4 KB alignment pass. Applying only
  Chrome customization also succeeds without selecting the optional MicroG patch.
- Regression: the user reported Incognito and homepage articles disappearing;
  device inspection confirmed Chrome's native New Incognito tab was disabled.
  The same account permits Incognito in stock Chrome, as confirmed by the user.
  MicroG 6.1.1's actual APK returns `1` for every `hasCapabilities` request,
  falsely including parental controls. The initial integration failed to account
  for this stub. Version 7.1.1 returned `6` (not in cache) for that capability;
  Chrome retains previously known capability values when updates are unknown.
- A candidate using Google's Gaia capability endpoint was tested but not retained:
  both native token and Android authenticator routes failed to obtain its scoped
  token. A strictly filtered diagnostic found `RESTRICTED_CLIENT`; no raw MicroG
  logs, tokens, account identifiers or authentication responses were retained.
- A minimum MicroG 7.1.1 check now protects account listing, token and capability
  requests from the 6.1.1 stub. The installed guarded candidate's capability
  bytecode was inspected to confirm the early unknown result for unsupported
  providers and the original native handling for supported providers.
- With explicit approval, only Chrome Morphe's `GET_ACCOUNTS` permission was
  revoked, followed by a force-stop/reopen. Chrome removed its stale signed-in
  state, and the native New Incognito tab command became enabled. Restoring the
  permission and restarting preserved that availability and exposed Sign in.
  No app data clear, uninstall or device-account removal was performed.
- The user then signed in and confirmed **Incognito, existing bookmarks and
  homepage articles all worked**. The account error was absent and the native
  Incognito command remained enabled after this sign-in. This validates recovery
  on this device; it does not override or establish support for supervised or
  managed accounts.
- After re-sign-in, the Wallet account-data switch was enabled. No payment data
  was opened or changed; actual Wallet synchronization remains untested. A further
  cold restart retained the signed-in account, no account error and an enabled
  native Incognito command.
- Native Google Password Manager failed to launch. MicroG's corresponding UI only
  opens Google's website. The patch now offers that website with an explicit
  native-saving/autofill limitation. The main Settings entry opens the dialog on
  the S26, and Open website reaches `passwords.google.com` inside Chrome Morphe.
  No password entry was opened or edited during testing.
- Custom passphrases, managed/supervised accounts and recovery on another device
  have not been accepted. Native Google password saving/autofill is unsupported.

Repeat permission denial/grant, account addition, cold-start sign-in retention,
transport failure, encrypted-data verification, actual bookmark synchronization,
and Incognito authentication when changing these hooks. Account display alone is
not Sync acceptance. Never record account credentials, tokens, encryption keys,
or MicroG authentication logs in test evidence.

## Settings and layout acceptance, September 27–28, 2026

| Check | Observed result |
| --- | --- |
| Main Settings → Morphe settings | Opens the private settings activity; remains available when the toolbar button is hidden. |
| Four switches | Persist across activity recreation and app updates. |
| Incognito address bar button off | Hides the button and returns its width to the address field. |
| True bottom off | Native new-tab toolbar and Hub controls return to their original top positions. |
| True bottom on | New-tab/address editing field stays below content; Hub action row, mode/group selector, menu and search move below the tab grid. |
| Active tab search | Field above Gboard, results above the field in portrait and landscape; accessible bounds do not overlap. Tapping a history result in landscape opens the fixture in a regular tab. |
| Native Theme screen | System default, Light and Dark choices remain; Black is controlled only from Morphe settings. |
| Black off / native Light | Restores Chrome’s native theme; selecting Light also disables Black. |
| Black palette | Pixel checks cover the toolbar, address field, NTP controls, suggested article cards and settings page. Text and prominent accents remain visible. |
| Settings cards and menus | Pixel checks confirm #000000 for settings cards, the three-dot menu and the homepage shortcut long-press menu. |
| Morphe back button | Transparent idle background matches the surrounding page, including #000000 in Black mode. |
| Native new-tab visibility | Unchanged, as requested. |

A further device regression on September 28 confirmed full-browser external links use regular tabs with the default option off, private tabs with it on, unchanged Custom Tab controls and regular storage, and return to the native authentication screen after changing appearance from Incognito.

Black mode off/on restored native gray article cards and then #000000 cards. A final rotation check found that a portrait search-field margin could collapse its height in landscape; v0.1.1 fixes this by translating the field while retaining its native measurement.

Morphe Manager on the S26 successfully imported the repository URL and displayed Chrome 153.0.8010.53, build 801005304. With source 0.1.2, the source name updates to Chrome Morphe. Selecting the matching original APK through Manager's file picker starts patching without an unsupported/experimental-version warning. Manager also completed a patch using its saved original APK; the exported result has the Chrome Morphe label, the expected package/version/build, a valid signature and 4 KB alignment. Device installation used the desktop-patched APK and development signing key; installation of the Manager-signed result remains untested.

Local UI XML, screenshots, PID-filtered logs and APK reports are retained outside this repository.
Protected Incognito screenshots remain protected; inspect accessible mode controls and the physical display.
Passing compilation, signing or fingerprint matching is not evidence of UI correctness.

## Earlier privacy acceptance, September 27, 2026

The preceding prototype established the following behaviors on the same exact Chrome build:

- Launcher opens Incognito on cold and warm starts.
- External HTTP(S) full-browser links open Incognito, including links sent by a separate fixture app.
- Disabling the default option restores regular external navigation; re-enabling it restores private navigation.
- Custom Tabs keep their own activity and regular cookie/localStorage context, without the toolbar mode button.
- Regular/private cookies and localStorage remain separate in both directions; a private marker is absent from regular history.
- Closing all private tabs discards private storage.
- Mode switching preserves existing regular tabs and creates a native tab if a destination collection is empty.
- The user confirmed rotation, address entry, suggestion tapping and mode switching in both orientations.
- The user confirmed authentication on returning through the launcher. An additional check of “See other tabs” → regular tab → mode button returned to the Incognito lock screen.

These earlier checks are distinct from the settings/layout acceptance above. Recheck the flows below when changing the relevant hooks.
No real browsing data is needed for any privacy assertion.

## Repeatable fixtures

Use disposable tabs only; do not close or inspect unrelated user tabs. Since source 0.4.0, routing follows the remembered mode instead of always choosing Incognito.

1. Run `python3 tests/storage_server.py` on the development machine, then forward the device port with `adb reverse tcp:8765 tcp:8765`.
2. In an explicit regular tab, enter `http://127.0.0.1:8765/set?value=regular`. Confirm both storage values are regular.
3. Build `python3 scripts/build_link_harness.py` and install the resulting local fixture APK.
4. Send a full-browser link from that separate app:

   ```sh
   adb shell am start -S --user 0 -n app.matthew.chrome.linktest/.MainActivity \
     --es kind full --es url http://127.0.0.1:8765/read
   ```

   First confirm regular mode and regular storage. Switch to Incognito, leave Chrome, send the same link again, and confirm private mode with isolated storage. `-S` stops only the fixture app so a previous Custom Tab task cannot merely be brought to the foreground.
5. Send `http://127.0.0.1:8765/private-only?value=private`, switch to regular, and confirm regular values remain. Search regular history for `private-only`; expect no results.
6. Send `--es kind custom --es url http://127.0.0.1:8765/custom-tab`. Expect `CustomTabActivity`, Close/Minimize/Share controls, regular storage, and no added mode button.
7. In a clean test profile, close all disposable Incognito tabs, reopen the `/read` fixture privately, and expect empty storage. Never close unrelated user tabs to perform this check.
8. Hold the mode button to open Morphe settings, disable **Remember last browsing mode**, and verify native launcher/external-link behavior. Restore the setting afterward.
9. With remembered mode enabled, leave and reopen through the launcher in each mode, both warm and after a force-stop of Chrome Morphe. Repeat using a mode selection from the native tab view with the toolbar mode button hidden.
10. Open a Custom Tab while full Chrome was last private, then reopen the full browser and confirm it still selects Incognito. Check authentication if private tabs are locked.
11. Test final-tab closure by X, swipe and Close all, then create another private tab from the empty viewer. Confirm fresh storage. Clean up only the fixture markers through `/clear` and close only the disposable fixture tabs.

Use `scripts/device_ui.py LABEL` for accessible UI evidence. `--tap` taps one exact matching test-app label and refuses ambiguous matches. `--serial` or `ANDROID_SERIAL` selects the phone when more than one device is connected.

## Checks to repeat for future builds

- Rotate during regular/private address entry; confirm the address bar stays above the keyboard and suggestions can be tapped and scrolled.
- Enable Chrome's **Lock Incognito tabs when you leave Chrome**. Leave the app and return through both the launcher and the mode button; authentication must still be required.
- Close every regular tab, then switch from Incognito to regular; one regular new tab should be created.
- Select Chrome's top address-bar position and verify the native top behavior still works, then restore bottom.
- Check portrait, landscape, keyboard dismissal, back navigation, new tab, tab switcher, scrolling, and a cold start.

All private-session assertions use test data. Do not import real browsing data to make these tests pass.
