# v0.4.0-beta.21

Mebuki stock text-reply integration. Owner confirmed beta.20 native thread rendering and saved session; live posting remains owner-verification pending.

## Root cause and implementation

- beta.20 isolated stock composer reproduced the actual loopback POST /mebuki/futaba.php?guid=on and HTTP 403 Read only; trace contained one connection to 127.0.0.1:18765 and one exact POST. No upstream POST occurred.
- Register the exact Mebuki stock reply path with the existing same-process socket authentication. Reuse the private saved session, revalidate before posting, do not follow redirects or retry writes automatically. No AOT changes.
- Official browser bundles retrieved with HTTP 200: app._main.t._tslug-CVcJPhqn.js, lib-CVvGuY8y.js, components-Cmn8HqJI.js, message-CGuV2_OB.js, use-thread-messages-ByVYyF88.js, use-file-attachments-DEVUA6os.js, app._main.new-DfgTN12t.js. The form action is /t/{slug}; React Router single-fetch transport appends .data. Text multipart fields: content, optional replyToId, showUsername, showThreadOwner. Origin and Referer use the official host. No extra CSRF field observed in the client; server-side requirements and real action responses are not independently verified. Cookie header is reused as saved by WebView, not guessed.
- Match the authenticated readback against the before snapshot and the new authored post, body, parent, time, and stable ordering. Return thisno using the same ordinal numbering function as native rendering, only for a confirmed unique match. Unknown, rejected or ambiguous responses never report success. Concurrent identical posts from another device cannot be conclusively attributed without an upstream post ID.
- Login-required, expired-session, rejected, rate-limited and uncertain outcomes are explained without suggesting blind reposting. Text replies only; attachment and new-thread submission are deliberately rejected. Public client supports up to four reply attachments and a separate new-thread form with Turnstile; neither is implemented or bypassed. Exact server rate limits are unverified.
- Discord MCP returned 401; BBS search did not establish the posting contract. Public client code is the basis of the implementation.

## Verification

- Isolated Android stock composer UI: mock POST, confirmed native number 2458429315443 (synthetic fixture), missing/expired session rejection, stock login notice, external POST denial, quote mapping, seven negative/uncertain action cases. Nine mock action requests total, zero live posts. Test: tests/MebukiPostGate.java.
- Native Mebuki thread and private image rendering plus external read rejection passed on the candidate with identical read implementation. Final APK also passed existing Aimoge and Animanch stock composer mock regression.
- All seven patches applied; existing AOT 18 URL cases passed, unchanged ARM64 library. Isolated AVD was stopped; shared emulator untouched.
- Release MPP: 895048 bytes; SHA-256 4ce128a9ab20b89910bd189dca12e0d7db9d6a03760da73d49de312b3ce3e8f2.

No real account session was used in the test. The actual official action response and successful live reply remain unverified; the owner should verify a single text reply and refresh before any retry if the result is uncertain.
