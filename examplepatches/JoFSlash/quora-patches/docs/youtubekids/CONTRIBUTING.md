# Contributing to the YouTube Kids patches

YouTube Kids is obfuscated like YouTube (classes in the default package), so patches find their methods by
strings and signatures. It has no anti-tamper and no Play Integrity check. The universal APK has x86_64
libraries: `python .github/scripts/check_app.py youtubekids <youtubekids.apk> --cli <morphe-cli.jar> --install
--expect-screen` patches it with every patch and starts it on a phone or emulator, as the emulator test does.

Playback needs GmsCore support: the player asks Play services for a DroidGuard result (thread "DG"), and Play
services throws `SecurityException: PackageVerificationRslt: not allowed` for a re-signed caller, which kills the
app. Through MicroG-RE the DroidGuard request fails quietly and videos still play, so YouTube's Spoof video streams
isn't needed (checked with 11.47.541, signed out). If videos start to stop after a minute or get 403 errors,
that is the place to look.

Where the patches hook in (11.47.541; names are obfuscated and change between versions):

- **Hide video ads** uses YouTube's ads library hooks from upstream Morphe: the player bytes ad layout
  (`"Bootstrapped layout construction resulted in non PlayerBytesLayout. PlayerAds count: "`) returns at once,
  and the activated ad slot triggers are filtered down to the slot expiration category (6) before they are
  sorted into a `SparseArray` by category. YouTube Kids has no "player waits for the ad slot" deferral that
  newer YouTube has. No ad showed on the test phone (EU, signed out) with or without the patch, so it is
  checked in the bytecode only.
- **Block tracking** hooks the one HTTP ping sender, `send(identity, ping, callback)` whose ping class is found by
  its `new Ping(byte[])` constructor that sets the "qoe" tag. The extension decides by URL path and tag. The
  watch statistics (`vss`: `/api/stats/playback`, `watchtime`, `delayplay`) must stay: with `watchtime` blocked,
  Watch it again stays empty. `kidsactivityendpointlogging` pings are kept too. Interaction events
  (InnerTube `log_event`) are dropped by giving the request a list that ignores adds, so the delayed event
  dispatcher sees an empty batch and returns before sending; the stored events expire by themselves.
  Clearcut goes to MicroG-RE, which drops it; Firebase Analytics is already off in the manifest.
- **Skip parent feature tour** presses the tour's Done button from the extension once the page is fully on
  screen: the setup pages sit side by side in a ViewPager, and the signed-out tour first saves the content
  level behind a spinner, so pressing it earlier would skip the wrong page.
- **Hide review prompt** forces the `app_rated` preference read in the home screen's review check to true.
- **Hide Sign in tab** replaces the `List.add` of the bar's last tab ("profile") while the label is
  `pivot_bar_signed_out_tab`.

The extension logs what it blocks with the tag `JoF`: `adb logcat -s JoF`.

See the [general guide](../../CONTRIBUTING.md) for building, pull requests and where things are.
