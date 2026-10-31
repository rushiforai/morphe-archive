# Mihon — preserve excluded Default-category downloads

The optional **Preserve excluded Default-category downloads** patch corrects the
numeric type of the built-in Default category ID. When Default is already excluded
from deletion, read chapter downloads now receive the same protection as downloads
in custom excluded categories. Other read/unread and bookmark preferences retain
their existing behavior. It protects future deletions; it cannot recover removed files.

The patch is off by default and introduces no app preferences or schema. Select it
in Morphe Manager, patch the original official APK and keep using Mihon's existing
download deletion exclusions. Only the GitHub ARM64 0.21.3 APK has been tested.

## Provenance and upstream work

- App/package: Mihon `app.mihon`, `0.21.3`, versionCode `39`.
- [Official ARM64 APK](https://github.com/mihonapp/mihon/releases/download/v0.21.3/mihon-arm64-v8a-v0.21.3.apk), 27,755,052 bytes.
- SHA-256: `0026bd25ce5b1c6bdc5bd2c9589a08a811ddc4fa7c994cf937729d5b7010619d`.
- Official signer SHA-256: `9add655a78e96c4ec7a53ef89dccb557cb5d767489fac5e785d671a5a75d4da2`.
- Source tag: `feadad5e1e2bf638be6e2ca317d11657b09d4596`. The affected file is identical at tested main `e588e04359fe1058206a2cbac1b01018ad787359`.
- Reuses the `0L` correction proposed by Marc Went / Dunky13 in [existing PR #4182](https://github.com/mihonapp/mihon/pull/4182), commit `07e5882033ae664b0abcca3f5a64dc6e3e59e212`, Apache-2.0. No duplicate upstream fix PR.
- [Public deletion and pending-delete regression tests](https://github.com/pengusto/mihon/commit/473c67a): 1/7 fail before, all 37 app unit tests pass after. Shared in the [supporting comment](https://github.com/mihonapp/mihon/pull/4182#issuecomment-6520333921).

## Implementation and verification

The original fallback boxes `Integer(0)` while category IDs are `Long`; intersection
with the excluded Default ID is therefore empty. The bytecode patch supplies boxed
`Long(0)` through a tiny private helper without borrowing a live wide register pair.
A canonical full-class DEX guard pins the original owner. Reapplying to an already
patched APK fails before export. No runtime MPE or app library is added.

The acceptance harness invokes the real installed APK's public `deleteChapters`
method, actual provider and filesystem. Its six cases cover excluded Default read
chapters, unread chapters, no exclusion, a different excluded ID, protected bookmarks
and removable bookmarks. Original: one failure (lost protected page); patched: all
six pass with retained bytes identical. Source collaborator mocks and native Source
proxies are described in the evidence; they do not replace the deletion code.

The matched UI fixture contains one synthetic favorite and a synthetic downloaded
chapter. Both screenshots use **Downloaded only**: the original deletes the excluded
chapter, so the filtered list is empty; the patched APK keeps its downloaded entry.
The library database itself is not deleted in either case.

[Fresh raw PNG/XML, hashes and Manager acceptance](../tests/mihon/evidence/2026-10-30/README.md).
[Historical evidence and missing-JSON recovery](../tests/mihon/evidence/2026-10-29/README.md).
Only the owned Android 35 ARM64 emulator is covered; no physical-device claim.
