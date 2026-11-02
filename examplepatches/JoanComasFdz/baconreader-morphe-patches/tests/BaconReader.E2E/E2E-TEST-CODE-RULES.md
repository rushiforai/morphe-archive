# End-to-end test code rules (binding)

These rules are binding for `tests/BaconReader.E2E`. They are destiny-loopsmith's
[E2E-TEST-CODE-RULES.md](https://github.com/JoanComasFdz/destiny-loopsmith/blob/main/tests/Loopsmith.Web.E2E/E2E-TEST-CODE-RULES.md),
translated from Playwright and a web app to Appium and a patched Android app on a phone.

The aim: a scenario is one Gherkin, line for line. Every acceptance criterion about a patched app is a Gherkin, written
by [docs/given-when-then-test-rules.md](../../docs/given-when-then-test-rules.md), and every Gherkin is one scenario
here, played on the phone. A scenario reads like the Gherkin it implements, in the app's own words, and everything that
isn't the scenario lives in `Infrastructure/`. What the e2e projects share (a Gherkin and its
`[TestDescription]`, the screen and its attribute, `ScenarioNaming`, the record next to a video) lives in
`tests/BaconReader.E2E.Shared`, a global using of every scenario.

## A full example

```csharp
using BaconReader.E2E.Infrastructure;
using BaconReader.E2E.Infrastructure.Phone.BaconReader.Screens;
using BaconReader.E2E.Infrastructure.Reddit;
using BaconReader.E2E.Infrastructure.Vocabulary;
using JoanComasFdz.AssertingThat;

namespace BaconReader.E2E.Scenarios.Startup.Account;

/// <summary>"Spoof client": BaconReader talks to Reddit as another app (RedReader by default), so logging in works again.</summary>
public sealed class SpoofClientTests : BaseE2E
{
    [Theory, PlayOnPhone]
    [PatchedWith(Patch.SpoofClient)]
    [TestDescription("""
        @phone
        Scenario: BaconReader patched with Spoof client logs in to Reddit as RedReader
          Given Reddit has a post "Hello from r/e2e" in r/e2e
          And the test account is subscribed to r/e2e
          And BaconReader is patched with "Spoof client"
          And BaconReader is installed
          When I open BaconReader
          And I tap "GOT IT :(" on "FINAL RELEASE ANNOUNCEMENT!"
          # Logged out, Reddit refuses BaconReader: the feed shows "Greetings!", BaconReader's "no longer operational" message.
          Then the feed shows no posts
          When I open the left menu
          And I tap "Add account"
          And I type the test account's user name in "Email or username"
          And I type the test account's password in "Password"
          And I tap "Log In"
          Then Reddit asks to connect "RedReader (Release)" with the test account
          When I tap "Accept"
          # BaconReader comes back from the login with the left menu open.
          Then the left menu shows the test account's user name
          # Not on the screen: the fake Reddit records what BaconReader sent.
          And Reddit saw RedReader's client ID, redirect URI and User-Agent
          When I close the left menu
          Then the toolbar shows the "Front Page" feed
          And the feed shows the post "Hello from r/e2e"
          # Not on the screen: the fake Reddit records what BaconReader sent.
          And Reddit got the request for the posts with RedReader's User-Agent
        """)]
    public async Task BaconReaderPatchedWithSpoofClientLogsInToRedditAsRedReader(Screen screen)
    {
        // Given
        Reddit.HasAPost("Hello from r/e2e", "e2e");
        Reddit.TheTestAccountIsSubscribedTo("e2e");

        // When
        await Phone.Launcher.OpenBaconReaderAsync();
        await Phone.BaconReader.FinalReleaseAnnouncement.WaitUntilShownAsync();
        await Phone.BaconReader.FinalReleaseAnnouncement.ClickGotItAsync();
        await Phone.BaconReader.Main.WaitUntilShownAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilMessageShownAsync();

        // Then
        // Logged out, Reddit refuses BaconReader: the feed shows BaconReader's "no longer operational" message.
        var loggedOut = await Phone.BaconReader.Main.Posts.ReadAsync();
        Asserting.That(loggedOut).ShowsNoPosts();

        // When
        await Phone.BaconReader.Main.LeftMenu.OpenAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.ClickAsync(new MenuEntry.AddAccount());
        await Phone.BaconReader.LogIn.WaitUntilShownAsync();
        await Phone.BaconReader.LogIn.TypeTheTestAccountsUserNameAsync();
        await Phone.BaconReader.LogIn.TypeTheTestAccountsPasswordAsync();
        await Phone.BaconReader.LogIn.ClickLogInAsync();
        await Phone.BaconReader.LogIn.WaitUntilConnectShownAsync();

        // Then
        var connect = await Phone.BaconReader.LogIn.ReadConnectAsync();
        Asserting.That(connect).AsksToConnect("RedReader (Release)").WithTheTestAccount();

        // When
        await Phone.BaconReader.LogIn.ClickAcceptAsync();
        await Phone.BaconReader.Main.WaitUntilShownAsync();
        await Phone.BaconReader.Main.LeftMenu.WaitUntilShownAsync();

        // Then
        var menu = await Phone.BaconReader.Main.LeftMenu.ReadAsync();
        var login = Reddit.ReadLogin();
        Asserting.That(menu).ShowsTheTestAccountsUserName();
        Asserting.That(login).SawRedReadersClientIdRedirectUriAndUserAgent();

        // When
        await Phone.BaconReader.Main.LeftMenu.CloseAsync();
        await Phone.BaconReader.Main.Posts.WaitUntilPostsShownAsync();

        // Then
        var toolbar = await Phone.BaconReader.Main.Toolbar.ReadAsync();
        var posts = await Phone.BaconReader.Main.Posts.ReadAsync();
        // Not on the screen: the fake Reddit records what BaconReader sent.
        var requestsForPosts = Reddit.ReadRequestsForPosts();
        Asserting.That(toolbar).ShowsFeed(new Feed.FrontPage());
        Asserting.That(posts).ShowsThePosts("Hello from r/e2e");
        Asserting.That(requestsForPosts).CarriedRedReadersUserAgent();
    }
}
```

