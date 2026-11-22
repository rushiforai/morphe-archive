# Reddit User Insights

A Morphe patch for the Reddit app:

- Shows each user's 3 most active subreddits right after their name in comments, with loading dots while they load.
- Shows the posts and comments of users who hide their profile, right inside their profile.
- Adds a User Insights entry to Reddit's settings.

Data comes from the public [Arctic Shift](https://arctic-shift.photon-reddit.com) archive, so some activity may be missing or a few hours old.

## Install

1. In Morphe Manager, add this source:
   `https://morphe.software/add-source?github=DrTron1c/reddit-user-insights`
2. Patch Reddit with the **User insights** patches turned on (Expert mode lets you mix them with the Morphe patches).
3. Open Reddit and turn on **Reddit User Insights** in Accessibility settings. This is only needed once. If the switch is greyed out: App info → ⋮ → Allow restricted settings.

## Use

- Tap a badge to see that user's posts in that subreddit.
- Tap **Full history** on any profile to see everything they posted.
- Settings: Reddit Settings → **User Insights**, long-press a badge, or the **User Insights** app icon.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.4.1](https://github.com/DrTron1c/reddit-user-insights/releases/tag/v1.4.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Reddit&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.reddit.frontpage`

**🎯 Supported versions:**

| 2026.46.0 | 2026.45.0 | 2026.44.0 | 2026.40.0 |
| :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [User insights](#user-insights) | Shows each user's top 3 subreddits next to their name and unhides hidden profiles. |  |
| [User insights pills in comments](#user-insights-pills-in-comments) | Draws the top subreddits inside the comment header, right after the name. |  |
| [User insights settings entry](#user-insights-settings-entry) | Adds User Insights to Reddit's settings, above the Morphe entry. Reddit 2026.30.0 or newer. |  |

</details>

<!-- PATCHES_END -->

## Updates

A daily check patches the newest Reddit. If everything applies, the new version is added and released automatically; if not, an issue is opened.

## Credits

[Morphe patches template](https://github.com/MorpheApp/morphe-patches-template) · [Arctic Shift](https://github.com/ArthurHeitmann/arctic_shift) · GPLv3
