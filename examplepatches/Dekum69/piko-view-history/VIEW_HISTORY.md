# View history for Instagram (piko patch)

A local, offline watch history for Instagram, in the spirit of Insta Pro / Honinsta: every feed
post, Reel and Story you view is recorded on the device and can be browsed later with a thumbnail,
caption, author, type, timestamp and a tap-to-reopen action.

Ported from the (closed but unmerged) piko PR
[#1952](https://github.com/crimera/piko/pull/1952) onto current `main`.

## What it adds

| Patch | What it hooks |
|---|---|
| `Log feed posts to view history` | Feed `viewed_impression` callback (only fires once a post is actually on screen, not for prefetched rows) |
| `Log Reels to view history` | `ClipsViewerViewPagerListener.onPageSelected` |
| `Log stories to view history` | `ReelViewerFragment.onCurrentActiveItemBound` |
| `View history` (settings) | Adds the History section, the `save_view_history` toggle and the retention picker |

The viewer is a plain-framework two-column grid (`HistoryActivity`) opened from
**Piko settings → History → View history**, or from the History row on the settings landing page.

- Newest first, 2000 rows max, `media_pk` is unique so re-viewing an item moves it to the top.
- **Auto-delete history** setting: keep forever, or drop items after 1 day, 2 days, 3 days,
  1 week, 2 weeks, 1 month or 3 months. Pruning runs when a new item is logged and when the
  history screen opens, so lowering the limit takes effect immediately.
- Long-press a card to copy the link or delete it; the toolbar Clear button wipes everything.
- Stories reopen in Instagram's own story viewer; posts/Reels open through Instagram's URL handler.
- Nothing leaves the device: `piko_view_history.db` is a local SQLite file, thumbnails are cached
  in memory only.

## Building the patch bundle

Building requires a GitHub token with `read:packages`, because
`app.morphe:morphe-patches-library` lives on GitHub Packages. The included
`.github/workflows/build-patches.yml` handles that automatically.

1. Push this repository to GitHub (any account, public or private).
2. Open **Actions → Build patches → Run workflow** (it also runs on every push to `main`).
3. When the run finishes, download the **`piko-patches-view-history`** artifact. It contains
   `patches-<version>.mpp`.

> `release.yml` has been changed to `workflow_dispatch` only, so pushing to `main` does not try to
> run the upstream semantic-release job (which needs GPG secrets this fork does not have).

## Applying it to Instagram

1. Install **Morphe Manager 1.33.0-dev.1 or newer**. Patching with Manager 1.32 together with the
   Theme patch makes Instagram crash on launch with `Resources$NotFoundException`.
2. Select the Instagram APK (tested layout: `447.0.0.55.81`, versionCode `385311895`, APKM).
3. Import the downloaded `.mpp`, enable **View history** (the three logging patches are on by
   default), then patch and install.
4. Open Instagram → profile → Piko settings → **History** → **View history**.

CLI equivalent:

```bash
java -jar morphe-cli.jar patch \
  --patches patches-<version>.mpp \
  --out instagram-patched.apk \
  instagram-447.0.0.55.81.apkm
```

## Notes / caveats

- Fingerprints were written against Instagram `439.0.0.37.89` (the PR author's build) and have not
  been executed against `447.0.0.55.81` yet. If a patch reports `... not found`, the fingerprint in
  `patches/src/main/kotlin/app/crimera/patches/instagram/misc/history/` needs the string/parameter
  list refreshed from the new dex.
- `GetPostTypeExtensionFingerprint` points at `getPostTypeKey` (it contains the `"A7Q"` literal).
  Pointing it at `getPostType` makes the patch overwrite the `"clips"` literal and breaks Reels
  detection, so do not "fix" that name back.
- License: GPLv3, same as piko. See `NOTICE`.
