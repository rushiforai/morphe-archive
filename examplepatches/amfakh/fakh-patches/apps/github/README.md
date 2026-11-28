# GitHub

Patches for the GitHub app (`com.github.android`, version `1.285.0`, APKM from APKMirror).

## Patches

Enabled by default.

Settings gets a **Patches** card with a **Fakh Patches** row. It opens the patches in groups
(Appearance, Navigation bar, Titles and lists, Repositories, Profiles, Comments and markdown, Code, Files
and downloads), with a switch or a setting for each patch in the bundle. Titles and lists, Repositories,
Comments and markdown and Files and downloads have headers within. **Disable analytics** has no switch,
because it changes the app's manifest. Every switch starts on, except **Pitch black**,
**Hide navigation bar labels** and **Background blur**.

With **Override tab width**, **Show whitespace marks**, **Hide + and - diff signs** or **Linkify code** applied,
GitHub's **Code options** settings screen also lists those switches under **Fakh Patches**, with a tab width slider
while **Override tab width** is on (off means the app's 8, and on again brings back the last width and scrolls to the slider). Its preview stays
at the bottom of the screen and shows code as the switches set it.

| Category | Patch | What it does |
|---|---|---|
| Theme | Material You | Colors the app from your wallpaper (Android 12+): the accent color instead of GitHub blue, and tinted surfaces, cards and borders in light and dark mode. |
| Theme | Pitch black | Makes the backgrounds black in dark mode on Android 12 and newer, with or without Material You. |
| Feature | Navigation bar tabs | Lets you choose which tabs the navigation bar shows and in what order (drag ≡ in the sheet). Adds **Repositories** and **Stars** tabs, hidden until you pick them, that open your repositories and your starred repositories. |
| Feature | Hide navigation bar labels | Removes the text under the icons of the navigation bar. |
| Theme | Liquid Glass navigation bar | Draws the navigation bar (the side bar in landscape) as a floating, translucent capsule with a sliding selection pill. Slide a finger along the bar to switch tabs, with a haptic tick for each tab. **Background blur** blurs what's behind the bar and bends it at the edges on Android 12 and newer. The pill takes the wallpaper accent with Material You and stays neutral gray without it. |
| Privacy | Disable analytics | Turns off GitHub's own analytics, telemetry and health metrics (the **Analytics** and **Crash reporting** switches under Privacy and analytics stay off), and Firebase Analytics, Crashlytics, Performance and Sessions. Push notifications keep working. |
| Feature | Landscape navigation bar position | Moves the landscape navigation bar to the left or right edge. |
| Feature | Smaller navigation bar | Shrinks the navigation bar height, the space between icon and label, and the label text size. |
| Feature | Download assets natively | Downloads a release asset straight with Android's download manager when you tap **Download** in its menu, instead of opening the browser. Files go to the **Download location** folder (default `GitHub` in Downloads). If the download cannot start, it falls back to the browser. |
| Feature | Add download menu to every file | Adds **Download** to the **⋮** menu of an open file, which saves it with Android's download manager in the **Download location** folder. Files up to 100 MB. |
| Feature | Add Preview menu to HTML files | Adds **Preview** to the **⋮** menu of an `.html` file, which shows the page with the repository's styles and images, private repositories included. Scripts stay off until you tap **Run scripts** and confirm, because they could read other files of the repository and send them elsewhere. With scripts on, what a page saves in the browser's storage is kept, apart for each repository. |
| Feature | Linkify code | Addresses and `owner/repo#123` in files, diffs and code blocks are underlined and open when tapped, GitHub's own in the app. A bare `#123` stays text. |
| Feature | Sort by Recently updated first | Issue and pull request lists open sorted by **Recently updated** instead of **Newest**, lists you opened before the patch included. Another sort you pick lasts until you leave the list. |
| Feature | Override tab width | Tabs in files, diffs and the code blocks of READMEs, issues, pull requests and comments are 2, 4 (default) or 8 spaces wide. The patch option sets the default width, and the **Override tab width** switch or **Code options** changes it without a restart, in what you open afterwards. The app uses 8. |
| Feature | Fold long code blocks | Code blocks longer than 25 lines show their first 20 lines and a **Show all N lines** button that opens the block in place. |
| Feature | Shorten GitHub links | A pasted GitHub link whose text is its own address reads as a short reference: `owner/repo#123`, `owner/repo#5 (comment)`, `owner/repo@0123456`, `owner/repo/path@main`, `owner/repo@v1.2`, `@user`. Other links drop `https://` and `www.`. Links with their own text stay as written, and every link still opens the same page. |
| Feature | Show avatar before each @mention | A small avatar shows before each **@mention** in READMEs, issue and pull request descriptions and comments. The avatars are loaded from GitHub. |
| Feature | Show labels in the header | Shows the labels of an issue or pull request under its title, in a row you can swipe sideways, without opening the info sheet. |
| Feature | Show exact time | Shows dates and times instead of ages such as **20d**, in lists, issues, pull requests, comments and notifications. Where there is little room it shows the time for today and the date otherwise. |
| Feature | Show whitespace marks | Spaces in files and diffs show as dim dots and tabs as dim » marks. The column that a diff keeps for **+** and **-** stays unmarked. Copied lines stay as they are. |
| Feature | Show repository age | Shows when a repository was created under its stars and forks: the date with **Show exact time**, otherwise how long ago. |
| Feature | Show download count for assets | Shows how many times each file of a release was downloaded, with a download icon next to its size. |
| Feature | Show tags on commits | A commit with a tag shows the tag's name under its author in commit lists. Only the 100 tags with the newest commits are read. |
| Feature | Show base branch in pull requests | In pull request lists, a pull request into another branch than the repository's default shows that branch. |
| Feature | Pin important branches | The branch picker lists `develop`, `main`, `master` and `staging` right after the default branch. The rest stays alphabetical, and so do search results. |
| Feature | Pin recent branches | The branch picker lists the most recently pushed branches near the top, after any pinned ones, with how long ago. You pick how many: **Off**, 3, 5 (default), 10 or 15. They come from the repository's latest 100 pushes, merges and branch changes. |
| Feature | Show if a profile follows you | A **Follows you** row shows on the profile of someone who follows you. |
| Feature | Linkify user location | The location on a profile opens in Google Maps, or the app you use for its links, when tapped. |
| Feature | Home header text | The Home header shows your username instead of **Home**. You can pick your username (default), your name or **Home**. |
| Feature | Hide + and - diff signs | The **+** and **-** at the start of diff lines are hidden, and the code stays aligned. |
| Feature | Collapse bot and agent comments | Comments by bots and agents such as Copilot start collapsed behind **Show bot comment**; tap it to read one. Descriptions of issues and pull requests stay open. |
| Feature | Preview hidden comments | A hidden comment of an issue, pull request or review shows its first line under the reason it is hidden. Discussions stay as they are. |
| Feature | Add collapsible section | The markdown toolbars get a button that puts a collapsible `<details>` section around the selected text. Android 10 and later. |
| Feature | Add table | The markdown toolbars get a button that inserts a markdown table template around the selected text. Android 10 and later. |
| Feature | Hide Copilot disclaimer | Removes **Copilot is powered by AI, so mistakes are possible** from under Copilot's comments. |
| Feature | Hide low-quality comments | Hides issue and pull request comments that only say **+1**, **me too** or ask for news. A line at the start of the timeline says how many are hidden. Comments by owners, members, collaborators and contributors always show. |
| Feature | Dim bots and agents | Commits, issues and pull requests by bots are faded in their lists, and so are bots' events in a timeline, such as **referenced this**. Copilot and other coding agents count as bots. |
| Feature | Conventional commits | In commit lists, the inbox, the activity list on Home, and the lists and pages of issues and pull requests, a title such as `feat(auth): add login` shows a **Feature** label, a gray `auth:` and the rest of the title. Ticket keys such as `[ABC-12]` or `abc-12:` may come first and stay in front of the label. |
| Feature | Draw Mermaid diagrams | Mermaid code blocks in READMEs, issues, pull requests and comments show as diagrams, drawn by a copy of Mermaid inside the app. Tap one to open it full screen, where you can zoom and drag it. |
| Feature | Icon-only floating buttons | The floating **Comment**, **New session**, **Finish your review**, **Re-run**, **Cancel workflow**, **Fix with Copilot** and **Commit changes** buttons show without their text, so they cover less of the screen. Screen readers still read the label. |
| Feature | Icon-only Add to list button | The **Add to list** button of a repository shows only its icon, as small as the buttons beside it, also when it would name the lists the repository is in. Screen readers still read the label. |

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
