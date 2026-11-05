# NuvioTV 1.1.0-beta.6

> Historical beta.6 notes. See [beta.7](NuvioBeta7.md) for the active patch set and verification.

All ten public NuvioTV patches advertise exact compatibility with `com.nuvio.tv`
`1.1.0-beta.6` (version code `1069`). Older versions are unsupported.

The merged-progress submenu, Home/startup scheduling, main-service playback write
routing, and its additional native contracts are documented in
[NuvioMergedProgress.md](NuvioMergedProgress.md).

Inspection input: `../OriginalApps/NuvioTV-1.1.0-beta6.apk`, SHA-256
`ac10b6c336a7b21e4f70b8c3d47478ef46d1289ed0d87510941e5a417994a9dd`.
The five original DEX files are extracted to `../Skills/inspection-evidence/.inspect-nuvio-beta6/` for the
native contract tasks. The APK manifest supplies the version identity.

## Native contracts

Patch implementations use the original beta.6 descriptors directly. Compatibility
metadata and execution guards accept only beta.6. Runtime helpers resolve local
reflection aliases to the beta.6 symbols and reject other installed versions.

| Contract | Original beta.6 DEX evidence |
| --- | --- |
| Progress repository | `Lz9/zc;`, one 14-parameter constructor; registry `k:Lo9/a0;`, profile manager `j:Le9/f;` |
| Progress interface | `Lo9/z;`: `r()` is the progress-list flow; `q()` is not that flow |
| Local watched history | `Lcom/nuvio/tv/data/local/sc;->i:Flow`; `h` is now a concurrent map |
| Settings coordinator | `Lp8/g;->get()` resolves `Lp8/e;->I3:Lsb/c;` to `Lo9/a1;` |
| Hilt profile and streams | `Lp8/e;->B` supplies `Le9/f;`; `V2` supplies `Lz9/k4;` |
| Stream playback pause | `Lz9/k4;->m(Z)V` writes `l:MutableStateFlow`; search remains `j(String,String,Integer,Integer,Z)Flow` |
| Player | `Lsa/df;`, one 52-parameter constructor; controller `Y:Lsa/p8;`; `f()` returns controller `E0:StateFlow` |
| Native request type | `Lsa/ec;->p(Lsa/p8;,Video,Z)V` reads controller `S:String` |
| Next episode routes | `Lsa/ec;->C(Lsa/p8;,Video,Z)V` has exactly three callers, all in `Lsa/wb;->invokeSuspend`; threshold `w(Lsa/p8;)V` has 12 registers and reads `n2:Z` |
| Player state | `Lsa/af;`: current video `z0`, next episode `o1:Lsa/e2;`, error `c1`; playing/buffering/ended remain `a/b/c` |
| Home | `Lqa/a4;`, one 27-parameter constructor; Home state `z:MutableStateFlow`; badge cache `V0:Map` and cached watched IDs `X0:Set` |
| Library | `Lz9/u0;`, one eight-parameter constructor; tracking registry `f`, profile `g`, library flow `n` |
| Card image helper | `La/a;->b`, same 15-parameter image signature and Composer at range start + 11 |
| Continue Watching card | `Lfa/v1;->invoke(Object,Object,Object)Object`, 65 registers, one image-helper anchor |
| Library / collection cards | `Lfa/e3;` / `Lfa/i1;`, 34 / 53 registers; two / three poster-helper anchors |
| Shared native settings | Toggle/list rows `Lxa/ub;`, sections `Lxa/bd;`, picker options `Lxa/cc;` |
| Playback style controls | `Lxa/za;->b` color dialog, `c` color row, `h` percentage row; native text style `Lh3/s0;->a:Lh3/i0;`, font unit `b:J` |

Hook matching checks the relevant signatures, unique anchors, register layouts,
and route bodies before inserting instructions. The route verifier rejects missing,
modified, ambiguous, and already-patched inputs. DEX output is written and reloaded.

## Verification

Run from the repository with Java 21 and Android platform 36:

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList
.\build-local.ps1 :patches:verifyNuvioBeta6 :patches:verifyNuvioBeta6Launcher
.\build-local.ps1 :patches:verifyNuvioBeta6Player :patches:verifyNuvioBeta6DateStyleRuntime
.\build-local.ps1 :patches:verifyNuvioBeta6Bundle
.\build-local.ps1 :patches:verifyNuvioNextEpisodePreload :patches:verifyNuvioStreamPreloadRuntime
```

The packaged-bundle task applies the next-episode patch alone and all nine runtime
patches together to the original APK. It checks merged extension/coroutine calls,
assembled route entry points, and DEX reload. The launcher task verifies native
catalog/list/profile contracts. The player test exercises the production readers
with beta.6 field identities, including buffering/errors and unaired next episodes.
The date-style test exercises the production controls, colors, sizing, persistence,
reset, and invalid choices. Host tests do not establish device UI behavior.

Device checks still include Layout focus/navigation, each opt-in feature, profile
switches, native playback, and Android TV launcher publication. Do not install as
part of host verification.

## Build evidence

The build and metadata tasks, all five `verifyNuvioBeta6*` tasks and the
next-episode/stream runtime tasks passed. The bundle is `patches/build/libs/patches-0.10.1.mpp`; its release version
was not bumped manually.

Morphe's SDK DEX checks reach cross-DEX verification, which reports 36 unresolved
optional-library references (Rhino, re2j, OkHttp, and Sentry) already present in
the original APK. Running the same hierarchy verifier on the original and combined
patched DEX produces identical findings after normalizing output DEX numbering;
there are no added or removed findings. Strict SDK verification therefore does
not pass globally for this input.

The full rebuild selects all ten patches, including side-by-side installation,
and produces
`../Apps/NuvioTV/NuvioTV-1.1.0-beta.6-patches-0.10.1-unsigned.apk`.
The rebuilt manifest identifies `com.nuvio.santodan` version code `1069`; its
provider authorities and app-owned permissions do not collide with the original.
The artwork authority and launcher labels are correct, all 112 original native
library entries are byte-for-byte preserved, and `zipalign -c -v 4` passes.
The APK is unsigned and has no stale signature files. It was not signed,
installed, or tested on a device.
