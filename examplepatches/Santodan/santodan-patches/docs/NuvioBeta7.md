# NuvioTV 1.1.0-beta.7

> Historical implementation notes. The active patch set targets [beta.8](NuvioBeta8.md).

The fourteen public NuvioTV patches support `com.nuvio.tv` `1.1.0-beta.7` (version code
`1070`) only. Production hooks and runtime reflection use beta.7 symbols directly;
no backward-compatibility adapters are included.
The current-session source label is documented in [NuvioCurrentStream.md](NuvioCurrentStream.md).
Preferred source ordering and per-profile autoplay are documented in [NuvioPreferredAddon.md](NuvioPreferredAddon.md).
Playback button customization is documented in [NuvioPlaybackButtons.md](NuvioPlaybackButtons.md).
IntroDB submissions, including settings, two-press capture, the native review
dropdown and validation errors, are documented in [NuvioIntroDb.md](NuvioIntroDb.md).
The source backup is
`../backups/nuvio-beta7-20261016-174310/`, with a manifest of SHA-256 hashes and a
binary Git diff.

Input: `../OriginalApps/NuvioTV-1.1.0-beta7.apk`, SHA-256
`a35eb5033615018f50f5205dc51f52e526b3b606f7e563943201dfbd7366d1f2`.
DEX inspection artifacts are under `../Skills/inspection-evidence/.inspect-nuvio-beta7/`.

## Native contracts

| Contract | Original beta.7 DEX |
| --- | --- |
| Progress repository | `Lba/ze;`, 14-parameter constructor; profile `j:Lg9/e;`, registry `k:Lq9/a0;` |
| Provider interface | `Lq9/z;`; progress lists `q()`, ready state `p()`, refresh `v(intent, ContinuationImpl)`, siblings `w(Continuation)`; progress writes `r(progress, boolean)` |
| Local watched history | `Lcom/nuvio/tv/data/local/kc;->i:Flow` |
| Provider selection | `Lba/hd;->invokeSuspend(Object)Object` is shared with watch-party state. Only the final provider return is replaced; jumps land on the callback and the unrelated first return is preserved. |
| Effective tracking source | `Ln3/j;`, native source enum `Lcom/nuvio/tv/data/local/vb;` |
| Settings / Hilt | `Lq8/e;`; coordinator provider `L3`, profile provider `B`, stream repository provider `Y2`; supplied by `Lq8/f;->get()` |
| Stream repository | `Lba/d5;->l(String,String,Integer,Integer,boolean)Flow`, pause `l:MutableStateFlow` |
| Player | `Lva/ue;`, 53-parameter constructor; controller `Y:Lva/k8;`; `f()` reads `F0:StateFlow` |
| Player request / state | `Lva/k8;->T:String`; `Lva/re;` current video `z0`, next episode `r1:Lva/v1;`, error `f1`; playing/buffering/ended `a/b/c` |
| Next episode routes | `Lva/ub;->D(controller,Video,boolean)V` has three callers, all `Lva/mb;->invokeSuspend`; delegates to `q`; threshold `x(controller)V` reads `r2:boolean` and has 12 registers |
| Home / badges | `Lsa/x3;`, 27-parameter constructor; state `z`, caches `V0` / `X0`; helper `Lsa/m5;`, cutoff coroutines `Lsa/a5;` and `Lab/jc;`, cache coroutine `Lba/g2;` |
| Library | `Lba/h1;`, eight-parameter constructor; registry `f:Lq9/j;`, profile `g`, flow `n` |
| Poster / wide images | `Leb/m;->b`, 15 parameters, Composer at range start + 11; `Lha/b1;` has 62 registers, `Lha/h2;` 36, `Lha/s0;` 53, wide `Lha/u1;->e` 65 (title v43) |
| Item context | Library `Lha/n0;->invoke` has two item anchors; collection `Lha/c0;->invoke` and `Lha/t0;->invoke` each have one |
| Shared controls | Rows `Lab/uh;`, sections `Lab/kj;`, picker `Lab/fi;`, style controls `Lab/og;`, Layout lambda `Lab/y9;` and item lambda `Lab/da;` |
| Compose | State factory `Lh1/h;->s(Object)Lh1/t1;` (the same-arity `r(long)` is incompatible); composer `Lh1/l0;`; width/height/size modifier methods moved from `e/g/m` to `f/h/n` |

