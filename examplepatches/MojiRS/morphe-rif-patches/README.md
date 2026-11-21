# morphe-rif-patches

[Morphe](https://morphe.software) patch bundle for **rif is fun for Reddit** 5.6.22: both the free app (`com.andrewshu.android.reddit`) and **rif is fun golden platinum** (`com.andrewshu.android.redditdonation`).

This bundle contains many small, independently-toggleable patches. Options for each patch are under **Settings → rif patches** in the patched app.

This is a port of my rif patches for ReVanced, which are available [here](https://github.com/MojiRS/revanced-rif-patches).

## Patches

| Patch                             | Description                                                                                                                                    |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| **Inline comment images**         | Shows images, GIFs and videos linked in comments and text posts inline.                                                                        |
| **Fix comment video links**       | Makes videos posted in comments play in rif's video player instead of failing to load.                                                         |
| **Fix YouTube videos**            | Fixes the built-in YouTube player.                                                                                                             |
| **YouTube player controls**       | Double-tap to seek, hold for 2x speed, and speed and captions controls in the YouTube player.                                                  |
| **Fix share links**               | Opens Reddit share links (reddit.com/r/…/s/…) directly in rif instead of bouncing through the browser, and fixes reddit.com/media image links. |
| **Repair broken gallery images**  | Shows galleries that still fail to load because some of their images can’t be found (e.g. deleted), by leaving those images out.               |
| **Keep reply box above keyboard** | Keeps the reply box unobscured above the keyboard.                                                                                             |
| **Fix broken markdown links**     | Shows links like `[name](u/name)` as links instead of raw text.                                                                                |
| **Hide blocked mod comments**     | Adds a setting to hide mod comments from blocked users. Off by default.                                                                        |
| **Reddit image hosting**          | Allows uploading media in posts and comments directly to Reddit for hosting. Replaces rif's broken imgur hosting.                              |
| **Fix history import**            | Makes "Import settings" restore the history from backups made with "Export settings and history".                                              |
| **Post to profile**               | Adds ways to post to your profile: a My Profile button on the submit page and Submit in your profile's menu.                                   |
| **Explain Reddit blocks**         | Shows "Reddit is temporarily blocking requests" instead of "Error: forbidden" when Reddit blocks a feed.                                       |
| **Fix random subreddit**          | Makes Random open a random subreddit again, picked by the redditrand.com API.                                                                  |

For details on how each patch works and its settings, see [PATCHES.md](https://github.com/MojiRS/morphe-rif-patches/blob/main/PATCHES.md).

## Use with Morphe Manager

1. Add **Patcheddit** as a patch source in Morphe Manager by clicking [this link](https://morphe.software/add-source?github=wchill/patcheddit). Patcheddit is required alongside these patches to restore rif's basic functionality.

2. Add **rif patches** as a patch source by clicking [this link](https://morphe.software/add-source?github=MojiRS/morphe-rif-patches). Alternatively, go to **Sources → (+)** and add the following Source URL:

   ```
   https://raw.githubusercontent.com/MojiRS/morphe-rif-patches/main/patches-bundle.json
   ```

3. Go to **Settings** and enable **Expert mode**. This is required to patch with multiple bundles at once.

4. Go to **Apps** and select **rif is fun** (free or platinum) to patch. After selecting the APK, in the top bar when choosing patches, ‼️make sure the patches from both **rif patches** and **Patcheddit** are selected.‼️

5. Install the patched app, open rif, and log in.

## FAQ

**Trying to load anything gives an `error: forbidden` popup message**

<dl><dd>
   
Make sure you're logged in and have installed [Patcheddit](https://github.com/wchill/patcheddit) alongside this bundle (see instructions above). Use the default RedReader client ID; custom IDs no longer work. Reddit blocks all content for logged out users.

</dd> </dl>

**I keep getting a "Reddit is temporarily blocking requests" error when trying to load content**

<dl><dd>

Reddit network security occasionally decides to block requests from rif. It should fix itself after a few minutes. See [revanced-rif-patches #7](https://github.com/MojiRS/revanced-rif-patches/issues/7) for more details.

</dd></dl>

**Trying to view NSFW content gives a "go to reddit to view mature content" popup**

<dl><dd>

Reddit sometimes blocks NSFW content on 3rd party apps unless you're the mod of a NSFW subreddit. The easiest fix is to create your own private subreddit and mark it NSFW.

</dd></dl>

## Building from source

Requires JDK 17 or newer, the Android SDK and a GitHub token with `read:packages` scope (Morphe publishes its Gradle plugin and patcher to GitHub Packages). Put credentials in `~/.gradle/gradle.properties`:

```properties
gpr.user=<github-username>
gpr.key=<token>
```

Then:

```bash
./gradlew :patches:buildAndroid
# output: patches/build/libs/patches-<version>.mpp
```

The patch code is shared with the ReVanced bundle; this repository is generated from it.

## License

GNU General Public License v3.0, see [LICENSE](LICENSE).
