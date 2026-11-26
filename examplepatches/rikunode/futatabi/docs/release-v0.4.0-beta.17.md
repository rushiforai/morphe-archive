# v0.4.0-beta.17 ? Mebuki Discord login compatibility (PARTIAL)

## Cause and fix
- Owner reported beta.16 Discord login returns to the credential form after submission. Discord upstream issue #5165 (https://github.com/discord/discord-api-docs/issues/5165) reports the same symptom and a resolution by enabling DOM storage. Android WebSettings documents the default as false.
- Enable DOM storage on MebukiLoginActivity only. Actual patched beta.16 and DOM-only beta.17 APKs were compared by isolated Android instrumentation: DOM storage false -> true; synthetic localStorage/sessionStorage read/write false -> true. First-party cookies true, third-party cookies false, multiple windows false, JS automatic windows false in both. No other compatibility setting changed.
- The DOM-only candidate displayed the official Discord email/password form after navigation. No credentials entered, no login submitted. The first observation at 5 seconds did not find fields; a later read-only UI dump found both. Actual authentication success remains owner verification, not proven by storage or form checks.

## Diagnostic and alternate browsing route
- Show main-frame HTTP/network/TLS failure and OAuth error-return status outside folded management controls. For a recognized Discord login/MFA POST error while viewing Discord, display only the status/error code and normal provider verification guidance. No request body, response body, credentials, URL query or token recording. No CAPTCHA bypass, UA spoofing, TLS relaxation, third-party cookie enablement or popup allowance. Actual post-credential challenge/error callback is unverified.
- Management includes optional official-site browser entry. Chrome Custom Tab preferred, normal Chrome or default browser fallback. Explicit notice: browser login is NOT imported into the app. Actual isolated AVD launched Chrome CustomTabActivity and displayed official mebuki.moe. No real authentication; normal-browser fallback untested.
- Better Auth Expo integration (https://better-auth.com/docs/integrations/expo) requires server trustedOrigins and native integration for deep-link/session handoff. RFC 8252 separates external user-agent cookie storage from the app. Existing public Mebuki client uses /auth/callback and /?error=failed; no verified native handoff contract. Do not extract browser cookies or bypass OAuth.

## Authenticated reading
- Reopened the previously collected public client bundle use-thread-messages-ByVYyF88.js (3440 bytes; SHA-256 67a1dc2f60dace2c400449e7e34910c73b8323a576be62cfbaaaff5ff03b482c). It fetches /api/thread/:slug/messages with optional t and initial, reads text, decodes Turbo Stream and uses timestamp, messageCount, messages, id, createdAt, content, replyTo. A new anonymous PC public fetch failed with HTTPError (status not captured). Authenticated payload and access path remain unverified. No guessed native conversion or unprotected private thread route. The verified beta.16 unavailable notice remains.
- Existing first-party get-session verification and app-private session storage unchanged; actual authenticated callback/commit pending owner login.

## Gates and limitations
- Final APK: all 7 patches applied; actual Android DOM storage read/write PASS; synthetic 503 status visible without fixture URL/query PASS; 13 navigation and 6 auth-error route classifications PASS. Browser launch PASS. Test uses synthetic storage origin only, no credential input or submission.
- No real login, posts or private reads. Isolated AVD only. Previous limitations: native stock composer, quote tree tap, Animanch menu filtering, authenticated Mebuki content, X login stability, read HTTP error, and other beta.16 limitations remain.
