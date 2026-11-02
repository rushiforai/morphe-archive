# BaconReader.E2E: end-to-end tests of the patched BaconReader

Scenarios that patch BaconReader Premium 6.1.4 with this bundle, install it on an Android phone and drive it with
Appium, each one the Gherkin of an acceptance criterion
([docs/given-when-then-test-rules.md](../../docs/given-when-then-test-rules.md)), recorded as a GIF and an MP4 so a PR
shows its patch working. **How to write one: [E2E-TEST-CODE-RULES.md](E2E-TEST-CODE-RULES.md)** (binding for this
project).

It is destiny-loopsmith's
[Loopsmith.Web.E2E](https://github.com/JoanComasFdz/destiny-loopsmith/tree/main/tests/Loopsmith.Web.E2E) for Android:
Appium (UiAutomator2) instead of Playwright, and a phone instead of a locally
served site.

## The phone

The scenarios need an Android phone reachable over adb (a Pixel 6 Pro on Android 17, on the device host's USB), an
Appium 3.8 server with the UiAutomator2 driver 8.7
that drives it over adb, and BaconReader Premium 6.1.4's clean APK. In an AndroidDev cloud session, the session-start
hook (`.claude/hooks/session-start.sh`) installs Appium, and sourcing `tools/e2e/connect.sh` in the shell that then runs
the scenarios joins the phone, starts Appium in the session and exports what they read
([patcher-specific-build.md](../../patcher-specific-build.md), "Cloud sessions"):

| Variable | Default | |
|---|---|---|
| `E2E_APPIUM_URL` | unset | the Appium server; without it, every scenario skips |
| `E2E_ADB_SERIAL` | `127.0.0.1:15555` | the phone for adb (installs, data, recording) |
| `E2E_APPIUM_UDID` | `E2E_ADB_SERIAL` | the phone as the Appium server sees it (its adb serial, when Appium runs next to the tests) |
| `E2E_ARTIFACTS_DIR` | unset | the folder holding `com.onelouder.baconreader.premium-6.1.4-clean-base-*.apk` |
| `E2E_BASE_APK` | that APK | the APK to patch, if it's elsewhere |
| `E2E_BUNDLE` | the newest `patches/build/libs/patches-*.mpp` | the bundle to patch with (`./gradlew buildAndroid`) |
| `E2E_TEST_BUNDLE` | the newest `e2e-patches/build/libs/e2e-patches-*.mpp` | the test-only bundle (`./gradlew buildAndroid`) |
| `E2E_FAKE_REDDIT_URL` | `http://127.0.0.1:5080` | the fake Reddit, as the phone reaches it: "E2E fake Reddit"'s `baseUrl`; the fake listens on its port here |
| `E2E_MORPHE_DESKTOP` | `/opt/patch-tools/morphe-desktop.jar` | Morphe Desktop, the patcher (`tools/morphe-desktop.sh` installs it), run with `java -jar` (JDK 21) |
| `E2E_VIDEO_DIR` | unset | record each run there (`record.sh` sets it) |
| `E2E_ACTION_GAP` | `0.4` | least seconds between two recorded steps |
| `E2E_APPIUM_INSTALL_HELPERS` | unset | `1`: let Appium install its helper apps (a phone just reset) |

Appium's helper apps (`io.appium.uiautomator2.server`, `.server.test`, `io.appium.settings`) stay installed on the
phone, so a session starts without reinstalling them; a reset phone needs one run with
`E2E_APPIUM_INSTALL_HELPERS=1` (the connection script sets it when they're missing).

## What a scenario does

For each scenario, `BaseE2E`:

1. starts the fake Reddit, on the run's first scenario, and empties it, with the test account made again ("The fake
   Reddit" below);
2. patches the clean APK with both bundles, the released one and the test-only one, once per set of patches and
   bundles (`build/e2e/patched/`), enabling a Startup scenario's `[PatchedWith]` patches, or for a LoggedIn scenario
   (`[PatchedWithEveryPatch]`) every patch the bundle lists, one APK for all of them ("Where tests go"), and the one
   every scenario gets, "E2E fake Reddit" and "E2E inbox envelope label" (`morphe-desktop patch --exclusive --enable …`, each after its own
   `--patches`);
3. installs it, unless it is the APK already installed, with its permissions granted; every APK is signed with the one
   key Morphe Desktop keeps next to its jar (`morphe.keystore`), and an app signed with another key is uninstalled first;
4. points the phone at the fake Reddit (`adb reverse`);
5. clears the app's data, so the scenario starts from a fresh install, and denies its notifications, so Android doesn't
   ask ("Allow BaconReader Premium to send you notifications?" shows at a different moment on each device); unselects
   every link on Android's "Open by default" screen, which clearing the data keeps ("Prompt to open Reddit links" asks
   only while no Reddit link is selected); and empties Downloads/BaconReader, where a long press saves an image ("Embed
   comment images");
6. starts recording the screen, when the run records;
7. after the scenario, fails it if the app made a request the fake Reddit doesn't answer.

The scenario's Given then makes its Reddit data (`Reddit.HasAPost("Weekly thread", "e2e")`), and it opens the app itself: `Phone.Launcher.OpenBaconReaderAsync()` and the first-start dialogs
(`FINAL RELEASE ANNOUNCEMENT!` → "GOT IT :(", unless "Disable final release announcement" is patched in, and with
"Prompt to open Reddit links", "Open Reddit links with BaconReader?" → "Not now" or "Set up"), or
`Phone.BaconReader.OpenAsync()`, which does all of it: with every patch, only the links prompt shows. Then it taps and
checks what its patch changes.

A scenario replaces the installed BaconReader with its own test-signed build and clears its data: whatever was
installed and logged in on the phone doesn't survive a run.

Measured on 2026-10-30 from a cloud session (~1–3 Mbit/s to the phone): sending a new APK ~1 minute; BaconReader's
first screen 4–11 s after it opens; the seven phone scenarios ~23 minutes recorded, at ~30 frames a second.

Measured on 2026-10-31 on the Pixel 6 Pro, in the Reseam repo, whose test code is this one, 4 runs of every scenario (3
unrecorded, 13–15 minutes each, and 1 recorded, 21 minutes): the longest wait was 15.9 s (an image under a comment
loading), then 13.4 s (a 10 s video playing to its end); every other wait took 4.2 s or less. Each wait is about twice
the longest seen, and at least 10 s. Of the retries the emulator needed, only `Waiting`'s read again of a view gone stale
fired (once); the others are gone. A run writes each wait's time to the scenario's output in the .trx
(`out/.results/`), and each retry that fires to its console too (`RunLog`), so the next measurement needs no code.

Measured on 2026-10-31 on the Pixel 6 Pro, in the Reseam repo, one unrecorded run of the seven phone scenarios before
and after the Startup and LoggedIn groups ("Where tests go"): 14 m 53 s with 4 APKs sent to the phone, then 12 m 07 s
with 2 (~1 minute each). A run writes each install to its console (`RunLog`, "installed: …").

## The fake Reddit

The scenarios never talk to Reddit (automation detection, throttled logins, content that changes): each makes exactly
the Reddit data it needs on a fake Reddit, [BaconReader.FakeReddit](../BaconReader.FakeReddit/README.md), which runs in
the test process.

- **The patch.** "E2E fake Reddit" is a test-only patch, in a bundle of its own that is never released
  (`./gradlew buildAndroid` builds it into `e2e-patches/build/libs/e2e-patches-<version>.mpp`;
  [patcher-specific-build.md](../../patcher-specific-build.md), "The e2e bundle"). It points BaconReader at the fake
  instead of Reddit: every full URL of a Reddit host in the app and its extensions, in code and in static fields, moves
  to it, paths kept:

  | Prefix | Becomes |
  |---|---|
  | `https://www.reddit.com`, `https://oauth.reddit.com`, `https://api.reddit.com`, `https://ssl.reddit.com`, `https://reddit.com`, `https://m.reddit.com`, `http://www.reddit.com`, `http://reddit.com` | `<baseUrl>` |
  | `https://i.redd.it/`, `https://preview.redd.it/`, `https://v.redd.it/` | `<baseUrl>/_media/i.redd.it/`, `<baseUrl>/_media/preview.redd.it/`, `<baseUrl>/_media/v.redd.it/` |
  | `https://cf-baconreader.onelouder.com/` | `<baseUrl>/_onelouder/` |

  Bare domains (`reddit.com`, `v.redd.it`, `amp.reddit.com`…) stay: BaconReader recognizes Reddit links in posts by
  them. Its option, `baseUrl` (default `http://127.0.0.1:5080`), is `E2E_FAKE_REDDIT_URL` (`--options baseUrl=…`
  after the test-only `--patches`).
- **Every scenario gets it.** BaseE2E adds "E2E fake Reddit" to every scenario's patches. A Given and `[PatchedWith]`
  never name it, only the patches under test (`ScenarioShapeTests` checks it).
- **The bundle's other patch.** "E2E inbox envelope label", which every scenario gets too: with unread messages, the
  main screen's left-menu button shows an orange envelope instead of the menu icon, two images UiAutomator can't tell
  apart, both "Navigate up". While the envelope shows, the patch makes the button's description "Navigate up, orange
  envelope" (`LeftMenu.ReadButtonAsync`).
- **The phone reaches it** through `adb reverse tcp:5080 tcp:5080` (the port of `E2E_FAKE_REDDIT_URL`), which BaseE2E
  adds afresh before each scenario: one still listed can forward nothing after adb reconnects. BaconReader's network security config already allows
  cleartext HTTP, to 127.0.0.1 too.
- **A scenario's Reddit.** BaseE2E empties the fake before each scenario and makes the test account, `e2e_user`
  (`TestAccount`); the scenario's Given makes the rest through `Reddit` (`Infrastructure/Reddit/`), in the Gherkin's
  words. A subreddit is a default subreddit, so the Front Page of an account without subscriptions shows its posts.
- **Logged out, Reddit refuses the app.** As Reddit does to BaconReader, even with "Spoof client", the fake answers a
  logged-out app's API requests with `HTTP 403 Blocked`; BaconReader then shows its "Greetings! … no longer
  operational" message instead of posts. A scenario that loads posts or comments logs in first ("Logging in").
- **Unanswered requests fail the scenario.** After each scenario, BaseE2E fails it if the app asked the fake for
  something it doesn't answer (it says 404 and logs it), listing each request: the fake lacks an endpoint, or the
  scenario's Given lacks data. `UnhandledRequests.Ignored` lists the few no scenario cares about, each with why.
- **Out of scope:** Reddit's chat (`chat.reddit.com`, `accounts.reddit.com`) and Snoomoji emotes
  (`www.redditstatic.com`) stay on Reddit.

## Run and record

In the shell that sourced the phone's connection script:

```bash
tools/e2e/record.sh --no-video SpoofClientTests            # while developing: unrecorded, unpaced
tools/e2e/record.sh --no-video --no-bundle LoggedIn        # a group or a domain folder (Startup/Account), reusing the last bundle
tools/e2e/record.sh --changed-since origin/dev            # right before the push: this branch's scenarios, recorded
tools/e2e/push-gifs.sh                                     # right after the push: posted on the branch's PR
```

`record.sh` builds the bundle (`--no-bundle` skips it), runs the chosen scenarios and, recording, writes
`out/<domain folder>/<gif name>.gif` and `.mp4` and `out/scenarios.json`
([tools/e2e/README.md](../../tools/e2e/README.md)); `push-gifs.sh` hands them to the "E2E videos" workflow, which posts
them on the PR ([docs/hosting.md](../../docs/hosting.md)). Without the phone, `dotnet test` skips every scenario and
runs only the shape and naming tests, and the fake Reddit's own tests (the "E2E CI" workflow does that).

By hand: `dotnet test tests/BaconReader.E2E` (add `E2E_VIDEO_DIR=<dir>` to keep the raw videos and their records).

## Exploring the app before writing a Gherkin

A Gherkin quotes the screen, never the patch's code ([given-when-then-test-rules.md](../../docs/given-when-then-test-rules.md),
"Before handing it over"). Many texts aren't in the APK as they show (errors built at run time, lines composed from Reddit's
data), and what UiAutomator sees of a view isn't in its code (a greyed-out menu entry whose title still reads as enabled).
The explorer, `Exploring/Explorer.cs`, lets you play a Gherkin step by step and read the screen at each one, instead of
running a whole scenario for each text you copy.

It sets the app up as a LoggedIn scenario does (every patch, the fake Reddit, logged in with the test account), with the
Reddit data a commands file makes, then runs the commands `tools/e2e/explore.sh` sends it, until `quit`. It isn't a
scenario: without `E2E_EXPLORE` it is skipped, `record.sh` never picks it (it isn't under `Scenarios/`), and
`ScenarioShapeTests` leaves it out.

In the shell that sourced the phone's connection script, with the bundles built (`record.sh` builds them):

```bash
tools/e2e/explore.sh start explore.txt > explore.log 2>&1 &   # sets the app up, then waits for commands
tools/e2e/explore.sh "tap id: toolbarTitle" "wait: 1" source  # waits until it's ready, then answers
tools/e2e/explore.sh quit
```

`start` runs `dotnet test` on the explorer alone, with `E2E_EXPLORE` naming the commands file; in a cloud session run it
in the background, as `record.sh`. Each other call sends its arguments, one command each, and prints the answers. The
explorer stops when the app does: source the connection script again before its 30-minute lease ends.

**The commands file** holds one command a line, `name: argument | argument`; blank lines and lines starting with `#` are
skipped. Its Reddit data runs before the app opens; its other commands once the app is logged in. Without a post, it
makes "Hello from r/e2e" in r/e2e: logging in waits for the Front Page's posts.

```text
post: e2e | Vote while loading
comment: Vote while loading | First comment
late comments: Vote while loading | 8
message: First subject | First message
fail posts: broken | 500 Internal Server Error
```

A text written on one line of the commands takes `\n` for a line break and `¦` for a `|`, which separates the
arguments: a Markdown table is `Scores\n\n¦ Player ¦ Score ¦\n¦---¦---¦\n¦ Ann ¦ 12 ¦`.

**Reddit data**, in the Gherkins' words (`Infrastructure/Reddit/`), from the file or sent later:

| Command | Makes |
|---|---|
| `post: <subreddit> \| <title>` | a text post |
| `post with text and image: <subreddit> \| <title> \| <text>` | a text post with an image under its text |
| `post with text: <subreddit> \| <title> \| <text>` | a text post whose text is that Markdown |
| `comment: <post title> \| <text>`, `comment with image`, `comment with gif`, `comment with image link`, `comment with video`, `comment with video link` | a comment on the post, and its media |
| `comment by: <post title> \| <author> \| <text>` | a comment by that user |
| `comment with table link: <post title> \| <text> \| <link>` | a comment with a table whose cell is a link to an image |
| `comment with spoiler link: <post title> \| <spoiler>` | a comment that is a spoiler linking to an image |
| `comments: <post title> \| <count>` | that many comments, "Comment 1" to "Comment &lt;count&gt;" |
| `reply: <post title> \| <comment text> \| <text>` | a reply to that comment |
| `subscribe: <subreddit>` | the test account's subscription |
| `message: <subject> \| <body>` | an unread message in the test account's inbox |
| `late comments: <post title> \| <seconds>` | the post's comments answered that late, as Reddit held them when asked |
| `fail posts: <subreddit> \| <status>` | the subreddit's posts answered with that status, such as `500 Internal Server Error` |
| `refuse posts: <subreddit> \| <status> \| <explanation>` | the same, with Reddit's explanation |
| `drop posts: <subreddit>` | the subreddit's posts answered by dropping the connection |

**The phone and what Reddit saw:**

| Command | Does |
|---|---|
| `tap: <text>` | taps the view showing exactly that text |
| `tap containing: <text>` | taps the view whose text contains it |
| `tap id: <id>` | taps the view with that resource id: BaconReader's by its name (`toolbarTitle`), another app's in full (`android:id/button1`) |
| `tap description: <description>` | taps the view with that content description (`More options`) |
| `tap at: <x>, <y>` | taps that point of the screen, in pixels |
| `type: <text>` | types into the field that has the focus |
| `back` | Android's Back |
| `wait: <seconds>` | waits, for a late answer or an animation |
| `source` | saves the page source, the UI tree UiAutomator sees, as `build/e2e/explore/source-<n>.xml` |
| `screenshot` | saves a screenshot as `build/e2e/explore/screenshot-<n>.png` |
| `actions` | lists the actions the fake Reddit recorded: votes, `read_message`, `subscribe`… |
| `requests: <count>` | lists the last requests (30 without a count), with the status the fake answered |
| `unhandled` | lists the requests the fake couldn't answer: what a scenario's Given would need |
| `quit` | ends the explorer |

A failing command answers `error: …` and the others still run. After `source`, `explore.sh` also prints each view of that
page source that shows a text or a description or can be tapped: its class, id, enabled and clickable, bounds, text and
description. `build/e2e/explore/` is emptied when the explorer starts.

**A page source holds what was typed into the app's fields.** On the phone that is only the fake Reddit's test account,
but never paste a page source or a screenshot of a login into a PR or a chat.

## Where tests go

`Exploring/` holds the explorer, a tool to look at the app before writing a Gherkin ("Exploring the app before writing a
Gherkin"). `Infrastructure/` holds everything that isn't a scenario: `BaseE2E`, `Device/` (adb, patching and installing,
recording, the link to the fake Reddit), the `Phone` page objects (Android's screens on `Phone`, the app's on `Phone.BaconReader`), `Reddit/` (the fake Reddit in the Gherkins' words), the `Vocabulary` and the assertions. What a scenario is (its Gherkin,
`[TestDescription]`, `[PlayOnPhone]`, its names, its recording's record) is in `tests/BaconReader.E2E.Shared`, shared
with the VS Code extension's scenarios ([tests/BaconReader.VsCodeExtension.E2E](../BaconReader.VsCodeExtension.E2E/README.md)). `Scenarios/` holds two groups, each run together so the phone gets each APK once
(E2E-TEST-CODE-RULES.md, rules f and g):

- **`Scenarios/Startup/`: patches that change how the app starts,** before the main screen: "Spoof client" (the login),
  "Disable final release announcement", "Prompt to open Reddit links" and "Disable feedback popup". Each scenario is
  patched with only the patches its Given names, since it tests exactly those dialogs and steps.
- **`Scenarios/LoggedIn/`: everything else.** Every scenario is patched with every patch, one APK for all of them, and
  its Given opens the app and logs in: `And BaconReader is patched with every patch`, `And BaconReader is open`,
  `And the test account is logged in`.

Inside a group, folders follow the patches' areas (`account`, `comments`, `editor`, `inbox`, `links`, `media`, `misc`,
`posts`, and `e2e` for the test-only patches): folder = area, class = one patch (`<Patch>Tests.cs`) in a folder of its
own, method = one scenario (one Gherkin), one per patch: its cases are rounds of it, with no storage cleared or app
restarted between them unless the patch is about the next start (docs/given-when-then-test-rules.md, section 3). A
recording's folder is its namespace under `Scenarios`: `Startup/Account`.

```
Scenarios/Startup/Account/SpoofClient/SpoofClientTests.cs
Scenarios/LoggedIn/Comments/EmbedCommentImages/EmbedCommentImagesTests.cs
```

## Patches without scenarios

- **"Disable feedback popup".** BaconReader's own time tracking shows "Please take a few moments to provide feedback"
  only after about an hour of use, and regular use of the patched app on the owner's phone already covers it.

## Logging in

A scenario logs in as BaconReader does, through the fake Reddit's login, made like Reddit's (the same page titles, field
ids and buttons): "Add account" in the left menu, "Log In" with the test account, then "Accept" on the page asking to
connect the app ("Spoof client" logs in as RedReader). Every scenario that loads posts or comments does it: logged out,
Reddit refuses BaconReader ([SpoofClientTests.cs](Scenarios/Startup/Account/SpoofClient/SpoofClientTests.cs)). A
LoggedIn scenario's Given says `And the test account is logged in` (`Phone.BaconReader.LogInWithTheTestAccountAsync()`);
a Startup one that logs in names "Spoof client".

## Isolation

One device, so scenarios run one after another (`xunit.runner.json`), Startup first, then LoggedIn (`ScenarioOrder`):
the order only saves installs, no scenario relies on it. Each starts from the app's data cleared,
Downloads/BaconReader and the fake Reddit emptied, so nothing one does (a login, a setting, a saved image, a post)
reaches another.
