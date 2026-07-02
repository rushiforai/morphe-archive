# Change Threads share domain

Rewrites generated Threads share links to `shoelace.kareem.one`.

## Hook coverage

Threads has several independent copy/share paths. This patch intentionally covers more than the obvious plain share intent builder:

- app share intent text extras
- chat invite/share intent text extras
- legacy `android.text.ClipboardManager#setText`
- `ClipData.newPlainText(...)`
- `android.content.ClipboardManager#setPrimaryClip(...)`

If a copied link still uses the original Threads host, first check whether it came from a new clipboard/share call site before changing the extension logic.

## Extension string-literal footgun

This patch also performs global app string-literal rewrites, for example replacing Threads hosts with the custom host. The extension dex is injected into the same patched app, so those global replacements can also rewrite the extension's own string constants.

Do not put full source-host literals such as `www.threads.com`, `threads.com`, or `https://www.threads.com` in the extension matcher logic. If those literals exist in the extension, the patcher can rewrite them before runtime and the extension will no longer match real Threads links.

Instead, construct source host strings at runtime from smaller pieces, such as `"threads" + "." + "com"`, and verify the installed extension class bytecode after patching.

## Query-string sanitizing

Sanitizing should happen after host rewriting, against the custom host. This keeps all hook paths consistent and avoids needing to match every possible source host variant twice.

Expected behavior:

- `https://www.threads.com/@user/post?igshid=abc` -> `https://shoelace.kareem.one/@user/post`
- `https://threads.net/@user/post?x=1#frag` -> `https://shoelace.kareem.one/@user/post#frag`
- Non-Threads text is left unchanged.
