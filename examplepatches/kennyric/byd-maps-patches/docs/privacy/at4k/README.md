# AT4K Launcher 1.3 patch validation

Input: `com.overdevs.at4k`, version 1.3, build 20, minimum SDK 27, standalone APK.

- APK SHA-256: `1bb6dad64f26e8d82d65f5a02f76327affb24b825f4d8d3f99c4d56d6fab77a3`
- Signer SHA-256: `bfc84ab1296c72653ebca20a2f4cd293bc342a67dd4c61df931edfbad5271685`

## Shipped-code evidence

The source comparison started from the 0.99 patches in
`saieshshirodkar/saiesh-morphe-patches`, commit
`bc8d7d9fb066f6eb5e1095c148b44df9899d381d`.
Version 1.3 has no `com.pairip` classes, license-check manifest components or
PairIP native library. The obsolete DRM control is retired for this target.

1.3 re-obfuscated the launcher internals: the shared preference holder is now
`T3/T8` (static `b` stores `launcher_prefs`, static `c` is the premium Compose
state). `MainActivity.onCreate(Bundle)` still reads `is_premium` from
`launcher_prefs`, boxes it and publishes it through that state; the successful
native unlock path (`T3/O8`) writes true to the same state and preference.
Unlike 1.2, the standalone `(SharedPreferences,String,Z)` writer is gone, so
there is no helper method to call anymore.

The patch therefore inserts the app's own `edit().putBoolean("is_premium",
true).apply()` editor idiom inline immediately before that startup read. At this
point `p1` is the preferences object, `v5` is `is_premium`, `v2` is true on
every incoming path (it feeds the later `READ_TV_LISTINGS` result move), and
`v6`/`v7` are dead scratch registers. All existing startup, state publication,
permission and receiver logic remains in place.

## Validation

- Android bundle compilation and patch-list generation succeeded.
- Morphe Desktop applied the patch, rebuilt and signed the APK; Android SDK APK
  and DEX validation passed.
- The independent decoded-output comparator checked all 5,331 classes and
  permits only the inserted startup write. It retains field and method
  declarations and distinct branch targets. Explicit default field values may
  be omitted by the compiler without changing their meaning.
- The manifest and decoded resource values match. Original native libraries,
  assets and compiled resource files are byte-for-byte preserved.
- Seventeen production input-guard assertions pass: the original is accepted;
  wrong package, old version, wrong build, absent/untrusted/mixed signers are
  rejected without manifest mutation, and different manifest minimum-SDK values
  are accepted unchanged per the shared publisher-variant policy.
- Reproducing the 1.2-era emulator flow (purchase button in the original,
  `Premium Unlocked ✓` after install and cold restart of the patched output)
  on 1.3 has not been repeated yet; device behavior evidence applies to 1.2
  only.

Reproduce after building the bundle (substitute local paths):

```sh
python3 scripts/validate_targets.py at4k ORIGINAL.apk --bundle BUNDLE.mpp --sdk ANDROID_SDK --output build/validation/at4k
python3 tests/verify_at4k_input.py --bundle BUNDLE.mpp --original ORIGINAL.apk --patched build/validation/at4k/at4k-unlock-premium.apk
```
