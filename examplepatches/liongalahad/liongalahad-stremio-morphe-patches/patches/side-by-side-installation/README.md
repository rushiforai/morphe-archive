# Side-by-side installation patch

This module changes only the Android installation identity so the patched build can coexist with official Stremio.

## Owned files

- `patch.patch` changes the package name, launcher label, app-defined signature permission, and provider authorities.
- `apply.ps1` compatibility-checks and applies the diff to a decoded APK tree.
- `morphe/` owns the equivalent checked manifest finalizer used by Morphe Manager.
- `patch.json` declares this module to the root build orchestrator.

The resulting package is `com.stremio.morphe`, the launcher label is `Stremio Morphe`, and all app-defined permissions and provider authorities are unique to the Morphe package.
