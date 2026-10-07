# Android testing environment

Runtime files are outside the patch repository, in `/code/morphe/.android-testing`.
That directory is inside the mounted code folder, so the SDK and emulator data
can survive replacement of the container. No patch behavior is changed by this
setup.

## Target toolset

- Android command-line tools, emulator, platform tools (`adb`), build tools 35.0.0.
- Google APIs Android 11 / API 30 x86-64 image, above the APK's API 29 minimum.
- Headless phone at 720 × 1280. Hardware mode uses 2048 MiB RAM and two virtual CPUs.
- The original Reddit 2026.14.0 APKM includes an x86-64 split.

Current setup status (2026-10-06): all listed SDK packages installed. KVM reports
usable, and Android booted in approximately 33 seconds. The initial `swiftshader`
renderer crashed the emulator; `swangle` booted successfully and is the launch
script default. Emulator 37.2.12 requires at least 2048 MiB even for this image.
The v0.3.6 test APK installed and opened its login screen without a recorded crash.
A second test APK was built successfully with all 18 default upstream Reddit
patches from Morphe v1.46.0 plus our three patches. It installed and loaded a live
feed. All 13 feed/Ads/Navigation bar/Sidebar switches are enabled and verified
after dismissing the per-setting restart prompts, followed by one app restart.
Account login completed using a fresh email magic link opened in the emulator.
An authenticated Home feed loaded; the vertical viewer opened media and advanced
to another post with an upward swipe. The NSFW button switched the persisted
filter on and off, and the visible feed changed between posts with and without
NSFW markers. No crash was recorded in these checks. These are short smoke checks;
intermittent failures and long sessions still need targeted reproduction.

## Container requirements

The current container has working `/dev/kvm` passthrough. When launching a new
Docker or Podman container, include:

```sh
--device=/dev/kvm
```

Retain the existing `/code` mount and other launch options. A non-root container
user may also need access to the host KVM device's group. Check inside the new
container:

```sh
/code/morphe/.android-testing/sdk/emulator/emulator -accel-check
```

The check must report that KVM is usable. GPU passthrough is optional; this setup
uses software graphics rendering via ANGLE/SwiftShader even when CPU virtualization is enabled.

The launchers in `/code/codex-container` now add `--device=/dev/kvm` and
`--group-add=keep-groups` when the host device exists. The latter preserves host
supplementary group access under rootless Podman and requires the crun runtime.
The `Containerfile` also includes the emulator's Ubuntu runtime libraries;
rebuild the image on the host to include those permanently.

## Start and inspect

Run from this repository:

```sh
testing/android/run.sh
```

`testing/android/run.sh --software` is a low-resource, unaccelerated boot
experiment. It is not assumed to be fast enough for interactive Reddit testing.

In another terminal:

```sh
export PATH=/code/morphe/.android-testing/sdk/platform-tools:$PATH
adb -s emulator-5554 shell getprop sys.boot_completed
adb -s emulator-5554 shell input tap 360 640
adb -s emulator-5554 shell input swipe 360 1050 360 250 400
adb -s emulator-5554 exec-out screencap -p > /code/morphe/.android-testing/screen.png
adb -s emulator-5554 emu screenrecord screenshot /code/morphe/.android-testing/emulator-screen.png
adb -s emulator-5554 shell uiautomator dump /sdcard/window.xml
adb -s emulator-5554 pull /sdcard/window.xml /code/morphe/.android-testing/window.xml
adb -s emulator-5554 logcat -v threadtime
adb -s emulator-5554 emu kill
```

This provides real Android execution, screenshots, taps/swipes, UI trees where
Reddit exposes them, and runtime logs. `testing/android/install.sh [unsigned-apk]` signs and installs a test build
using a persistent local debug key. It requires Android to finish booting and
uses ordinary streamed installation (incremental installation is disabled).
Without an argument it uses the saved APK containing all upstream defaults and
our v0.3.6 patches. Test builds need a consistent local signing key to update
without deleting app data. Signing keys, logs, account state and screenshots
belong in the runtime directory, not Git.

