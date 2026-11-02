# 191 response text Web search

The stock `o.lo.c(Context, String)` launcher starts ACTION_WEB_SEARCH using
`Activity.startActivityForResult(intent, 0)`, without NEW_TASK. Its exception
fallback also launches the Google search URL for a result. Neither route needs
a result, and the foreign search/browser activity can remain above ChMate in
ChMate's task (reported on Samsung Android 16, Haiagaru 1.8.5).

The 191-only entry hook delegates to `ExternalWebSearch.open` and returns before
the native for-result path. It starts the same search-provider intent using the
application context and FLAG_ACTIVITY_NEW_TASK. If no search provider handles
it, the encoded HTTPS Google search URL uses the same separate-task launch.
Browser preferences are respected; no WebView, internal checker, image/video
viewer, generic URL handler, or other ChMate version is changed.

An empty selection is ignored; unavailable/blocked activities produce a toast
without logging the selected text. No authentication or browser data is changed.

Verification:

- `VerifyExternalWebSearch.java`: patched DEX entry invokes the helper and returns
  before the stock startActivityForResult path.
- `frida-web-search191-test.js`: eight offline checks through the actual patched
  native launcher, using capturing ContextWrappers. Application-context routing,
  NEW_TASK, query preservation, provider fallback, URL encoding (+ / Unicode &),
  missing handlers, and empty selections are checked.
- Build and emulator APK patch/install succeeded. Local logs/artifacts:
  `build/verification/web-search191*`.

The capturing-context test does not verify Samsung task-manager behavior or
returning to a real thread on the reporting device. Physical-device UI QA remains.

2026-11-01: `ExternalWebSearch.prepare` is also called from the existing shared
`Haiagaru.retargetSelfIntent` launch boundary. All three versions now add NEW_TASK
to native ACTION_WEB_SEARCH intents, including 242's for-result launcher. Query,
explicit provider and existing flags are retained; ACTION_VIEW is unchanged.
191's original dedicated launcher/fallback remains. Six offline runtime checks
pass on each of 191/226/242; no real search query is submitted. See
`docs/version-parity-20261101.md` for verification and installation status.
