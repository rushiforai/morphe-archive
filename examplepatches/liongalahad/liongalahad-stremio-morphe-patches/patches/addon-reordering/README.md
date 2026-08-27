# Addon reordering patch

This module adds remote-friendly ordering to Stremio Android TV's installed-addon list.

## User workflow

1. Open **Addons** with the catalogue filter set to **Installed**.
2. Hold **OK** on an addon.
3. The addon enters reorder mode with a thick Stremio-purple outline. A centered chevron is shown only for each available direction.
4. Press D-pad **Up** or **Down** to swap the addon with its adjacent item.
5. Press **OK** to save the new account order, or **Back** to restore the original order.

Held directional keys do not repeat. Each deliberate key press performs one adjacent swap. While a save is running, navigation and repeated confirmation are consumed.

## Persistence and safety

The visual list is changed provisionally. On confirmation, the module:

- obtains the active account from Stremio's `core` preferences, including the account-local preference file supplied by the multi-account module;
- fetches the latest addon collection from Stremio's account API;
- requires every visible addon URL to match one unique server descriptor;
- replaces only the matched positions in that freshly fetched array;
- preserves hidden addons, descriptor order slots, and every unknown JSON field; and
- submits the complete collection before asking Stremio Core to pull the account state again.

Any authentication, network, response-shape, duplicate-URL, or collection-mismatch failure exits reorder mode and restores the exact pre-edit rows. The authentication key is never logged.

Reordering is deliberately limited to lists where every visible descriptor is installed. Catalogue and discovery result lists are rejected with an instruction to open **My Addons**/**Installed**.

## Owned files

- `patch.patch` adds selection, click-suppression, and Back-cancellation hooks to the addon fragment.
- `morphe/` expresses the same three hooks as exact Morphe bytecode fingerprints for Manager builds.
- `src/com/stremio/morphe/AddonReorderBridge.java` owns the interaction state, outline drawable, account-safe merge, API request, rollback, and Core refresh.
- `apply.ps1` compatibility-checks and applies the compact smali diff.
- `augment.ps1` builds the module as `classes11.dex`; `classes10.dex` remains owned by the multi-account module.
- `patch.json` registers this module at order 150.

## Compatibility

The patch is checksum-gated by the root build for Stremio Android TV 1.10.4. It has been composed and signed for x86_64 and arm64-v8a. The x86_64 build was installed and exercised on an API 36 Android TV emulator.

## Rebuild

```powershell
.\scripts\build.ps1 -OriginalApk "C:\path\to\the-supported-stremio.apk"
```

See [TEST_RESULTS.md](./TEST_RESULTS.md) for the current acceptance evidence and the remaining server-write test boundary.
