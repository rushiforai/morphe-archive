# Offline course study

Enable offline mode exposes Chessable's existing course downloads to non-PRO
accounts. Sign in and download an owned course while online. After its download
finishes, its lessons and due reviews are available without connectivity. Native
local storage keeps completed progress across restarts; reconnect with the app
open to synchronize it. Undownloaded courses remain unavailable offline.

Use **Download Video** beneath a chapter's player to save its accessible video
separately. Video downloads retain native quality, Wi-Fi, pause, resume, cancel,
and removal controls. Owning a text course does not grant access to a separately
sold video upgrade.

This covers course MoveTrainer content and accessible course videos, not browsing
the shop or signing in without a connection. Course ownership and server authorization
remain unchanged. The patch does not mark the account PRO or alter schedules.

## Supported build and implementation

The supported original APK and Hermes bundle fingerprints are the same as
[the folder patch](patch-design.md): Chessable 3.0.4 (118333), Hermes 96.
Thirteen fixed-size edits preserve function offsets and exception tables:

| Native component | Change |
| --- | --- |
| DownloadCourseItem | Use the native downloader and remove its PRO badge. |
| authorizeJwtOrSignUserOut | Permit offline startup through existing cached-token and sign-out checks. |
| Network error handler | Apply the existing offline route allowlist to every account tier. |
| Home and course page | Permit downloaded content and local dashboard refresh while disconnected. |
| NetworkState | Display the existing network transition banner. |
| Cached session restoration | Decode the JSON-serialized token before passing it to the original setJwt path. |
| Video DownloadControls | Display the native full-width download button without its PRO badge; preserve disabled, connectivity, and download-state checks. |
| Video startDownload | Enter the existing quality selection and Wi-Fi checks instead of the PRO upsell. Authorized video URLs, storage checks, and the downloader are unchanged. |
| Video OfflinePlaceholder | Show the existing download-while-online guidance for an undownloaded video. |

Native storage serializes values as JSON, but the fallback token restore reads
the raw serialized string. Without decoding, an offline cold start can install
quotation marks as part of the token, producing a 401 on reconnection. The patch
reuses the app's existing JSON.parse callback in the now-unreachable PRO error
block, then rejoins the original setJwt path. The success-only redirect follows
ResumeGenerator's rejection check; active tokens bypass it. Null still reaches
the missing-token sign-out check. HTTP errors and the progress queue are unchanged.

Both patches share a recognized edit profile. Either can be selected alone or
applied after the other; unselected edits are not enabled. Validation normalizes
only these audited edits before checking the full original SHA-256, so other
bundle changes still fail closed. The Hermes footer is recomputed after editing.

## Verification

Local tests cover integrity, independent patch composition in either order,
unexpected sibling edits, startup branch targets, local feature registers, and
the stored-token decoding trampoline returning to the original session setter.

Audit a combined APK with:

```sh
python3 scripts/verify-patched-apk.py ORIGINAL.apk PATCHED.apk \
  --patches folder-reviews offline-mode
```

For an offline-only APK, use `--patches offline-mode`. Morphe CLI requires
`--exclusive -e 'Enable offline mode'` to disable other default-selected patches.
The auditor verifies every declared edit, unchanged length, the Hermes checksum,
and byte-for-byte equality outside those edits and the checksum.

## Live acceptance

Testing on 2026-09-25 used a dedicated non-PRO account on headless Android 15 ARM64, with the
emulator's Wi-Fi and mobile data disabled independently of the host network.
Private screenshots and storage snapshots stay outside version control.

- The baseline course download action opens the PRO upsell.
- The patched action downloads owned Basic Endgames (6371) and Everything You
  Need to Know About Chess (193039), showing their native downloaded indicators.
- Downloaded courses open offline; an undownloaded control course is grayed out.
- Basic Endgames review completed offline and created a pending progress record.
  The record survived a force-stop/restart. A manual retry helped diagnose the
  original reconnect error, so that first run alone is not automatic-sync proof.
- A separate offline lesson increased course 193039's local learned count from
  2 to 3. Its pending record survived three cold starts. An independent server
  read still showed 2 before reconnection; automatic native sync changed it to 3
  and cleared the local queue. That run exposed the incorrect token restoration
  addressed by the final decoding edits.
- With the final offline-only build, a new lesson increased the local count
  from 4 to 5. One pending record survived an offline force-stop/restart. The
  independent server count was 4 immediately before reconnection and 5 after
  automatic sync; the queue became empty. There were zero 401 or sync-error log
  entries, and no error dialog on reconnection. The restored token also retained
  the correct single JSON serialization layer in storage.
- All 17 local tests pass without failures or skips. Morphe Desktop 1.17.0 builds
  both the combined and standalone APKs. Independent audits verify their exact
  declared changes, and the edited functions and reused JSON parser disassemble.
- Canceling download deletion preserves the local copy. Confirming deletion
  restores **Download course**, removes its downloaded indicator, and leaves the
  learned count at 5/92.

Course-only v1.1.0 Hermes bundle SHA-256:

- Offline only: `911c7c78822852ab3230b5bc34c8826a0551c0a99ccb4a7086128ab2d19a0f53`.
- With folder reviews: `fb2af0cae8b1d21977b2ba5cd93551b456f5f7736e9274cd4a1512cc9ebdf501`.

### Owned-video downloads

The same non-PRO account has access to course 193039's chapter 3 video,
**Tactics & Strategy** (18:28). Video testing on 2026-09-25 established:

- The released course-only patch still opens the PRO upsell from **Download
  Video**. The video extension starts the native download without that upsell.
- Pausing a partial download exposes **Resume Download** and **Cancel Download**.
  Resuming completes it and shows **Video Downloaded**.
- With Wi-Fi and mobile data both disabled, the downloaded video opens after a
  force-stop/restart. Playback advances, and seeking to 17:36 loads the correct
  frame and continues playing without a connection.
- Canceling the downloaded-video action sheet retains the download. **Delete
  Video** asks for confirmation, removes the downloaded indicator, and restores
  the unavailable-offline state. Course progress remains 5/92.
- The final build repeats download and cold-start offline playback, resuming
  from 1:31. After deletion, the placeholder correctly says to download the
  video while online. The cached account still reports non-PRO.
- A video download makes its chapter accessible offline, but does not download
  other chapters' content. Use **Download course** as well for full course study.
- All 17 local tests pass. Both standalone and combined APKs build and pass
  independent bounded-change audits. All three edited video functions disassemble.

Video-enabled Hermes bundle SHA-256:

- Offline only: `612cc8195e5538352c79c6e9bb6beb467c7eb34b9f18289753124d87f06efcf3`.
- With folder reviews: `e43dc662456de3ca0e989029c7d6ade4e1a10466acdfd8ea2a2a64dc911643f2`.

PRO accounts, dark-theme rendering, long-duration background
execution, low-storage failures, and expired-session recovery are not validated.
Exact next-review timestamps and simultaneous study on multiple devices are not
asserted by the course-count checks. Never clear app storage or uninstall with
unsynced work pending.
