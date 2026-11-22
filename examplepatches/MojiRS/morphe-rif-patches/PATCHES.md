# Patch details

How each patch works, and its settings (under **Settings → rif patches** in the patched app). For a summary, see the [README](README.md).

All patches target **rif is fun 5.6.22**. rif is R8-obfuscated, and the free (`com.andrewshu.android.reddit`) and golden platinum (`com.andrewshu.android.redditdonation`) builds are obfuscated independently: same code, different class and member names. Patches find their targets by shape (signatures, strings, call patterns) or through the per-build symbol table `RIF_BUILDS` in `patches/src/main/kotlin/app/revanced/patches/rif/shared/Rif.kt`.

## Inline comment images

Shows images, GIFs, videos and tables in comments and text posts inline.

With Patcheddit's *Inline media* patched in too, this patch shows tables only and leaves images and videos to Patcheddit; its settings then have only *Inline tables*. This is decided when patching: switching Patcheddit's Inline media off in its settings doesn't bring this patch's images back.

**Tables**

- A markdown table is drawn in place of rif's "[View formatted table]" link and its plain-text cells: thin borders, bold header row, left/center/right alignment, links in cells (tap one to open it like any link). Columns share the comment's width and long text wraps. Tap the table anywhere else to open rif's zoomable popup.
- Works with "Inline images" off. Setting: *Inline tables*.

**Images**

- Direct image links (i.redd.it, preview.redd.it, `.jpg` `.png` `.webp` `.gif` …), animated **GIFs and WebP**, **Giphy** (by id), and common hosts resolved through their `og:image` tag (imgur pages, reddit galleries, redgifs, gfycat, Tenor, imgflip).
- Bare links, and Reddit-app `[gif]` markers, are replaced by the image. `[text](url)` links keep their text, with the image on the line below.
- Multi-image **imgur albums** (listed through imgur's API with rif's client ID) show an "n/x" badge and ◀ ▶ buttons: tap the left or right third of the image to cycle through the album, or the middle to open it in rif's album viewer.
- Images shrink to fit indented replies.
- Long pressing an image selects its comment, like tapping the comment's text.

**Videos**

- Comment videos (`reddit.com/link/…/video/…/player`), v.redd.it links, and imgur `.gifv`/`.mp4` play inline on their own line below the link, muted and looping (or tap-to-play).
- Reddit videos are read from their DASH manifest: the largest rendition up to 480p plays inline, the smallest supplies the still frame, and the separate sound file plays alongside (kept in sync) once unmuted.
- Tap a video for controls like rif's own player's, built from rif's own icons and colors: back to start, play/pause, repeat (on by default), sound, seek, and full screen. Full screen opens rif's player at the same position, repeat and sound settings.
- The video is drawn by a `TextureView` laid over the space the text reserves for it, in the frame rif wraps comment and post bodies in. Players are released while scrolled away or while rif is hidden (e.g. the phone is locked), and restored where they were.

Settings: *Inline images*, *Scale inline images to fit*, *Limit inline media width* and *Limit inline media height* (off by default), each with a *Max width (% of screen)* / *Max height (% of screen)* slider, *Inline album navigation* (off: no arrows, tapping an album opens it), *Inline videos*, *Autoplay inline videos*, *Inline tables*, *Long press image to select comment* with a *Long press delay* slider.

How it works: images are fetched and embedded on rif's background thread, when it renders a comment or post body (before it's shown). A hook after each body `setText` then starts GIFs and adds video overlays on the main thread.

## Fix share links

Opens Reddit share links (reddit.com/r/…/s/…) directly in rif instead of bouncing through the browser, and fixes reddit.com/media image links.

`reddit.com/media?url=…` links wrap an image. rif mistakes them for a link to the post with the id `media`, an unrelated r/funny post, so the image never opens. This patch opens the wrapped link instead.

`matrix.redditspace.com/_matrix/media/…` image links have no file extension, so rif opens them in its browser, where Reddit's redirects can end at the same r/funny post. This patch looks up the image behind the link and opens that. With Inline comment images on, these links show inline too.

Reddit's "Share" button now produces links like `reddit.com/r/sub/s/AbC123`. rif doesn't recognise them as Reddit links, so it opens them in its in-app browser; Reddit redirects that to the post, which rif then opens as a second screen on top of a blank browser, so Back lands on the blank page. This patch looks up where a share link points (a quick lookup, remembered while rif runs) and gives rif the post's address instead, so it opens like any other post and Back returns to where you were. It covers links tapped inside rif and links opened from other apps. `np.` and `old.` links work too. If a link can't be resolved (offline, Reddit refuses), rif behaves as it did before.

