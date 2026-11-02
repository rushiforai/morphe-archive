# Patch scenarios

A **patch scenario** tests what one patch does to the app: the subject a pull request changes (a fix that makes
something work again, a feature it adds, a cleanup it makes). It lives in its app's e2e project under `Scenarios/`, in
one of two groups ("Scope"), then by the patch's area, as this bundle groups them (`account`, `comments`, `media`,
`posts`…): its [README](../tests/BaconReader.E2E/README.md), "Where tests go".

This document is a child of [How to write a Gherkin](given-when-then-test-rules.md), which holds what every Gherkin
shares (its shape, When, Then, the PR, the checks before handing it over). It adds what a patch scenario does: its
scope and the order of its rounds. Adapted from destiny-loopsmith's
[loop scenarios](https://github.com/JoanComasFdz/destiny-loopsmith/blob/main/docs/given-when-then-loop-scenarios.md).

## Example

[SpoofClientTests.cs](../tests/BaconReader.E2E/Scenarios/Startup/Account/SpoofClient/SpoofClientTests.cs): BaconReader
patched with only "Spoof client", logging in to the fake Reddit, which has a post for it to show.

```gherkin
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
```

## Scope

1. **Test only what the PR's patch changes.** One Gherkin covers one patch, everything it does (e.g. "Show tables draws a table").
   Behaviour the patch doesn't touch, even if it shows on the same screen, is left out.
2. **Its group decides what it is patched with:**
   - **Startup** (`Scenarios/Startup/`): a patch that changes how the app starts, before the main screen ("Spoof
     client", the login; "Disable final release announcement"; "Prompt to open Reddit links"; "Disable feedback
     popup"). **Patch with the fewest patches:** the patch under test, and only what it needs to get to its subject:
     "Spoof client" when it needs a login (anything that loads posts or comments: Reddit, and so the fake Reddit,
     refuses a logged-out BaconReader with `HTTP 403 Blocked`). Each one is quoted in the Given, one a line.
   - **LoggedIn** (`Scenarios/LoggedIn/`): every other patch. **Patch with every patch**, as the user installs them,
     one APK for every LoggedIn scenario: `And BaconReader is patched with every patch`, then `And BaconReader is open`
     and `And the test account is logged in`. It still tests only its own patch (point 1). When another patch changes
     what it sees, say so in a `#` line above the check; when that is a bug of the two together, tell the owner.
3. **Cover every case that can change the result.** For example:
   - each value its setting offers (on and off, each choice);
   - the content it acts on and content it must leave alone (a post with a table and one without);
   - the boundary that matters (the 500th comment and the 501st).

   Each is a round of the patch's one Gherkin. The app without the patch is BaconReader's own behaviour: it gets no
   Gherkin.

## Order

1. **Go up, one value at a time:** a setting's values in the order the settings screen lists them, off before on.
2. **Isolate every round.** After a round's Then, go back to where the round started (Back, or close what it opened),
   unless the next round needs what it left. Each round then starts from the same screen as the first, and what it shows
   comes from its own actions only. Keep a state only when the next round is about it, and say so in a `#` line in that
   round ("# keeping the search open: the next round clears it").
   Never clear the app's storage or restart it to isolate a round: it costs a start of the app, and a case that only
   shows again from a fresh app (a prompt answered once) is one round, not one per answer. Stop and open the app again
   only when the round is about the next start, and say so in a `#` line.
3. **Put the offering round first** (what a menu or a setting offers), then the rounds that use each offer.
