# v0.4.0-beta.23

Correct Mebuki's official stock reply route. Owner beta.22 diagnostic reported HTTP 405, ROUTER_ERROR, valid authenticated before-read.

## Evidence

- Official homepage and manifest-1310c429.js retrieved with HTTP 200. Manifest 198164 bytes, SHA-256 983bee4a65ec606f2742a4a6e0b5a676157e6b23211695d6ba3be9bd8b2a71af.
- Manifest: routes/app path app; routes/app._main pathless; routes/app._main.t.$tslug path t/:tslug, hasAction true, hasClientAction false, not an index route. routes/$ path *, hasAction false, hasLoader true.
- Thread bundle app._main.t._tslug-CVcJPhqn.js (272641 bytes, SHA-256 90566ad0073717acee327097dd5d801077f56e480dbca588da6d51323640c9fc) invokes useSubmit with current pathname, POST, multipart/form-data, replace. Public lib-CVvGuY8y.js useSubmit X() invokes router.navigate; components-Cmn8HqJI.js Xr/Yr/Lr append .data and serialize form data. _routes is GET-only. No extra action header is constructed in those functions.
- Anonymous GET only: old /t/{slug}.data returned HTTP 404, X-Remix-Response, catch-all route; /app/t/{slug}.data returned HTTP 202 with router redirect; /app/t/{slug} returned HTTP 302. No live POST. The missing parent path explains the observed router-level 405; authenticated POST acceptance remains owner-verification pending.
- Related upstream sources: https://reactrouter.com/start/framework/routing ; https://v2.remix.run/docs/guides/single-fetch/ ; https://github.com/remix-run/react-router/issues/11024 ; https://github.com/remix-run/remix/issues/8905 ; https://better-auth.com/docs/concepts/cookies . GitHub issue search confirmed the wrong-action case. Reddit archive partial, BBS and Hatena search did not provide additional protocol evidence.

## Changes and verification

- Canonical /app/t/{slug}.data, matching Referer, cookie path and same-thread redirect classification. Explicit 405 message. No automatic retries, alternate routes, credential or authorization changes.
- JVM synthetic-only test MebukiRouteContractTest: beta.22 compiled classes returned 405 on old route, zero acceptances, 15 assertions. Corrected production classes accepted one request on new route, verified readback/native number, rejected a subsequent synthetic 405 without alternate POST, 59 assertions. Final build compiled classes repeated the corrected gate successfully. Test overrides all URL protocols in-memory, no sockets or real account. Android Context/Base64 shims in tests/host.
- All seven patches applied. ARM64 library unchanged and 18 exact URL CPU cases passed. Existing native rendering and socket authentication code unchanged. Android UI fixture updated for the correct route but not executed: the combined AVD test operation was blocked by a safety check; no attempt made to bypass it. Isolated AVD stopped, shared AVD untouched. No new Android UI or cross-board end-to-end regression claim.
- MPP 901953 bytes, SHA-256 a4e2220ba8d3696ec8569179b6fbc9a2003cd1579b6dda306d2ad6d2ba0cc41c. Owner should try one text reply, inspect the diagnostic if not confirmed, and refresh before retrying. Actual server acceptance is not yet verified.
