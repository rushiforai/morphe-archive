# 🧩 AfterSync

Morphe patches for Sync for Reddit — an actively-updated patch set that keeps the
now-abandoned app working: crash fixes for parts of the app that broke after the
developer stopped maintaining it, removal of dead telemetry/ads/purchase-validation
code that depended on servers that may no longer respond, and a fix for
Reddit-hosted images no longer embedding properly in comments and posts.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=ram-prices/AfterSync

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.21.19](https://github.com/ram-prices/AfterSync/releases/tag/v1.21.19)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;24 patches total
<details open>
<summary>📦 com.laurencedawson.reddit_sync&nbsp;&nbsp;•&nbsp;&nbsp;24 patches</summary>
<br>

**🎯 Supported versions:**

| v23.06.30-13:39 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Center media in posts](#center-media-in-posts) | Centers images, GIFs, and videos embedded in a post's own body horizontally. Media in comments stays left-aligned. |  |
| [Clean up root settings menu](#clean-up-root-settings-menu) | Removes the dead "Developer options" visibility-check code left behind after removing it from Sync for Reddit's settings menu. This is the bytecode fix "Clean up root settings menu (resources)" needs to avoid a crash — select that patch too (or select this one, which pulls it in automatically). |  |
| [Clean up root settings menu (resources)](#clean-up-root-settings-menu-resources) | Removes the "New" category ("Developer options", "Legacy settings", and its promotional banner) and moves "Run setup" into the "Other" category in Sync for Reddit's settings. This patch only edits XML — see "Clean up root settings menu" for the matching bytecode fix this resource change requires to avoid a crash. |  |
| [Fix blank images in post bodies](#fix-blank-images-in-post-bodies) | Fixes images embedded directly in a post's own body (not a comment) showing as blank boxes in Sync for Reddit, by giving that render path the available-width value it was never being given. |  |
| [Fix comment image margins from missing dimensions](#fix-comment-image-margins-from-missing-dimensions) | Fixes comment-embedded preview.redd.it images being boxed as if they were square (causing large empty margins around non-square photos) by giving them the same real-dimension lookup from Reddit's own metadata that post bodies already get. |  |
| [Fix inline comment/post images](#fix-inline-comment-post-images) | Fixes comment and post images hosted on preview.redd.it showing as a raw link instead of embedding, widens the size/aspect-ratio limits that reject large images from embedding at all, adds a caption below images whose link text isn't just the bare URL, stops embedded images/GIFs from being stretched to a square, caps their size, gives Giphy embeds a real animated fallback instead of a static link chip when Reddit's own size metadata for them is missing, and properly embeds bare i.redd.it (and similar) image/GIF links pasted directly in a comment instead of showing a small frozen link-preview chip. |  |
| [Hide online user counter](#hide-online-user-counter) | Hides the subreddit info screen's "number of users online" count, which Reddit's API no longer provides to this app at all (confirmed — not a simple field rename), instead of always showing an incorrect 0. The member count is unaffected. |  |
| [Rebrand About screen](#rebrand-about-screen) | Renames "Everything else" to "About", removes "Help and support"/"Rate app!"/the original Credits entries, adds a row for the original app's version, and repurposes two Credits rows and their links for Morphe and this patch repo's GitHub page in Sync for Reddit. This is the bytecode fix "Rebrand About screen (resources)" needs to avoid a crash — select that patch too (or select this one, which pulls it in automatically). |  |
| [Rebrand About screen (resources)](#rebrand-about-screen-resources) | Renames "Everything else" to "About", removes "Help and support"/"Rate app!"/the original Credits entries, adds a row for the original app's version, and repurposes two Credits rows for Morphe and this patch repo's GitHub page in Sync for Reddit. This patch only edits XML — see "Rebrand About screen" for the matching bytecode fix this resource change requires to avoid a crash. |  |
| [Remove Gestures settings](#remove-gestures-settings) | Removes the "Gestures" section (Swipe to return, Dim behind activity, Swipe to return sensitivity) from Sync for Reddit's General settings screen, including the code that would otherwise crash the settings screen once those preferences no longer exist. This is the bytecode fix "Remove Gestures settings (resources)" needs to avoid a crash — select that patch too (or select this one, which pulls it in automatically). |  |
| [Remove Gestures settings (resources)](#remove-gestures-settings-resources) | Removes the "Gestures" section (Swipe to return, Dim behind activity, Swipe to return sensitivity) from Sync for Reddit's General settings screen. This patch only edits XML — see "Remove Gestures settings" for the matching bytecode fix this resource change requires to avoid a crash. |  |
| [Remove Privacy section](#remove-privacy-section) | Removes the "Privacy" entry (privacy policy link, Crashlytics toggle, "Delete Firebase installation ID", "Revoke GDPR consent for ads") from Sync for Reddit's settings, now that telemetry and ads have already been removed. |  |
| [Remove Restore purchases](#remove-restore-purchases) | Removes the "Restore purchases" entry from Sync for Reddit's settings, plus the Sync Ultra screen's "Restore subscription" and dev-only "Reset subscription locally" buttons, now that Ultra and ad removal are unlocked unconditionally and don't depend on this state. This is the bytecode fix "Remove Restore purchases (resources)" needs to avoid a crash — select that patch too (or select this one, which pulls it in automatically). |  |
| [Remove Restore purchases (resources)](#remove-restore-purchases-resources) | Removes the "Restore purchases" entry from Sync for Reddit's settings, plus the Sync Ultra screen's "Restore subscription" and dev-only "Reset subscription locally" buttons, now that Ultra and ad removal are unlocked unconditionally and don't depend on this state. This patch only edits XML — see "Remove Restore purchases" for the matching bytecode fix this resource change requires to avoid a crash. |  |
| [Remove Sync Ultra screen](#remove-sync-ultra-screen) | Relocates "Translate text"/"Restore removed comments"/"Paint users"/"Tag users" click behavior onto the Comments settings screen, and strips the now-pointless preference-wiring setup code from the Sync Ultra screen. This is the bytecode fix "Remove Sync Ultra screen (resources)" needs to avoid a crash — select that patch too (or select this one, which pulls it in automatically). |  |
| [Remove Sync Ultra screen (resources)](#remove-sync-ultra-screen-resources) | Relocates "Translate text"/"Restore removed comments" into the existing "View tweaks" category and "Paint users"/"Tag users" into the existing "Highlighting" category on the Comments settings screen, then removes everything else on the Sync Ultra screen, including its entry point in the root settings menu. This patch only edits XML — see "Remove Sync Ultra screen" for the matching bytecode fix this resource change requires to avoid a crash. |  |
| [Remove Ultra cloud backup](#remove-ultra-cloud-backup) | Removes the redundant, Firebase-backend-dependent "Cloud backup and restore" section from Sync for Reddit's Backup settings screen. This is the bytecode fix "Remove Ultra cloud backup (resources)" needs to avoid a crash — select that patch too (or select this one, which pulls it in automatically). |  |
| [Remove Ultra cloud backup (resources)](#remove-ultra-cloud-backup-resources) | Removes the redundant, Firebase-backend-dependent "Cloud backup and restore" section from Sync for Reddit's Backup settings screen. This patch only edits XML — see "Remove Ultra cloud backup" for the matching bytecode fix this resource change requires to avoid a crash. |  |
| [Remove Website previews](#remove-website-previews) | Removes the "Website previews" toggle from Sync for Reddit's Sync Ultra screen and disables the underlying feature. This is the bytecode fix "Remove Website previews (resources)" needs to avoid a crash — select that patch too (or select this one, which pulls it in automatically). |  |
| [Remove Website previews (resources)](#remove-website-previews-resources) | Removes the "Website previews" toggle from Sync for Reddit's Sync Ultra screen and disables the underlying feature. This patch only edits XML — see "Remove Website previews" for the matching bytecode fix this resource change requires to avoid a crash. |  |
| [Remove ads](#remove-ads) | Permanently disables ads in Sync for Reddit. |  |
| [Remove telemetry](#remove-telemetry) | Disables Crashlytics crash reporting, Firebase Analytics collection, and a device/account registration call to Google's servers in Sync for Reddit. Depends on "Remove telemetry (resources)" for the Analytics half — that patch is also safe to use alone if you only want the Analytics flag disabled. |  |
| [Remove telemetry (resources)](#remove-telemetry-resources) | Disables Firebase Analytics data collection in Sync for Reddit. Unlike most "(resources)"-suffixed patches in this project, this one is safe to use on its own — see "Remove telemetry" for the broader bytecode patch that also disables Crashlytics and a device/account registration call, and depends on this one rather than the other way around. |  |
| [Unlock Sync Ultra](#unlock-sync-ultra) | Permanently unlocks Sync Ultra locally, without depending on the abandoned app's validation servers. Also stops the paint/tag cloud-sync jobs, since they'd otherwise keep making network calls to a backend that may no longer respond. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

AfterSync patches are licensed under the [GNU General Public License v3.0](LICENSE)