## Verification

Use Java 21 and Android platform 36 from the repository root:

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList
.\build-local.ps1 :patches:verifyNuvioBeta7 :patches:verifyNuvioBeta7Launcher
.\build-local.ps1 :patches:verifyNuvioBeta7Player :patches:verifyNuvioBeta7DateStyleRuntime
.\build-local.ps1 :patches:verifyNuvioBeta7Bundle
```

The DEX verifier checks native contracts and missing, changed, ambiguous and duplicate
hook rejection, then writes and reloads the modified DEX. Host runtime checks cover
player targets, buffering/errors, Hilt readers, style controls, persistence and reset.
The bundle verifier applies next-episode, merged progress, playback customization
and IntroDB individually, plus the current-stream indicator, then all twelve behavior patches together. It checks assembled hooks and extension/coroutine
references, verifies the unrelated watch-party return is untouched, and compares
cross-DEX hierarchy findings with the original. Both have the same 36 unresolved
optional-library references; no new hierarchy finding is introduced.

Device checks remain for focus/navigation, native playback, profiles, all opt-in
features, and Android TV channel publication. Host checks do not establish device UI
behavior. No device installation is part of this task.

## Correction and verification

The supplied log showed two reflection failures. Settings used the incompatible
`h1.h.r(long)` factory with a Boolean argument, preventing the menu from rendering.
Stream preloading selected the suspend `ba.d5.j(...,ContinuationImpl)` method with
a Boolean argument. Both calls now use the exact beta.7 signatures listed above.
The logcat command itself did not cause these failures.

Production DEX validation checks both signatures before patching. Negative tests
reject the incompatible same-arity signatures. The beta.7 menu runtime verifier
covers 17 standalone, combined, expanded and collapsed patch selections, with the
incompatible factory present as a regression trap. Stream tests include an
incompatible suspend-method trap, the real 30-second delay, caching, cancellation,
disposal and profile isolation. Settings-store and provider-refresh fixtures use
beta.7 fields and methods. Historical beta.6 verifiers are not run for this update.

Run the additional runtime checks:

```powershell
.\build-local.ps1 :patches:verifyNuvioBeta7SettingsMenuRuntime :patches:verifyNuvioBeta7TrackingDialogs
.\build-local.ps1 :patches:verifyNuvioStreamPreloadRuntime :patches:verifyNuvioProviderRefreshRuntime
.\build-local.ps1 :patches:verifyNuvioSettingsStoreRuntime
```

Final replacement artifacts:

- Bundle: `dist/patches-0.11.0-nuvio-beta7-detail-fixed.mpp`.
- Unsigned APK: `../Apps/NuvioTV/NuvioTV-1.1.0-beta.7-patches-0.11.0-detail-fixed-unsigned.apk`.

These replace the earlier build that produced the reported errors. The seek
thumbnails files remain removed at the user's explicit request and are absent
from the build. The original source backup remains available. Device UI and
playback still require testing on the target device.

Final validation passed: beta.7 DEX, launcher, player, date-style, tracking-dialog,
17 menu selections, settings-store, provider-refresh and packaged standalone /
combined bundle checks. The full APK rebuild applied all ten patches with no
failed patches. The output is `com.nuvio.santodan`, version code 1070; all 112
native libraries match the original, alignment passes, and no stale APK
signatures remain. The APK is unsigned and has not been installed.

## Detail-page resolver correction

The later device log (18:39-18:40) exposed another stale method name:
`ra.t0.C(int,String,String):String` was receiving `Meta`. The beta.7 native
resolver is static `ra.t0.D(Meta,NextToWatch,List):Video`. Runtime lookup now uses
that exact signature and validates its return type and static status. Patching
also validates the original DEX signature. The regression fixture keeps the
incompatible `C` method alongside typed `D`, and exercises movie and episode
preloads through the production observer. A negative DEX test rejects an integer
parameter substituted for `Meta`. No older-version support was added.

The replacement artifacts for this additional fix are
`dist/patches-0.11.0-nuvio-beta7-detail-fixed.mpp` and
`../Apps/NuvioTV/NuvioTV-1.1.0-beta.7-patches-0.11.0-detail-fixed-unsigned.apk`.
The full APK rebuild applied all ten patches successfully; native libraries and
alignment checks passed. Signing, installation and device validation were not performed.
