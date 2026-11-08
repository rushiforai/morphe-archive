# Next-episode source reuse on beta.10

Current target: **NuvioTV 1.1.0-beta.10 (1073)**. See
[beta.10 contracts and verification](NuvioBeta10.md).

## Beta.10 cache-context correction

The native cache distinguishes profile, type, episode, source configuration,
search mode and priority binge group. Previously the preload passed a null group,
while native playback searches pass controller `bb.gc.r3:String`. Nonempty groups
therefore produced a cache miss even after a successful preload.

The preload now uses the current playback group, invalidating stale consumers
and cooldowns when it changes. It preserves the 30 seconds of actual playing time
already earned for that episode. Local-plugin autoplay uses a separate
`continuePluginOnly` cache entry: when native
`PluginKt.scraperIdFromPluginBingeGroup` recognizes the group, both that mode and
the full list are warmed, with at most two consumers in the existing 45-second
timeout. Ordinary groups warm only the full list. Native cache expiry,
authentication, source configuration, profile isolation and explicit refresh remain.

Original beta.10 DEX proves `bb.dg`, `bb.xf` and `bb.zf` read `gc.r3` before
calling repository `ba.o5.l`. Cache-key builder `o5.f` takes two mode booleans and
the group string; `ba.p5.g` is search mode and `p5.h` is priority binge group.
Full searches trim the group; preferred/continue-plugin modes use an empty group.
The dispatcher mask is now **16**: only force-refresh defaults false. Both plugin
flags are passed explicitly and enabled together for continuation searches, matching
the native autoplay call. Group values are never logged.

Run `:patches:buildAndroid :patches:verifyNuvioStreamPreloadRuntime
:patches:verifyNuvioNextEpisodeCooldown :patches:verifyNuvioBeta10Player
:patches:verifyNuvioBeta10Bundle '-PnuvioBeta10Selections=next,combined'`.
The runtime fixture models group and mode in its cache key and checks group
changes, continuation/full reuse and explicit refresh. The original-input bundle
fixture proves the request readers and rejects missing group/parser contracts.

For device verification, wait for `Preload completed mode=next_episode`,
then press Next Episode and inspect addon requests. A brief native loading message
can still appear while observing a cached flow; it alone does not prove another
network fetch. Source preloading does not prepare or buffer the next video.

Verification on 2026-11-05 passed the tasks above, including the real 30-second
runtime delay, no extra requests when opening either warmed list, explicit refresh,
source-group changes, standalone and combined DEX/resource assembly, and cross-DEX
checks with no new findings. Evidence is under
`Skills/inspection-evidence/.inspect-nuvio-beta10/preload-cache-fix-build.log`.
Bundle: `patches/build/libs/patches-0.16.4-nuviotv-beta10-cache-fix.mpp`.
No complete APK was rebuilt, signed or installed by the agent for this change.
The user repatched and tested on the TV. On 2026-11-05 they confirmed it appears
to work correctly after enabling the next-episode setting in their test profile.
The preceding TV log showed `enabled=false` and no delayed preload; that test
therefore exercised the disabled native path, not a failed cache lookup.

## Historical contracts (not beta.10 inputs)

The following describes earlier contracts. The next-episode patch fetches addon
source lists after 30 seconds of actual playback. Pauses and buffering do not
advance this delay. With its setting enabled, the manual next-episode picker
reuses the native search session and Nuvio's separate threshold preload is
suppressed. Explicit source refresh still performs a fresh search. Expired or
empty sessions can require another fetch when opening the next episode.

## Proven target and hooks

- Original: `../OriginalApps/NuvioTV-1.1.0-beta6.apk`; package `com.nuvio.tv`,
  version `1.1.0-beta.9`, version code `1069`.
- `Lsa/ec;->C(Lsa/p8;Lcom/nuvio/tv/domain/model/Video;Z)V` is static, has
  171 registers, and delegates to `sa.ec.p`. Its incoming force-refresh flag is
  register 170. All three original callers belong to `Lsa/wb;->invokeSuspend`.
- The refresh guard is inserted at the callee entry, so branches within callers
  cannot bypass it.
- `Lsa/ec;->w(Lsa/p8;)V` is the static threshold preloader. Its 12-register body
  starts with scratch register 0 and reads the native `n2` triggered flag. The
  entry predicate returns while the patch is enabled and otherwise branches to
  the original first instruction.
- The player ViewModel `sa.df` exposes controller `Y:sa.p8`. Request type
  `S:String` is the type used by the native episode loader. Case-insensitive
  `series` and `tv` are normalized to the native `series` search key.
- State `sa.af` uses current video `z0`, next episode `o1`, and playback error
  `c1`; the playing/buffering/ended flags remain `a/b/c`.

The patches preserve the native force-refresh escape hatch, coroutine lifecycle,
profile isolation, and disabled behavior. They do not change playback URLs or
advance the episode.

## Verification

Run `:patches:verifyNuvioBeta6`, `:patches:verifyNuvioBeta6Player`,
`:patches:verifyNuvioNextEpisodePreload`, `:patches:verifyNuvioStreamPreloadRuntime`,
and `:patches:verifyNuvioNextEpisodeBundle`. These check the original DEX contracts,
missing/changed/ambiguous/duplicate rejection, serialized entry instructions,
standalone and combined bundle application, timing, buffering, retries, profile
changes, and disposal. See `NuvioBeta6.md` for the full target evidence.

Device checks remain necessary for native picker UI, source-cache expiry, long
playback sessions, and switching player engines. Host verification does not prove
that the APK has been signed, installed, or tested on a device.
