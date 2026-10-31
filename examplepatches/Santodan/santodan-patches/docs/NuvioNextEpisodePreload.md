# Next-episode source reuse on beta.9

Current target: **NuvioTV 1.1.0-beta.9 (1072)**. See [beta.9 contracts and verification](NuvioBeta9.md). Version-specific DEX notes, commands and artifacts for earlier versions below are historical; use the beta.9 contract and `verifyNuvioLatest` for the current release.

NuvioTV patches support only `1.1.0-beta.9`. The next-episode patch fetches addon
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
