# rif is fun

Patches for rif is fun for Reddit, for use with ReVanced. To install them, see
[ReVanced Manager](../../README.md#revanced-manager) or [ReVanced CLI](../../README.md#revanced-cli).

## Tested version

| Package | Tested version |
| --- | --- |
| `com.andrewshu.android.reddit` | `5.6.22` |

## Patches

| Patch | What it does | Default |
| --- | --- | --- |
| Disable ads | Removes ads and the ad consent form, and keeps the ad SDKs from starting. | On |
| Enable golden platinum | Enables the golden platinum features that work without rif's servers, and makes the ads setting switch only ads. | On |
| Fix /s/ links | Opens Reddit share links (/s/) as the post they point to, from the app and from other apps. | On |
| Fix galleries | Fixes Reddit galleries and inline Reddit videos failing to load, including gallery images Reddit marks as failed. | On |
| Fix Imgur | Fixes Imgur albums and album thumbnails failing to load, and links with a title in them. | On |
| Fix load more comments | Fixes "load more comments" not loading further comments. | On |
| Fix markdown links | Shows markdown links that Reddit leaves as raw text, such as links to u/name, as links. | On |
| Fix media links | Opens reddit.com/media links as the Reddit-hosted image they wrap. | On |
| Fix Redgifs | Fixes Redgifs videos not loading. | On |
| Fix YouTube player | Fixes the built-in YouTube player, which showed a black screen and error code 0. | On |
| Keep typed text in view | Keeps the line being typed in view when writing a long reply. | On |
| Spoof client | Restores login and browsing by using another app's Reddit OAuth client. | On |

## Options

### Spoof client

`OAuth client ID`, `Redirect URI` and `User-Agent` set the Reddit client the app logs in with. Change them only if
Reddit stops accepting [RedReader](https://github.com/QuantumBadger/RedReader)'s public client, whose rate limit every
RedReader user shares:

1. Set all three to another "installed app" client: its client ID, the redirect URI registered for that ID, and the
   User-Agent that app sends.
2. If you are logged in, remove the account and add it again: its token belongs to the old client. Logged out, the app
   gets a new token by itself.

### Fix Imgur

`Imgur client ID` sets the Imgur client the app loads albums with. Change it only if Imgur stops accepting the app's
own.

## Known issues

- **Imgur uploads fail.** The app uploads through a RapidAPI proxy of Imgur's API that no longer accepts its key
  ("You are not subscribed to this API").
- **Synccit, new post notifications and downloadable themes are gone.** They need servers that no longer answer:
  synccit.com, and rif's rifnotifier.talklittle.com and redditthemes.com, so Enable golden platinum hides their settings,
  menu items and theme list. Themes from a folder still work (**Theme**, **Enable developer mode**).
