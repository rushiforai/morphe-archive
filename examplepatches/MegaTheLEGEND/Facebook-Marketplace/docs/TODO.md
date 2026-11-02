# TODO


- [x] **Disable internal webview**: make links open directly in the system browser.
  - The `externalLinks` option is enabled by default.
  - Confirmed working on device.
  - Known gap: other launchers such as Messenger, `LinkHandlingHelper` / `X.Rrg.A0C`, or direct `BrowserLiteActivity` launches may bypass `X.dBh.A00`. Test these paths if needed.

- [x] **Block Reels launches**.
  - The `blockReels` option is enabled by default.
  - Confirmed on device: Reels do not start and produce no audio.
  - Known side effect: fullscreen video paths such as Watch and listing videos may also be blocked because they share the launcher.
  - Not covered: Reels grid/tab UI on profiles and inline autoplay in feeds.

- [x] **Make Marketplace the home tab and fix Back behavior**.
  - The `marketplaceIsHome` option is enabled by default.
  - Confirmed working on device: Back from the Marketplace root leaves the app instead of switching to Facebook Home; Back within deeper screens still navigates up.

- [x] **Return to Marketplace when reopening the app**.
  - The `returnToMarketplace` option is enabled by default.
  - Confirmed by the user as working on device.

- [x] **Hide group suggestions**.
  - The `blockGroupSuggestions` option is enabled by default.
  - Confirmed by the user as working on device.
  - Scope: Marketplace search and listing-page group suggestion blocks. Other native Facebook Groups-related UI may remain outside the Marketplace surface.

- [ ] **Remove ads and group remnants from listing pages**.
  - Inspect listing pages while scrolling down and remove the **Related ads** and **Suggested ad products** sections.
  - Remove the Groups-related sections appearing in the same area: **Related groups** and **Groups discussion**.
  - Check multiple listings and scroll positions to ensure these sections are consistently hidden without breaking the listing page or normal scrolling.
  - Do not mark complete until confirmed working on-device.

- [ ] **Keep search inside Marketplace**: remove “Search in all of Facebook” and “Search with Meta AI” from Marketplace search.
  - The `blockFacebookSearch` option is enabled by default, but device behavior has not yet been confirmed.
  - Test Marketplace search suggestions and results with a query. Confirm both entries are absent and Marketplace search still works.
  - Test seller profile > `...` > Search; it should not launch Facebook-wide search.
  - If an entry remains, inspect `adb logcat -s MarketplaceOnly` for `hid N Facebook-wide search entry`, `search flag ...`, and `search flag read, not overridden: ...` messages.
  - Known gaps: deep links may still open a search results page; text matching is English-only; localized or canvas-rendered entries may evade view filtering.
  - Risk: a MobileConfig flag match could interfere with Marketplace search. Opt out with `-OblockFacebookSearch=false` if necessary.

- [x] **Make Marketplace fill the whole viewport**: remove the blank strip left by hiding the bottom tab bar.
  - Confirmed fixed on device.

- [x] **Force dark mode**.
  - The `forceDarkMode` option is enabled by default.
  - Confirmed by the user as working on device.
  - Potential limitation: custom-colored, WebView, or React Native screens may still follow the system theme.

- [x] **Add an About page to the account menu**.
  - The `aboutPage` option is enabled by default.
  - Confirmed by the user as working on device.
  - The page is opened from the Marketplace account menu.

- [ ] **Replace the hamburger with a refresh button**.
  - Keep the hamburger's top-bar slot, but replace its icon and click handler with a refresh action for the Marketplace feed.
  - Keep the side menu disabled (`lockNavigation`).
  - Starting points: `X.2Eb` click handler, `X.23K.A0D`, and `WordmarkNavigationBar.initSlidingPanelEntryButton`.
  - Find the existing pull-to-refresh or selected-tab reselect path before implementing.

- [ ] **Remove unused components** to reduce APK size.
  - Audit other tabs and unreachable Reels/Watch UI, Groups, Dating, Stories, and related resources.
  - Do not delete classes blindly: first stub or block entry points, then confirm through verifier/build results and logcat that code is truly unreachable.
  - Preserve classes and resources required by Facebook's runtime, reflection, dependency injection, or manifest.

- [x] **Rename the app to `io.focalpoint.prism` with the display name `Marketplace`**.
  - Confirmed working on device: builds, installs, and launches; the storefront icon is applied.
  - The original Facebook app remains separately installable.

- [ ] **Restrict direct activity launching**.
  - Added to the checklist per user request. Implementation and device testing are not yet confirmed.
  - Audit the merged/installed manifest for exported activities, activity aliases, and intent filters.
  - Determine which activities are reachable from external apps and whether they need to be exported.
  - Protect unintended activities while preserving the Marketplace launcher entry point, required Android system integrations, legitimate navigation, and any required deep links.
  - Test external launch attempts, for example with `adb shell am start -n <package>/<activity>`, and inspect installed package details with `adb shell dumpsys package io.focalpoint.prism`.
  - Acceptance criteria: external apps cannot directly launch unintended internal activities, while the Marketplace launcher and normal in-app navigation continue to work.

- [ ] **Random A/B UI on fresh install**: occasionally the app loads a different UI than the original Facebook app, and it only happens during install (first launch after installing).
  - Reported by the user; not investigated yet.
  - Unconfirmed guess: Facebook's server-side A/B / experiment flags give a freshly installed (cloned `io.focalpoint.prism`) copy a different layout variant. Needs checking.
  - To investigate: capture a screenshot of the odd UI and `adb logcat -s MarketplaceOnly` while it happens; compare with a reinstall (does it go away?) and with a fresh install of the stock app.
  - Check whether any patch hook (return-to-Marketplace, back, dark mode, search/group filters) is skipped on first launch.

## Notes

- Use `[x]` only for features confirmed working on-device.
- Use `[ ]` for incomplete work or behavior not yet confirmed.
- A successful build alone does not count as device verification.
