# rif is fun

## Compatible version

| Package | Compatible version |
| --- | --- |
| `com.andrewshu.android.reddit` | `5.6.22`, `4622` |

## Patches

| Patch | What it does | Default |
| --- | --- | --- |
| Disable ads | Removes ads and the ad consent form, and keeps the ad SDKs from starting. | On |
| Fix /s/ links | Opens Reddit share links (/s/) as the post they point to, from the app and from other apps. | On |
| Fix galleries | Restores Reddit gallery and inline video lookup and uses available previews for failed gallery images. | On |
| Fix Imgur | Loads Imgur albums and covers through the Imgur API and opens titled album links. | On |
| Fix load more comments | Fixes "load more comments" not loading further comments. | On |
| Fix markdown links | Shows markdown links that Reddit leaves as raw text, such as links to u/name, as links. | On |
| Fix media links | Opens reddit.com/media links as the Reddit-hosted image they wrap. | On |
| Fix Redgifs | Opens RedGIFs video links in the public embedded player inside rif’s browser. | On |
| Fix YouTube player | Fixes the built-in YouTube player, which showed a black screen and error code 0. | On |
| Hide retired service controls | Makes the ads checkbox control ad placement independently of Cards, native albums and folder themes. Hides disabled Synccit and new-post notification settings, new subscriptions, and the remote theme catalog. | On |
| Keep typed text in view | Keeps the line being typed in view when writing a long reply. | On |
| Spoof client | Uses your own Reddit OAuth registration when all three options are set. Leaves the app’s configuration in place when they are blank. | On |

## Options

### Fix Imgur

`Imgur client ID` can override rif’s bundled Imgur registration with one you are authorized to use.
Reseam stores the override in the patched APK so rif can request albums and covers.

### Spoof client

Set all three patch-time options together for your own Reddit installed-app registration.

- `OAuth client ID` is the public ID from your registration.
- `Redirect URI` is the exact registered HTTP(S) or app callback URI. Use a URI without a fragment.
- `User-Agent` describes your app and identifies its operator.

Leave all three blank to keep the app’s shipped OAuth configuration. If you change registrations, add your
Reddit accounts again so they can obtain tokens for the new client. A cached guest token can stay in use
until it expires. The patch preserves app settings.
Live Reddit sign-in and browsing with a custom registration still need verification.

## Ad display

With **Hide retired service controls** applied, use **Settings → General settings → Show ads** to
control feed, banner and native album ads. Cards, native albums and folder themes keep their settings
when you turn ads off. Restart rif to refresh open screens. **Disable ads** takes precedence over
**Show ads** and also disables ad consent and SDK startup.

## Local themes

With **Hide retired service controls** applied, open **Theme**, turn on
**Enable developer mode** and tap **Select theme directory**. Open the folder containing the theme’s
`manifest.json`, then tap **Use this folder → Allow**. After editing the files, choose **Reload files**,
then close and reopen rif. An active folder theme uses rif’s list layout. Turn off developer mode
to see the saved Cards layout with a built-in theme.

## Known issues

- **Previously enabled Synccit and notification settings can still appear.** The patch preserves rif’s opt-out controls and their availability rules.
- **Some gallery images are skipped.** Reddit supplies neither the full image nor a usable preview for those items.
- **Imgur uploads use the original proxy.** The album and cover patch leaves that upload path in place.
- **Some YouTube videos cannot play in rif.** The video must be available and allow embedding.
- **RedGIFs native playback and download options are unavailable for embedded videos.** The public player handles the media inside rif’s browser.