No settings.

How it works: a hook at the top of rif's link router resolves `/r|u|user/{sub}/s/{code}` links on a background thread (HEAD request, redirects followed by hand, tracking parameters removed) and calls the router again on the main thread with the result. A second hook at the start of `MainActivity`'s VIEW-intent handling does the same for `/r/` links from other apps, then starts a fresh `MainActivity` on the post and finishes the blank one.

## Repair broken gallery images

Shows the images of Reddit galleries that fail to load with "Error loading gallery" because Reddit marks some of their images as failed.

For some galleries Reddit sends `{"status":"failed"}` with no size for every image, and rif rejects the whole gallery when any image has no size. The images themselves are still on `i.redd.it`. This patch finds each failed image there (a quick lookup per file type, the last type that worked first), gives rif a normal entry for it, and drops images that can't be found. A gallery with nothing wrong is not touched and makes no lookups. If no image can be found, rif shows its usual error. Patcheddit repairs failed images first; this patch handles the ones it can't find (e.g. deleted), by leaving them out.

No settings.

How it works: a hook at the start of rif's gallery response parser (which runs on a background thread) reads the JSON, and for a gallery with an image that has neither a source size nor a preview, rewrites it before rif parses it. Any failure hands rif the original response.

## Keep reply box above keyboard

Keeps the text you type in the reply box above the on-screen keyboard.

rif's reply box is a floating dialog as tall as its text. The box doesn't learn that the keyboard is open, so after a few lines it grows down behind the keyboard and the text you are typing disappears (pulling down the notification shade and back sometimes refreshed it). This patch keeps the box in the space above the keyboard, where it scrolls instead of growing. The box looks the same; only the comment reply box is changed (modmail dialogs are not).

No settings.

How it works: a hook right after rif's dialog base class sets the dialog window's soft input mode (in `onStart`) calls the extension, which, for a dialog containing both the `scrollview_frame` and `quote_parent` views (only the comment reply box has both; the modmail dialogs share `scrollview_frame`), sets the window's height to `MATCH_PARENT` (keeping its width) and, on every layout pass, sets the bottom padding of the dialog's content view to the height the keyboard covers (from `getWindowVisibleDisplayFrame`). rif's own layout (the box centred in a full-size root, its contents in a `ScrollView`) then caps and scrolls the box above the keyboard.

## Hide blocked mod comments

Adds a setting to hide distinguished (mod and admin) comments from blocked users.

rif already hides a blocked user's comments, but not a distinguished one such as a moderator bot's pinned comment. With **Hide blocked users' mod comments** on (Settings → rif patches → Blocked users; off by default), those comments disappear too, together with the replies under them, like rif's own blocked-user filter. A comment opened on its own (its permalink) and comments in subreddits you moderate still show.

How it works: Reddit does not mark a blocked mod's comment as a blocked author's; it sends `unrepliable_reason: NEAR_BLOCKED` instead. A hook in rif's blocked-comment filter asks the extension first, passing that flag and the `distinguished` value. When the setting is on and both apply, rif goes straight to its own permalink and moderator checks.

## Reddit image hosting

Uploads images, GIFs and videos for posts to Reddit instead of imgur, and posts them as native image and video posts.

rif's Image tab on the Submit screen uploaded to imgur, which no longer works for everyone. With this patch the tab (renamed "media") works as before (pick, confirm, progress, submit), but the file goes to Reddit's own hosting and the post is a real image post (`i.redd.it`) or video post (`v.redd.it`), not a link. The picker offers images and videos; the confirm dialog and the form's thumbnail show a frame of a video. Images over 20 MB are still shrunk first; GIFs and videos are never resized or re-encoded (Reddit's own size limit applies; videos up to 1 GB). A video's thumbnail is its first frame, uploaded as a second file. The tab's texts no longer mention imgur. One file per post. If the subreddit doesn't allow that kind of post, Reddit's message is shown and the form stays filled.

Comment replies get an image button too: in the formatting bar (when "show formatting" is on), after the link button. It picks a PNG, JPEG, WebP or GIF, and puts a marker like `![img](photo.png)` in the text, as its own paragraph, where you can move or delete it. When the reply is sent the file is uploaded to Reddit (a still image over 20 MB is shrunk; a GIF is never re-encoded, 100 MB at most) and the comment is posted with the image inline; everything else in the text keeps its formatting. Reddit allows one image or GIF per comment, so a second pick is refused. The button is not in private-message replies and edits, and a subreddit that doesn't allow images or GIFs in comments gets a short message instead of the picker. If anything fails the text stays in the dialog.

