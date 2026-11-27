# GitHub

Patches for the GitHub app (`com.github.android`, version `1.285.0`, APKM from APKMirror).

## Patches

Enabled by default.

Settings gets a **Patches** card with a **Fakh Patches** row. It opens the patches in groups
(Appearance, Navigation bar, Titles and lists, Comments and markdown, Code and files, Releases and
downloads), with a switch or a setting for each patch in the bundle. **Disable analytics** has no
switch, because it changes the app's manifest.

| Category | Patch | What it does |
|---|---|---|
| Theme | Material You | Colors the app from your wallpaper (Android 12+): the accent color instead of GitHub blue, and tinted surfaces, cards and borders in light and dark mode. Adds a **Material You** switch and a **Pitch black** switch in Fakh Patches. |
| Feature | Navigation bar | Adds a **Navigation bar tabs** setting in Fakh Patches that chooses which tabs the navigation bar shows and in what order (drag ≡ in the sheet). Adds **Repositories** and **Stars** tabs, off by default, that open your repositories and your starred repositories. |
| Feature | Hide tab labels | Adds a **Hide tab labels** setting in Fakh Patches that removes the text under the icons of the navigation bar. |
| Theme | Glass navigation bar | Draws the navigation bar (the side bar in landscape) as a floating, translucent capsule with a sliding selection pill. On by default; the **Liquid Glass navigation bar** switch in Fakh Patches turns it off. Slide a finger along the bar to switch tabs, with a haptic tick for each tab. The **Background blur** switch (off by default) blurs what's behind the bar and bends it at the edges on Android 12 and newer. The pill takes the wallpaper accent with Material You and stays neutral gray without it. |
| Privacy | Disable analytics | Turns off GitHub's own analytics, telemetry and health metrics (the **Analytics** and **Crash reporting** switches under Privacy and analytics stay off), and Firebase Analytics, Crashlytics, Performance and Sessions. Push notifications keep working. |
| Feature | Landscape navigation bar position | Adds a **Landscape navigation bar position** setting in Fakh Patches that moves the landscape navigation bar to the left or right edge. |
| Feature | Smaller navigation bar | Adds a **Smaller navigation bar** switch in Fakh Patches that shrinks the navigation bar height, the space between icon and label, and the label text size. |
| Feature | Download assets | Downloads a release asset straight with Android's download manager when you tap **Download** in its menu, instead of opening the browser. Adds a **Download location** setting in Fakh Patches (default folder `GitHub` in Downloads). If the download cannot start, it falls back to the browser. |
| Feature | Recently updated first | Issue and pull request lists open sorted by **Recently updated** instead of **Newest**, lists you opened before the patch included. Another sort you pick lasts until you leave the list. |
| Feature | Tab width | Tabs in code blocks of READMEs, issues, pull requests and comments are 2, 4 (default) or 8 spaces wide. The patch option sets the default, and **Tab width** in Fakh Patches changes it in the app. The app uses 8. |
| Feature | Collapse long code blocks | Code blocks longer than 25 lines show their first 20 lines and a **Show all N lines** button that opens the block in place. |
| Feature | Shorten links | A pasted GitHub link whose text is its own address reads as a short reference: `owner/repo#123`, `owner/repo#5 (comment)`, `owner/repo@0123456`, `owner/repo/path@main`, `owner/repo@v1.2`, `@user`. Other links drop `https://` and `www.`. Links with their own text stay as written, and every link still opens the same page. |
| Feature | Mention avatars | A small avatar shows before each **@mention** in READMEs, issue and pull request descriptions and comments. The avatars are loaded from GitHub. |
| Feature | Labels in the header | Shows the labels of an issue or pull request under its title, in a row you can swipe sideways, without opening the info sheet. |
| Feature | Show exact time | Shows dates and times instead of ages such as **20d**, in lists, issues, pull requests, comments and notifications. Where there is little room it shows the time for today and the date otherwise. |
| Feature | Show whitespace | Spaces in files and diffs show as dim dots and tabs as dim » marks. Copied lines stay as they are. |
| Feature | Repository age | Shows when a repository was created under its stars and forks: the date with **Show exact time**, otherwise how long ago. |
| Feature | Release download count | Shows how many times each file of a release was downloaded, next to its size. |
| Feature | Collapse bot comments | Comments by bots and agents such as Copilot start collapsed behind **Show bot comment**; tap it to read one. Descriptions of issues and pull requests stay open. |
| Feature | Hide low-quality comments | Hides issue and pull request comments that only say **+1**, **me too** or ask for news. A line at the start of the timeline says how many are hidden. Comments by owners, members, collaborators and contributors always show. |
| Feature | Dim bots | Commits, issues and pull requests by bots are faded in their lists. Copilot's commits stay as they are. |
| Feature | Conventional commits | In commit lists, the inbox, the activity list on Home, and the lists and pages of issues and pull requests, a title such as `feat(auth): add login` shows a **Feature** label, a gray `auth:` and the rest of the title. Ticket keys such as `[ABC-12]` or `abc-12:` may come first and stay in front of the label. |
| Feature | Mermaid diagrams | Mermaid code blocks in READMEs, issues, pull requests and comments show as diagrams, drawn by a copy of Mermaid inside the app. Tap one to open it full screen, where you can zoom and drag it. |
| Feature | Icon-only floating buttons | The floating **Comment**, **New session**, **Finish your review**, **Re-run**, **Cancel workflow**, **Fix with Copilot** and **Commit changes** buttons show without their text, so they cover less of the screen. Screen readers still read the label. |

The app draws its screens with both Views and Jetpack Compose, so the patch recolors both: resource
colors for the Views, and the Compose palettes and schemes when the app starts. Markdown and README
bodies are drawn by a WebView with GitHub's own CSS, where only the links take the accent. Semantic
colors (red, green, yellow, purple, the diff lines) stay as they are, so a changed line is still easy
to spot.

The switches are saved in the app's own settings. **Pitch black** applies right away and only
affects dark mode. Any other change shows a Restart bar, which stays on every Settings screen until
the app restarts. A list already saved as **Recently updated** keeps that sort after its switch is
turned off.

Install over the app you already have only if it was patched by the same Morphe Manager keystore;
otherwise Android asks you to uninstall first.

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-1.19.1-all.jar patch -p patches/build/libs/patches-<version>.mpp -o github-patched.apk com.github.android_1.285.0-956_4arch_6dpi_apkmirror.com.apkm
```

## Getting the APK

Download the `1.285.0` APKM from APKMirror. Morphe Manager looks the app up on APKMirror itself,
so it can take you to that page.
