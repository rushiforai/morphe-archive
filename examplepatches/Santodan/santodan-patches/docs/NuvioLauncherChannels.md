# NuvioTV Android TV launcher channels

Current target: **NuvioTV 1.1.0-beta.9 (1072)**. See [beta.9 contracts and verification](NuvioBeta9.md). Version-specific DEX notes, commands and artifacts for earlier versions below are historical; use the beta.9 contract and `verifyNuvioLatest` for the current release.

Select **NuvioTV - Android TV launcher channels** when patching the original
NuvioTV **1.1.0-beta.9** APK. This patch can be installed
independently or alongside the other NuvioTV patches.

Open **Settings → Layout → Santodan-Patches → Android TV launcher**:

- **Library** publishes one channel using the app's current library source.
- **Upcoming** publishes one channel mirroring the app's Upcoming row, including
  the result of the optional Keep airing series in Upcoming patch.
- Each **catalog** switch publishes a separate channel. Catalogs come from enabled
  installed addons, including rows that have not been loaded on Home.
- Each **tracking list** switch publishes a separate channel from connected
  Trakt, Simkl, or MDBList providers. List membership and per-list ranks determine
  the entries and order.

On beta.6, **Catalogs** and **Tracking lists** each start as one collapsed entry.
Expand that entry to see collapsed addon or tracking-provider groups, then expand
only the source whose individual channels you want to select. Source groups show
the number of selected channels. Existing channel selections survive this UI change.

Beta.6 Upcoming tiles include the native unaired date, or the future finale date
when **Keep airing series in Upcoming** is enabled. The shared **Date label
appearance** settings control the artwork badge's position, color and size. Badges
are rendered into cached artwork in the background and published through a
dedicated read-only artwork provider. It serves only completed image files with
hashed names, so launchers can read badges after Nuvio closes. Dates also appear in
the tile title and description. If artwork cannot be downloaded, the original
image and date text remain available.

On beta.6, native Continue Watching also uses the installed airing-series patch's
effective aired rule. A show whose future finale keeps it in Upcoming is excluded
from the native Continue Watching channel, matching the app's split rows.

All switches start disabled. Choices and cached entries are saved per Nuvio
profile. Turning off a switch deletes that channel. The original Continue Watching
channel remains managed by Nuvio.

The launcher controls which published channels are visible. If a row does not
appear automatically, enable it in the launcher's channel customization screen.
Tiles open Nuvio's detail page, including when Nuvio is already running.

Channels contain up to 100 unique titles. Catalogs that require a search or other
argument without an addon-provided default are omitted. Upcoming mirrors the native
row, so its contents depend on Nuvio's Upcoming/Continue Watching settings.
Changes publish after a short debounce and when leaving the app. Selected catalogs
refresh when settings/addons change and every 30 minutes while Home is alive.
The last snapshot is restored when the app process starts; fresh repository data
replaces it as it arrives. Reboot refresh without opening Home can restore cached
rows but does not independently fetch catalogs.

Verification:

```text
:patches:verifyNuvioLauncherChannels
:patches:verifyNuvioLauncherUi
:patches:verifyNuvioLauncherDates
:patches:verifyNuvioLauncherPublisher
:patches:verifyNuvioLauncherBundle
:patches:verifyNuvioNextEpisodeBundle
:patches:verifyNuvioSettingsMenuRuntime
```

These cover original beta6 DEX contracts, source identities, membership and
ordering, actual publisher operations against a TvProvider fixture, standalone
application to the beta6 APK, combined runtime patches, and partial settings-menu
selections. Physical TV checks remain necessary for launcher visibility, focus and
scrolling, profile switching, provider disconnect/reconnect, and cold/warm tile
navigation. Beta.6 checks also cover grouped-menu expansion/collapse and saved
selections, date formatting and removal, image read permissions, asynchronous badge
appearance and style changes. Runtime failures use the `SantodanLauncher` log tag.

For native Continue Watching problems, beta.6 logs a read-only **Native CW
diagnostic** under `SantodanLauncher`. Open Home, let its rows load, then return to
the launcher. The log compares the visible in-app item count, native cache counts
and timestamps, native published-program count, and missing artwork. Only artwork
hosts are recorded; full URLs, credentials and watch-history lists are omitted.
The diagnostic logging itself does not change synchronization or rows.
