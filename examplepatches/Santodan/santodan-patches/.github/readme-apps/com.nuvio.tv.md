These sixteen patches target NuvioTV beta.9 only. See [beta.9 verification](docs/NuvioBeta9.md). For future app updates, see the [shared contracts and maintenance workflow](docs/NuvioMaintenance.md).

- **GitHub APK updates**: Optional patch that checks APK releases from `Santodan/santodan-patches`, shares background download progress with the native banner, and opens Android's normal APK installer for foreground installation progress. The installed release version defaults to the bundle version. Includes installer fixes for patched APKs and side-by-side installations. See [GitHub release publishing instructions](docs/NuvioApkUpdates.md).

### Continue Watching

- **Merge tracking progress**: Combines Nuvio Sync and connected tracking-provider progress and watched-show history, with a choice between highest progress and the most recent update. Library and collection Watched labels follow the selected provider for each show. Quick startup sync reuses validated saved history and applies local playback changes; Sync now refreshes remote services. Nuvio's native update-download banner shows sync stages, progress and errors. Cached Continue Watching entries remain visible until a complete, ready snapshot replaces them. Library contents and refreshing remain controlled by Nuvio's native Tracking settings.

    - Enable **Show merged progress provider** to display the winning provider's icon (Trakt, Simkl, MDBList, or Nuvio) at the bottom-right of each Continue Watching poster. The option is disabled by default and displays icons only while merging is enabled.

| Card | Poster |
| -- | -- |
| <img src="images/NuvioTVProvidersCard.png" width="400" alt="Collections"> | <img src="images/NuvioTVProvidersPoster.png" width="400" alt="Library"> |

- **Remaining episodes in Continue Watching**: Adds a setting to show the number of aired, unwatched episodes on Continue Watching cards. Counting runs in the background for recently displayed cards and stops when disabled.<br>

![Remaining](images/NuvioTVRemainingCount.png)

- **Keep airing series in Upcoming**: Adds a setting to keep series in the separate Upcoming row until their latest scheduled episode airs, with a finale-date badge.<br>

![Upcoming](images/NuvioTVUpcoming.png)

### UI

- **Finale dates in library and collections**: Adds separate settings to show the latest scheduled episode date on library and collection posters in `dd-MMM-yy` format.

| Collections | Library |
| -- | -- |
| <img src="images/NuvioTVDateCollection.png" width="400" alt="Collections"> | <img src="images/NuvioTVDateLibrary.png" width="400" alt="Library"> |

- **Upcoming movie dates in library and collections**: Adds two independent, disabled-by-default switches under **UI** to show known release dates on unreleased movie posters in `dd-MMM-yy` format. Dates come from the poster metadata, with a background catalog lookup when an exact date is missing. Already released movies and unknown dates have no badge. Movies with a past release year skip unnecessary catalog requests; current/future years still need an exact date.

### Streams

- **Preferred source add-on**: Choose a preferred installed add-on per profile to schedule its refresh first and show its results first. A separate, disabled-by-default switch automatically plays its first playable stream as soon as it is available. Other add-ons continue loading concurrently; manual source selection remains available. Configure both settings under **Settings > Layout > Santodan-Patches > Streams**. See [settings, logcat and verification](docs/NuvioPreferredAddon.md).

- **Indicate current stream**: Shows `[Playing]` on the active source when reopening Sources during playback. Enabled by default under **Settings > Layout > Santodan-Patches > Streams**. See [settings and verification](docs/NuvioCurrentStream.md).

- **Preload streams in Continue Watching**: Searches sources in the background for visible, playable episodes and movies, so opening playback can reuse the search results.

- **Preload streams on detail page**: Searches sources for the current Play or Resume movie or episode, following changes to the next episode on the detail page.

- **Preload streams for next episode**: Fetches the next episode's source list after 30 seconds of actual playback, giving the current episode time to buffer. Pauses and buffering do not count toward the delay. Nuvio reuses the results when you open the next episode; expired searches refresh in the background during longer episodes. On beta.9, enabling this switch also suppresses Nuvio's separate threshold preload and prevents the manual next-episode picker from forcing another search. Explicit source refresh remains available. This switch is disabled by default and independent of the other preload switches.

### Playback

- **Fix startup track reselection**: Prevents a seek from dereferencing a missing playing period during startup. Select this independent patch when patching; it has no runtime toggle. Active-period seeks retain their original behavior. See [evidence and verification](docs/NuvioPlayerStability.md).

- **Customize playback buttons**: Choose which native playback controls appear, their order, and placement in the main row or More actions. The customization is opt-in under **Settings > Layout > Santodan-Patches > Playback**. See [settings and verification](docs/NuvioPlaybackButtons.md).

- **Submit segments to IntroDB**: Enable the feature and enter your API key under **Settings > Layout > Santodan-Patches > Playback**, using the same single-line input and Cancel/Clear/Save layout as Anime Skip. A dedicated playback button captures the start on its first press and the end on its second, then opens a native NuvioTV dialog with an Intro/Recap/Outro dropdown and side-by-side Submit/Cancel buttons. Filmstrip play/stop/check icons distinguish the capture stages. Rejections show IntroDB's validation reason when available. See [setup, logcat and verification](docs/NuvioIntroDb.md).

### Android TV launcher

- **Android TV launcher channels**: Publish selected catalogs, tracking lists, Library and Upcoming to the Android TV launcher. Disabled by default and configured under **Settings > Layout > Santodan-Patches > Android TV launcher**. See [setup and verification](docs/NuvioLauncherChannels.md).

### Installation

- **Side-by-side installation**: Lets you choose a different package name and launcher name so the patched app can coexist with the official app.

The patch settings are under **Layout > Santodan-Patches**, grouped under **Continue Watching**, **UI**, **Streams**, **Android TV launcher**, and **Playback** labels. Labels appear only for installed patch groups. Package and launcher names are configured when patching the APK.

<img src="images/NuvioTVMenu.png" width="800" alt="Santodan-Patches menu">
