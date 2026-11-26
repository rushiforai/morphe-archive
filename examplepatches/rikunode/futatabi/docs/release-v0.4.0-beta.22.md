# v0.4.0-beta.22

Mebuki stock reply transport and last-attempt diagnosis. The owner reported that beta.21 returned uncertain and the attempted reply was absent after refresh. The actual authenticated upstream response from that attempt is unavailable; the live rejection cause is not established.

## Verified protocol corrections

- Public bundles retrieved over HTTPS with HTTP 200: components-Cmn8HqJI.js (127505 bytes, SHA-256 4f832e34e0df9ac8237c8f8bc480819bd0f87cf168d9943e29c663dc492eaba8), app._main.t._tslug-CVcJPhqn.js (272641 bytes, SHA-256 90566ad0073717acee327097dd5d801077f56e480dbca588da6d51323640c9fc), message-CGuV2_OB.js, entry.client-BZ1dNS5c.js and use-file-attachments-DEVUA6os.js.
- React Router's Xr/Lr/Yr/Pr/Fr/jr/Mr functions use POST /t/{slug}.data, browser fetch and a flattened JSON reference table. The beta.21 thread API decoder is incompatible with this action format. Anonymous GET of a trial thread's .data returned HTTP 404, text/x-script, X-Remix-Response and a flattened table. It was not a POST test.
- Reconstruct ordered multipart fields (optional replyToId, content, showUsername, showThreadOwner), CRLF wire normalization, default fetch Accept, same-origin Origin/Referer and Android WebView default UA. No synthetic fetch-metadata headers, no CAPTCHA or challenge bypass, no automatic POST retry or redirect follow.
- Revalidate saved session; when the WebView root header exactly matches the saved header, use CookieManager's exact action path selection, including HttpOnly cookies. Conflicting duplicate cookie names or missing root cookies stop before POST. If the root header has changed, do not silently switch identity; use the previously saved, revalidated session and record the category. No cookie values or names are exposed.
- Separate router data, explicit action errors, no-content, same-thread redirects, other redirects, HTTP errors, challenge, HTML, malformed and transport responses. Only eligible action responses and authenticated readback matching one new authored post can report success. Unknown responses may be read back for diagnosis but cannot report success. Existing ordinal mapping and native rendering retained.
- Extension home > Mebuki post diagnostics shows latest attempt only: fixed stage/response/readback enums, HTTP status, counts, cookie-scope category and presence flags. No body, thread slug, post ID, account, cookie value or arbitrary upstream error text is stored. Unknown results direct the owner to the diagnostics after refresh.

## Evidence and limitations

- Four synthetic single-fetch fixtures decoded by the actual public JS decoder extracted locally. Authenticated action success/failure payloads from the real server are still unverified. Server CSRF requirements, exact cookie configuration, and rate limits are not inferred from client code.
- Isolated AVD: actual stock composer, 19 mock action requests, 9 mock acceptances, 15 negative/uncertain cases, redirect/no-content, quote/CRLF mapping, missing/expired session and external socket denial PASS. Synthetic thisno 2458429315443 received by Flutter. Separate focused CookieManager scope test: one accepted mock POST and duplicate-name rejection before POST. Actual diagnostics screen rendered and verified redacted metadata. No live POST; target UID IPv4/IPv6 egress blocked throughout tests.
- Existing native Mebuki read/image protection and Aimoge/Animanch composer mock regression passed. Seven patches applied; unchanged ARM64 library passed 18 URL cases. Isolated AVD stopped; shared emulator untouched.
- BBS search returned no actionable protocol evidence; Discord connector unavailable per supervisor. No owner credential used. Text replies only; attachments and new threads remain unsupported.
- Release MPP 901908 bytes, SHA-256 ae31069d79e50e71f5bb5bf4e52386df6c0a20df40b006c783582c98e1608600.

Owner live test required. Submit one text reply, refresh first if uncertain, then open the diagnostics screen. Do not retry an uncertain submission blindly.
