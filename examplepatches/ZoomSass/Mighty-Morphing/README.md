# Mighty Morphing Patches

![Mighty Morphing Patches](banner.png)

Patches for Joey for Reddit (last published release)

Click the following to add to morphe sources

https://morphe.software/add-source?github=ZoomSass/Mighty-Morphing

<!-- PATCHES_START EXPANDED -->
- <span style="color:#d85a45">**Arctic Shift restore:**</span> [v1.4.5: Link preview fix.] Removed and deleted comments, and removed posts on the comments screen, get an Arctic Shift Restore button that brings back the archived text. Nothing is fetched until you tap it. Works with Modern UI or Classic. Turn it on in Joey Settings - Morphe Settings. Initial release, please report any issues or suggestions for improvements.
- <span style="color:#d85a45">**Backup and restore:**</span> Save Joey and Morphe settings to a file and restore them later, including splash, theme, fonts, comments, and show and hide. Log in to the same Reddit account before restoring subscriptions. Access via Joey Settings - Morphe Settings.
- <span style="color:#d85a45">**Disable tooltips:**</span> Turns off the first-run tips Joey shows.
- <span style="color:#d85a45">**Dismiss without tearing:**</span> Swiping a photo away to close it looks smooth instead of tearing.
- <span style="color:#d85a45">**Editor image and GIF upload:**</span> Uploads images and GIFs to Reddit directly when adding comments. Both can be uploaded via the image button. Also adds keyboard gif auto upload to reddit (click markdown in editor (far left icon) to enable keyboard gif support).
- <span style="color:#d85a45">**Fix collapsed replies:**</span> Loads replies that stay hidden when Reddit will not open them. Based on the Patcheddit fix.
- <span style="color:#d85a45">**Fix login page:**</span> Makes Reddit's login page load and work properly inside Joey, and clears the cookie banner out of the way.
- <span style="color:#d85a45">**Inline comment media:**</span> Shows GIFs, pictures, subreddit emojis and Reddit videos in comments instead of links. Tap to open, drag left or right to resize, and scroll past them as normal. YouTube links use a 16:9 preview with the title. Extra settings in Joey Settings - Morphe Settings.
- <span style="color:#d85a45">**Log in with your own client ID:**</span> Lets Joey log in with another app's client ID, for when Joey's own login stops working. Normal option here is to sign in to RedReader once, then paste the App ID from Reddit's "you authorized an app" email into this patch's settings in expert mode.
- <span style="color:#d85a45">**Media enhancements:**</span> [v1.5.0: New. The Modern UI media features, now as their own patch so Classic Joey can have them too. Nothing changes for existing users; Modern UI already includes all of this.] Downloads with your own file names and folder, full screen media, optionally opening without controls, an album viewer with thumbnails, grid and captions, and swiping albums closed. All on by default; each can be turned off in Joey Settings - Morphe Settings.
- <span style="color:#d85a45">**Modern UI:**</span> [v1.5.0: The media features (downloads, full screen media, album viewer and more) are now shared with the new Media enhancements patch, so Classic Joey users can have them too. Nothing changes for existing users. Media options now have their own section in Morphe Settings.] [v1.4.0: Post buttons & menu editor for the post bar and ⋮ menu. Full screen media, optionally opening without controls. New album viewer with thumbnails, grid and captions. Separate Modern fonts. Sidebar subreddit search keyboard fixed. Performance improvements, comparably smooth to Joey or better.] A cleaner layout for Joey, on by default, with a choice of themes. Joey's own themes and colours are off while it's on, and Classic Joey can be switched back on any time. Posts use one compact list with adjustable post buttons, info line and image style, including whether opened posts show the full picture. Settings in Joey Settings - Morphe Settings.
- <span style="color:#d85a45">**Open Reddit share links:**</span> Opens modern Reddit share links directly to the right post or comment in Joey instead of loading the web page. To open Reddit links from other apps, make sure all links are ticked in Android Settings -> Apps -> Joey -> Open by default.
- <span style="color:#d85a45">**RedGifs with sound:**</span> RedGifs clips play with their sound, in HD when it's available.
- <span style="color:#d85a45">**Search auto open keyboard:**</span> Opens the keyboard automatically for homepage search and comment search. The Enter and Search keys start the search.
- <span style="color:#d85a45">**Seasonal sidebar banner:**</span> Shows a picture in the sidebar header that changes with the season, or one you choose. If you set it back to Joey's image, any picture Joey had already saved is still there and gets used again.
- <span style="color:#d85a45">**Show/Hide:**</span> Choose which comment editor buttons, sidebar entries, subreddit toolbar items and post actions are shown, and drag to reorder them. What doesn't fit on a post goes in its menu. Adjust in Joey Settings - Morphe Settings.
- <span style="color:#d85a45">**Skip ads and checks:**</span> Removes ads everywhere and also drops the Play Store install check and crash reporting.
- <span style="color:#d85a45">**Splash Screen:**</span> [v1.4.0: Match theme keeps your chosen animation.] Logo inspired by u/otheast. Logo, colours and animation can be customised, follow your theme, or the animation can be turned off, in Joey Settings - Morphe Settings.
- <span style="color:#d85a45">**Subreddit filter options:**</span> Adds a subreddit suffix filter and lets you toggle subreddit filters on or off without deleting them. Configure in Joey - Settings - Filters, or from the feed Filter out posts menu.

<!-- PATCHES_END -->

## To be added
- **Video upload support:** In-comment video uploads to Reddit.
- **Album downloads:** Save every file in a Reddit gallery.
- **Internal browser domains:** Specific domains list to always open inside Joey's internal WebView browser.
- **Account stats:** Reactivate account age and karma indicators on posts and comments.
- **Pinned sidebar:** A sidebar that can stay open beside the feed.
- **Post info line overflow menu:** Choose which post details stay on the line and which go in an overflow menu.
- **Feed UI tweaks:** Further adjustments to the feed layout.
- **Modern UI:** Further theme enhancements.
- **Show and hide previews:** Live previews for the remaining Show/Hide options.
- **More link previews:** Show more than 4 link previews.
- **Image host choice:** Upload images to a different host, for subreddits that block Reddit-hosted images.

## Credits
- **Morphe:** The patcher these patches are built for.
- **Patcheddit:** The collapsed replies fix and the login page fix are based on its patches.
- **Infinity for Reddit:** Inline comment media reads Reddit's gallery and emoji data the same way it does.
- **Arctic Shift** by Arthur Heitmann: Added restore functionality using Arctic Shift. https://github.com/ArthurHeitmann/arctic_shift

## License

Mighty Morphing Patches are licensed under the [GNU General Public License v3.0](LICENSE).