## a. Test shape

- A class is `public sealed class <Topic>Tests : BaseE2E`, in a folder of its own under its domain folder (rule g).
- **One Gherkin is one scenario, and one per patch** (docs/given-when-then-test-rules.md, section 3): one method, a
  `[Theory]` with:
  - `[PlayOnPhone]`: plays it once, on the phone. It matches the Gherkin's `@phone` tag;
  - what its app is patched with (rule b), by its group (rule g):
    - a Startup scenario: `[PatchedWith(...)]`, the patches its Given quotes, exactly those, and none of the ones BaseE2E
      adds to every scenario;
    - a LoggedIn scenario: `[PatchedWithEveryPatch]`, and its Given says `And BaconReader is patched with every patch`
      and names no patch;
  - `[TestDescription("""…""")]`: the Gherkin it implements, word for word as agreed with the owner, tags and `#` lines
    included;
  - one parameter, `Screen screen`: the screen its attribute plays it on. BaseE2E reads it; the body never does (the
    project's `NoWarn` says so to xunit's analyzer).
- Its **name** is the Gherkin's `Scenario:` title, each run of letters and digits a word (an apostrophe joins its
  word), capitalized, a word in capitals keeping only its first one ("a GIF" → `AGif`) (`ScenarioNaming.ToMethodName`). Its **GIF name** is the method name kebaberized, then its screen:
  `bacon-reader-patched-with-spoof-client-logs-in-to-reddit-as-red-reader-phone`.
- `ScenarioShapeTests` (`dotnet test`, no phone) fails a scenario that isn't a `[Theory]` with `[PlayOnPhone]` and
  its `Screen` parameter, has no `[TestDescription]`, isn't named after its Gherkin's title, whose screen attribute isn't
  its Gherkin's tag, that is in neither `Scenarios/Startup/` nor `Scenarios/LoggedIn/`, a Startup scenario without
  `[PatchedWith]` or whose `[PatchedWith]` isn't exactly the patches its Given quotes, one a line
  (`And BaconReader is patched with "<patch>"`), or names one BaseE2E adds, and a LoggedIn scenario without
  `[PatchedWithEveryPatch]` or whose Given doesn't say `And BaconReader is patched with every patch`, or names a patch.
- The body is `// Given` once, then a `// When` and a `// Then` for each round of the Gherkin, in its order (rule h).
  It calls only `Phone`, `Reddit` and `Asserting.That`: no Appium API, no locators, no adb, no HTTP, no `Assert.*`, no
  delays.
