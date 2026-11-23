# Focus Guard Patches

A small custom patch set for Morphe. The first patch targets Firefox Android **160.0** and adds friction to disabling or uninstalling **LeechBlock NG** through Firefox's extension-management API.

> This repository is independently maintained and is not affiliated with, endorsed by, or an official project of Morphe, Mozilla, or the LeechBlock developer.

## Current patch

| Patch | Target | Behaviour |
|---|---|---|
| Protect LeechBlock NG | Firefox Android `org.mozilla.firefox` `160.0` | Rejects disable and uninstall requests for the LeechBlock NG extension ID; leaves other extension IDs on the original code path. |

The patch uses the LeechBlock NG add-on ID `leechblockng@proginosko.com`.

### Limitations

This is deliberate friction, not a tamper-proof control. It does not prevent:

- clearing Firefox app data or deleting the Firefox profile;
- uninstalling Firefox, replacing its APK, or installing a different browser;
- disabling site access/permissions or otherwise interfering with LeechBlock outside the two patched engine methods;
- bypasses added by future Mozilla changes or alternate extension-management code paths.

The patch is intentionally compatible only with Firefox `160.0`. Do not broaden the compatibility declaration until a new APK has been audited and tested.

## Build

Prerequisites:

- JDK 21
- Gradle 9.8.2
- A GitHub token with `read:packages` access if the Morphe package registry requires authentication

Configure package credentials in your user-level `~/.gradle/gradle.properties`, not in this repository:

```properties
gpr.user=YOUR_GITHUB_USERNAME
gpr.key=YOUR_GITHUB_TOKEN
```

Then run:

```sh
gradle :patches:buildAndroid --no-daemon
```

The output `.mpp` bundle is written to `patches/build/libs/`.

The repository intentionally does not include a Gradle wrapper binary. CI installs the pinned Gradle version using `gradle/actions/setup-gradle`; local builds should use the same Gradle version.

## Import into Morphe Manager

1. Build the `.mpp` file, or download the `focus-guard-patches-mpp` artifact from a successful GitHub Actions run.
2. In Morphe Manager, import the `.mpp` file as a patch bundle.
3. Patch the **original, unmodified Firefox 160.0 APK**.
4. Keep a backup of Firefox data before installing the patched build. A patched APK has a different signing certificate from Mozilla's official APK, so it may require replacing the existing installation; export/bookmark-sync important data first.
5. Test both disable and uninstall attempts against LeechBlock, then test that a different extension can still be disabled and removed.

## Validation

### Automated tests

```sh
python -m unittest discover -s tests -v
```

These tests validate the source-level patch contract and the Firefox 160.0 DEX layout recorded from the APK audited for this patch. The optional uploaded-APK integration test is skipped unless `FIREFOX_160_APK` is set.

### Audit an APK directly

The DEX audit tool uses only Python's standard library:

```sh
python tools/firefox160_dex_audit.py /path/to/org.mozilla.firefox_160.0.apk
```

To run the optional integration test against that APK:

```sh
FIREFOX_160_APK=/path/to/org.mozilla.firefox_160.0.apk python -m unittest discover -s tests -v
```

The audit checks the manifest package/version, exact GeckoEngine method descriptors, access flags, parameter/register counts, `WebExtension.id`, both callback adapter interface types (`Function1`/`Function2`), and the uninstall error callback's real DEX register order (`extensionId: String`, then `Throwable`).

### Post-patch device validation

CI can prove that the patch project builds. It cannot prove runtime behaviour on your device. After applying the patch, verify all of the following manually:

1. LeechBlock NG remains enabled after attempting to disable it.
2. LeechBlock NG remains installed after attempting to uninstall it.
3. The add-ons manager reports/handles the rejected operation without crashing Firefox.
4. A non-LeechBlock extension can still be disabled and uninstalled normally.
5. Firefox restarts and normal browsing still work.

If any test fails, do not rely on the patch as a restriction.

## Development notes

- The patch resolves both fingerprints before changing either method. A signature mismatch should fail the patch instead of patching a guessed method.
- The disable path invokes Firefox's existing `Function1` failure callback with an `IllegalStateException`.
- The uninstall path invokes Firefox's existing `Function2` failure callback with the extension ID string and an `IllegalStateException`. The ID-string argument was verified in the Firefox 160.0 synthetic error adapter.
- No extra DEX registers are allocated; the inserted code uses existing local/parameter registers.
- Target APK audit details are in [`docs/FIREFOX_160_AUDIT.md`](docs/FIREFOX_160_AUDIT.md).

## License

GPL-3.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
