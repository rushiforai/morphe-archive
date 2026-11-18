# Coffee 1.26.0 and non-blocking update notices

Good Coffee, Great Coffee **1.26.0 (1504), ARM64** uses an unprotected startup
profile. Unlike 1.24.0 and 1.25.1, its original DEX contains no PairIP classes,
constant holders or VM calls. Its profile therefore omits the five recovered
initialization resources. The Unity pack bridge and original Firebase JNI DEX
remain required. All three supported profiles embed the same Firebase bytes.
Games client, base class and retry-field mappings come from this version's DEX.

The optional, default-selected **Non-blocking update notice** patch replaces
the local version/install warning screen with one Android `LENGTH_SHORT` toast
per process. It completes the original loading coroutine without waiting for an
Update button. It handles both the unsupported/outdated version notice and the
same screen's unofficial-install warning. Server status values, authentication,
purchase verification, receipts and other loading outcomes remain unchanged.
Backend protocol changes can still require a newer supported app/profile.

Patch a clean complete 1.26.0 ARM64 APKM/XAPK in Morphe. The default selections
are Skip rewarded ads, Google Play Games via MicroG-RE and Non-blocking update
notice; startup/pack support is their dependency. Preserve your existing signing
key when updating an installed copy. To restore the original warning behavior,
repatch clean input with the notice patch disabled, using the same key.

## Implementation and checks

The notice delta is SHA256-guarded and uses the existing PZB2 reader.
`native/coffeebusiness/update-1260.json` identifies the reviewed library,
coroutine boundary, original JNI JavaVM slot and payload address. The assembly
requests the Java helper through the Unity thread's context ClassLoader. JNI
lookup failures and Java toast exceptions leave loading independent of the
notification. The RX payload has 776 bytes. The builder relocates the program
header table into the appended segment, preserves original virtual addresses
and checks 16 KiB mapping congruence.

```powershell
python scripts/build_coffee_update_notice.py original.so notice.so --delta output.delta.gz
python scripts/test_coffee_update_arm64.py --library notice.so
```

Development dependencies: keystone-engine 0.9.2, unicorn 2.1.4 and pyelftools.
They are not needed on the phone. The native test executes the emitted ELF with
an isolated JNI fixture: active/failed/unchecked/version-warning statuses,
signer warning, missing VM/helper, repeat MoveNext, status and register retention.
The original ELF fails on the blocking dialog. JNI attach/detach and failed
local-frame creation are not exercised by this fixture.

Validation on the final APK: build, clean-input FULL patch, signature, all16
splits/44 libraries/2519 assets and all three packaged profile selections pass.
Only the reviewed ARM64 libil2cpp differs in the original native/assets audit.
The uninstrumented APK reaches the menu and Day1 with Maisie on a muted API35
Google APIs emulator with ARM64 translation. A separate memory-only test forces
the existing version callback to status0: the actual toast is shown/hidden in
2.633s, the Start menu is reachable, and the same process records Day1 start and
Maisie's arrival. The published APK contains no test instrumentation.

A null-base ContextWrapper test triggers a real UI-thread NullPointerException
inside the toast helper; its catch logs the failure and the process survives.
An earlier attempt to throw an exception by intercepting Toast.makeText with
Frida caused a native emulator-bridge SIGSEGV. That attempt is excluded from
passing evidence; its cause has not been established. Raw failure evidence is
retained privately. Testing used12 in-memory OCR frames and one private image
for the otherwise unreadable first-run age slider.

The test save and signer are disposable. Existing-user same-key upgrades,
Google/TapBlaze sign-in, cloud restoration, physical ARM64/API36 runtime and
paid checkout remain unverified. No real-money purchase was attempted.
Only source and patch resources are distributed; game APKs, keys, logs, images
and saves remain private. Implemented with OpenAI Codex; no generated media.
