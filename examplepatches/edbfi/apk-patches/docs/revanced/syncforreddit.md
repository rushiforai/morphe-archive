# Sync for Reddit

Patches for Sync for Reddit, for use with ReVanced. To install them, see
[ReVanced Manager](../../README.md#revanced-manager) or [ReVanced CLI](../../README.md#revanced-cli).

## Tested version

| Package | Tested version |
| --- | --- |
| `com.laurencedawson.reddit_sync` | `v23.06.30-13:39` |

## Patches

| Patch | What it does | Default |
| --- | --- | --- |
| Disable ads | Removes ads and the ad consent form, and keeps the ad SDKs from starting. | On |
| Disable Sync for Lemmy bottom sheet | Removes the Sync for Lemmy promotion that shows at every start. | On |
| Enable Sync Ultra | Enables the Sync Ultra features that work without Sync's servers, and loads website previews on the device. | On |
| Fix /s/ links | Opens Reddit share links (/s/) as the post they point to, from the app and from other apps. | On |
| Fix galleries | Fixes Reddit galleries failing to open. | On |
| Fix Imgur | Fixes Imgur albums failing to open, album previews in comments and posts staying blank, and Imgur uploads failing. | On |
| Fix Other discussions | Fixes "Other discussions" failing to load, by searching Reddit for the link instead. | On |
| Fix post thumbnails | Fixes post thumbnails not loading. | On |
| Fix Redgifs | Fixes Redgifs videos not loading, Enhanced autoplay's included. | On |
| Fix Tenor previews | Fixes previews of Tenor links in comments and posts staying blank. | On |
| Fix video downloads | Fixes downloaded Reddit videos having only audio. | On |
| Fix View more comments | Fixes "View more" not loading further comments. | On |
| Hide Gfycat link previews | Hides the blank previews of Gfycat links in comments and posts. Gfycat shut down in 2023. | On |
| Spoof client | Restores login and browsing by using another app's Reddit OAuth client. | On |
| Use /user/ endpoint | Requests user profiles from /user/ instead of /u/. Not needed today: Reddit redirects /u/ to /user/, and the app follows the redirect. | Off |

## Options

### Spoof client

`OAuth client ID`, `Redirect URI` and `User-Agent` set the Reddit client the app logs in with. Change them only if
Reddit stops accepting [RedReader](https://github.com/QuantumBadger/RedReader)'s public client, whose rate limit every
RedReader user shares:

1. Set all three to another "installed app" client: its client ID, the redirect URI registered for that ID, and the
   User-Agent that app sends.
2. Remove your accounts in Sync and add them again: their tokens belong to the old client.

### Fix Imgur

`Imgur client ID` sets the Imgur client the app uses. Change it only if Imgur stops accepting RedReader's public one,
whose quota every RedReader user shares too.

## Known issues

- **Website previews make your phone load every linked page they show.** With Enable Sync Ultra, the phone reads the
  preview image a page names for itself (`og:image`). Each linked site sees your IP address when a link scrolls into
  view, much as if you opened it. To stop it, turn off **Website previews** in Sync Ultra's settings.
- **Website previews stay blank behind a proxy.** A proxy could reach addresses on your own network, which previews must
  never load.
- **Translations have no "Translated by Google" badge.** It was an image on Sync's server.
- **Paints and tags stay on the device.** Paint users' **Force refresh** does nothing, and **Clear all** only says
  "TODO". Ultra synced them, and cleared them, through Sync's servers, which only serve accounts that bought Ultra.
  Remove them one at a time.
- **Settings cloud backup is gone.** It kept backups on Sync's servers. The app's local backup still works.
- **Restore comment is gone.** It read removed comments from Pushshift, which no longer serves apps.
- **Translate and Select text from images need Google Play services.** They run Google's ML Kit on the device.
- **"Other discussions" can miss a post of the same link, or show a post of a different one.** It searches Reddit for the link.
