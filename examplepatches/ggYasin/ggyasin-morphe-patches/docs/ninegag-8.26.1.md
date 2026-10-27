# 9GAG 8.26.1 compatibility

## Input provenance

Original APK: `com.ninegag.android.app`, version `8.26.1`, code `80260100`,
minimum SDK 27, target SDK 36. Retrieved from the build-pinned original-app
endpoint `https://d.apkpure.net/b/APK/com.ninegag.android.app?versionCode=80260100`.

SHA-256: `ca257ed2a28ebb2f3bc0718b92390e3ced0b109cb1644bf06fdbb8d294f6b8e9`.
This also matches [Uptodown's 8.26.1 listing](https://9gag.en.uptodown.com/android/download).
Publisher certificate SHA-256:
`85581f5f4501c97a2c8bfa6f8942cfa829b0fc2d531288d6d77ce16ff30e4219`.
`apksigner verify --print-certs` verified the input signature and pinned certificate.

REA 6.7.0 with the audited JADX headless MCP 0.7.1 JAR inspected the package,
`d44.j`, `d44.d`, `g3b.f`, `gb.a`, `fa`, `ib`, and incoming banner references.
Root-obfuscated classes use JADX's `defpackage.` aliases. Raw DEX descriptors,
not display aliases, drive the patch. REA's package evidence ID is
`ev_6ed08b7015ebc501b0f74eec760c478550310b5066ad45361e309e937ebe3e50`.

## Version-specific edits

- **Promoted feed display:** `Ld44;->j(ILjava/lang/String;Z)Ljava/util/List;`
  retains 10 registers and its 30 original instructions, prefixed by
  `const/4 p3, 0x1`. The shared `d(String,int,int,int,boolean)` query builder
  remains unchanged; its promoted selector value 2 means `Promoted <> TRUE`.
- **Dedicated banner:** `Lg3b;->f(Landroid/widget/FrameLayout;Li04;)V` has
  11 registers and 54 original instructions. It now hides and clears only the
  supplied ad frame, then returns before registering the ad binding. REA found
  exactly three direct callers: HomeActivity, StandaloneHomeContainerActivity,
  and SwipeablePostCommentsActivity. Four banner layouts are zero-height/gone.
- **Ad policy:** `Lgb;->b(ZLo57;Lib;)Lfa;` has 3 registers and 22 original
  instructions. Unlike 8.23.0's Boolean gate, **null enables ads** in 8.26.1.
  A two-instruction prefix returns the real `Lfa;->a` NotInitialized blocker.
  This base policy feeds startup, synchronous checks and the reactive flow.
  Its wrapper only substitutes NSFW for null or the Subscription blocker, not
  NotInitialized. Entitlement, billing, consent and paid-access state are not
  changed. Returning `Boolean.FALSE` would be type-incorrect; returning null
  would enable ads.
- **Hosts:** the existing finite list is retained; actual executable references
  and string-valued fields are rewritten, not just unused DEX string-pool data.
- **Analytics:** optional and still off by default. Only the documented manifest
  metadata is added; Firebase services and other components remain intact.

8.23.0 keeps its original independent fingerprints and narrow edits. Patch names
no longer embed one version, so manual saved selections using old names may need
reselection after updating the source.

## Verification

Both selected patches and main-only builds were applied **without `--force` or
`--continue-on-error`**, using Desktop 1.19.1 `--validate --bytecode-mode STRIP_FAST`.
Both rebuilt and signed successfully. The verifier passed 39 checks for each:

```shell
python3 scripts/verify_ninegag.py original.apk patched.apk \
  --cli-jar /path/to/morphe-desktop-all.jar --java /path/to/jdk21/bin/java \
  --analytics --report verification.json
# Omit --analytics for the default main-only build.
```

It checks the actual instruction prefixes and preserved bodies, unchanged
shared database query and ad-flow callers, all 42,020 live class definitions,
no duplicates, all 173 listed-host references, all 135 native/asset entries,
manifest permissions and components, resource IDs, and layouts. Resource public
ID declaration order may change; the complete declaration multiset must not.
The unpatched/re-signed baseline fails the patch-effect checks (RED).

A separate bounded interpreter exercised actual original and assembled proposal
DEX over 96 runtime-policy and 24 startup-policy input combinations. All proposal
cases remained blocked, while the original included ad-enabled cases. This is
static semantics validation, not ART/device execution.

Local Gradle is blocked by a GitHub Packages token lacking `read:packages`.
A standalone source compilation using official Desktop 1.19.1/Patcher 2.0.1,
Kotlin 2.3.21 and D8 9.4.26 passed the existing 10 native-loader JUnit tests.
The normal GitHub Actions build remains the publication build path.

**No Android device or emulator was connected.** Feed behavior, login, paging,
startup timing and mounted-install behavior still require device confirmation.
Do not describe static validation as a runtime ad-free guarantee.