`testing/android/capture.sh [label]` collects the emulator display, recent logcat,
crash log and UI hierarchy into a private capture directory. This includes
dialogs that may be missing from the accessibility tree. Use it when recording
reproduction steps for intermittent failures.

Account-dependent NSFW/subscription tests require a logged-in Reddit account.
Use the emulator console screenshot when `screencap` is unavailable. Login screens
can reject Android's screenshot API, and their modal sheets can be absent from
the UI accessibility tree. Check the actual display before interpreting a login
failure. Keep login screenshots and UI dumps in the private runtime directory.
An emulator may not reproduce every issue on a physical phone; long sessions,
background/resume, process recreation and network interruptions should be
tested explicitly.

## Reinstall tools after replacing the container

The mounted SDK remains available, but Ubuntu runtime libraries may need
reinstallation:

```sh
apt-get update
apt-get install -y libxkbfile1 libnss3 libxcomposite1 libxcursor1 libxdamage1 \
    libxi6 libxrandr2 libxtst6 libpulse0 libasound2t64 libgl1 libglu1-mesa \
    libxkbcommon-x11-0
```

If the runtime directory is absent, install Google's command-line tools into
`sdk/cmdline-tools/latest`, accept the SDK licenses, and use its `sdkmanager` to
install `platform-tools`, `emulator`, `build-tools;35.0.0`, and
`system-images;android-30;google_apis;x86_64`.

## Patch follow-up status

- NSFW reliability and silent account updates: completed through v0.3.10.
- Independent bottom-bar buttons and native icons: completed through v0.3.10.
- Vertical viewer on native feeds, subreddit overlay and synchronized position:
  completed in v0.4.0.
- Interactive app filtering on modern post cards, saved startup setting and
  **Hide apps in feed** after the Ads options, without a subtitle: v0.4.1.
- Reported intermittent Home-to-profile viewer position: exact failure was not
  reproduced; screen ancestry guard and fresh-profile focus regression added in
  v0.4.1. Native Home-to-profile navigation and viewer round trip passed.

## NSFW reliability pass (2026-10-06)

The focused JVM checks fail against the v0.3.6 code and pass after binding each
button to its original callback's navigation screen and toggling the displayed
mode instead of a lagging account getter. The patched APK applied all 21 patches
and updated the emulator without deleting app data. Home, profile-tab, and
background/resume toggles all changed the persisted filter as expected, with an
empty crash buffer and no RedditMode warnings. App left on Home in SFW mode.

The reported intermittent long-session failure was not reproduced. The changes
address demonstrated failure paths; they are not confirmation that this specific
report is resolved. New warnings can be captured with capture.sh if it recurs.

## Account acknowledgements (v0.3.8)

The user confirmed that v0.3.7 fixes visiting a profile followed by a broken
NSFW button. The click wrapper now also preserves that screen binding if Compose
passes it through the hook again during a redraw.

Each tap changes the local filter and shows an updating-account-settings toast.
RedditModePatch observes the preference repository's F() sync call, preserving
the original coroutine continuation/context. Only successful server results for
both over18 and noProfanity produce a confirmed toast and refresh. The over18
setter's own return cannot establish this: it discards an unsuccessful sync result.

Taps during an update queue the latest desired mode; an obsolete update does not
show a confirmation or refresh the feed. A rejected update waits for its other
request to finish before starting the queued mode. A 30-second timeout releases
the pending update and reports failure. Local filter state remains the requested
state on failure; the toast does not claim the account state matches it.

Focused JVM checks cover owner replacement, repeated wrapping, lagging account
state, immediate/asynchronous acknowledgements, rejection, queued reversal,
queued reversal after rejection, and timeout/late replies.