- Strings appear only for text the app composes around names and numbers (a post's title, a comment line, a toast:
  rule e).

## b. BaseE2E

`Infrastructure/BaseE2E.cs` owns everything that isn't the scenario:
- the skip: a scenario is skipped unless `E2E_APPIUM_URL` is set (the phone's connection script exports it: README, "The phone");
- **the fake Reddit** (README, "The fake Reddit"): started once per run in the test process, on
  `E2E_FAKE_REDDIT_URL`'s port, which the phone reaches through `adb reverse` (set once the device is reached, again
  when lost, `Device/FakeRedditLink`); emptied before each scenario, with the test
  account made again (`TestAccount`); the scenario's `Reddit`, through which its Given makes its Reddit data; and after
  the scenario, a failure listing every request the app made that the fake doesn't answer (`Reddit/UnhandledRequests`,
  whose short ignore list says why for each);
- **the patches:** it patches the clean APK with the bundle `./gradlew buildAndroid` built, and installs it with its
  runtime permissions granted (`Device/PatchedApps`):
  - a Startup scenario's app with its `[PatchedWith]` patches, the fewest it needs, and the ones every scenario gets,
    which a Given never names (`PatchedApps.Always`: "E2E fake Reddit", "E2E inbox envelope label"): `morphe-desktop
    patch --exclusive --enable …`;
  - a LoggedIn scenario's app with every patch the bundle lists (`morphe-desktop list-patches`), each enabled the same
    way, and the test-only ones.

  An APK is patched once per set of patches and bundle, signed with one test key, and sent to the phone only when it
  isn't the one installed (sending one takes 1–3 minutes over the slow link): the LoggedIn scenarios share one;
- **a fresh app per scenario:** stopped and its data cleared (no login, no setting, no cache from the scenario before),
  as just installed, but with its notifications denied (`Device/PatchedApps`): Android doesn't ask, on any device;
- **the screen:** one Appium session on the phone, its UiAutomator2 helpers already installed
  (`skipServerInstallation`, `skipDeviceInitialization`; `E2E_APPIUM_INSTALL_HELPERS=1` installs them after the
  phone was reset), that never launches or resets the app itself: the scenario opens it;
- **the recording:** when the run records (`E2E_VIDEO_DIR`), Android's `screenrecord` records the screen from before
  the app opens to the end, 576 px wide in the screen's shape at 1 Mbit/s, in parts of 3 minutes joined at the end,
  with a ring drawn onto the video where each tap lands, before it (`Device/ScreenRecording`); it saves the video
  (record.sh holds its last frame 3 s), also when the scenario fails, with its record next to it (title, Gherkin,
  screen, patches, GIF name, domain folder, when the main screen first showed, whether it passed);
- the `Phone` property.

A scenario never repeats any of that.

## c. Phone

