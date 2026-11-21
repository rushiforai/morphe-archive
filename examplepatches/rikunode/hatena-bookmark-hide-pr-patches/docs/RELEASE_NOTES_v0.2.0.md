# v0.2.0 EXPERIMENTAL — Hatena Bookmark 5.80 (58000) PR filtering

**Prerelease / not production ready.** This version supports **5.80 / versionCode 58000**, not 5.84. Two Morphe patches: (1) hide native PR entries from article feeds, (2) optional safe side-by-side clone. Both on by default.

**Confirmed:** Original APK SHA256 `f5de27b6d0948d5716ef7dd24c0910c37e370c07db3888ff8aaa38a70afbd94b`; original APK v2/v3 signer CN=Hatena Inc. with source stamp; no Pairip-related components found. Morphe Desktop applied both patches, zero errors, rebuilt and signed the clone; final DEX bytecode confirms isPrEntry() causes early return false. Android 36 virtual device installed the clone and launched MainActivity.

**NOT CONFIRMED:** Live feed rendering, disappearance of actual advertisements, signed-in account functionality, 2026 API compatibility, or absence of malware in any third-party APK mirror. Android emulator System UI was unresponsive in two host-constrained test runs; neither yielded valid article-list UI data. We did not disable Play Protect or bypass license checks.

**Important:** User-supplied original APK was from an unofficial third-party archive. The public release distributes ONLY Morphe .mpp source/patches, **no APK**. A valid APK signature is not a comprehensive malware safety guarantee. Keep your installed 5.84 untouched, and do not install a third-party APK if you are uncomfortable with its origin.

See Japanese instructions in `docs/MORPHE_MANAGER_SETUP_JA.md`. Historical v0.1.1 targeted 5.84 and is known blocked by Pairip.