The final v0.3.8 APK applied all 21 patches without failures. An authenticated
emulator run observed real F() acknowledgements for both settings when turning
mode on and off, with no crashes. Screenshots/OCR captured the pending and
confirmed messages; diagnostics are private under .android-testing. The final
release extension fingerprint matches the extension used for that APK.

## Silent NSFW button (v0.3.9)

Per user instruction, emulator runs and post-release download checks are skipped
for this iteration. Local checks cover preserving Inbox, adding NSFW when Inbox
is absent, duplicate tab prevention, normal silence, and retained error toasts.

The NSFW tab is now added to both native bottom-bar builders, alongside Inbox.
Its title/click label and icon are drawn explicitly rather than borrowing Home's
appearance. The blur-content preference uses drawable/icon_nsfw (0x7f08043f);
the matching Compose assets are i0.S0 and h0.S0 for outline/filled states. The
preference XML and icon registry were inspected directly in Reddit 2026.14.0.
Settings acknowledgements, queued requests, filtering and refresh behavior remain.
Pending/success messages are retained only in logs; normal operation has no toast.

## Correct icon renderer (v0.3.10)

The user revoked the no-testing preference; emulator and release verification
are enabled again. Raw DEX inspection showed com.reddit.ui.compose.ds.q9 with
the expected icon renderer signature. The decompiler's pointer.q9 package is an
alias, not a runtime class. Both custom buttons now use the raw DEX class name.

Final APK applied all 21 patches with zero failures. Ten local checks passed.
Authenticated emulator captures show Home / Vertical / NSFW / Inbox / You, with
NSFW's 18 diamond outlined when off and filled when on. Vertical's video icon
renders correctly too. Both mode transitions received settings acknowledgements;
no icon-render warnings or crashes were recorded. Mode restored to off. Private
captures bar-off.png and bar-on.png contain only the navigation bar.

## Interactive app filter pass (2026-10-06, v0.4.1)

With all 18 default upstream patches and the three custom patches installed,
the previous build displayed Hot & Cold interactive cards while hiding was
enabled. Runtime tracing showed modern `ym1.u1` post cards containing
`com.reddit.devplatform.feed.custompost.b`; these bypassed `Listing.getChildren`.
The new converter hook removes the whole card. A runtime trace observed 63
removed cards while retaining 19 other post conversions.

Native UI checks verified the setting after Hide feed ads and before Navigation
bar, with no subtitle. Turning it off, restarting and reopening r/HotAndCold
displayed games; turning it on, restarting and scrolling hid games while ordinary
discussion posts remained. Ten focused JVM checks also cover legacy children,
modern cards, compact indicators, disabled startup settings and null conversions
from other filters.

## Home-to-profile vertical report (v0.4.1)

The exact intermittent jump could not be reproduced. Static inspection confirms
that focus and positions are keyed by each pager, with no shared last index. A
fresh-profile regression now covers Home remembering a post also present in the
profile: the profile starts at its own first media item. The feed resolver now
requires the model's owning screen to descend from the current screen, rather
than relying only on Activity identity and ON_SCREEN visibility. Runtime tracing
confirmed BaseScreen.X4() is the parent link used by the embedded profile Posts
screen.

In the emulator, Home was advanced to feed section 9, then the media overlay's
author was tapped to open their profile. Vertical opened SUBMITTED_POSTS at index
0. Three upward swipes displayed four different titles; Back synchronized to the
last selected profile post, and reopening kept that post. No AndroidRuntime
exception was recorded. This checks the transition and the defensive guard; it
does not establish the cause of the user's intermittent report.

Tapping Home in the profile's bottom bar opened a second native Home feed with a
different pager and Android Activity. Its first image differed from the original
Home, as did the underlying native feed. A runtime map inspection confirmed
separate entries: original Home retained section 9 and its original post ID;
profile retained its own selected post, and the second Home had a different
position and post. No shared position was found.

Returning from the profile Activity to the original Home viewer preserved its
selected post. Closing that viewer and reopening Vertical from the original Home
feed also opened the same post, confirming isolation in the full native back
stack transition.
