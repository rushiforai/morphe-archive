# Deezer 9002703 LRCLIB implementation

The owner confirmed the final lyrics repair in review `0e5e9c067bff` and
authorized publication on 22 November 2026. The earlier failures below are
historical engineering evidence. Native offline playback was confirmed earlier.
The owner tests the app; the agent delivered signed MPPs containing `classes.dex`
and did not operate the app's UI or install an APK.

## Native contracts

The availability mapper `lllllIlIIIIlIlI.IllIlIlIIlIllIll` returns a native Rx
Observable of the legacy lyrics DTO and returns an empty source for missing
native metadata. Keep its original implementation in a private alias and wrap
the returned stream. Do not synthesize a native lyrics ID or change persisted
track flags. An asynchronous fallback emits only after matching usable lyrics
are received. Native data wins if it arrives while a fallback is pending.

The query executor `IIlIlIIIllIIIIIl` maps through `IIlIIlIIIIlIIll(16)`;
that mapper calls `IIIIlIIlIIlllIlI.lIlIIIlIlIIlIlI`, which unwraps the Sponge
success object's data. The stream therefore emits the DTO itself, not a list
or a Sponge result wrapper. Its combining function `IIIlIIllIIlllI(7)` merely
puts the two inputs into `lIlIIlllIIIlIll` without another conversion.

The full-screen manager `IllIIllIlIlIIIIl.IllIlIlIIlIllIll` maps its source to
`lIllIlIllIIllll(track, LyricsDataModel)`. Wrap that mapped source before its
existing `observeOn(main)` call. The native metadata getter stays unchanged.
When that metadata reports no lyrics, the original manager exits before creating
its normal source. Start a separate empty-source fallback on that exact exit
edge. Its result uses the original main-thread success consumer, which changes
the controller to ready and publishes the native model to the player. Pending
and missing results keep the native hidden state. Store the subscription in the
manager's original disposable field and check its current track on every
delivery. This avoids stale results when skipping tracks or closing the player.

The artwork pill has an independent gate in `lllIIIllIIlll.onBindViewHolder`:
both the text pill's visibility and cover image's enabled state check the
original track flag directly. The owner confirmed that the `5583caaf0401`
manager-only change still left the pill absent, and the installed APK contains
that exact review. Wrap this adapter binding after preserving the original body.
For an eligible track without native lyrics, start a shared-repository lookup
from the cover holder itself. Only a usable result posts the existing pill and
cover enabled state to the Android main thread. Keep the original click action.
An owned volatile holder token and complete track signature reject recycled or
rebound results. Cancel and clear the token on native recycling. Do not change
the native metadata flag, open an activity automatically or show a pending pill.

Engineering reviews include `MorpheLyrics` stage markers for the cover binding,
lookup, HTTP status, match booleans and result. The diagnostics omit titles,
artists, albums, lyric text, request URLs and credentials. They are disabled
unless the compiled patch version contains `+review.`. This lets the owner
reproduce while the agent reads existing logs; it does not authorize UI testing.

The owner confirmed the `2dfb3b69243a` artwork pill appears but tapping seems to
do nothing. Read-only hierarchy inspection found the pill enabled and clickable;
ActivityTaskManager recorded a successful LyricsActivity launch. The native
manager's missing branch called controller state 0 before `loadMissing`.
`llIIlIIIIlllll.IIlllIIIIIIIIIlI(0)` emits `IIIIIIIIIIlIIlII` (`CloseLyrics`),
and the activity's event consumer calls `Activity.finish()` for that event.
Replace the state-0 call itself, rather than appending a lookup after it.
Keep native state 1 (loading) until the lookup completes. Clear stale manager
data at request start; the original success consumer publishes a matching model.
A current-track completion sends state 0 only if no model was published. Native
metadata, keep-lyrics limits and successful native requests remain unchanged.

The owner requested no APK changes merely for Frida attachment. Existing matching
17.26.2 tooling was reused: a rish-shell server starts, but PID attachment is
denied, `run-as` rejects this non-debuggable package and `/proc/PID/maps` is denied.
The earlier successful session used Gadget embedded in a diagnostic clone.
The current standard-package build has no Gadget or loader. No Gadget or debug
flags were added for this investigation; the owned server and forward were stopped.

The first `b7a1755d95df` review failed owner acceptance on Into The Light,
Just Thoughts, All Of You and Fool's Paradise. The cached-status override could
not bootstrap a player whose native metadata said no lyrics. The record for
Into The Light (31883328) has plain and synchronized lyrics and `/api/get`
returns 200 for title, primary artist, album and 226-second duration. The
Wardenclyffe search entry (20956827) is instrumental with no lyric bodies and
must remain unavailable. `hasWordSync` does not govern line-synchronized LRC
availability. Matching tests use these reported metadata shapes with synthetic
lyric text; no provider lyric bodies are committed.

The original Rx ABI is `IlIlIllIIllIl` with abstract `llIlIllIIIl(observer)` and
public `llIIIIIIlIIIIll(observer)`. Observer `lIlIlllllIllI` has `onNext`,
`onComplete`, `onError` and renamed `onSubscribe`; it is not a Maybe observer.
Use the public original upstream-operator superclass and constructor. Every
generated constructor must carry `ACC_CONSTRUCTOR` in the direct-method table.
Bind method/field references against the actual original APK and the owned
extension; do not infer private ABI from Java spelling alone.

## Formats and attribution

LRCLIB JSON is decoded into independent `LyricsPayload` data. Treat `plainLyrics`
and line-synchronized `syncedLyrics` separately. Ignore the different Lyricsfile
YAML representation. Preserve UTF-8 punctuation, parse 1–3 fraction digits and
multiple timestamp tags, sort/deduplicate timestamps and retain blank timed
gaps. A nonzero legacy offset or malformed timing falls back to plain text.

The native Pipe JSON schema uses `lrcTimestamp`, `line`, `lineTranslated`,
`milliseconds` and `duration`; line times/durations are integer milliseconds.
The legacy DTO's Pipe sync type is null. The full native model uses type 0 for
sync and 1 for plain; plain line time is -1. Construct native objects rather
than casting the provider JSON or LRC string. Provider IDs have `lrclib:` names;
they are not Deezer IDs. Put LRCLIB attribution in the licence/source footer,
with no invented copyright/writer claims or translations. Hide the native
report action for fallback data and refresh its menu when the model changes.

## Requests, ownership and checks

Use the signed-in track's title, artist, optional album and duration in seconds
with HTTPS `/api/get`. Deezer/Google tokens and native IDs are never sent to
LRCLIB. Identify the application/version/project in User-Agent; serialize
requests, coalesce matching subscriptions, bound cache and queue size, and honor
Retry-After including positive jitter. Do not scan the music library. Check HTTP
status and Content-Type before JSON; retain platform TLS verification.

Match title/artist while retaining edit/mix qualifiers, and check duration within
two seconds. A placeholder album is not a conflict. Pending, empty, instrumental,
404 and error results do not advertise fallback lyrics. Cancellation and the
bound native track signature fence every async delivery. A fallback miss keeps
the native error/completion behavior.

Batch verification includes JVM parsing/cache/flow checks, native ABI and
register/constructor checks against the original input, original-APKM patching,
MPP signature/DEX checks and the repository's complete verification command set.
The owner confirmed the repaired native-first/fallback flow after the close-order
fix. Parsing, missing-data behavior, ownership and cancellation also have the
offline checks above; those checks alone are not rendered UI evidence.

Primary reference: https://lrclib.net/docs.txt
