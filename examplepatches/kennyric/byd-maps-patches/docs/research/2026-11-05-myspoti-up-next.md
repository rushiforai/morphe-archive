# Myspoti 2.3.0 Android Auto Up next

> Myspoti 2.4.0 publishes this queue natively. The 2.4.0 port keeps that queue and opens the
> library to every Android Auto host; see `2026-11-07-myspoti-2.4.0-port.md`.


## Input and intended result

Original publisher APK supplied by the user: `myspoti-stable-2.3.0-arm64-v8a.apk`.
Package `app.myspoti.stable`, version 2.3.0 (1121), minSdk 29.
SHA-256: `2633fbc80e79c2b6ccadb7cda34f381fc5537770d7c2d77b49abb37dd4ef1e5f`.
Publisher certificate SHA-256: `2b8f54daf60ce32cee1ab9206553c7e5741e96f2f32efdf2545758bf210a2c41`.

The handover's phone copy is already patched and has a different hash. It is supporting
research, not this patch's input. Initial investigation was entirely offline. The user
subsequently authorized installation as an update on the phone; see the delivery record below.

The new **Android Auto Up next** patch exports the actual queue through the existing
framework media session. Android Auto/DriveDeck receive current plus up to 49 upcoming
occurrences, titles, artists, album text, artwork URIs and duration. Selection uses the
same queue-row handler as Myspoti's phone UI. It does not change caller admission,
shuffle/repeat policy, account state, provider eligibility or audio resolution.

## Audited producer and selection paths

- `PlaybackService.onCreate` creates `tv4` wrapping `sv4.a:MediaSession`.
- `PlaybackService.e(ag5)` publishes metadata and state; original active ID is -1.
- `tv4.Y(PlaybackStateCompat)` converts state then calls framework `setPlaybackState`.
- `ke7.t:er5` is Compose MutableState containing `ra7` (`EngineQueue`). `ra7.a` is
  current SongsModel; `b` is explicitly queued and `c` is nextUp. `fp0.V0(c,b)` used
  by Next concatenates **b before c** (its implementation adds its second argument first).
- `ke7.d(vb6)` updates the remote snapshot `ke7.u` and projects it into EngineQueue.
  Remote `zf5.j()` supplies occurrence UID, `k()` media URI. Current plus upcoming
  use matching URI/UID keys, allowing an upcoming occurrence to retain its ID on transition.
- Local playback publishes the same EngineQueue from `gt.run` using `dg4.X()` (only
  indices after the current item). Local queue entries have provider `local`, URI
  `local:<track id>`, and UID containing the current native list position. IDs use
  actual LocalTrack object identity so reorder can update selection indices without
  changing already published occurrence IDs.
- `bh3.invoke` calls `ke7.a.M0(va7)` for a phone queue-row tap. This dispatches local
  entries to `dg4.P(index)` or remote entries to `ke7.c(va7)` and `pd7` using URI/UID.
- `qv4.onSkipToQueueItem(long)` originally only checks callback attachment. The
  extension retains that check and validates the attached callback's owning service,
  then resolves the requested occurrence against the current queue before dispatch.

## Implementation choices

Use the existing EngineQueue, rather than reconstructing a queue from browse results
or fetching recommendations. Hook its MutableState setter after the write, filter for
EngineQueue values, and coalesce main-loop refreshes. Refresh after remote snapshots,
including null, and alongside original playback-state publication. Clear on teardown,
missing current item, advertisements or an inconsistent remote/current metadata snapshot.
Do not republish unchanged queue rows on position-only state updates.

Allocate monotonically increasing public IDs and retain them for surviving occurrence
keys. Repeated media IDs with distinct provider UIDs stay separate. Missing provider
UIDs get distinct IDs per duplicate row in order; identical-URI duplicates with no
provider occurrence identity cannot be distinguished across an otherwise identical
transition. This is a provider information limit, not a reason to collapse duplicates.
Removed IDs are never recycled. Reject stale selection IDs and re-resolve the live
native entry, including its latest local position.

Patch execution verifies original package/version/build/minSdk/signer and the exact
reflected fields and method signatures. Other versions require a separate port. Existing
Custom branding and Gearslip personal library patches remain independent and can be
applied together to the original input.

## Required validation and evidence boundaries

