# Chrome Morphe user-visible behavior contract

**Authoritative repository specification.** Last reconciled with the owner's complete task history on September 30, 2026, through the request to create this document. The preservation baseline is release **0.5.1**.

## Authority and maintenance

This document defines what Chrome Morphe must do for its user. For intended user-visible behavior, it takes precedence over **every other source in this repository**: source code, tests, `AGENTS.md`, README, implementation notes, changelogs, release notes, and historical acceptance reports. A conflicting implementation or test is a defect or stale evidence; it is not permission to weaken this contract.

Later explicit owner instructions can change the contract. Record the changed decision and its source here before treating it as a new target. Do not reinterpret a reported regression as a requested feature removal, or silently rewrite the contract to match existing code. If a conflict cannot be resolved from the owner's decisions, identify the specific conflict and ask for clarification. This repository precedence does not override instructions outside the repository or grant permission to reset accounts, delete user data, or perform unrelated operations.

The requirements below are observable outcomes, not a mandated implementation. An agent should be able to understand the product without reverse-engineering the code. Stable requirement IDs support change reviews and regression checks.

**Provenance:** `U01`–`U63` in the [complete message ledger](#complete-user-message-ledger) identify the owner's messages and question/answer replies. All six stored history segments were reviewed, covering 67 human-message occurrences: 63 distinct messages and four repeated messages at conversation resumptions. Environment, Page, plugin, and agent-instruction context was considered for scope rather than turned into product features. Personal account identifiers and disposable credentials are deliberately omitted.

Some defaults and interactions were established during implementation rather than specified word-for-word by the owner. These are explicitly marked **preserved baseline**, reconciled against the 0.5.1 [README](../README.md), [device evidence](TESTING.md), [MicroG notes](MICROG.md), and [autofill notes](ANDROID_AUTOFILL.md). They are preservation requirements, not claims that the owner personally tested every scenario. Historical evidence does not override the final decisions here.

## 1. App identity, supported target, and installation

Sources: U01–U05, U12, U20–U21. Packaging details are preserved baseline.

| ID | Required behavior |
| --- | --- |
| APP-01 | The installed app and repository/source branding are **Chrome Morphe**. Replace the former user-facing names **Chrome Patch Test** and **Chrome Tweaks**. Historical reports may identify old builds by their old names. |
| APP-02 | The supported original app is Android Chrome **153.0.8010.53**, version code **801005304**, ARM64. The original request for 153.0.8010.49 was superseded. Do not silently broaden support to another build. |
| APP-03 | Selecting that exact supported original app in Morphe Manager must not produce an unsupported/experimental-version warning. Correct compatibility metadata must describe actual support; this is not a request to suppress legitimate incompatibility checks. |
| APP-04 | Installation works on the owner's **unrooted Galaxy S26** alongside stock Chrome. Chrome Morphe has its own tabs, settings, and storage. Do not replace stock Chrome, import its data implicitly, or change the device's default browser as a side effect. |
| APP-05 | Preserve update continuity. The installed package identifier remains `app.matthew.chrome.test` despite the visible rename. Updates using the same signing key preserve the app's data and settings; changing a display name is not a reason to require an uninstall. |

The accepted device environment is Galaxy S26 / Android 16 / ARM64 / 4 KB memory pages. This is a tested scope, not proof of support on every Android device or on 16 KB configurations.

## 2. Morphe settings and independent controls

Sources: U12, U14–U15, U44, U46, U48. Defaults, persistence, and secondary entry points are preserved baseline.

**SET-01:** Chrome's main Settings contains a section/entry named **Morphe settings**. It remains reachable when the toolbar mode button is disabled. The page's back button blends into its surrounding background; it must not have an unmatched gray or differently colored tile.

**SET-02:** Expose these separate controls. An unrelated setting must not have to be enabled to use another feature, except the stated Tab picker dependency.

| Setting label | Enabled | Disabled | Fresh-install default |
| --- | --- | --- | --- |
| Incognito address bar button | Show the regular/Incognito mode switch. | Hide it and give its space back to the address field. | On |
| Black mode | Apply the black Chrome surfaces in section 6. | Use Chrome's native theme colors. | Off |
| True bottom address bar | Apply the bottom address/editing/tab-view layout in section 5. | Restore native Chrome positioning decisions. | On |
| Tab picker | Show the row described in section 7 while True bottom is enabled and the browsing state permits it. | Omit the row. | Off |
| Remember last browsing mode | Use the last regular/Incognito mode for ordinary launcher opens and full-browser external links. | Use native Chrome launch/link routing. | On |

**SET-03:** The Tab picker setting stays visible but **grayed out and non-interactive** when True bottom is off. Retain the user's saved picker choice so re-enabling True bottom restores it. Merely using stock Chrome's bottom address-bar option does not satisfy this dependency.

**SET-04:** Settings persist across leaving/reopening the app, activity recreation, and same-key app updates. Upgrade the former Incognito-default preference to remembered-mode behavior without turning an explicit opt-out back on. Apply appearance changes when returning to the browser; stale colors or layouts must not remain until an unrelated action.

**SET-05:** Holding the toolbar mode button opens Morphe settings as a secondary entry point. With the optional MicroG integration installed, this page also exposes **Allow account access** for account setup. This account action is not an additional appearance or browsing-mode toggle.

## 3. Mode switching and remembered mode

Sources: U01, U03, U06, U08–U11, U44–U47. Existing-tab preservation, native routing when disabled, and first-use behavior are preserved baseline.

| ID | Required behavior |
| --- | --- |
| MODE-01 | Tapping the toolbar mode button switches between regular and Incognito browsing, like the requested Samsung Internet convenience. Its action/accessible description reflects the destination mode. Switching must not close the other mode's tabs. |
| MODE-02 | Switch to the destination mode's existing tabs when available. If that destination has no tab, use the ordinary new-tab behavior for that mode. This does not authorize retaining a hidden private tab after the user closes the last one. |
| MODE-03 | With Remember last browsing mode enabled, the ordinary **Chrome Morphe launcher icon** reopens the mode the user last left: regular stays regular; Incognito stays Incognito. A special Incognito home-screen shortcut must not be required. This applies to warm returns and cold launches. |
| MODE-04 | External HTTP(S) links that open the **full browser** use that same last-used mode. The final decision is not “external links always open Incognito.” A new link still opens its requested destination page. |
| MODE-05 | Mode choices made using the native tab viewer or native new-tab controls count as well as choices made through the added toolbar button. Hiding that button must not disable mode remembering. A temporary regular-mode state during startup must not overwrite the user's remembered Incognito choice. |
| MODE-06 | Embedded **Custom Tabs** keep their ordinary activity, mode, controls, and storage behavior. Do not redirect them into a full Incognito browser or add the full-browser mode switch/picker. Opening a Custom Tab must not replace the remembered full-browser mode. |
| MODE-07 | With no saved mode yet, preserve Chrome's native restored mode. With remembering disabled, restore native routing rather than forcing Incognito. Explicit internal regular-tab choices must remain regular. |
| MODE-08 | Retain Chrome's normal visibility rules for its existing **New tab** toolbar control. The owner withdrew the request to remove that restriction after discovering the button appears once a tab is open. The empty Incognito viewer's new-tab action below is a separate requirement. |

## 4. Empty Incognito state and privacy

Sources: U07, U09, U30, U33, U39–U43, U47, U52. Session cleanup and close-path coverage are preserved baseline.

**PRIVATE-01:** Closing the last Incognito tab leaves the **empty Incognito tab viewer selected** instead of automatically taking the user to regular tabs. This applies to the individual close control, swipe-to-close, Close all Incognito tabs, and closing the last private tab through the picker. The empty viewer offers **New Incognito tab**, and the user can deliberately switch to regular tabs.

**PRIVATE-02:** Retain the empty private *mode*, not the closed private session. Do not keep a hidden tab or preserve private cookies/site storage merely to keep the viewer selected. A newly created private session after the last private tab closes must not inherit that closed session's cookies or local storage. Regular-session data remains separate.

**PRIVATE-03:** Staying in the empty Incognito viewer is independent of the Remember last browsing mode toggle. When remembering is on, leaving from that empty viewer still counts as the user's Incognito choice, including for subsequent full-browser external links. Native tab/session restoration rules still determine whether a new private tab is needed on return.

**PRIVATE-04:** Preserve Chrome's **Lock Incognito tabs when you leave Chrome** protection. When Chrome requires authentication, launcher return and the added mode button must not expose private pages, titles, icons, or picker controls before authentication. The tab picker stays hidden while authentication is pending/showing. If Chrome offers **See other tabs**, switching to regular tabs and then back must not bypass the lock. That native action need not be made permanently visible; the owner reported that it was not always offered.

**PRIVATE-05:** Preserve native secure-screen behavior and real account/device policy restrictions. Do not disable authentication or fake account eligibility to satisfy mode-switching tests. Likewise, a patch/provider bug must not incorrectly disable Incognito for an account that is eligible in stock Chrome.

## 5. True bottom layout and scrolling

Sources: U01, U06, U12, U48, U51, U60–U62. Native top-setting interaction, search layout, and picker visibility during editing are preserved baseline.

| ID | Required behavior |
| --- | --- |
| BOTTOM-01 | With True bottom enabled, keep the actual address/task bar at the bottom on ordinary pages **and new-tab pages**. Focusing the address field or entering text must not send it to the top. |
| BOTTOM-02 | While typing, place the usable address field above the on-screen keyboard, with suggestions/results in the available space above it. Fields, suggestions, results, and keyboard must not cover one another or collapse. Suggestions remain tappable. |
| BOTTOM-03 | In the tab viewer, move the options row to the bottom: new tab, regular/Incognito selector, tab groups, menu/more or move options, and tab search. Preserve those controls' native actions. Reserve space so the tab grid/results are not covered. |
| BOTTOM-04 | Tab search and other address-entry/search surfaces reached by these flows remain usable above the keyboard, with results above the field. Rotation while typing must retain a visible, usable field and tappable results. Both portrait and landscape are required. |
| BOTTOM-05 | Turning True bottom off restores native Chrome layout, including its own top/bottom choices. Selecting **Top** in Chrome's own address-bar setting disables True bottom. Enabling True bottom selects the bottom behavior. Preserve ordinary native transitions such as Find in page rather than forcing the picker into every screen. |
| BOTTOM-06 | On a scrollable page where stock Chrome hides its controls, scrolling down hides **both the address bar and enabled tab picker together**. Scrolling back up restores both together. No stranded row, mismatched offset, empty reserved strip, or first-scroll-after-restart omission is acceptable. Native reasons to keep controls visible, such as focused editing, still apply. |

The bottom behavior applies in both regular and Incognito browsing. It must remain usable with the picker disabled, with the mode button disabled, during keyboard transitions, after returning to the app, and after rotation.

## 6. Black mode

Sources: U12, U14–U15, U18–U19, U61–U62. Native-theme interaction and preservation of page/accent colors are preserved baseline.

**BLACK-01:** Black mode changes Chrome's dark gray neutral backgrounds to **`#000000` black**. It provides a black appearance in addition to the native light/dark choices, but its **only setting is the toggle in Morphe settings**. Do not add or restore an Appearance → Theme → Black entry.

**BLACK-02:** Include all affected Chrome surfaces, specifically the surfaces the owner found incomplete:

- The address bar/toolbar background and address-field background, including while they move during scrolling.
- The tab-picker background and the join between it and the address bar.
- Chrome settings backgrounds and the individual settings option containers/cards.
- Morphe settings, including the background surrounding its back button.
- Regular homepage/new-tab surfaces and suggested article cards.
- The three-dot menu and long-press/context menus, including homepage-shortcut and page-link menus.
- Dark neutral backgrounds in the tab-view controls covered by True bottom.

**BLACK-03:** Black must hold **throughout** interactions, not just after settling. In particular, an upward scroll must not first show the address bar in dark-mode gray and then change it to black when the gesture ends. Cover the first visible moving frame, continued motion, stopping, menu display/dismissal, app return, and cold restart. The toolbar and picker must agree.

**BLACK-04:** Preserve readable text, meaningful pressed/focused states, icons, images, accents, and the blue active-tab outline. This feature targets Chrome surfaces; it does not globally repaint website content or article images black.

**BLACK-05:** Disabling Black restores native theme colors. Chrome's Theme screen retains **System default, Light, and Dark**; selecting a native theme clears Black mode so that choice actually takes effect. The back button matches its surrounding background in native themes as well as Black mode.

## 7. Tab picker

Sources: U48–U62. Selection, scrolling, close semantics, and visual measurements supplement those requests with the preserved 0.5.1 baseline.

| ID | Required behavior |
| --- | --- |
| PICK-01 | Offer an optional, horizontally scrollable tab row **immediately above the True bottom address bar**, using Samsung Internet as a functional reference. It is not available with the stock address-bar layout; the setting dependency is SET-03. |
| PICK-02 | Show the current mode's tabs, each with its page icon, tab name, and an individual **X** close control. Do not mix regular and private tabs in one row. Preserve tab order and visibly identify the active tab. |
| PICK-03 | Tapping a tab selects it. Horizontal swipes scroll the row without accidentally invoking Chrome's page-switch gesture. Bring a newly selected tab into view, including after address entry has hidden/recreated the row. Manual horizontal scrolling remains usable. |
| PICK-04 | Closing a tab closes that tab, including when it is not active. Preserve native close confirmations/group protections and regular-tab Undo. Closing the final private tab follows PRIVATE-01 and PRIVATE-02. |
| PICK-05 | The active tab has a **blue outline/highlight inset vertically** so its top and bottom lines have breathing room inside the row. Do not return to a highlight pressed against the container edges or add the unwanted extra selected underline. |
| PICK-06 | Keep the original, smaller **×** appearance. The owner's alignment request must not be implemented by enlarging the X or replacing it with a visibly larger icon. Keep a usable touch target. |
| PICK-07 | Center the visible **tab-name glyphs and X glyph together on the same horizontal centerline**, halfway between the top and bottom of the highlight. Both must look vertically centered and in line with each other. Centering widget boxes or font line boxes alone is insufficient if the visible text still looks low. |
| PICK-08 | Update names when page titles change; retain readable ellipsis for long titles. Use a sensible New tab/Incognito tab fallback when no title exists. A stale title must not survive tab reuse or mode switching. |
| PICK-09 | Show the current page's favicon when available, rather than an old page's icon or a persistent generic new-tab icon. Update on navigation, same-title navigation, icon-only changes with the same URL/title, delayed loading, Back/Forward, tab restoration, and subsequent live changes after restoration. Background restored tabs must not require selection just to acquire an available cached icon. |
| PICK-10 | A local generic fallback is valid when the current page has no available icon. Clear an old page's icon on navigation; a late callback from a previous page must not replace the new page's icon. A cached/restored icon must not prevent later live updates. |
| PICK-11 | There is **no gray separator line or visible gap between picker and address bar**, at rest or during scrolling, app return, or long-press-menu display/dismissal. A fix that merely makes a divider invisible at rest, or leaves a transparent strip through which the page shows, does not satisfy this requirement. In native themes the join must still match the adjacent surface. |
| PICK-12 | Hide and restore the row together with the address bar during normal page scrolling (BOTTOM-06). Hide it during address editing, in the full tab viewer, when the browser is not active, during a native top-position transition, and behind Incognito authentication. Show the current row again when eligible, without stale content or missing first-frame rendering. Do not overlay it on the tab-view options or keyboard. |

**Visual reference, not an implementation prescription:** the accepted layout uses a 48dp row/touch area, a 6dp vertical highlight inset, a 24sp × glyph, and a 13sp title. On the tested S26, the original X's visible ink is 22 × 22 pixels. Acceptance measurements put the title and X centers within half a physical pixel because their glyph heights differ. Preserve that apparent size and shared center, while respecting device density/font scaling; do not demand a universal physical-pixel size.

## 8. Account sign-in, bookmarks, homepage articles, and Wallet

Sources: U22–U33. Optional patch selection, setup/provider boundaries, and limits are preserved baseline.

**ACCOUNT-01:** Offer optional **MicroG sign-in** so the separately installed/signed Chrome Morphe can sign in without giving up its UI features. The supported setup uses **Morphe MicroG 7.1.1 or newer**; 7.1.1 is the accepted provider version in this history. Do not regress to the older provider behavior that incorrectly classified the account and disabled features.

**ACCOUNT-02:** Make account setup actionable: **Morphe settings → Allow account access**, Android's account-enumeration permission presented under Contacts, then Chrome **Sign in**. A separate MicroG login/consent may be required. A stock device Google account is not automatically a MicroG account; do not promise automatic sharing or leave the user in a dead-end “account already exists” loop. Do not solve that loop by removing the phone's existing account.

**ACCOUNT-03:** **Verify it's you** must open the required verification flow and allow the user to complete it. Successful verification must resolve the corresponding recoverable account error and allow existing synchronized bookmarks to appear. A visible account name alone is not evidence of successful sign-in, verification, or bookmark synchronization.

**ACCOUNT-04:** The eligible signed-in user must be able to use **Incognito, synchronized bookmarks, and regular-homepage suggested articles together**. Sign-in must not falsely disable Incognito or remove the feed through incorrect account restrictions. Preserve real parental/enterprise restrictions and normal feed settings, availability, and network conditions; the requirement does not force articles into the Incognito new-tab page.

**ACCOUNT-05:** Keep the normal **Payment methods and other info from Google Wallet** eligibility state. It must not be spuriously disabled by a false account-capability result. The switch became enabled during recovery on the test device, but actual Wallet-data synchronization/payment use was **not accepted**. Do not present that untested capability as supported merely because the switch is enabled.

**ACCOUNT-06:** Same-key app updates/restarts should retain the working account setup. Account-provider failures must not silently erase sign-in state or be disguised as successful synchronization. Preserve the user's consent, verification, and policy checks. Provider updates affect other apps and are not implicitly authorized by a Chrome UI change.

## 9. Password viewing and Android autofill while signed in

Sources: U27, U34–U43. The final accepted behavior supersedes the earlier “native passwords/autofill unavailable” limitation.

| ID | Required behavior |
| --- | --- |
| PASSWORD-01 | **Google Password Manager** in Chrome settings must perform a useful action rather than doing nothing. Provide the accepted route through **Android settings → Google → Google Password Manager** to Google's protected native password viewer. The user can authenticate and view a stored password there. |
| PASSWORD-02 | Preserve Google's website as an explicit alternative/fallback, with a separate website login if required. It is not a silent replacement for the native-viewing capability accepted on the S26. The website follows the browser's remembered-mode behavior. |
| PASSWORD-03 | With optional **Android autofill**, the user can save and fill website credentials in **regular tabs while Chrome remains signed in through MicroG**. The system provider remains the provider the user selected; Google was tested. Chrome setup uses **Autofill services → Autofill using another service**, with its requested restart. No sign-out should be required just to use these password capabilities. |
| PASSWORD-04 | Filling must populate the real username and password fields and permit successful submission, not merely display an account or a suggestion. Preserve origin matching and provider authentication; a credential for the fixture's first hostname must not automatically match an unrelated hostname. |
| PASSWORD-05 | Do **not** enable this Android autofill route in Incognito/off-the-record browsing. There must be no private form-value exposure to the provider, no private autofilling, and no private save prompt, including after leaving/returning to the app. The earlier private save prompt was a regression, not a desired feature. |

The system password provider can use a different Google-account selection from MicroG. This route does not imply restoration of every first-party Google Play Services feature in Chrome. Private Custom Tabs are subject to the same off-the-record exclusion, but their autofill path has not had a separate device acceptance test.

## 10. Sharing and preservation of normal Chrome actions

Source: U53; link-sharing coverage is preserved accepted baseline.

**SHARE-01:** Sharing a page from the three-dot menu opens Android's share chooser for that page without crashing or restarting Chrome. Long-press **Share link** likewise opens the chooser for the chosen link. Canceling the chooser returns to a usable browser with its tabs intact.

**SHARE-02:** Black mode, tab-picker rendering, and menu fixes must not break native sharing or other unaffected Chrome actions. A menu that merely looks right is not sufficient if tapping its action crashes. Do not replace native actions with no-op controls to avoid crashes.

## 11. Distribution and acceptance workflow

Sources: U01–U04, U12–U13, U16–U17, U20–U21, U25, U31–U43, U63. Release packaging and data-preservation practices are preserved baseline.

**DIST-01:** Maintain the public **matthewclso/chrome-morphe** repository with Morphe Manager installation instructions, a recognizable patch-repository structure, and the **MIT license** for original project code. Distribute patch bundles and their metadata/checksums rather than Chrome or MicroG APKs. Keep source/app branding consistent with APP-01.

**DIST-02:** Manager users can add the repository as a remote patch source or import the released `.mpp`. Metadata points to the intended published release and accurately names its supported app/version. Keep the optional **MicroG sign-in** and **Android autofill** selections and their setup requirements clear; do not imply that ordinary Chrome customization alone supplies them.

**CHECK-01:** Prefer acceptance on the owner's USB-connected, unrooted Galaxy S26; WSL/local builds and fixtures support that work. Guide the user through necessary connection, permission, sign-in, and authentication steps. A past “connected/unlocked” or “approved” reply is not a new product requirement or an unlimited standing authorization for future destructive recovery.

**CHECK-02:** Use disposable pages/accounts entries for checks and let the user perform authentication. Preserve unrelated tabs, accounts, passwords, stock Chrome, and device settings; clean up only the test fixtures. Never weaken private screenshots or authentication to make automation easier.

**CHECK-03:** Map each code change to affected requirement IDs and exercise the relevant user-visible flow plus its adjacent regression risks. Record what was actually tested, on which build/device, and what remains unverified. A successful compile, signature, hook match, screenshot at rest, or account label is not a substitute for the associated behavior. Documentation-only changes need a consistency/coverage/link review, not an Android rebuild.

### Regression checks that must not be lost

These are test scenarios derived from the contract, not a claim that every one was rerun for every release. Use [TESTING.md](TESTING.md) for dated evidence and detailed fixtures.

| When changing | Observable acceptance |
| --- | --- |
| Settings or feature gates | Toggle each affected feature off/on; reopen/update; verify persistence, disabled picker with True bottom off, restored picker choice, and settings access without the mode button. |
| Mode routing | Test ordinary launcher and full-browser external links after leaving each mode, warm and cold; include a native tab-view selection and an empty Incognito viewer. Custom Tabs retain their own behavior and do not change the remembered mode. |
| Private tab closure | Close the last private tab by each affected path; stay in the empty private viewer; create a new private session with cleared old cookies/storage. Do not confuse a retained empty pane with a retained private session. |
| Private UI or lifecycle | Enable native Incognito lock and leave/return. Confirm no page/picker metadata before authentication; test regular-to-private return through the mode button and See other tabs when available. |
| Bottom layout | Test ordinary/new-tab pages, address entry, suggestion selection, tab view, and tab search, including rotation while the keyboard is open. Check reserved content space and native Top/off behavior. |
| Picker geometry | Check the original small X and title visually on the same centerline, the inset blue outline, long-title ellipsis, individual close actions, and horizontal scrolling that does not switch pages. |
| Picker metadata | Test changed titles, same-title navigation, icon-only updates, absent/delayed icons, history navigation, fast navigation with late callbacks, restored/background tabs, and a cached icon followed by a live update after restart. |
| Toolbar/menu rendering | Check **during** downward/upward gestures, not only after stopping. Both bars hide/return together; neither disappears from the first moving image; Black stays #000000; no divider/gap appears during long-press menus or after dismissal. Also check Black off. |
| Account integration | Test actual sign-in, verification, bookmarks, Incognito availability, and regular-homepage articles together. An enabled Wallet switch alone is not Wallet-sync acceptance. |
| Password integration | While signed in, save/fill a disposable regular login, check a different hostname, open the native viewer and authenticate, and verify no provider activity/private save offer in Incognito or after app return. |
| Sharing or color/tint changes | Open both page Share and long-press Share link, then cancel. Verify the chooser and retained Chrome process/tab state; do not actually send test material to a contact. |
| Release/install metadata | Verify the exact supported app is treated as supported, the visible name is Chrome Morphe, updates use the intended signing identity, and the public bundle/checksum/Manager URL correspond to the tested artifact. |

**Acceptance limits:** other devices/16 KB pages, custom Sync passphrases, managed/supervised account configurations, actual Wallet synchronization, shared-group dialogs, and very large tab collections need their own evidence. Preserve genuine restrictions and native protections without claiming these scenarios are already accepted. Consult dated reports for historical results; a previous limitation does not erase a later accepted feature.

## Superseded or withdrawn decisions

| Earlier statement | Final controlling decision |
| --- | --- |
| Research only; do not build yet (U01). | Implementation was authorized in U02. Research-first wording was a phase boundary, not a permanent restriction. |
| Target Chrome 153.0.8010.49 (U01). | Target installed 153.0.8010.53 / 801005304 (U04, U20). |
| Remove the New tab button's visibility restriction (initial concern U08). | The owner corrected the observation and explicitly withdrew that change (U10–U11). Preserve native visibility. |
| Add Black alongside Light/Dark inside Chrome's Theme screen (U12). | Keep **only** the Morphe settings Black toggle; remove Theme → Black (U15). |
| Always open Incognito by default (U01, U12). | Remember the last mode for ordinary launcher opens (U44). |
| Keep external links opening Incognito (U45). | The later reply explicitly applies last-used mode to full-browser external links too (U46). Custom Tabs remain outside that redirect. |
| Chrome Patch Test / Chrome Tweaks. | Use Chrome Morphe (U20–U21); preserve the installed package ID for updates. |
| Enlarge/redesign the X as an alignment fix. | Keep the old small size; center it and the title on the same line (U54, U56–U57). |
| Native password viewing/autofill unavailable after sign-in (early integration limitation). | Preserve the later accepted native viewer and regular-tab Android autofill while signed in (U34–U43). Private autofill remains excluded. |
| A save prompt appeared in the private test (U39). | That was a failing prototype result. The later no-prompt result (U41) and preserved privacy boundary control; “Not now” (U40) was a test response, not permission to save private credentials. |

## Complete user-message ledger

This is a concise disposition of **every distinct human message**, including setup replies and confirmations, rather than only the original feature request. Replayed messages retain the same ID. The requirements above carry authority; this ledger preserves how decisions evolved and must not revive superseded requests. Sources supplementing the messages are explicitly identified as baseline above.

| Source | User message / final disposition |
| --- | --- |
| U01 | Initial request: toolbar mode switch, fully bottom address/editing bar, Incognito default, Galaxy S26, research/API review and testing plan before implementation. Captured by APP, MODE, BOTTOM, CHECK; version/default/phase later superseded. |
| U02 | Begin implementation and walk through required user steps. CHECK-01; supersedes the research-only phase. |
| U03 | Unrooted; USB available; route only links opening the full browser, not embedded Custom Tabs. APP-04, MODE-06, CHECK-01. |
| U04 | Target installed 153.0.8010.53. APP-02. |
| U05 | Welcome screens completed without an account; browser ready. Setup context, not a requirement to prohibit future sign-in. |
| U06 | Mode switch, new tab, address entry, rotation, and suggestion selection work in both orientations. MODE-01, BOTTOM-01–04. |
| U07 | Authentication required after leaving/reopening Incognito. PRIVATE-04. |
| U08 | Reported disappearing New tab button in Incognito. Later withdrawn by U10–U11; MODE-08. |
| U09 | See other tabs appeared only once. Retain native availability and lock behavior; no promise that this action always appears (PRIVATE-04). |
| U10 | Corrected report: New tab appears once a tab is open. MODE-08. |
| U11 | Explicitly requested no removal of that visibility restriction. MODE-08. |
| U12 | Add Morphe settings with mode-button, Black, True bottom and default-mode controls; move all tab-view options/search below; publish the named GitHub repo with Manager instructions and MIT. SET, BOTTOM-03, DIST; Black location/default mode later revised. |
| U13 | Phone unlocked/connected for settings tests. Test logistics only. |
| U14 | Morphe settings back button has a mismatched background. SET-01, BLACK-02/05. |
| U15 | Remove Theme → Black; blacken individual settings containers and three-dot menu. BLACK-01/02. |
| U16 | Phone reconnected/unlocked. Test logistics only. |
| U17 | USB cable reconnected after troubleshooting. Test logistics only. |
| U18 | Blacken homepage suggested-article cards. BLACK-02. |
| U19 | Blacken long-press menus. BLACK-02. |
| U20 | Rename app/repo to Chrome Morphe; fix erroneous unsupported warning for matching .53 / 801005304. APP-01–03. |
| U21 | Rename Chrome Tweaks too. APP-01. |
| U22 | Existing device account not added; Add account says it already exists. ACCOUNT-01/02; personal account identifier omitted. |
| U23 | Authorize MicroG integration. ACCOUNT-01/02. |
| U24 | Sign-in succeeds, but Verify it's you does nothing. ACCOUNT-03. |
| U25 | Approve shared MicroG update to 7.1.1. Provider/setup decision, ACCOUNT-01; not blanket authorization for later provider updates. |
| U26 | Verification succeeds and existing bookmarks appear. ACCOUNT-03. |
| U27 | Wallet option grayed out and Password Manager does nothing. ACCOUNT-05, PASSWORD-01; actual Wallet sync remains unverified. |
| U28 | Incognito disabled after account work. ACCOUNT-04, PRIVATE-05. |
| U29 | Homepage suggested articles disappeared after sign-in. ACCOUNT-04. |
| U30 | Same account still allows Incognito in unmodified Chrome. Confirms an integration regression rather than permission to override real policy; PRIVATE-05. |
| U31 | Ready for device testing. Test logistics only. |
| U32 | Approved the pending recovery step. Historical task approval, not a new feature or standing destructive-recovery authorization. |
| U33 | Signed in; Incognito and bookmarks work; articles returned. Joint acceptance for ACCOUNT-03/04. |
| U34 | Ask to retain autofill and password viewing while signed in. PASSWORD-01–04. |
| U35 | Continue that test. Authorization to investigate/validate the password route. |
| U36 | Phone connected/unlocked. Test logistics only. |
| U37 | USB debugging enabled/authorized. Test logistics only. |
| U38 | Original Chrome saves/autofills normally. Comparison evidence; PASSWORD-03/04. |
| U39 | Google offered to save the private dummy login. Failed privacy result; PASSWORD-05. |
| U40 | “Not now.” Private-save test response; does not establish private autofill support. |
| U41 | “It didn't offer to save.” Later private-test result; PASSWORD-05. |
| U42 | Regular fixture username and password both filled. PASSWORD-03/04. |
| U43 | Native password viewing worked; disposable entry deleted. PASSWORD-01, CHECK-02. |
| U44 | Replace always-Incognito startup with whichever mode was last used. MODE-03/05; repeated at two resumptions. |
| U45 | Initially chose to keep external links opening Incognito. Superseded by U46. |
| U46 | Explicitly chose last-used mode for external full-browser links too; Custom Tabs unchanged. MODE-04/06. |
| U47 | Stay in Incognito after closing all private tabs in the viewer. PRIVATE-01–03; repeated at a resumption. |
| U48 | Optional tab picker above True bottom; gray its setting out for stock address bar; icon, title and X per tab; Samsung Internet reference. SET-03, PICK-01/02. |
| U49 | Shorten the active blue highlight vertically. PICK-05. |
| U50 | Remove gray line between address bar and tab bar. PICK-11. |
| U51 | Picker must disappear on downward scroll like the address bar. BOTTOM-06, PICK-12. |
| U52 | Lock screen hides picker until authentication. PRIVATE-04, PICK-12. |
| U53 | X sits below center; page sharing crashes. PICK-06/07, SHARE-01; repeated at a resumption. |
| U54 | New X is too big; restore old size and only center it. PICK-06/07. |
| U55 | Favicon defaults incorrectly or shows a previous page's icon. PICK-09/10. |
| U56 | Center tab title vertically within highlight. PICK-07. |
| U57 | X and tab name must share the same centerline, not remain offset. PICK-07. |
| U58 | Gray divider has returned; remove it. PICK-11. |
| U59 | Divider specifically reappears when a long-press menu is shown. PICK-11 and menu regression check. |
| U60 | Both bars stopped hiding on downward scroll; restore stock scrolling behavior. BOTTOM-06, PICK-12. |
| U61 | Both now hide/return, but returning address bar flashes gray until scrolling stops. BOTTOM-06 accepted; BLACK-03 still required. |
| U62 | Address bar now stays black throughout motion. BLACK-03 acceptance. |
| U63 | Create this complete user-visible behavior document, with authority over other repository sources to prevent regressions. This contract and its maintenance/precedence rules. |
