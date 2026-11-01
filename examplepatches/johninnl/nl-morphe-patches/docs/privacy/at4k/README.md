# AT4K Launcher 1.2 patch validation

Input: `com.overdevs.at4k`, version 1.2, build 19, minimum SDK 27, standalone APK.

- APK SHA-256: `ac34c0abf1ceee5d5133dc3e99bde9173a00c5a16132852507ed23c0fbd41341`
- Signer SHA-256: `bfc84ab1296c72653ebca20a2f4cd293bc342a67dd4c61df931edfbad5271685`

## Shipped-code evidence

The source comparison started from the 0.99 patches in
`saieshshirodkar/saiesh-morphe-patches`, commit
`bc8d7d9fb066f6eb5e1095c148b44df9899d381d`.
Version 1.2 has no `com.pairip` classes, license-check manifest components or
PairIP native library. The obsolete DRM control is retired for this target.

The old `Q3/A5.h(Z)` purchase-state setter is replaced by a different design:
`MainActivity.onCreate(Bundle)` assigns `launcher_prefs` to `Q3/r8.b`, reads
`is_premium`, boxes it and updates `Q3/r8.c:LN/g0;`. The public premium accessor
returns `Q3/r8.d`, which aliases that same Compose state. The successful native
unlock action writes true to this state and preference too.

The patch adds one call to the existing `Q3/T4.r(SharedPreferences,String,Z)`
writer immediately before that startup read. At this point `p1` is the
preferences object, `v5` is `is_premium`, and `v2` is true on every incoming path.
The writer calls `edit().putBoolean(key,value).apply()`. All existing startup,
state publication, permission and receiver logic remains in place.

## Validation

- Android bundle compilation and patch-list generation succeeded.
- Morphe Desktop applied the patch, rebuilt and signed the APK; Android SDK APK
  and DEX validation passed.
- The independent decoded-output comparator checked all 5,156 classes and
  permits only the inserted startup call. It retains field and method
  declarations and distinct branch targets. Explicit default field values may
  be omitted by the compiler without changing their meaning.
- The manifest and decoded resource values match. The compiler renames four
  case-colliding resource ID names while preserving numeric IDs; the comparator
  resolves those IDs. Original native libraries, assets and compiled resource
  files are byte-for-byte preserved.
- Seventeen production input-guard assertions pass: the original is accepted;
  wrong package, old version, wrong build, absent/untrusted/mixed signers, and
  wrong or missing minimum SDK are rejected without manifest mutation.
- A fresh Android 16 TV emulator showed the purchase button in the original
  and `Premium Unlocked ✓` after a clean install of the patched output. A
  force-stop and cold restart retained the unlocked UI. No app crash was
  observed in this flow. Physical TVs and every individual premium feature
  have not been tested.

Reproduce after building the bundle (substitute local paths):

```sh
python3 scripts/validate_targets.py at4k ORIGINAL.apk --bundle BUNDLE.mpp --sdk ANDROID_SDK --output build/validation/at4k
python3 tests/verify_at4k_input.py --bundle BUNDLE.mpp --original ORIGINAL.apk --patched build/validation/at4k/at4k-unlock-premium.apk
```
