These are the available patches for NuvioTV:

### Continue Watching

- **Merge tracking progress**: Combines Nuvio Sync and connected tracking-provider progress and watched-show history, with a choice between highest progress and the most recent update. Library and collection Watched labels follow the selected provider for each show. Cached progress and watched history load without waiting for provider refresh; synchronization continues in the background. Incremental Watched badge updates process changed cached metadata and limit progress logging.

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

- **Preload streams in Continue Watching**: Searches sources in the background for visible, playable episodes and movies, so opening playback can reuse the search results.

- **Preload streams on detail page**: Searches sources for the current Play or Resume movie or episode, following changes to the next episode on the detail page.

### Installation

- **Side-by-side installation**: Lets you choose a different package name and launcher name so the patched app can coexist with the official app.

On NuvioTV **1.1.0-beta.4 and beta.5**, patch settings are under **Layout > Santodan-Patches**, grouped under **Continue Watching**, **UI**, and **Streams** labels. Labels appear only for installed patch groups. Airing-series, finale-date, upcoming-movie-date, and stream-preloading patches support beta.4 and beta.5; merged progress, remaining episodes, and side-by-side installation also support beta.2. Package and launcher names are configured when patching the APK.

The two **Streams** switches are independent and disabled by default. Preloading uses Nuvio's native search cache and installed addons/plugins, with bounded background work. It pauses new preloads while native playback pauses source searches. Source results retain Nuvio's profile/configuration checks and cache expiration; media playback begins when you press Play.

Include `"SantodanMovieRelease:V"` for movie-date diagnostics. Toggle messages identify the library or collections setting; routine settings recompositions stay silent.

Include `"SantodanStreams:V"` in your logcat filters to see preload starts, completion times, source counts, and timeout/cancellation events. Repeated composition hits stay silent, and diagnostics omit stream URLs and redact custom video IDs.

<img src="images/NuvioTVMenu.png" width="800" alt="Santodan-Patches menu">
