# 🏷️ YouTube Music AI Tagger

Tags songs made by AI artists in the YouTube Music app, so you can see at a glance what you're listening to.

YouTube Music only shows its own AI label in a few places. This patch adds a clear tag everywhere a song shows up:

| Tag | Meaning |
| --- | --- |
| 🟦 **AI** (blue) | The artist is on the community AI-artist list. |
| 🟥 **AI** (red) | YouTube itself labels the song as made with AI. *(coming soon)* |

When both apply, only the YouTube tag is shown.

## Details

**Where the tag shows:** at the start of the artist line in song rows, playlists, cards and shelves, the queue, the mini player and the Now Playing screen.

**Where the data comes from:** the community list is
[CennoxX/spotify-ai-blocker](https://github.com/CennoxX/spotify-ai-blocker), matched by artist name.
It's downloaded the first time the app opens and refreshed every 24 hours. Nothing else is sent anywhere.
If an artist is wrongly listed or missing, report it to that project.

## Setup

1. Patch **YouTube Music 9.30.53** and enable **YouTube Music AI Tagger** together with the official Morphe
   YouTube Music patches (they're needed for signing in).
2. Install and open the app. Tags appear once the artist list has downloaded, which takes a few seconds on first launch.

[← Back to OrangeTree Patches](../README.md)
