# 🧩 Custom Morphe Patches

Add-on YouTube patches for use with [Morphe](https://morphe.software):

- **Keyboard speed shortcuts**: the `-` and `=` keys of a hardware keyboard decrease and increase
  the playback speed, like `<` and `>` on the YouTube website.
- **Keyboard comments shortcut**: the `M` key shows and hides the comments of the video.
- **Keyboard fullscreen shortcut**: the `F` key enters and exits fullscreen.
- **Keyboard minimize shortcut**: the `Esc` key minimizes the video to the miniplayer.
- **DeArrow original titles**: videos with a DeArrow title show both the DeArrow title and the
  original title, such as `Clear, descriptive title | YOU WON'T BELIEVE WHAT HAPPENED`.

This bundle is an add-on. Its patches work through the official Morphe YouTube patches, so
apply it **together with** the official "Morphe Patches" source, never on its own.

### How to use these patches

1. Add this source to Morphe Manager: https://morphe.software/add-source?github=Prisoner-24601/custom-morphe-patches
2. Patch YouTube in **Expert mode**, which gives each source its own tab. Keep your usual
   selection in the Morphe Patches tab and enable the patches you want in this one.
3. Confirm the "Multiple patch sources selected" warning.

### Keyboard speed shortcuts

- `-` / numpad `-` lowers the speed, `=` / `+` / numpad `+` raises it, holding a key repeats.
- Each press moves to the next multiple of the step (default 0.25x, so 1.1x goes to 1.25x
  or 1.0x), between 0.25x and 8x. A toast shows the new speed.
- Only while a video is open. Text fields (search, comments) and Ctrl/Alt/Meta combinations
  are left alone.
- The step is the **Speed step** patch option: 0.05x, 0.10x, 0.25x or 0.50x.

### Keyboard comments, fullscreen and minimize shortcuts

- `M` shows the comments panel of the open video, and closes it when it is open.
  `F` enters fullscreen, and exits it in fullscreen.
  `Esc` minimizes the video to the miniplayer, also from fullscreen or with the comments open.
- The key of each is its **Key** patch option: a single letter or digit, `Esc`, `Backspace` or `Tab`.
- Like the speed keys, they only work while a video is open, and not while typing or with Ctrl/Alt/Meta.
  Without an open video, `Esc` keeps its usual action of going back.
- The comments shortcut uses the command router of Morphe Patches 2.2 or newer.
  The fullscreen shortcut uses Morphe's fullscreen controller when **Exit fullscreen mode**,
  **Open videos fullscreen** or **Open Shorts in regular player** is applied, and otherwise
  taps the fullscreen button of the player.

### DeArrow original titles

- Needs the **DeArrow** patch of the Morphe Patches source, and DeArrow titles turned on in
  Settings → Morphe → DeArrow of the patched app, for the places you want them.
- Only videos with a DeArrow title change. Other videos show their title as before.
- The original title is the title as set by the uploader, also when YouTube shows an auto-translated title.
- If both titles are the same apart from capitalization or spacing, the title is shown once.
- If the original title cannot be fetched, only the DeArrow title is shown until it is fetched again.
- The DeArrow icon (if enabled in the Morphe settings) is shown before the combined title.
- Casual mode of DeArrow still works: when it keeps the original title, only the original title is shown.
- Which title is shown first is the **Title order** patch option: DeArrow title first (default)
  or original title first.
- The text between the titles is the **Separator** patch option: ` | `, ` — `, ` • ` or a new line.
- How it works: after all patches are executed, it changes the DeArrow code of the Morphe YouTube
  patches, so the original title is always fetched for videos with a DeArrow title
  (`DeArrowTitle.needsOriginalTitle`) and is combined with the DeArrow title (`DeArrowTitle.titleFor`).

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.4.0](https://github.com/Prisoner-24601/custom-morphe-patches/releases/tag/v1.4.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [DeArrow original titles](#dearrow-original-titles) | Shows both the DeArrow title and the original title, instead of only the DeArrow title. Apply together with the Morphe YouTube patches, and turn on DeArrow titles in the Morphe settings. | • Separator<br>• Title order |
| [Keyboard comments shortcut](#keyboard-comments-shortcut) | Makes a key of a hardware keyboard (M by default) show and hide the comments of the video. Apply together with the Morphe YouTube patches 2.2 or newer, which this patch uses to show the comments. | • Key |
| [Keyboard fullscreen shortcut](#keyboard-fullscreen-shortcut) | Makes a key of a hardware keyboard (F by default) enter and exit fullscreen while a video is open. | • Key |
| [Keyboard minimize shortcut](#keyboard-minimize-shortcut) | Makes a key of a hardware keyboard (Esc by default) minimize the open video to the miniplayer, also from fullscreen or with the comments open. | • Key |
| [Keyboard speed shortcuts](#keyboard-speed-shortcuts) | Makes the - and = keys of a hardware keyboard decrease and increase the playback speed. Apply together with the Morphe YouTube patches, which this patch uses to change the speed. | • Speed step |

</details>

<!-- PATCHES_END -->

## 🧑‍💻 Development

- Commit to `main`: each push with a release-worthy commit publishes a stable release.
- Use semantic commit messages: `feat:` and `fix:` create releases, `chore:` does not.
- Do not edit the generated `patches-list.json`, `patches-bundle.json` or `CHANGELOG.md` by hand.

### 🛠️ Building locally

- Building needs a GitHub token with the `read:packages` scope, see
  [the patcher setup docs](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md#-prepare-the-environment).
- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`

## 📜 License

These patches are licensed under the [GNU General Public License v3.0](LICENSE).
They are not made or endorsed by the Morphe project.