Post bodies get the same button, in the formatting bar of the Submit screen (on every tab: text, link and image posts, and videos on the media tab) and of the edit dialog of any post. Any number of images and GIFs can go in the body, each as its own paragraph. Reddit only processes images that rif attaches to a post as markdown `![img](<id>)`, and even then they stay on "Processing", so after the post is made rif edits it once: each image becomes a plain `https://i.redd.it/...` link in the body. Rif shows the images inline (with "Inline comment images"); other apps and old Reddit show links. If that edit fails after a few tries, the post stays up and a message says its images may show as "Processing" until you edit it. An edit that adds an image sends every image the post has again (an edit that attaches images deletes the ones it leaves out), including every `i.redd.it` link in the body; if Reddit refuses that because a link is somebody else's, the edit is sent again without the links it can't vouch for, and if it is still refused Reddit's message is shown and the dialog stays.

The submit page's hint "text on link posts cannot be edited after submission" and the "Edit anyway?" question before editing a link, image or video post's text are gone: such text can be edited.

No settings.

How it works: the picker and preview decoder get small hooks, then four more. The picker's intent also accepts `video/*`; the preview decoder returns a frame for a video (and rotation is skipped for videos). The body of rif's imgur uploader task is replaced by a call into the extension, which asks Reddit for an upload lease (`/api/media/asset.json`, with rif's own sign-in token), posts the file to it and returns the asset URL for rif's URL field. The 10 MB checks (the confirm branch, the dialog's warning, the size state and the resize target) become 20 MB, and for GIFs and videos "needs resize" is always false. A video is streamed from the device as it is; its bucket comes from the lease. `SubmitTask`'s form parameters turn a link post to one of our asset URLs into `kind=image`, or `kind=video` with `video_poster_url` for a video; an asset that was already posted once (a retry after an error) is uploaded again (video and poster), because a reused asset makes a broken post. Reddit answers an image or video post with no post in it, so the reply is read, the user's newest posts are polled for the `i.redd.it` / `v.redd.it` id (up to 30 s, videos 60 s; for a video also the same title posted since) and rif gets a normal reply with the new post's address.

## Fix random subreddit

Makes rif's Random button (the sidebar's subreddit picker) open a random subreddit again. Reddit removed `/r/random` and `/r/randnsfw`, so rif showed "Banned subreddit". The patch asks the redditrand.com API (`api.redditrand.com`, an unofficial third-party service) for a random subreddit and opens that; rif then titles the feed and loads the subreddit as it did when Reddit still redirected.

Each tap sends one plain request to redditrand (your IP address, like any web request; no Reddit token, account or cookies). If redditrand is down or its reply can't be read, nothing is replaced and rif shows its usual "Banned subreddit" error. There is no retry. Links to `/r/randnsfw` use redditrand's NSFW pick; there is no NSFW row in the picker.

No settings.

How it works: rif's request base class runs every Reddit request's background step on a worker thread and reads the request URI from one field. A hook at the top of that step lets the extension look at the URI; if it is a listing of `r/random` or `r/randnsfw` (any sort), it makes a blocking request to redditrand (10 s timeout), reads the name from `{"url":"/r/<name>/"}`, and rewrites the URI to `r/<name>` before rif builds its request. The field's `final` flag is removed so it can be replaced. rif's own random mode handles the rest, so refreshing Random picks another subreddit, as it used to.

## Explain processing videos

Shows "Video still processing. Try again in a minute." when you tap a Reddit video (`v.redd.it`) that can't play yet, instead of rif's "Error retrieving reddit video metadata." or "Error determining video format." Nothing is retried; tap again later. A video posted from rif with Reddit image hosting is in this state for its first minute or so, and can stay there for a few minutes.

It covers two cases. A video Reddit hasn't produced yet (the post has no video data; a video that never processes stays like this for good), and a video whose streams Reddit still refuses (HTTP 403) while the data is complete. Any other failure keeps rif's own message, and videos that play are unchanged.

No settings.

How it works: rif's video metadata loader parses the post JSON and returns null when the post has no video yet. A hook there keeps the first 256 KB of the response (rif gets an identical copy), and a second hook replaces the error toast in the loader's null branch: if that body is a post with `is_video` true and no `media`, it shows the message above, otherwise rif's toast. For the second case, a hook at the start of the player's error callback notes, per player, whether the DASH and HLS playlists of the v.redd.it video were answered with 403 (other failures are noted too), and a hook on the toast that ends rif's format-metadata fetch shows the message only when both were refused and nothing else failed. rif's mp4 fallback isn't used for playback (rif builds it as DASH and fails), so a refused video stays unplayable until Reddit serves it.
