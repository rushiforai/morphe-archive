# Eclipse Music

Browse and play Eclipse Music from the car: a templated Android Auto app with Home, Discover, Library, Radio, search and an editable Up Next, plus a matching layout for hosts that only show the classic media browser.

**App version:** 0.6.75 · **Build:** 155 · **Original file:** APK

[Use your original APK](../guides/downloads.md#local-original-inputs){ .md-button .md-button--primary }

Select the complete original file for this exact version in Morphe Manager.

> **Status.** The templated app is confirmed at level 9 in DriveDeck: Home with its sections, Umbra, linked mixes, Your Shows and search through your chosen provider all work there. Hosts at level 8 and the classic media browser are not confirmed yet, so treat those as experimental and report anything that differs.

## Patches

| Patch | Default | What it does |
| --- | --- | --- |
| **Android Auto templated media app** | On | Adds an Eclipse Music app to hosts that support templated media apps. One page offers Home laid out like the phone’s, Discover and Library; below them come your playlists, albums, artists, radio categories and live stations, search through the provider you chose on the phone, collection pages and an Up Next page you can jump around in without losing what you queued. The host’s own now-playing screen plays your music. Confirmed at level 9; level 8 is not confirmed yet. |
| **Android Auto browse upgrade** | On | Experimental, not confirmed on a classic host yet. Gives Eclipse’s existing media browser, which hosts without templates, car media centres and assistants use, the same layout: Home, Discover, Library and Radio, with Up Next shown in the same way. Lists are cut to the size the host asks for, and Up Next refreshes when the queue changes. Eclipse’s own entries, playback resumption and queue keep working as before. |

Both patches are selected by default and work on their own or together. This port targets 0.6.75 (build 155) exclusively.

## What you get in the car

| Your host | What you see |
| --- | --- |
| Templated host with level 9 (newer Android Auto builds, DriveDeck API 9) | One page with chips for Home, Discover and Library. Home follows the phone: your recent playlists as untitled condensed tiles, the Umbra card as a banner, Made For You, your mixes, songs rows as large tiles with title and artist, live stations with the cover on air, the featured-artist spotlight, albums, playlists and artists, Your Shows, then Radio. Nothing sits behind a See all, and a status banner and a styled player complete it. |
| Templated host with level 8 (not confirmed yet) | The same pages with rows and grids instead of chips and spotlights: a Browse list switches between Home, Discover and Library, the recents are small tiles and the Umbra card is one row. |
| Classic media browser (hosts below level 8, Gearslip, car media centres, Bluetooth and assistant controllers; not confirmed yet) | Home, Discover, Library and Radio as browsable folders. Home rows are grouped under their titles in the phone’s order, every entry of a row is listed (up to 30 per row, cut silently) and there is no See all. |

The sections of Home, in the order of the phone, and where each one comes from:

| Section | In the car (level 9 / level 8) | Where its data comes from |
| --- | --- | --- |
| Recent playlists (no title) | Condensed tiles / small tiles | The feed. Linked playlists in the recents open through Eclipse’s own linked-playlist loader. |
| Umbra | Banner with a **DJ** action / one row. A tap starts the DJ and opens the player; **Stop** shows only while the DJ runs. | Eclipse’s own DJ service, started exactly like the phone’s Umbra card. Chatting with Umbra is not offered in the car. |
| Made For You | Two large tiles: this month’s Replay (greyed out with “Building your replay…” until it has songs) and All-Time Top Songs | Eclipse’s own replay service and its all-time top-songs loader. |
| Daily Mixes, New For You, Popular Tracks, Trending on Eclipse and every other songs row | Large tiles with title and artist; a tap plays the whole row from that song | The feed. |
| YouTube Music mixes and other linked playlists | Large tiles; a tap opens the playlist | Eclipse’s own linked-list loader. |
| Eclipse Stations | Large tiles with the cover of the song on air and “LIVE · title – artist” | Eclipse’s live stations. |
| Featured Artist | Spotlight / one round tile | The feed and Eclipse’s artist loader. |
| Fresh Drops, New Releases, Mood Mixes, Playlists For You, Discover, Your Playlists | Large tiles | The feed, your library and Eclipse’s album and playlist loaders. |
| Popular Artists | Round tiles | The feed and Eclipse’s artist loader. |
| Your Shows | Large tiles; a tap lists the episodes | The podcast shows you follow in Eclipse and Eclipse’s own feed loader. Left out while you follow none. |
| Radio | Genre, mood, decade and activity tiles (always last) | Eclipse’s radio catalogue. |

Section titles are the ones you gave them on the phone, then the server’s, then Eclipse’s built-in names. The order, hidden sections and renames you set on the phone apply in the car too.

## Before using

- A patched app is signed with a new certificate, so the original Eclipse Music has to be uninstalled first. Local data goes with it: your library and playlists return through cloud sync after you sign in, and Eclipse add-ons have to be installed again.
- Android Auto only lists apps that were not installed from the Play Store when **Unknown sources** is switched on in its developer settings.
- Home and Discover need an Eclipse account that is signed in on the phone. When the account is signed out, offline or the service is switched off, Home falls back to your library and says why.

## Known limits

- Lists in the car cannot carry per-song buttons. Add a whole album, playlist or list to Up Next from its page instead of a single song.
- Linked playlists (YouTube Music, Spotify) open and play, but albums and artists of those services are left out of Home: Eclipse has no loader the car can use for them. Umbra only starts the DJ in the car; chatting with it is not offered.
- Search in the templated app works like the phone’s Search screen: it asks the provider selected there (an installed addon), shows songs, albums, artists and playlists under their own titles, and the chips (All, Tracks, Albums, Artists, Playlists) narrow them without asking again; below level 9 the list shows the types in that order with the type on the second line, and submitting opens the sectioned results. The provider you pick in the car is the one the phone shows next. Apple Music and Tidal as providers, and addons that answer with Apple Music’s results, are not offered in the car; when no provider can answer, the search falls back to your library and says “From your library”. Voice search and the classic browser’s search keep working as before.
- In the classic browser, a host that asks for a page size gets lists cut to it. The new Home, Discover, Library and Radio levels end in a More item for the rest; Eclipse’s own long lists (for example all your songs) show only their first page. A host that does not ask for a page size still receives the whole list.

[Installation](../guides/install.md) · [Choose patches](../guides/choose-patches.md) · [Compatibility and defaults](../reference/catalogue.md)