1. Run the repository's complete `scripts/local-release/verify.cjs` command set.
2. Build the bundle and apply **Android Auto Up next**, alone and with the existing
   branding and personal-library patches, to the exact supplied original APK. Inspect
   actual applied/failed patches and output DEX hooks; verify APK signing separately.
3. One bounded runtime acceptance with Frida coverage of both provider and consumer:
   start a playlist and radio, inspect standard queue metadata/active ID, Next,
   selection, duplicate occurrences, shuffle, queue replacement and service teardown.
   Use an authorized emulator/account or separately authorized phone; never infer
   permission from a connected phone. Existing tooling stays frozen. Missing hooks or
   account state block runtime acceptance rather than permit new tooling implicitly.
4. Retain compact source/input/output identities, results and diagnostics; stop owned
   runtimes and remove job scratch/build storage after archiving source and deliverables.

## Delivery record

The Android build, patch unit tests and aggregate extension unit tests passed using
the normal verification command's Gradle targets with `--no-watch-fs`. Python regressions,
Medium bundle/tests, catalogue/page checks and strict bilingual documentation/site checks
also passed. The complete verifier did not finish: its existing release-cleanup tests
block on workstation `lsof` filesystem enumeration. This remains an open mandatory gate;
no validation tooling was changed to bypass it.

Both queue-only and combined patching of the exact original APK passed patching,
rebuilding and signing, with exact expected applied-patch sets and no failed patches.
The local MPP signature verifies against the repository's existing public key.
Output DEX contains the service bind/unbind, MutableState, remote queue, playback-state
and selection hooks plus the extension's framework queue and active-ID publication.

The combined APK uses the archived phone copy's `Spotify` label and `classic_green`
branding; its icon image bytes are identical. The supplied Morphe BKS certificate
matches the actual phone installation: SHA-256
`8a47c1bacd4161681c22797ce63c240ae706a5e69778bebde95c7c5fe8b0c4e5`.
On the user's explicit instruction, the combined APK was installed with `adb install -r`
without uninstalling or clearing data. Package installation returned Success. The
installed APK hash matches the delivered file exactly, and the package UID plus both
credential-encrypted and device-encrypted app-data inode identities were preserved.

Combined APK SHA-256: `2a51c70612b53e8cd46b1bfa040dc8df2042d839865961d447ea8dc1ea2db047`.
Queue-only APK SHA-256: `ba12a9e2d423c93d8a6e0be6ca1a40a41b458f803d604d9db9a6c8e69b84a4fb`.
Local MPP SHA-256: `219570f719b2d97122a164c9ebc448c759e7531e75e7e33861ca2e8dc7693f22`.

No agent-controlled app launch, playback control, phone instrumentation or emulator
acceptance was performed. The user requested installation instead of the proposed new
observer; that observer was not created. After the update, the user explicitly reported
"this is confirmed fixed" and approved release on main. This is user acceptance of the
installed fix, not a claim that the agent traced all playback modes. Local artifacts
are in `~/Downloads/Myspoti-Up-Next-2026-11-05`.

For release verification, the user separately approved changing only
`scripts/local-release/flow.cjs` and `tests/test_local_release.cjs` to replace the
blocking macOS mount scan with bounded native process inspection. The existing
ownership markers, command-group shutdown, fail-closed scan and cleanup gates remain.
Native macOS inspection checks the job owner's working directories, vnode file
descriptors and file-backed memory mappings, including detached processes; Linux
retains the existing lsof check. No additional Android observer or fixture runner was
introduced. Release publication and cleanup are recorded separately after verification.

The existing cleanup regression file passes, including live detached cwd, open-file
and closed-fd memory-mapping holders. Native inspection treats kernel-protected
internal descriptors of the invoking application and launchd-owned, sealed Apple
platform services as outside the owned child-job scope; their accessible cwd, file
descriptors and mappings are still inspected. Permission failures in ordinary user
job processes remain failures. Missing native APIs, truncated reads, unstable PID
lists and timeouts also retain the workspace. The local driver supplies this same
proof through the Pages publisher's existing `isQuiescent` callback for both cleanup
and deployment, preserving its live-owner PID guard. This stays within the approved
`flow.cjs` and `test_local_release.cjs` scope; no Pages runner files were changed.

Platform references: [MediaSession queue publication](https://developer.android.com/reference/android/media/session/MediaSession#setQueue(java.util.List))
and [queue selection callback](https://developer.android.com/reference/android/media/session/MediaSession.Callback#onSkipToQueueItem(long)).
