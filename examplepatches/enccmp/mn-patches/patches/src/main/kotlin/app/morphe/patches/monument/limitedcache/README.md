# Patch — Limit thumbnail cache by default

> Part of the [Monument Morphe patches](../../../../../../../../../README.md) bundle.

Turns the **"Unlimited cache size"** preference **off by default** (limited ~100 MB thumbnail
cache). The switch in *Settings → Manage cache* is checked when the thumbnail cache size preference
is `0` (unlimited), and `0` is the **default** — so unlimited is on out of the box. This patch
makes the default a limited value instead. The user can still turn unlimited back on; that choice
persists.

Source: [`Fingerprints.kt`](Fingerprints.kt), [`LimitCacheSizePatch.kt`](LimitCacheSizePatch.kt).

## How it works

- **Fingerprint** — `SharedPrefsHelper.getThumbnailsCacheSize()` (obfuscated to `a0()I`), matched
  by return type `int` + the unique key string `config.thumbnails_cache_size` + the
  `SharedPreferences.getInt` call (the setter uses the same string but returns void).
- **Injection** — overrides the `getInt(key, 0)` default argument with `5000` (the app's own
  "limited" value, set when the switch is turned off). An unset preference now reads as
  **limited / switch off**, and this flows to `AndroidConfigurationManager.getThumbnailCacheLimit()`
  as well.
