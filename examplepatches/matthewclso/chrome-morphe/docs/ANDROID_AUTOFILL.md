# Android autofill

Available as an optional patch in source **0.3.0 or newer**. It keeps MicroG
sign-in while allowing Google's stock Android autofill service
to handle website forms. Chrome 153 normally rejects that provider in its
platform-autofill mode; the optional **Android autofill** patch removes
that exclusion in availability checking and provider preference persistence.
It also disables Android autofill entirely for off-the-record profiles,
including Incognito and private Custom Tabs.
Native policy checks, service availability, explicit user selection, origin
information and provider authentication remain unchanged.

## Local validation

- The prototype builds and patches Chrome 153.0.8010.53 (801005304, ARM64).
- The resulting APK passes signature verification with the existing development
  key and 4 KB alignment checks.
- Disassembly confirms two Google-specific comparison results changed in
  `AutofillClientProviderUtils`. The tab's provider preparation now routes
  off-the-record profiles through Chrome's existing disabled path, which
  destroys any attached provider and sets the content view to
  `IMPORTANT_FOR_AUTOFILL_NO_EXCLUDE_DESCENDANTS`.
- The loopback fixture accepts only its public dummy credential and never logs
  or persists submitted fields. Windows can reach the WSL fixture over localhost.

## Device findings, 2026-09-28

On the Galaxy S26, while retaining MicroG sign-in:

- Prototype v43 saved a disposable login to Google's system password service.
  Revisiting the form offered that login; after Google's confirmation, both
  fields were filled correctly and the fixture accepted the submission.
- A second hostname did not receive that saved login or populate either field.
- The HTTPS fixture was served through local DevTools request interception at
  `https://example.com/morphe-autofill-fixture/`; no submitted fields were sent to
  that domain. `example.org` was the separate-host negative check. The plain
  loopback fixture did not receive a save offer on this device.
- **v43 failed Incognito privacy testing:** the user observed a Google save
  prompt after submitting a private dummy login. Android autofill was disabled
  immediately afterward. Do not distribute that prototype.
- v45 adds the off-the-record guard described above. The user confirmed no
  private save prompt; Android recorded no Chrome autofill requests during that
  private entry/submission or after backgrounding and reopening the app.
  The user then confirmed regular-tab filling still worked; both fields matched
  the disposable credential. Private autofill is deliberately unavailable;
  merely suppressing the submission callback would not prevent disclosure of
  private form values or later save prompts.
- Starting from Chrome's own Google Password Manager button, **Android settings
  → Google → Google Password Manager** reached the stock native viewer. The user
  confirmed viewing the disposable password and deleted only that entry.
  Authentication was left to the user; no real password was inspected.
- Chrome's account remained visible without an account-error indicator. No
  account, app data, system provider selection or default-browser role was reset.
- Final release build v46 (source 0.3.0) was installed with the same signing key.
  Its private guard matches v45's verified bytecode. A further private form test
  used native touch/text input and completed with the expected dummy credential;
  the private-mode control remained selected, no save prompt appeared, and the
  framework recorded no autofill requests. Sign-in and Android autofill selection
  remained present afterward. Test tabs, servers and ADB forwards were removed.

Accepted release bundle SHA-256:
`2ba57042b85707dbca777742b7dc81330c8531bf762dd7e66391f23c9a36a162`.
Local v46 APK SHA-256 (not distributed):
`0edb960ac0334dfaf9b80a69a9c824a131921b767fed61bfa4fc1d210a4fa3a2`.

## Device acceptance

1. Install as an update, with **Chrome customization**, **MicroG
   sign-in** and **Android autofill** selected. Retain the existing signing key.
2. Keep Google selected as Android's autofill provider. In Chrome's autofill
   settings, choose **Autofill using another service** and confirm the restart.
3. Start `python3 tests/autofill_server.py` and run
   `adb reverse tcp:8766 tcp:8766`. In an explicit regular tab, open
   `http://localhost:8766/login`. For a provider that excludes localhost, use a
   controlled HTTPS fixture: forward `tcp:9223` to
   `localabstract:chrome_devtools_remote` and run
   `node tests/https_autofill_fixture.mjs <new-fixture-tab-id>` (Node 24).
   It intercepts every fixture request locally, including POSTs. Close the test
   tab before stopping the harness. Never submit fixture data to an unrelated
   public website.
4. Check whether Google offers to save it. Reopen the form and test actual
   filling and successful submission. The expected result is
   **Expected dummy login matched: yes**.
5. Open `http://127.0.0.1:8766/login` (or change `example.com` to `example.org`
   with the HTTPS harness active) and verify the first host's credential is not
   automatically offered as a matching login. Do not use a real credential or
   choose it through a manual password search.
6. Check native authentication when viewing/filling credentials, Incognito
   behavior (no provider requests, filling or save prompt), cold-start retention, and unchanged
   MicroG sign-in/bookmarks. The user completes any authentication themselves.
7. Remove only the disposable fixture entry after testing. If the experiment
   fails, restore Chrome's original autofill setting and the preceding APK.

Native password viewing from Chrome's settings button is a separate integration
path. Chrome offers Android password settings through the public
`android.settings.CREDENTIAL_PROVIDER` intent with Google as its package URI,
plus the existing website fallback. Android Settings must open the provider's
protected manager under its own authority. This does not impersonate stock
Chrome or bypass Google's authentication.

The native viewer route above was accepted on Samsung's Android 16 settings UI;
other manufacturers can arrange provider controls differently. Private Custom
Tabs use the same off-the-record guard but have not had a separate autofill
device test. This patch does not enable autofill in Incognito.

Source references, pinned to the target version:

- [AutofillClientProviderUtils](https://github.com/chromium/chromium/blob/153.0.8010.53/chrome/browser/autofill/android/java/src/org/chromium/chrome/browser/autofill/AutofillClientProviderUtils.java)
- [TabImpl provider and content-view lifecycle](https://github.com/chromium/chromium/blob/153.0.8010.53/chrome/android/java/src/org/chromium/chrome/browser/tab/TabImpl.java)
- [Profile.isOffTheRecord](https://github.com/chromium/chromium/blob/153.0.8010.53/chrome/browser/profiles/android/java/src/org/chromium/chrome/browser/profiles/Profile.java)
