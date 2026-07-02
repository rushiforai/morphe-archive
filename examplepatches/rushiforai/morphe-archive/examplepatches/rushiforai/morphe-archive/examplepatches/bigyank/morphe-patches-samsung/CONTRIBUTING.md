# Contributing

## Adding a new Samsung Health version

1. Download the target APK from APKMirror.
2. Decompile with `apktool d shealth.apk` or inspect DEX with [jadx-morphe](https://github.com/hoo-dles/jadx-morphe).
3. Verify Knox-related classes still exist at the paths in `Fingerprints.kt`.
4. Verify Samsung Account provider methods (`SamsungAccountUtils`, `com.osp.app.signin.sasdk.common.Util`) still match the fingerprints.
5. Verify OOBE heuristics in `OobeKnoxStubber.kt` still match (Knox popup strings, `HomeAppCloseActivity`, `KnoxHandlerViewModel`, `$this$isRooted`).
6. Cross-check against [SamsungAppsPatcher](https://github.com/bigyank/SamsungAppsPatcher) `apply_shealth_knox_bypass.py` if gates moved.
7. Add `AppTarget(version = "x.y.z")` to `Constants.kt`.
8. Test both patches with Morphe Manager on a Knox 0x1 device — confirm launch, login, and sync.
9. Open a PR with device model, Knox status, Health version, patch bundle version, and test results.

## Patch layout

```
patches/src/main/kotlin/app/bigyank/patches/shealth/
├── KnoxBypassPatch.kt       # disableKnoxIntegrityChecksPatch
├── AccountBypassPatch.kt    # bypassSamsungAccountSignatureCheckPatch
├── Fingerprints.kt          # 21 method fingerprints (17 Knox + 4 account)
├── BytecodeStubUtils.kt     # shared stub helpers (try/catch-safe body replacement)
├── OobeKnoxStubber.kt       # content-scanned OOBE Knox/root gate stubs
└── SigninPackageReplacer.kt # dex string/field com.osp.app.signin → com.notsamsung.dummy
```

## Patch design notes

The Knox patch stubs **17 stable SDK methods** (fingerprints) plus **OOBE/root gates** via dex content scan in `OobeKnoxStubber.kt`. Obfuscated class names like `home/oobe2/util/h` change per release; do not hardcode them.

**Out of scope for Health patches:** manifest/res multiuser edits, custom cert allowlists, other Samsung apps. `$this$isRooted` file checks are handled via dex scan in `OobeKnoxStubber.kt`. See [AUDIT.md](./AUDIT.md) for comparison with SamsungAppsPatcher and a prioritized roadmap.

The account patch is **dex-only** by design. Do not re-add `resourcePatch` for manifest/res replacement — it causes OOM on ~300 MB Health APKs during on-device patching.

Prefer **new fingerprints** for stable SDK methods; use **targeted dex scans** only for obfuscated app code (OOBE pattern established in `OobeKnoxStubber.kt`).

## Tooling

| Tool | Use |
| :--- | :--- |
| [jadx-morphe](https://github.com/hoo-dles/jadx-morphe) | Find method signatures and const-strings when adding fingerprints |
| [Morphe documentation](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-resources/guide.md) | Patch authoring basics |
| `adb logcat` | Verify `OOBEManager`, `MeSaSyncManager`, `AccountManagerProvider` after patching |
| SamsungAppsPatcher scripts | Parity reference for Knox gate patterns (PC-side, not required for Morphe users) |

## Commit messages

Use [conventional commits](https://www.conventionalcommits.org/) (`feat:`, `fix:`, `refactor:`, `bump:`) — releases are automated via semantic-release.