`Infrastructure/Phone/` models the phone as the user holds it: Android, and the apps on it.
- **`Phone`**: Android's own screens, one class each (`Phone.Launcher`, `Phone.AppInfo`, `Phone.OpenByDefault`).
- **`Phone.BaconReader`** (`Phone/BaconReader/BaconReaderApp.cs`): the app. One class per screen (an activity:
  `MainActivity` → `Phone.BaconReader.Main`) in `Screens/` and per dialog in `Dialogs/`, named and nested as the app
  does: `Phone.BaconReader.Main.Toolbar`. A part the user sees as its own (a toolbar, a post's row) gets its own class.
- An action belongs to the part that shows it: `Phone.Launcher.OpenBaconReaderAsync()` (Android),
  `Phone.BaconReader.FinalReleaseAnnouncement.ClickGotItAsync()` (the app).
- `Phone.BaconReader.OpenAsync()` is "Given BaconReader … is open": open from the launcher, answer the first-start
  dialogs its patches show, wait for the main screen.
- every member touches the device, so every member is async with an `Async` suffix:
  - **Act**, what a user does, by verb: `Click…Async` (a tap), `Type…Async` (a text field), `Select…Async` (a menu,
    a spinner), `Tick…Async` (a checkbox or a switch), `Swipe…Async`, `Open…Async` (an app, a link);
  - **Wait**: `WaitUntil<what the user expects>Async` (`Phone.BaconReader.Main.WaitUntilShownAsync()`), always for
    something the user would see;
  - **Read**: `ReadAsync()` returns an immutable record snapshot of what that part shows, never the raw UI tree:
    vocabulary values (rule e) where it shows one kind of thing, the shown text where it composes a line;
    `ReadLayoutAsync()` returns where its views are on the screen (their bounds, in pixels) for layout checks (rule d).
- **Pace the steps.** Every Act and Read goes through `OnScreen` (`PressAsync`, `TouchAsync`, `ActAsync`, `DoAsync`,
  `ReadAsync`), never straight to Appium: while recording, a step starts no sooner than `--action-gap` seconds after the
  previous one ended, so the GIF doesn't tap faster than the eye follows. A view that is off screen is scrolled to first
  (through `OnScreen`, when a scenario first needs it). `PressAsync` shows where it taps before it taps: the recording
  draws a ring there from 0.4 s before the tap until just after it (Android draws no touch for Appium's taps);
  `TouchAsync` does the same for any other touch (a double tap, a long press). Waits don't go through it (`Waiting`).
- Snapshots don't retry: a scenario waits for what it expects before it reads.
- Locators are private to their class and use only `Locate`: a resource id (`Locate.AppId("toolbarTitle")`, Android's
  own `Locate.AndroidId("button1")`), a content description, or the exact text. Never XPath or a position. A view a patch
  creates in code gets a content description in the patch, in the same PR.

## d. Assertions

- Each snapshot record has its own static `<Type>Assertions` class next to it (`ToolbarSnapshotAssertions` next to
  `Toolbar.cs`), with extension methods on `AssertingThat<T>` in the app's language: `ShowsFeed(new Feed.FrontPage())`,
  `ShowsTable(…)`, `HasNoAwards()`; never `TextIs(…)`.
- A Gherkin's "must not be there" line has its own assertion: `HasNoAwards()`, `IsGreyedOut(…)`.
- **Layout** assertions work on a `ReadLayoutAsync()` snapshot, from the bounds of its views, never from a
  screenshot: `HasNoOverlap()`, `FitsInsideTheScreen()`.
- They return the `AssertingThat<T>` for chaining, use xunit's `Assert` inside, and their message says what the user
  sees against what was expected: "The toolbar shows the "Popular" feed, but "Front Page" was expected."
- Read and assert on separate lines.

## e. Vocabulary

- `Infrastructure/Vocabulary/` holds one Dunet union per kind of thing a scenario names (a feed, a subreddit, a sort,
  a setting…), one file per kind, each with one function from a case to what the app shows (`ToShownText`): the only
  place those strings live. The reverse (`Read<Kind>`) is derived from it.
- **Patches are an enum,** `Patch`, not a union: `[PatchedWith]` is an attribute, and an attribute takes only
  constants. Its `ToShownText` is the patch's name in the bundle, which `morphe-desktop patch --enable` takes and the Gherkin
  quotes.
- A Gherkin's quoted **name** of a thing a scenario acts on or checks ("Front Page", "Best", "Spoof client") is a
  vocabulary case in the scenario. A quoted **text the app composes** (a post's title, a comment, a dialog's message)
  is the quoted string itself, exactly as the Gherkin quotes it; so is the Reddit data a Given makes (a post's title,
  a subreddit's name), which the scenario passes to `Reddit`.
- Every union has an `Unlisted(string Shown)` case: what the app shows that no case names yet, so a failing assertion
  names it as the app shows it.
- A case is added when a scenario needs it; no up-front lists.

## f. Isolation

A scenario never depends on another scenario or on what ran before it: everything it needs comes from BaseE2E (its
patched app, freshly cleared) and its own steps. Its rounds are isolated inside it the way its Gherkin says. There is
one device, so scenarios run one after another (`xunit.runner.json`), in an order that sends each APK to the phone
once (`ScenarioOrder`, tested by `ScenarioOrderTests`): the tests without the phone first, then the Startup scenarios,
those with the same patches together, then the LoggedIn ones, each group by class and method. Each class is a test
collection of its own, named by its place in that order (`ScenarioCollections`), and the collections run by name. A
scenario never relies on that order: it only keeps the phone from switching APKs.

## g. Adding a test

1. Write the **Gherkin** first (docs/given-when-then-test-rules.md) in a ```` ```gherkin ```` block and agree it with
   the owner: it is the PR's acceptance criterion.
2. Find its **group**, the first folder under `Scenarios/`:
   - `Scenarios/Startup/`: a patch that changes how the app starts, before the main screen (the login, the first-start
     dialogs: "Spoof client", "Disable final release announcement", "Prompt to open Reddit links", "Disable feedback
     popup"). Its app is patched with only the patches its Given names, since it tests exactly those dialogs and steps;
   - `Scenarios/LoggedIn/`: every other patch. Its app is patched with every patch, one APK for every LoggedIn
     scenario, and its Given opens the app and logs in.
3. Find its **domain folder** under the group's: the patch's area, as this bundle groups its patches
   (`account`, `comments`, `media`, `posts`… → `Scenarios/Startup/Account/`, `Scenarios/LoggedIn/Comments/`…).
4. Its **class** is the patch's, `<Patch>Tests.cs` (`SpoofClientTests.cs`), in a folder of its own named for the class
   without `Tests` (`Scenarios/Startup/Account/SpoofClient/SpoofClientTests.cs`). Its namespace stays the domain
   folder's (`BaconReader.E2E.Scenarios.Startup.Account`): the recordings' folder is named by it (`Startup/Account`).
5. Write the scenario (rules a–f, and rule h for the translation).
6. Grow `Infrastructure/` only by what this scenario needs: the page-object members, vocabulary cases and assertions it
   calls. A missing content description goes into the patch, in the same PR.
7. Run it unrecorded while you work: `tools/e2e/record.sh --no-video <its class>` (`--no-bundle` when the patches
   didn't change).
8. Record it once, right before the push, never between pushes: `tools/e2e/record.sh --changed-since origin/dev`. Each
   GIF shows what the Gherkin says. Right after the push, `tools/e2e/push-gifs.sh` posts the GIFs on the PR.

## h. From a Gherkin to a scenario

Line for line, in the Gherkin's order:

| In the Gherkin | In the scenario |
|---|---|
| `@phone` | `[Theory, PlayOnPhone]` |
| The whole Gherkin | `[TestDescription("""…""")]`, word for word |
| `Scenario: BaconReader patched with Spoof client logs in to Reddit as RedReader` | `public async Task BaconReaderPatchedWithSpoofClientLogsInToRedditAsRedReader(Screen screen)` |
| `Given Reddit has a post "Weekly thread" in r/e2e` | `// Given`: `Reddit.HasAPost("Weekly thread", "e2e")` |
| `And the post "Weekly thread" has a comment with a GIF` | `// Given`: `Reddit.ThePost("Weekly thread").HasACommentWithAGif()` |
| `And BaconReader is patched with "Spoof client"`, one line a patch (Startup) | `[PatchedWith(Patch.SpoofClient, …)]`, every patch the Given names |
| `And BaconReader is patched with every patch` (LoggedIn) | `[PatchedWithEveryPatch]` |
| `And BaconReader is installed` | nothing: BaseE2E installed it |
| `And BaconReader is open` | `// Given`: `Phone.BaconReader.OpenAsync()`, after the Reddit data |
| `And the test account is logged in` | `// Given`: `Phone.BaconReader.LogInWithTheTestAccountAsync()`, after it opens |
| A `When`, and the `And` lines after it | One `// When` block: one Act call per line, in order, ending with the `WaitUntil…` for what the Then reads |
| `I open BaconReader` | `Phone.Launcher.OpenBaconReaderAsync()` |
| `I tap "GOT IT :(" on "FINAL RELEASE ANNOUNCEMENT!"` | `Phone.BaconReader.FinalReleaseAnnouncement.WaitUntilShownAsync()`, `ClickGotItAsync()` |
| A `Then`, and the `And` lines after it | One `// Then` block: one read per part it checks, then one assertion per line, chained |
| `the toolbar shows the "Front Page" feed` | `Phone.BaconReader.Main.Toolbar.ReadAsync()`, `ShowsFeed(new Feed.FrontPage())` |
| A quoted name of a thing | A vocabulary case (rule e) |
| A `#` line (why it surprises) | Stays in the Gherkin; a `//` line above the read it explains, when it explains a check |

A Gherkin line with no page-object member or assertion yet gets one (rule g, step 5), named in the same words.
