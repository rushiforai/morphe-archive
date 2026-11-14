# CLAUDE.md

Guidance for Claude Code when working in this repository.

## What this is

Sync Up is a [Morphe](https://github.com/MorpheApp) patch bundle for **Sync for Reddit**
(`com.laurencedawson.reddit_sync`, plus the `.pro` and `.dev` variants). It is a derivative
of [Patcheddit](https://github.com/wchill/patcheddit), reduced to only the Sync for Reddit
patches.

Morphe is a fork of ReVanced. A patch bundle is a `.mpp` file: a JAR of Kotlin patch
definitions plus DEX'd "extension" code that gets injected into the target APK. Patches
locate methods in the obfuscated app with **fingerprints** and rewrite their smali.

## Layout

```
patches/src/main/kotlin/app/morphe/patches/
  all/misc/debugging/            Universal patch (applies to any app)
  reddit/customclients/          Reusable patch builders shared across Reddit clients
    Constants.kt                 Extension method descriptors
    SpoofClientPatch.kt          The client-id / redirect-uri / user-agent option set
    ModifyWebViewPatch.kt        Redirects WebView.loadUrl through the extension
    FixRedgifsApiPatch.kt        Enables the shared Redgifs interceptor
    FixSLinksPatch.kt            Enables the shared /s/ link resolver
    sync/                        Sync-family patches
      Constants.kt               Compatibility declarations (the supported packages)
      ads/, detection/piracy/    Shared across the Sync family; piracy detection is a
                                 dependency-only patch (it has no name, so it is not
                                 user-selectable)
      syncforreddit/             The Sync for Reddit patches themselves
        http/                    Interceptor based patches; InterceptHttpRequests installs the
                                 hook the others depend on, and has no name so it is not
                                 user-selectable
        ui/                      Patches that change Sync's own views
patches/src/main/resources/branding-license/   License texts bundled into the .mpp
extensions/shared/library/       Java injected into every patched app (shared base classes)
extensions/shared/               Wrapper project that packages the library as an extension
extensions/syncforreddit/        Sync-specific injected Java
  http/                          The interceptors, one per patch, each gated on its own
                                 isPatchIncluded so an unselected patch passes requests through
  ui/                            Code that manipulates Sync's views at runtime
extensions/syncforreddit/stub/   Compile-only stubs of app classes the extension references,
                                 declaring only the members actually used
test/test_all_apks.py            Rebuild the bundle and patch APKs dropped into test/
.github/scripts/                 README patch list generator, run by the release
```

Each patch directory pairs a `Fingerprints.kt` (how to find the code) with the patch file
(what to do to it). Follow that split when adding patches.

Extension classes must stay under `app.morphe.extension.*` — the Morphe extensions library
provides `app.morphe.extension.shared.{Logger,Utils}` and the patches reference extension
classes by their exact smali descriptor, e.g.
`Lapp/morphe/extension/syncforreddit/FixSLinksPatch;`. Renaming a package or class means
updating the descriptor string in the corresponding patch.

`extensions/*/build.gradle.kts` files are auto-discovered by the Morphe settings plugin, which
scans `extensions/` for build files. Nested projects such as `:extensions:syncforreddit:stub`
do not need to be listed in `settings.gradle.kts`.

## Commands

| Task | Command |
| --- | --- |
| Build the bundle | `./gradlew buildAndroid` → `patches/build/libs/patches-*.mpp` |
| Regenerate the patch list | `./gradlew generatePatchesList` → `patches-list.json` |
| Patch real APKs | `uv run test/test_all_apks.py` (APKs go in `test/`) |
| Apply patches by hand | See [Verifying changes](#️-verifying-changes) — the only way to catch smali errors |
| Read the target APK | `uv run --with androguard==4.1.4 python ...` — see [Inspecting the APK](#inspecting-the-apk) |
| Refresh the README patch list | `uv run .github/scripts/generate_patches_readme.py RashKash103/sync-up dev patches-list.json README.md` |

Building needs **JDK 21**, an **Android SDK** with platform 36, and a GitHub PAT with
`read:packages`, exported as `GITHUB_ACTOR` / `GITHUB_TOKEN` or set as `gpr.user` / `gpr.key`
in `~/.gradle/gradle.properties`; the Morphe plugin and libraries come from GitHub Packages.
There is no `~/.gradle/gradle.properties` on this machine, and where `gh` is authenticated
`GITHUB_ACTOR=$(gh api user -q .login)` and `GITHUB_TOKEN=$(gh auth token)` serve. Without them
the Morphe plugin fails to resolve and the build dies with an unhelpful
`IllegalArgumentException (no error message)` before it starts.

Use `uv run` for Python, not bare `python3`.

## ⚠️ Verifying changes

**The build passing does not mean a patch works.** There are three separate layers, and each
catches a different class of error. Skipping the later ones is how broken patches ship.

| Layer | Catches | Misses |
| --- | --- | --- |
| `./gradlew buildAndroid` (and CI) | Kotlin and extension Java compile errors | Everything below |
| Running the patcher against a real APK | Smali syntax, unresolved fingerprints, register errors | Runtime behaviour |
| Installing on a device | Whether it actually works | — |

The middle layer is the one that is easy to forget and the one that hurts. **The smali inside
those Kotlin string literals is not assembled until a patch executes against an APK**, so a
malformed instruction compiles perfectly and fails only at patch time. A patch that has only
been built has not been tested in any meaningful sense.

Note that a device is only ever *one* device. The app's `minSdk` is 23, so extension code can
call a method that does not exist on most of the range it is offered to and still work
perfectly on whatever is to hand. `./gradlew :extensions:syncforreddit:lintRelease` is what
answers that question — its `NewApi` check reads every call against `minSdk` — and
`buildAndroid` does not run it, so it has to be asked for. It found three: `Map.computeIfAbsent`,
`List.sort` and `Outline.getRadius`, all API 24, all shipped. D8 *outlines* such a call into a
`$$ExternalSyntheticApiModelOutline0` rather than desugaring it, so it is still the real method
and still throws below the level it needs; seeing that name in the dex is not reassurance.
Being inside a `catch` is not reassurance either, since a `NoSuchMethodError` is an `Error` and
walks straight through a `catch (Exception)`. R8 does quietly fix some of it — `Map.of()`
becomes `Collections.EMPTY_MAP` — so what the dex holds is worth reading before changing
anything.

### Everything must be tried in tablet mode as well

**Tablet mode is a different app, not a wider one.** `pa.d.S3()` reads `tablet_mode` from the
`PreferencesTabletFragment` file, defaulting to a bool resource, and screens branch on it —
`PreferencesGeneralFragment.C3` hides the whole of the `drawer` category *and* the whole of the
`bottom` category in a single pair of calls when it is true. A settings row added inside one of
those categories is therefore simply gone on a tablet or an unfolded foldable, which is exactly
where it is most wanted: tablet mode is when the rail is drawn. Anything of ours that is to
survive goes in a category of its own, as a sibling rather than a child.

The bar and the rail diverge the same way — two bars built at once, different item order, a fifth
item on the rail — so a patch touching navigation has to be run both ways round, and so does its
**settings screen**, not merely its behaviour. v1.12.0-dev.1 shipped five rows nobody with a
foldable could see, because the rail's behaviour was driven from the settings *file* across 81
combinations while the settings *screen* was only ever opened with `tablet_mode` false.

`adb shell "run-as <pkg> ..."` to write `tablet_mode` into the per-account file, force-stop, and
launch: the whole switch costs a few seconds, and it belongs in every run that touches a screen.

**Sync's own settings search mis-lands in tablet mode, and that one is not ours.** Searching a
row and tapping the result scrolls to the wrong place entirely — measured on Sync's own
`Autohide FAB`, which landed in the `General` category, with a control build carrying neither
`Choose what the bottom bar shows` nor `More actions on the floating button`. It behaves in
portrait. Do not go looking for a patch to blame when a search result lands somewhere odd on a
tablet; check portrait first, and check a stock row.

### A patch that touches the settings must be tested against Backup

**Back up and restore on a device before shipping anything that adds, moves, hides or changes a
settings row.** Sync's Backup screen walks every setting it knows and writes them out, and its
Restore reads them back, so a row that is not where the app expects breaks a screen that has
nothing to do with the patch. Taking the Ultra subscription rows out is what crashed the Backup
screen the moment it opened, and that shipped in v1.7.0 because the change was tested on the
screen it altered and nowhere else.

Open Settings → Backup, *Backup now* through to **Backup complete**, then *Restore from backup*
through to **Settings restored**, and check the written file is valid JSON holding the new keys.
It is a couple of minutes and it is the only thing that catches this.

### Measure, do not infer

Reading the app is how a patch gets written. It is not how a broken one gets diagnosed, and
mistaking the one for the other is expensive: an address in a post that would not draw as a link
took nine prereleases, and the ones that shipped a cause inferred from the bytecode were wasted,
including a patch that had to be withdrawn. The link was being made correctly every time and
thrown away afterwards, by a call that reading the code had already dismissed.

The tell is two readings that cannot both be true — a span applied to a builder, and the same
builder returning text with no spans. At that point stop reading and instrument. What settles it
is the object's own state at the moment it is used: identity (`System.identityHashCode`), the
thread, fields read by reflection rather than deduced, and `new Throwable().getStackTrace()` to
name the path that got there. Reflection over `getDeclaredFields()` by type works where names
cannot, since the app's are obfuscated and change with every build.

Make the instrument prove itself: log the first few calls unconditionally, so that a capture
showing nothing means the diagnostic is not running rather than that the code never ran. That
distinction cost two rounds on its own, once to a hook that was never reached.

### Local toolchain

None of this is in the repository; recreate it in a scratch directory as needed. It is worth
the setup time, since it turns a CI round trip into a few seconds.

1. **JDK 21** — Gradle needs it, and morphe-desktop is compiled for class file version 65.
   The system JDK may be older.
   `curl -L "https://api.adoptium.net/v3/binary/latest/21/ga/linux/x64/jdk/hotspot/normal/eclipse" | tar xz`
2. **Android SDK** — the extension modules are `com.android.library` projects and need
   platform 36. Install `commandlinetools-linux`, accept the licences, then
   `sdkmanager "platforms;android-36" "build-tools;34.0.0"`. Point `ANDROID_HOME` at it.
3. **A GitHub token with `read:packages`** — the Morphe plugin and libraries come from GitHub
   Packages. Export as `GITHUB_ACTOR` / `GITHUB_TOKEN`. Without the scope the plugin will not
   resolve and the build fails before it starts.
4. **morphe-desktop** — the patcher, for actually applying patches. Grab the `-all.jar` from
   the latest release of `MorpheApp/morphe-desktop`. **Sign with the keystore kept at
   `~/.android/sync-up/morphe.keystore`** — pass `--keystore=$HOME/.android/sync-up/morphe.keystore`
   — rather than letting the patcher make one. It lives outside the scratch directory on purpose:
   a scratch directory is wiped between sessions, and a new key means `adb install -r` is refused
   as a signature mismatch, which costs an uninstall and a reinstall of the app's data to get
   back to a device that is still signed in. The copy there signs as `CN=Morphe`, SHA-256
   `dde016e1…b482`, which is what is on the test device.
5. **A Sync APK** — the supported build, `v23.06.30-13:39`. One is at
   `~/Downloads/sync-revanced/` on this machine.

   **Sign in, or half of what is worth measuring never happens.** Reddit answers the API 401
   unauthenticated, so the feed is empty, nothing draws, and anything watching a view per frame
   is being read on a screen that produces a frame or two a second. A build patched with the
   `AAAAAAAAAAAAAAAAAAAAAA` placeholder from the recipe above **cannot** sign in — the authorize
   page comes back blank, and the only thing that says why is the WebView's own console line in
   logcat naming `client_id=AAAA…`. Patch with the real `client-id` and it loads. The account's
   credentials are in `~/reddit-creds.txt`; **never commit either, and never write the client id
   into a file in the repository** — pass it on the command line. The fresh account's Frontpage
   is nearly as quiet as no account at all, so switch it to the All feed.

   Two things about typing them in: `adb shell ime disable` is the wrong move here, because with
   no enabled keyboard the system puts up its input-method chooser over the form and eats the
   rest of what is typed. The password field disables suggestions by itself, so leave the
   keyboard alone and move between the two fields with `KEYCODE_TAB`.
6. **The emulator comes up locked, and a locked device has no app.** The AVD here carries a
   device lock, so after a cold boot the user is `RUNNING_LOCKED` and credential-encrypted
   storage is shut. In that state Sync's components are not registered at all: `am start`
   answers `Activity class ... does not exist`, `monkey` says *No activities found to run*, and
   `screencap` returns a black image. None of that is the patch — the stock APK does exactly
   the same. `adb shell cmd lock_settings verify --old <pin>` unlocks the user, and
   `input swipe` plus the PIN dismisses the keyguard. Typing with `input text` goes through the
   keyboard's autocorrect, which mangles a username; `adb shell ime disable <the IME>` while
   typing credentials avoids it, and it has to be enabled again afterwards.

Building and patching, with all of the above exported:

```sh
./gradlew buildAndroid                       # -> patches/build/libs/patches-*.mpp
java -jar morphe-desktop.jar patch \
  -p patches/build/libs/patches-*.mpp \
  -O client-id=AAAAAAAAAAAAAAAAAAAAAA -e "Spoof client" \
  -e "<any patch that is off by default>" \
  --unsigned -o out.apk <the Sync APK>
```

`Spoof client` validates its `client-id` against `^[\w-]{22}$`, so any 22 character string
gets past it. The result is not a usable app, but patch application is what is being tested.
Grep the output for `Applied:` and `FAILED`.

### Inspecting the APK

Fingerprints have to be written against real bytecode, never guessed. `androguard` via
`uv run --with androguard==4.1.4` reads the DEX directly; disable its logging first with
`from loguru import logger; logger.remove()` or it floods stdout.

Two properties of Sync's build make this tractable:

- **Source file names are retained.** Classes are obfuscated (`La8/a;`), but `classDef.sourceFile`
  still says `OkHttpHelper.java`. Several existing fingerprints match on it, and it is usually
  the most stable thing available.
- **Field names often survive where method names do not.** `MaterialRow`'s setters are `d`, `k`
  and so on, but they assign `mTitle` and `mIcon`, which is how the right ones were identified.
  When a method is ambiguous, look at the fields it touches.

### Compile checking extension Java without Gradle

For a fast loop on extension code alone, compile it against the real okhttp and `android.jar`
with the Eclipse compiler (`ecj`, a single jar that runs on any JRE), stubbing the Morphe
shared library from this repository's own sources. This catches things like lambda capture of
a non-effectively-final local, or a subclass reaching a protected member through a superclass
typed reference, both of which have happened here.

### Smali gotchas

Errors found the hard way, all of which compiled cleanly and failed at patch or run time:

- **Field references need a colon**: `->fieldName:Ltype;`. Androguard prints them with a space,
  so copying its output verbatim produces `missing COLON` at patch time.
- **Check whether a type is an interface before using `invoke-interface`.** `Lxa/d;` looks like
  one but is a `public abstract` class, so it takes `invoke-virtual`. The wrong choice patches
  successfully and fails verification at runtime, which looks like an unrelated bug.
- **Check the register count** before using `v0` in injected code. `get_registers_size()` minus
  the parameters is what is free.
- **A parameter register is not still the parameter later in the method.** Sync's compiler
  reuses them as scratch locals: in `PostMoreBottomSheetFragment.o2`, `p1` holds the view that
  was passed in for exactly two instructions before it is overwritten. Injecting at the end and
  reading `p1` silently handed the extension the wrong object, and because it was still a
  `View` subclass nothing complained. Disassemble the *patched* APK and read the registers at
  the injection site rather than trusting `p1` to mean what it says.
- **`SyncPreference.S` reuses the holder's register for its own view two instructions from the
  end.** Injecting before the final return and passing `p1` therefore hands a `View` where an
  `androidx.preference.h` is declared, and the class fails to verify the moment the settings
  open — `VerifyError: register v5 has type Reference: android.view.View but expected
  Reference: androidx.preference.h`, which takes the app down rather than the screen. Reading
  the disassembly is not enough here: the last few instructions *do* use that register as the
  holder, through an `iget-object v5, v5, ...itemView` that quietly redefines it. Inject at the
  start, and `post()` anything that has to happen after the row has drawn.
- **Do not add a `new-instance`** to a method another patch fingerprints by counting them. The
  Redgifs fingerprint counts `NEW_INSTANCE == 1` in the method it hooks.
- **Injecting before the final `return` does not cover every path.** `Loc/b;->F` jumps from the
  middle of the method straight to the return when the view measures its text ahead of time, so
  a call placed in front of that return is never reached by the path that matters, and nothing
  is logged at all. Anchor on an instruction every path executes — the one that reads the value
  being passed around is usually it — and resolve the branch targets before choosing an index.
- **An extension class the patch points a call at has to be `public`.** It is reached from
  whatever app package the call was injected into, so a package-private one throws
  `IllegalAccessError: Illegal class access` the first time that call runs — which for anything
  on a startup path means the app will not open. `translate/TranslatePatch.kt` checks the access
  flags of every class it calls into before it injects anything, which turns this into a patch
  failure rather than a crash on a device. The same applies in reverse to app methods the
  extension calls: see the two accessors on `Lda/d;`, opened by that patch.
- **An injected call cannot go into a method that takes an array.** What assembles inline smali
  builds a method around the instruction out of the target method's own parameters, and does not
  read an array among them. It fails as `NoSuchElementException: Collection is empty` from
  `InlineSmaliCompiler.compile` — nothing about arrays, and nothing about the line at fault
  beyond the patch's own stack frame. Naming the register by number rather than as `pN` does not
  help, since the signature is built either way. `RedditProvider.bulkInsert(Uri, ContentValues[])`
  cannot be hooked; its callers, which take no arrays, can.
- **okio is in the app under another name, so never name it.** okhttp is there under its own
  name and compiles fine against the extension, but `okio.Buffer` throws
  `NoClassDefFoundError: Lokio/Buffer;` the first time it is reached and takes the app down —
  which for an interceptor means a crash on whatever the user just tapped. Reading a request
  body is where this comes up, since writing one to a sink is the documented way. Read the bytes
  off the body object instead: what `RequestBody.create(MediaType, byte[])` returns holds them
  in a field, found by its type rather than its name, since the names do not survive R8.
- **A values file holding nothing but `<item type="id">` is refused when the resource table is
written back**, as `XmlEncodeException` naming the file and the line, and the patcher then
rebuilds the whole table as a fallback. Declare an id where it is used — `@+id/name` in the
layout — which costs no file at all and is what the id is for.

**Most of the app's drawables are not there any more.** R8's resource shrinker left every
  unused one's name and id in place and replaced the drawing with `<x/>`, a stub whose element
  names a class that was shrunk away too. A row given one patches perfectly and takes its whole
  settings screen down the moment it is opened, with
  `InflateException: Class not found x` and nothing naming the drawable. Only the drawables the
  app still uses itself survived as a real `<vector>` — `outline_vpn_key_24` is a stub,
  `outline_lock_24` is not — and nothing in the name says which. `patches/util/Drawables.kt`
  reads the drawable and answers with nothing where there is no real drawing, so the row goes
  without an icon rather than the screen coming down; name icons through it. Nothing cosmetic
  should be able to fail a patch: `Spoof client` is what lets the app sign in at all, and a
  credit line or a row's icon failing to find what it expected would take that down with it and
  leave the app unable to reach Reddit. Check the tint too:
  a surviving vector whose `fillColor` is a literal `#FF000000` or `#FFFFFFFF` disappears in one
  of the two themes, while the ones Sync uses on its own rows carry
  `android:tint="?attr/..."` and follow the theme.
- **Two methods on a class can have the same signature.** `Loc/c;` has both `u()V` and `p()V`,
  so a predicate matching "no parameters, returns void, on `Loc/c;`" finds the wrong one. Anchor
  on what guards or surrounds the call instead.

## How Sync is put together

Findings from reading the APK, recorded so they do not have to be rediscovered.

**Networking.** Sync bundles a *modified* Volley whose `BasicNetwork.performRequest` builds
okhttp3 requests directly rather than using `HttpURLConnection`. It obtains its client from
`OkHttpHelper` (`La8/a;`), so a single interceptor there sees every Reddit API request. This is
what `interceptHttpRequests` hooks, anchored on `BasicNetwork` because Volley is not obfuscated,
unlike the four near identical client builders in `OkHttpHelper`.

**Images do not go through the Volley client.** Sync registers its own Glide loader in
`YourAppGlideModule` and hands it `OkHttpHelper.a()`, a *different* client again. The Glide
OkHttp integration is declared in the manifest and its `OkHttpUrlLoader$Factory` builds a
client of its own, but Sync's registration supersedes it, so hooking that one alone does
nothing. Anything touching images has to hook the client passed in `YourAppGlideModule`.
That class keeps its name, since Glide's generated code refers to it.

There are at least three distinct OkHttp clients in play: Volley's, Glide's, and the several
`OkHttpHelper` builds for other purposes. Before assuming an interceptor will see a request,
find out which client actually issues it.

**Reddit only answers with what was asked for, and Sync always asks for the same two things.**
Every request Sync makes for comments carries `?always_show_media=1&profile_img=true` — the
thread, and the `/api/morechildren` this bundle stands in for. `profile_img=true` is what puts
each author's picture into the answer, as `profile_img` on the comment itself, and
`PostParserHelper` stores it from there into `post_author_profile_pic` and from nowhere else:
nothing goes back for it afterwards. So a replacement request that leaves the parameter off
produces comments that are drawn with no picture beside the name, for good, while the ones that
came with the thread have theirs. That is what made avatars disappear below a "view more", and
anything else that stands in for one of Sync's requests has to carry what Sync asked for.

**Requests are Volley `Request` subclasses**, one per endpoint, named for what they do
(`OAuthCommentsRequest`, `GrabRedgifRequest`, `ImgurGalleryRequest`). They parse with
`org.json`, and Sync reads raw markdown: `body` and `selftext`, never `body_html`. It has no
`removed_by_category` field at all.

**Thread URLs are `/r/<sub>/comments/<id>/_/...json`** against `oauth.reddit.com`. Patcheddit's
Boost patches match `^https?://\w+\.reddit\.com/comments/`, which never fires on Sync.

**Every settings screen is a `pa.d`, and `pa.d.t3(int)` is where its rows come to exist.**
A screen of Sync's own is its own fragment, so there is nowhere of ours to run code from on one
— unlike the translation screen, which is a fragment of ours and can therefore turn its own rows
on and off directly. `t3` loads the screen's XML, has a single return that every path reaches,
and runs for every screen there is, so a call placed before that return is handed the fragment
with its rows already loaded. A screen that does not hold the rows in question is left alone.
`y(key)` is `findPreference` and `Preference.q0(boolean)` is `setEnabled`; `SettingsRows` fades
whatever is turned off, since Sync colours every row's words as it draws them whatever state the
row is in.

**Sync's Backup writes out the per-account settings file, so anything kept there travels in
it.** The file is handed to whoever is helping and copied between devices, so nothing of ours
that is a secret belongs in it: the client id and the three things beside it live in
`sync_up_client`, and a PIN in `sync_up_locks`, both files of our own that Sync has never heard
of and therefore cannot write out. A PIN of four digits beside the salt it was hashed with is
worked out from such a file in no time. Both classes move anything an older build of ours left
in Sync's settings across on first use and take it out of Sync's, so a backup made afterwards is
clean; check by reading the written file rather than by reasoning about it.

**An activity that is stopped before it builds its screen has no window of its own.**
`HomeActivity.h0` decides what to ask for before the app opens, and the path that asks calls
neither `l0()` nor anything else that sets a content view, so until the lock is satisfied the
activity has nothing. Sync can do that because a `BiometricPrompt` is the system's window and
goes on taking input; a dialog of ours is the app's own, and when it goes the app has no window
at all. Input dispatch then times out — `ANR in ... Reason: Input dispatching timed out
(Application does not have a focused window)` — and the app is bricked until it is force stopped.
A dialog shown from inside `onCreate` is also torn off as a leaked window the first time the
activity is rebuilt, which a foldable does merely by being opened. Anything of ours that locks
the way in has to let the app build its screen first, or not lock there at all.

What works is to cover `MainActivity` instead: hook its `onCreate`, post, and put up a full
screen opaque `Dialog` over a screen that is already whole. Only Sync's *reading* of
`biometric_start` is answered in `h0`, never where it goes next, so the app always reaches what
builds its screen. Losing the cover then leaves a working app rather than a brick, which is the
right way round. Two things that only show up once it is full screen: an `EditText` needs
`IME_FLAG_NO_EXTRACT_UI` or the keyboard takes the whole screen for a field of its own in
landscape and what is being asked goes with it, and the content needs a `ScrollView` or the way
out is pushed off the bottom with the keyboard up. **Force a rotation** —
`settings put system accelerometer_rotation 0; settings put system user_rotation 1` — as the
stand-in for a device that folds; both of those were found that way and neither shows in
portrait.

**Changing account builds the screen again, and sometimes the whole process again.** The logs
say `Start proc` for the one and leave `MainActivity` created afresh for the other, and which of
the two happens is not consistent. Anything hooked on `MainActivity.onCreate` therefore runs a
moment after an account has been changed, so a lock asked there asks a second time for what the
account switch has just been given. A flag in the process does not survive the restart; what
does is a note left in our own settings and thrown away as it is read, so that it can only ever
excuse the one prompt, with a minute's expiry in case nothing reads it. Keep the in-process flag
as well for the rebuilds that do not restart anything — a foldable being opened is one.

**A local bundle is named after the version in `gradle.properties`, which the release moves.**
Patching with `patches-<the version you last typed>.mpp` goes on succeeding against a file from
hours ago, and what is then tested is not what was just built. Take the newest instead:
`ls -t patches/build/libs/patches-*.mpp | grep -v -e sources -e javadoc | head -1`. Two fixes
were "verified" here against a stale bundle before this was noticed.

**Sync's own fingerprint prompt can be stood down by answering the setting for it.** Each of the
three sites reads `SharedPreferences.getBoolean("biometric"/"biometric_start", false)` with the
same three registers, so that one instruction is swapped for a static of ours taking the same
three. Answering `false` is what lets a prompt of ours offer the fingerprint *instead of* Sync's
rather than after it. `androidx.biometric` is in the app and its callback class is public, so a
compile-only stub naming the obfuscated members — `s` is authenticate, `e$a` is the builder with
`d`/`c`/`b`/`a`, and the callback's `c` is onAuthenticationSucceeded — is enough to put that
prompt up. The account being unlocked has to be remembered between the two injections, because
the register holding its name is reused a couple of instructions later.

**`HomeActivity` is not where the app ends up.** An ordinary run opens it, it sends the app on
to `MainActivity` and finishes itself, and `MainActivity` is what stays on the screen. Anything
shown from `HomeActivity.onCreate` is therefore taken off the screen a moment after it arrives —
a dialog posted from there is gone before it can be read, while having already counted as shown.
`OnboardingActivity` is the first run's, and it stays. Read `dumpsys activity activities` for
`topResumedActivity` rather than assuming the first activity named is the one in front.

**The feed keeps its place as a row number, and the cache is swept from under it.**
`RedditProvider.delete` runs `DELETE FROM tbl_posts WHERE age <= '<now - 48h>'` and the same for
`tbl_lists`, plus `tbl_viewed_new` at 168h, and the only thing that calls it is `bulkInsert` —
so every new page of posts sweeps whatever has aged out. `VerticalPostsFragment` saves its place
as a `LinearLayoutManager` anchor *position* under the key `"SyncRecyclerView"`, in `w0` from
`n2()` and in `u0` from `l2(Bundle)`, and `M3(Cursor)` reads it back. A position stops meaning
the same post once rows above it are swept, and androidx then drops a pending position that is
no longer a real row and lays out from the top. `Restore position` does not appear with it,
because that snackbar is only ever built by `q4()`, the deliberate jump to the top.

`M3` is the *only* caller of the adapter's `S(Cursor)`, so it is the one place to hook, and
`PostAdapter.o(int)` is `getItemId` answered out of the `hash` column — a post identifier that
survives its neighbours being deleted, and is what `keepFeedPositionPatch` anchors on.

Three things about that method were found the hard way, and all three cost a round:

- **Opening a post does not stop the feed.** Sync shows `CommentsActivity` translucently over
  it, so `n2()` never runs and `M3` never restores on that path — the position is kept simply
  because nothing was destroyed. The restore only happens when the screen is genuinely rebuilt,
  which is what makes the bug rare, and it means a note held in memory under the old fragment is
  gone by the time the new one asks. The note has to travel in the bundles themselves.
- **`M3` holds one `return` but several ways of reaching it.** `if-nez v0` jumps from the middle
  straight to that return whenever the feed already had posts — every time but the first, and so
  exactly the times that matter. Counting `return` opcodes does not catch this. Worse, moving the
  call earlier does not help either: the branches that skip the restore are retargeted onto
  whatever is inserted in front of their target, so a call placed before the `Bundle.remove` run
  is jumped over too. What works is to inject only at index 0, where nothing can branch over it,
  and `post()` the rest.
- **The adapter is already empty by the second save.** The app saves twice as a screen goes away
  and `getItemCount()` is 0 on the second, which is the call that carries the outState bundle —
  the one the rebuilt screen reads back. Working the position out afresh there yields nothing, so
  the second call has to fall back to what the first worked out or the note never reaches the
  bundle at all.

**To reproduce it, shorten the window rather than waiting two days.** `Calendar.add` is reached
twice in `delete` with a shared `const/16 v0, -48` and `const/16 v3, 11` (`HOUR_OF_DAY`); writing
`12` (`MINUTE`) and `-2` in front of each of the two calls that go on to run the `tbl_posts` and
`tbl_lists` statements makes the whole thing happen in the time it takes to read a post, and
leaves the `tbl_viewed_new` week alone because that branch never crosses the insertions. Scroll
to load a few pages, wait out the window, then scroll to the bottom: the next page load sweeps
the rest and the list collapses — measured here from 50 rows to 25, with the reader's post moving
from row 24 to row 5.

**The recycler's own members, since the classes keep their names but nothing else does.**
`RecyclerView.e0()` is getAdapter and `r0()` getLayoutManager; on `RecyclerView$h` (Adapter)
`n()` is getItemCount and `o(I)J` getItemId; on `RecyclerView$p` (LayoutManager) `n0(View)` is
getPosition and `D1(I)` scrollToPosition; `LinearLayoutManager.G2(I I)` is
scrollToPositionWithOffset (it also invalidates any pending `SavedState`, so it settles where the
list lands rather than racing a restore) and `g2()` findFirstVisibleItemPosition.
`LinearLayoutManager$SavedState` keeps its name too, with `a`/`b`/`c` for the anchor position,
offset and from-end flag. Sync's own `PostsRecyclerView.h2()` already answers
findFirstVisibleItemPosition across all three of its `Custom*LayoutManager`s.

**The floating button's place jumps about on its own, and anything standing in for it inherits
that.** On a refresh, on a jump to the top and on taking the *Restore position* offer, Sync lays
the button out at the place it sits when the bottom bar is away — `y=2190` on a 2400 tall screen,
which is inside the bar — for a frame or three, then moves it up to where it is shown (`1917` or
`1762`). It is drawn at full size and full opacity while it is down there, and the excursion
repeats several times over a refresh. `translationY` stays `-63` throughout, so nothing is
fighting over the offset; it is the laid-out position that moves.

**That is the app's own, not this bundle's.** Measured with `extraFabActionsPatch` applied but
inert — a fresh process with no extra actions chosen, so no surface is built and `over()` returns
before it touches the button — and the excursions are still there, unchanged. The earlier reading
that Sync fades the button in, and that the fade covers those frames, was wrong: the fade seen in
a capture is Sync's animator interpolating up from the zero *this patch writes*, and with the
alpha left alone the button reads `1.0` the whole way. The surface damps the jump instead: a step
of about the button's own size or less is followed at once, and anything further has to stay
where it jumped to for a few frames running before the surface goes with it. The surface then
sits still through the wobble while the button underneath it bounces.

**Damp both directions.** The first go at this followed a jump *upwards* at once and only made a
drop wait, on the reasoning that a drop is what the wobble does. It is not the only thing that
does: a screen change lays the button out high for a moment, the surface took that at once, and
the slow release then left it stranded about twelve hundred pixels above the button for several
frames — which reads as the button having vanished. Measured as `held=948` while the button sat
at 1917. A rule that is instant one way and patient the other latches onto whichever transient
goes the instant way.

**Counting frames is not enough, because the button genuinely stays there.** On a *pull* to
refresh the button sits at the lower place for as long as a finger keeps moving, so any patience
runs out and the surface follows it down across the bar — measured as the settle counter
reaching its limit and `held` going to 2041 at frame 517 of a drag. The rule that actually holds
is physical rather than timed: read where the bottom bar is and never put the surface over it.
`SyncBottomNavigationView` sits at `y=2127 h=273` on a 2400 tall screen while this happens, so
the button at `y=2190` is plainly inside it and the button at `1917` is not. The bar is found by
shape, not by name — the showing child as wide as its parent, against the bottom of it — so a bar
sliding away carries its own position with it and the room reappears as it goes, which is what
lets the surface follow the button down when the bar really has gone.

**A soft keyboard moves the button most of the way up the screen, and the window does not
shrink.** Opening the search sheet and tapping its field puts Sync's button at `y=1097` on a
2400 tall screen, from the `1917` it was resting at, and back again when the keyboard goes —
measured frame by frame. A surface that follows it is a surface stranded in the middle of the
feed, which is exactly what a reader sees, at about 45% down.

Two readings matter about how to tell. The button's **parent stays 2400 tall throughout**, so
nothing about the window's own height says a keyboard is up; the coordinator passes the inset
to its children instead. What does say it is `getRootWindowInsets()`: `883/63`
(`getSystemWindowInsetBottom()`/`getStableInsetBottom()`) with the keyboard up against `63/63`
without it, so the difference between what the system is taking now and what it always takes is
decisive and needs nothing past API 23 — `WindowInsets.Type.ime()` is API 30 and this is offered
from 23.

**The sheet is read as the bottom bar while it is up**, which moves `noLowerThan` from `1980` to
`1160`. That is conservative rather than wrong — it only makes the surface stay put more often —
but it is why the number moves, and it is not the keyboard shrinking anything.

**The emulator cannot finish this one, and the reason is worth knowing.** The search sheet
covers the whole screen on a phone, so the activity behind stops drawing and only two or three
pre-draws land while the keyboard is up — short of the four a jump needs before it is followed.
A fold leaves the feed visible beside the sheet, which supplies the frames. So the half that can
be measured here is the beginning of the move: the settle counter reaching `settlingAt=1097
settling=1` where the surface is allowed to follow, and staying at `settling=0` where it is not.

**"Autohide FAB" turned off hides the button, and that is Sync's — but it is ours to put
right.** Measured with the patch inert — *Show FAB* on, *Autohide FAB* off, no extra actions
chosen so no surface is built and `over()` returns before touching anything — and the button is
still `vis=4`. With autohide off the app never runs the path that shows its button, so it is
left invisible for good and there is no floating button at all. Nothing here writes the button's
visibility and the surface only mirrors it, so the surface went the same way.

It is put right rather than merely attributed: `SettingsSingleton.x()` hands back a `Settings`
whose fields keep their names, and `mainFab` with `mainFabAutohide` say exactly whether the
reader asked for a button that never hides. Where they do and the button is invisible, it is
shown. Where autohide is on, being invisible is the app doing what it was told and nothing is
touched.

**A flicker cannot be seen in a screenshot, and `screenrecord` drops the frame.** What settles it
is logging the button's position, opacity, visibility and scale on every `OnPreDrawListener`
call, printing only when the line changes and the first few unconditionally. A capture of the
same recipe before and after is what shows a two-frame excursion going away; a video of it does
not, since the recorder never captured the frame in the first place.

**An interceptor never sees a picture that is already kept.** Glide looks in its own cache on
disk before it goes to the network, so every route in this bundle — the Imgur unblocking above
all — is simply skipped for anything fetched once before. Measured: the same feed of
`/domain/imgur.com` opened twice produces the full set of requests the first time and **nothing
at all** the second, with the interceptor not reached once.

That is what a reader sees as thumbnails still showing Imgur's refusal while opening the same
post works. The two are different addresses — Sync asks for `i.imgur.com/<id>h.jpeg` for the
thumbnail and `i.imgur.com/<id>.jpeg` for the picture, the `h` being Imgur's own size suffix —
so the thumbnail is the one that was fetched and kept while the region was refused, and the
larger one was never fetched before and is routed normally. Imgur answers a refused region with
a notice that is a perfectly good image, so Glide keeps it like any other.

Both addresses do reach the interceptor and are read as `PICTURE`, and DuckDuckGo serves the
suffixed one as readily as the plain one — checked against both. Nothing about the thumbnail is
special except that it was already kept. `CachedPictures.watch()` therefore throws the kept
pictures away when a setting that decides *how* one is fetched changes, which is the only moment
the answer to an address can differ. Confirmed on a device: a reload that made no requests at all
made 42 after the toggle, and 40 of them were routed once the unblocking was turned back on.

Glide is `Lcom/bumptech/glide/b;` — the package survives, the members do not. `d(Context)` is
`get`, `b()` is `clearDiskCache` and insists on *not* being on the drawing thread, `c()` is
`clearMemory` and insists that it *is*. Only the settings that change how a picture is fetched
count: throwing every picture away because somebody changed whether an address is handed out when
sharing would cost a reader everything they have for nothing.

**Note that `android:dependency` is not an answer here.** It only keys off a checkbox, so a row
that should follow a list preference's value has to be turned on and off in code.

**Sharing and copying both go through `RedditHelper` (`Ld7/f;`)**, which is where an address
handed out can be changed. `u(Context, subject, url)` builds the SEND intent for a link — it is
the one that rebuilds a `v.redd.it` address, which is how to tell it from `t`, the one that
shares arbitrary text — and `a`, `b` and `c` put something on the clipboard, told apart by
whether they announce *URL copied to clipboard* or *Text copied to clipboard*. All five names
are the minifier's, so fingerprint them on those strings rather than on the names.

Anything hooked there runs on the thread that drew the menu, so it must not touch the network:
asking a Rimgo instance whether it is answering from one of these is a `NetworkOnMainThread`
away from taking the app down. Say what is already known instead. And change only a string that
is *wholly* an address — `a` and `b` carry comment text as readily as links.

**The navigation bar is a real menu, and the app settles what is on it exactly once.** There are
two of them and both keep their names: `SyncBottomNavigationView` extends Material's
`BottomNavigationView`, `SyncNavigationRailView` extends `NavigationRailView`, and both inherit
`NavigationBarView`, whose `g()` is `getMenu()` and is public, so an extension can reach the
items from outside Material's package. The bar inflates `res/menu/main_bottom_actions.xml` —
Posts, Actions, Explore, Inbox, as `menu_posts`, `menu_actions`, `menu_explore`,
`menu_messages` — and the rail takes `res/menu/main_rail.xml` through `app:menu` in
`activity_main_tablet.xml`, which is the same four plus `menu_settings`. `res/menu/main_bottom.xml`
is one of the shrinker's `<x/>` stubs and is not used by anything.

`MenuItem.setVisible` appears **twice in the whole of both classes**, both in the bar's
constructor: Actions unless `navigationBottomActions` is set, and Inbox while nobody is signed
in. The rail hides nothing at all, so in tablet mode the inbox item is there even signed out.
Nothing afterwards changes an item's visibility, which is what makes it safe to read the bar
once and treat that as what the app meant to draw.

The place to hook is the method that dresses the bar — the only one on either class that hands
Material a `ColorStateList`, which is how `bottomNavigationItemsPatch` finds it rather than by
its minified name. It runs as the bar is built, after the constructor's own hiding, and again
through `h()` whenever the theme or the settings change, and its single return is reached by
every path on both classes. In tablet mode **both** bars are built, so anything keyed on the
view has to expect two.

**A settings row of ours must not live inside one of Sync's categories.**
`PreferencesGeneralFragment.C3` hides the `drawer` and `bottom` categories whole when
`pa.d.S3()` says tablet mode, so rows added inside `bottom` vanish on a foldable — see
[Everything must be tried in tablet mode as well](#everything-must-be-tried-in-tablet-mode-as-well).
`bottomNavigationItemsSettingsPatch` builds a `PreferenceCategory` of its own, with a
`CategoryHeaderPreference app:categoryTitle=...` as Sync's own categories do, and inserts it as
the next sibling of `bottom` so it still reads as a continuation of it.

**The two bars do not draw the same four items in the same order.** The bottom bar inflates
Posts, Actions, Explore, Inbox; the rail inflates Posts, Explore, Inbox, Actions, Settings. So
nothing keyed on position may assume either order, and because both bars are dressed in tablet
mode, a diagnostic that does not name which bar it is reading alternates between them and looks
like a bug — an 81 case sweep reported one failure that was only the rail's line being read for
the bottom bar's.

**Material caps the items, and hiding one does not make room.** `BottomNavigationView.f()` is
`getMaxItemCount()` and answers **5**; the rail's answers **7**. The check is in
`NavigationBarMenu.a()` — `menu.size() + 1 > cap`, throwing `IllegalArgumentException` — and
`size()` counts every item in the menu whether the bar is drawing it or not. A bar that declares
four therefore has room for exactly one more however many are hidden. What gets past the cap is
*replacing* an item rather than adding one: an item already in the menu, given another name, icon
and meaning, costs nothing.

**One method answers a tap on either bar.** Both bars are their own `OnItemSelectedListener` and
both hand the item straight to `Lhc/a;->b(Context, ta.d, MenuItem)Z` — `NavigationViewHelper.java`,
which the build keeps, and the only method on that class taking three parameters. It compares the
id against six: `menu_posts`, `menu_messages`, `menu_explore`, `menu_search`, `menu_settings` and
`menu_actions` — note that **`menu_search` is in no menu at all** and `menu_settings` only on the
rail, so both are finished destinations nothing shows. Anything it does not recognise falls
through to `return false`, so an id of our own was already harmless before anything was injected.

Mind which way round Material reads that answer: the listener returning **true** is what makes
Material draw the item as the selected one, so a button that carries out an action rather than
going somewhere must answer **false**.

**The unread badge is built by id, from one method per bar.** `SyncBottomNavigationView.P()` and
`SyncNavigationRailView.Y()` — the only `()V` on either that asks `NavigationBarView.k(I)`
(`getOrCreateBadge`) — call it with `menu_messages`, then `L(true)`, `E(3)`,
`I(SizeHelper.c(4))`, `B(SizeHelper.c(3))`, `F(MessageCountHelper.a())`, `z(-42495)`, `A(-1)`, or
`o(id)` (`removeBadge`) where the count is not positive. The dressing method calls it, a message
arriving calls it, and the bar being attached calls it, so a correction appended to one path is
undone by the next: `bottomNavigationItemsPatch` stands in for the whole method instead and
reproduces those calls exactly. `getOrCreateBadge` is safe on an item the bar is not drawing — the
badge is simply attached to nothing — so it never has to be guarded.

**Leave the selected pill alone.** Material keeps the selected item **twice** — by id, which
draws the filled icon, and by position, which draws the pill — and reconciles the two only on a
real selection event. Any menu change can leave the position stale while the id stays right, and
a menu of ours changes whenever a row is turned over.

An attempt to control the pill cost four bug reports in a row and was taken out again. It had
been reasonable on the face of it: Sync marks a destination through `O(I)` on the bar and `X(I)`
on the rail, each eight instructions ending in `MenuItem.setChecked(true)`, and a button carrying
an action is not a screen. But neither of those runs at startup — Material's own `buildMenuView`
re-checks the item at the position it last had one, measured with the hook never once reached —
and a check cannot simply be removed, since every nav item is exclusive-checkable and
`setChecked(false)` on one of those *checks* it. What was shipped instead was a hidden item to
park the mark on, with `BottomNavigationView.f()` answered as 6 rather than 5 to make room for it.
On a device that produced a pill on the newly added button while the feed was still on Posts, a
pill that would not move when Posts was tapped, and a pill and a filled icon on different buttons
at once; tapping another destination and back repaired it every time, which is the tell that the
two halves had drifted apart.

So nothing here writes `setChecked`, adds an item for the mark, or touches the cap. What is left
is one static wrongness — replacing the first button leaves the pill on the replacement at
startup — and it is worth far less than the instability of trying to fix it. Fixing it properly
would mean writing `NavigationBarMenuView`'s remembered position directly, which is a private
member of an internal Material class.

**A setting of Sync's can be taken over, and hidden rather than removed.** `Show actions` under
Experimental writes `navigation_bottom_actions`, and that key appears as a string in exactly one
place — `SettingsSingleton.p`, which reads it into the cached `Settings` — while the field it
lands in, `navigationBottomActions`, is read in exactly one more: `SyncBottomNavigationView`'s
constructor. So the whole setting is one switch with one consumer, and
`bottomNavigationItemsPatch` answers it from a row of its own instead.

Two things make that safe to do. **Backup reads `SharedPreferences.getAll()`**, in
`PreferencesBackupFragment.i4()`, not the preference tree — so a row taken out of the XML does not
take its key out of a backup, and the key goes on travelling whatever happens to the row. And
`isPreferenceVisible` is in the resource table, so `app:isPreferenceVisible="false"` on the
element hides the row where it stands. Hiding beats removing: nothing in the app looks this one up
by name, so removing it would not have thrown, but a row still in the tree is a row anything
expecting it still finds — and taking rows out of a settings screen is what brought the Backup
screen down in v1.7.0.

Taking a setting over means writing it, not merely ignoring it: the bar's constructor reads it at
the next start, so a row saying one thing while the setting says another comes back as a bug a
restart later. It also means migrating — the row adopts whatever the setting already said the
first time it is read, or everyone who had turned it on silently loses it.

**Sync's actions are a numbered table with everything needed already in it.** `Lt7/b;` is
`ActionsManager.java`: `h(n)` is the name (carrying a `\n` where the sheet shows two lines),
`d(n)` the drawable id, `f(n)` whether the reader left it on under *Action visibility*, and
`ActionsBottomSheetFragment.w4(activity, manager, subreddit, n, null)` carries one out. Both
`h` and `d` answer a number they do not know by throwing `RuntimeException("Unknown action")`.
The numbering is in `patches/.../ui/SyncActions.kt`, shared by the floating button and the
navigation bar so the two cannot drift; it is read from the jump table, which runs the *reverse*
of the order the names appear in the code.

Those icons are safer than the ones a settings row wants: they are drawables Sync still draws
itself, so the resource shrinker left them whole, and Material tints a navigation item's icon from
the `ColorStateList` the bar is handed — so even one with a literal black fill follows the theme
on a bar, which it would not on a row.

**Menus are layouts, not lists.** The post overflow sheet is
`res/layout/dialog_bottom_post_more.xml`, a `LinearLayout` of `MaterialRow` views dispatched by
`view.getId()` in `onItemClicked`. Adding an entry the way Boost does is not possible; rows are
built and inserted at runtime instead, which avoids introducing an id resource.

**A menu opened from the toolbar is a different thing from the same menu opened anywhere else.**
`Ls9/f;` is the base of Sync's sheet menus, and `P1` sets `L0` — read back through `d4()` — when
the last touch was above the bottom of `id/toolbar`. In that mode the sheet is a *top* sheet:
`A3()` hands back `MaterialTopSheet` rather than `MaterialBottomSheet`, `C3()` skips colouring
the dialog's navigation bar, and `o2()` takes the behaviour off `id/design_bottom_sheet`
(`CoordinatorLayout$f->q(null)`). Both sheet themes inherit `enableEdgeToEdge`, so Material
registers `BottomSheetDialog$1` on the sheet, and the first insets it is handed build an
`EdgeToEdgeCallback`, whose constructor calls `BottomSheetBehavior.from` on the sheet that no
longer has one: `IllegalArgumentException: The view is not associated with BottomSheetBehavior`,
on the main thread, which is the whole app. Whether the insets ever reach the sheet is
device-dependent — the emulator here never dispatches them that deep, on either navigation style
and with or without a cutout, so the crash cannot be reproduced locally even though the
behaviour is demonstrably gone. `toolbarMenuCrashPatch` answers Material's lookup before it is
made. The sort chip under the subreddit title never enters this mode, which is why only the two
toolbar buttons were ever affected. The reporter confirmed on v1.10.0-dev.11 that the crash is
gone on a device that had it, so the mechanism read out of the bytecode was the right one — a
fix shipped on `build(Needs bump):` precisely because it could not be reproduced here, and
confirmed by the one person who could.

**Text is built, then handed to a view.** `Loc/c;` is a builder: characters in a `StringBuilder`
and a list of spans beside them. `Loc/c;->d()` returns a `SpannableString` when that list holds
anything and a plain `String` when it does not. `Loc/b;` is the text view that reads it — `A()`
hands back the builder *after resetting it*, `F()` takes the built text and sets it. Sync finds
its own tappable spans in `Loc/b;->onTouchEvent` through the `Lnb/a;` interface, which the link
span `Lmb/d;` implements. `Lmb/d;` paints with nothing but the view's `textColorLink` and adds no
underline, so a link that has lost its span is indistinguishable from the words around it.

**A preview is drawn in full and then stripped.** `Lnc/d;->c()` runs the SAX parse and, when
`Lnc/a;->d` is set, finishes by calling `Loc/c;->p()`, which drops every span and keeps the
characters. `Lnc/a;->c()` sets that flag, and it is the option set used by both
`SimpleSelftextPreviewTextView` and `CardSelftextPreviewTextView`, so a post's body was drawn as
inert text in every layout until `keepSelftextLinksPatch`. `SimpleHolder` draws the post header
in `CommentsActivity` as well as feed rows, so the post screen was affected too, and Sync's
`slideSelftextPreviews` setting only chooses between two paths that both end at the strip.

**Interceptors must not assume how a response is labelled or written.** A rewrite that reached
threads was skipping listings, and either of two guards could account for it; Reddit no longer
answers the API unauthenticated, so which one it was could not be established, and both were
dropped. Do not gate on `Content-Type` being `application/json` — the undelete interceptor asks
nothing about the kind and works on every listing — and let a regex over a body tolerate `\/`,
since JSON may escape the slashes in a URL. Writing them back unescaped is valid either way.

**Requests made while answering a request do not pass through the interceptor.** `ImgurAlbum`
asks Imgur what an album holds from inside the answer to Sync's own album request, over
`HttpURLConnection` — so none of the routes saw it, and a reader with a proxy configured still
could not open an album. Anything of ours that reaches the network from outside an okhttp chain
has to be offered the routes explicitly; `ImgurFetch` is where that is done.

**Sync registers `imgur.com` and `i.imgur.com` as deep links**, on
`.ui.activities.IntentActivity`. `adb shell am start -a android.intent.action.VIEW -d
"https://imgur.com/a/<id>" -n com.laurencedawson.reddit_sync/.ui.activities.IntentActivity`
therefore opens any Imgur address of any kind straight into Sync's own viewer, which beats
hunting for a post that happens to link one. Without `-n` the default browser takes it.

**Imgur refuses whole regions**, the United Kingdom among them, and what arrives is a notice
rather than the picture. Three ways round it, and they do not cover the same ground — measured,
not assumed:

- **DuckDuckGo's image proxy**, `external-content.duckduckgo.com/iu/?u=<address>`, serves one
  still picture. Asked for an album page, a video, a dead id or an address with no scheme it
  answers **400 with a small SVG**, and an SVG apology handed to an image decoder draws as a
  broken picture rather than as nothing — so it is only ever offered a picture. It takes the
  address raw or encoded, and ignores whether the ending matches the real type, which is why
  the browser extensions append `.png` to a bare id. An **animated GIF comes back byte for
  byte** — measured against a known one, same length, same `image/gif` — so a gif needs no
  other route. What looks like it mangling one is Imgur: asked for the `.gif` of a video post,
  Imgur itself answers `image/jpeg`, and Rimgo hands back the same bytes.

  **So videos and albums cannot be served by this route at all**, and no amount of code changes
  that. `.mp4`, `.gifv`, `/a/<id>` and `api.imgur.com` each answer 400 with the SVG.
- **Rimgo** serves media at `/<name>.<ext>` and keeps Imgur's own shape for pages, so an album
  is `/a/<id>` or `/gallery/<id>` as HTML, each item written as `src="/<id>.<ext>"` — which is
  how an album is recovered in a refusing region, where the page, the embed and the API are all
  refused and the archive only holds what someone captured. `.gifv` is **not** media to an
  instance: it answers with the same page Imgur does, so a route has to ask for the `.mp4`.

  **Serving media and serving albums are two different abilities.** Of the 23 published
  instances, one served an album page whole, two served media perfectly while answering 403 to
  every album, and the rest were rate limited, refusing or gone — so an album has to be asked of
  each chosen instance rather than only of the one that is carrying the pictures, and an instance
  that cannot do albums must be rested rather than dropped.
- **A proxy** carries the request itself, so it answers anything including the API. An
  interceptor cannot change the proxy of the client it sits on, so the request is carried out on
  a client of our own and the reply handed back to the chain.

**Of the icons an alert would want, only some survived.** `outline_report_24`,
`outline_info_24` and `outline_close_24` are real vectors carrying `android:tint="?attr/..."`;
`outline_warning_24`, `outline_error_24` and every `chevron`/`arrow_forward`/`navigate_next` of
that family are stubs. The one real chevron, `material_ic_keyboard_arrow_right_black_24dp`,
has a literal black fill and so disappears in the dark theme — tint it at runtime with the
colour the row's own title has just been given, which is what the app sets from the theme.

**An instance answers differently depending on who is asking.** Several Rimgo instances hand a
browser-like `User-Agent` a 7 KB error page and hand `Dalvik/2.1.0` the real one — measured on
the same address a second apart. A survey run from a desktop with curl therefore reports
instances as broken that work perfectly in the app, which is how the first count of them came
out far too low.

**Being on the published instance list says almost nothing about working.** Asked for the same
picture, the 23 instances LibRedirect publishes answered nine different ways: nine served it,
several answered 429 because Imgur rate limits them, some 403, 404 or 500, four did not resolve
at all — and **two answered 200 with a page of HTML**, because they route a media address to
their post handler. So a health check must ask what the reply *is*, not merely whether it
arrived: status 200 **and** `Content-Type: image/*`. `/removed.png` is the thing to ask for —
Imgur's own placeholder for something taken down, tiny, permanent, and it exercises the whole
path including whether Imgur is answering that instance at all.

**`RootPreference` takes the screen's id for its own key.** It reads `preference_ref` as an
integer and calls `setKey(Integer.toString(it))` in its constructor, so an `android:key` written
in the XML is replaced and `findPreference("my_key")` finds nothing. Look one up by the id as
text instead. It is usable from a screen of ours, though: what it does by default is cast the
activity to `PreferencesActivity` and call its screen lookup, and our screens are in that
activity.

The library's own members, established the same way and used by the alerts: `G0` is setTitle,
`E` getTitle, `H0` setVisible (final) and `L` isVisible, `s0` setIcon by id, `t0` by drawable,
`C0` setSelectable, `B0` setOrder, `u` getParent; on `PreferenceGroup`, `P0` is addPreference,
`X0` removePreference, `Q0` findPreference, `T0` getPreference and `U0` getPreferenceCount.

Looking one up by a key of our own does not fail loudly — `y(key)` simply answers nothing, and
whatever was to be done to the row is quietly not done. That is how the three route rows went on
answering a tap with the whole thing switched off: `q0(false)` was being called on nothing. It
also draws its own title, summary and icon, so `fadeDisabledRowsPatch` has to cover it as well
or a row that refuses to be tapped looks exactly like one that would.

**A fragment is rebuilt from its class name**, so a settings screen has to be its own class.
One class told which screen it is — through arguments or a field — comes back from a rotation
not knowing, and loads the wrong screen. That is why the redirect screens are five subclasses of
one base rather than one class with an id.

**Nothing on the device can read a file you name by path.** Sync asks for no storage permission
at all and targets Android 13, so there is no path a certificate or a key could be read from.
What needs no permission is the system's document picker, which hands back the one file that was
chosen — `ACTION_OPEN_DOCUMENT`, then `ContentResolver.openInputStream`. Pasting the text in
remains the other way, and is the only one for the API keys.

**The one place a picker's answer can be caught is `ComponentActivity.onActivityResult`.** A
result is delivered to the activity, and the members a fragment is handed one through are
renamed by the minifier — `androidx.fragment.app.Fragment.onActivityResult` is not in the dex at
all. `onActivityResult` itself overrides a method of the framework's, so its name is fixed, and
`androidx/activity/ComponentActivity` carries one that every activity in the app inherits;
`PickAFile.whatCameBack` is called from there and answers to one request code of its own. Keep
that code under 65536: `FragmentActivity.onActivityResult` dispatches anything with the top
sixteen bits set to a fragment and never reaches `super`.

**A multi-line `EditText` with no maximum fills the dialog it is in.** A certificate read out of
a file is four thousand characters, and a field given only `setMinLines` grows to all of them —
a swipe over it then scrolls the field rather than the dialog, and the password row underneath
becomes unreachable, in the one dialog where a password is needed. `setMaxLines` as well as
`setMinLines`.

**`trimIndent()` is applied after interpolation**, so a template holding `${rows}` is indented
by however far the rows are. For a written XML file that puts four spaces in front of the
declaration, and the patch then fails while the APK is rebuilt with
`Unexpected token (position:[1:5])` — naming neither the file nor the line. Build such a file
line by line instead.

**`chain.proceed` throws where a region is blocked at the connection**, rather than returning a
reply to inspect. A route that reads the reply to decide whether to step in therefore has to
catch `IOException` as well, or it will fail to do anything in exactly the case it exists for.

**A client certificate is per host, never per service.** The server decides when to ask for
one, and the certificate names whoever holds it, so a certificate kept for "Rimgo" would be
handed over by whichever instance asked for one — including an instance asking precisely in
order to find out who is reading. Each instance is offered the certificate attached to it and
nothing else.

**Testing the emulator's networking against the host is a trap.** `10.0.2.2` is slirp's alias
for the host's loopback and is unreliable under load: the proxy accepts the connection, the
guest never completes it, and the app eventually fails with `ECONNABORTED (Software caused
connection abort)` while the proxy logs a read timeout — from the same device where
`toybox nc 10.0.2.2 <port>` answers fine. `adb reverse` did not forward either. What works is a
container with **no published ports**: the emulator reaches it on the docker bridge
(`172.17.0.2`) and nothing is bound on a host interface. The same run then worked first time.

**`adb shell input text` truncates at about 100 characters**, and a second call does not append
— it inserts wherever the cursor is, so chunking interleaves the text. Anything longer than a
password cannot be typed into the app from a script, which means a pasted certificate cannot be
got onto the device through the test harness at all. The certificate reading is covered by
`test/test_request_parsing.py` instead, where it is deterministic.

**`uiautomator dump` leaves the last dump behind when it fails, and reading it back is
indistinguishable from reading the screen.** It refuses to dump until the window goes idle, and
a window with an autoplaying video in it never does — so the command writes nothing, the
previous `/sdcard/ui.xml` is still there, and `cat` hands back a screen from several minutes
ago that looks entirely plausible. That is how a dialog that `dumpsys window` said was not
focused went on appearing in every reading. Delete the file first and refuse an answer that
holds no `<hierarchy`; where it will not dump at all, `screencap` is the thing that always
tells the truth.

**The guest's own numbers say whether the emulator is actually starved.** `adb shell top` and
`adb shell cat /proc/loadavg` are a few seconds and settle in one go what the host's load
average only suggests: an emulator that was reported as CPU-starved was in fact **383% idle at
a guest load of 1.15**, and swapping inside its own 2.5 GB — the AVD's memory is fixed whatever
the host has spare. `am kill-all` and force-stopping Chrome freed 700 MB of it.

**Every `adb install -r` leaves the app running interpreted.** ART compiles it in the
background, and until it has, a first launch is slow enough to be declared unresponsive —
which is why ANRs cluster immediately after a reinstall and look like whatever was just
changed. `adb shell cmd package compile -m speed -f com.laurencedawson.reddit_sync` takes about
nine seconds and takes the question away. `wm size 540x1200` with `wm density 240` quarters
what a software-rendered emulator has to draw, and `wm size reset` puts it back.

**An ANR on this emulator is usually the host.** Every one seen here read
`Waited 5000ms for FocusEvent`, with the skipped frames and the `Davey!` lines belonging to
`system_server` rather than to the app, and one of them landed on Sync's own Backup screen
before any patched screen had been opened. Check `/proc/loadavg` before believing a patch
caused it; software rendering plus a loaded host is enough on its own, and `uiautomator dump`
forces a main-thread traversal every time it is called. The ANR trace names the thread that was
stuck: one read here was the main thread inside `hwui`'s `RenderProxy`, waiting on the render
thread, with nothing of ours anywhere on the stack. `adb shell dumpsys dropbox --print` is where
to read it from.

**The emulator leaves stale tiles, which read as views drawn in the wrong place.** A capture
taken after the bar's items were laid out again showed a navigation item's icon, complete with
its selected pill, floating in the content area a third of the way down the screen. There was no
such view: `uiautomator dump` showed a clean hierarchy with the item only in the bar. It is the
software renderer failing to clear what it drew. Forcing a full redraw — a rotation does it —
takes it away, which is what tells a stale tile from a layout bug, and a control run with the
patch changing nothing shows it just the same.

**`printDebug` is off unless the device says otherwise, and nothing says so.** The shared
library gates it on `morphe_debug`, which this bundle has no settings UI for, so a diagnostic
written with `Logger.printDebug` produces nothing at all and reads exactly like code that never
ran. Writing `<boolean name="morphe_debug" value="true" />` into
`shared_prefs/morphe_prefs.xml` turns it on for the whole extension. `printInfo` is always
logged, which is why the toastless `printInfo` is also what a diagnostic should use if the
device cannot be reached.

**Settings can be driven from a script without root.** `adb root` is refused on this image, but
a build carrying `Enable Android debugging` can be reached with `run-as`, which makes the
per-account settings file readable and writable — so a patch with settings can be put through
every combination of them by force-stopping the app, writing the file, and launching again,
rather than by tapping switches. `run-as` cannot read `/sdcard`, so the file goes via
`/data/local/tmp` with `chmod 644`. Tapping a `SyncCheckBoxPreference`'s switch directly often
does not register on this emulator; tapping the row's words does.

**Dead endpoints Sync still calls.** Worth knowing before diagnosing a media bug:

- `api.gfycat.com` and `gfycat.com` — DNS no longer resolves at all.
- `api.redgifs.com/info` — 404, removed. Sync calls it first when opening a RedGifs link.
- `images.syncforreddit.com` — DNS no longer resolves. Sync's Imgur proxy, answered locally by
  `FixImgurProxyPatch`.
- `ap.syncforreddit.com` — Sync's own proxy, still up but answers 401 to everything without a
  subscriber token. `/stats.json` is open and says what it is: a cache of website previews.
  **One host, three jobs**, all through `/image?url=`, and each needs different handling:
  an Imgur picture or album (`imgur-album-<id>`), a whole page whose picture is wanted, and
  `redgifs-<id>` / `gfycat-<id>`, which Sync asks for the *video* when the `enhancedAutoPlay`
  setting is on. Three interceptors of ours want that one path, so each claims only its own and
  passes the rest down the chain: `FixImgurProxyPatch` first, then `RedirectGfycatPatch` for the
  two video tokens, then `WebsitePreviewImagePatch` for a page. Reissuing the request against
  whatever `url=` holds is right for a picture and hands HTML to an image decoder for a page. A
  preview that draws a broken image with no sign of our interceptor in the log is this: another
  interceptor took it first.
- `api.pushshift.io` — 403 without moderator credentials. Sync's own *Restore comment* row asks
  it, but that row is behind `t7.d0.e()`, a remote flag that is off, so it never appears; the
  Ultra unlock does not turn it on, since it only rewrites `t7.d0.d()` where `uc.b.j()` is asked
  beside it. `UndeleteRedditPatch` covers the same need from Arctic Shift and the Wayback
  Machine.
- `imgur-apiv3.p.rapidapi.com/3/image` — where the *stock* app uploads a picture. Its RapidAPI
  subscription lapsed (403 *You are not subscribed to this API*), but `Spoof client` has always
  rewritten that URL to `api.imgur.com/3/image`, so a patched copy never asks it. What was left
  failing is the Client-ID beside it: Sync's `981c2f80e996ca3` is shared by every copy and spent
  — Imgur answers an upload with it `x-ratelimit-clientremaining: 0`, while the identical request
  with a fresh ID answers 200 and returns the `data.link` Sync reads. `Spoof client` now carries
  an `imgur-client-id` option for that, defaulting to Sync's own so nothing borrowed is shipped.
  The stale `x-rapidapi-*` headers are still sent and Imgur ignores them. The upload also sits
  behind a remote switch, `reddit-sync-development/master/api/upload.json`, currently
  `{"enabled": true}` — when that is false Sync says *Upload to Imgur is not currently
  available* and never issues the request at all.

  **Rate limits will lie to you here.** Both RapidAPI and Imgur answer a burst of probes with
  *Too many requests*, which reads exactly like a dead key. Space the calls out and re-read
  before concluding anything: `api.tumblr.com` was written up as broken on a single 429 and is
  in fact fine.
- `sli.mg`, `api.eroshare.com`, `i.lvme.me`, `picsarus.com`, `vid.me` — services that shut down
  years ago. Nothing to route them to; the content is gone at the source.
- `67.205.181.214` — a house ad loaded into a WebView when AdMob fails. Dead, and unreachable
  anyway once `Disable ads` is applied.

**Not dead, despite appearances.** Checked and working, so do not "fix" them:

- `todo.syncforreddit.com` — serves the launcher icons, `licenses.html`, and the translate
  marker images. Alive.
- `backend.deviantart.com/oembed` — alive over **https**; Sync asks over `http` and OkHttp
  follows the 301, and the manifest sets `usesCleartextTraffic="true"` so the request starts.
  A made-up deviation URL answers 404, which is easy to mistake for a retired endpoint.
- `api.tumblr.com` — Sync's shared `api_key` still works. It answers 429 *Limit Exceeded* under
  a burst, which is a shared key being busy, not a retired one.
- `raw.githubusercontent.com/laurencedawson/reddit-sync-development`, `api.streamable.com`,
  `reddit.statuspage.io`, `syncapps.io`, `api.redgifs.com` itself — all answering.

## Patcher version

`gradle/libs.versions.toml` tracks Morphe Patcher and the patches library at **2.1.0**, which is
what the manager ships and what the template builds against. It was pinned at patcher `1.3.3`
for a long time because the ported sources were written against that API; that migration is
done, and the pin is no longer something to preserve.

**Build against the same major as everything else loaded.** Morphe applies the behaviour of the
newest patcher any loaded bundle was built for to *every* loaded bundle, and a bundle built for
an older one is called out in a warning rather than an error:

```
WARNING: Patches built for an older version of Morphe Patcher are applied with the behavior of
Morphe Patcher 2.0.0 that Morphe Patches 2.0.0 was built for, and may not work as intended:
  Sync Up 1.9.2, built for Morphe Patcher 1.3.3
    - Fingerprint strings must equal a string of the method, instead of only being contained in one
    - Fingerprint instruction filters before a filter that does not match are retried with their
      next matching instruction, instead of only the first filter
```

Almost nobody runs this bundle alone — it is loaded alongside Morphe Patches for the Clone app
patch — so that warning is what a user sees, and the behaviours it names are the ones that
actually apply.

**A fingerprint string has to equal a whole string of the method, not a fragment of one.** This
is true on 2.x regardless, so it is worth keeping right even though the warning is gone.
`Spoof client` broke exactly this way before the migration: it matched on
`"authorize.compact?client_id"` and on `"Basic"` where the app holds the whole authorization url
and `"Basic "` with its trailing space.

Checking a string against the APK is not enough on its own: it can be an exact string of the app
somewhere else while being only a fragment within the class the fingerprint targets, which is
what `"Basic"` was — exact in okhttp's `Credentials`, a fragment in Sync's own. Read the strings
of the *target* class. Where the whole string cannot be written down because it names the package
or the version — the user agent does both — match with `custom` over the method's instructions
instead, which is not string matching at all and so reads the same under either behaviour.

### What the 1.3.3 to 2.x migration moved

Only four things, and the compiler finds all of them:

- `returnEarly` and `getReference` moved out of the patches library into the patcher:
  `app.morphe.util.*` becomes `app.morphe.patcher.util.*`.
- `indexOfFirstInstruction` and `indexOfFirstInstructionOrThrow` stayed in
  `app.morphe.util`, so those imports are left alone.
- `writeRegister` and `registersUsed` were dropped with nothing to replace them. They are
  reimplemented in `patches/util/Instructions.kt`, since what they say is what the ported
  patches were written to say.
- `PatchListGeneratorKt` is still `app.morphe.util.PatchListGeneratorKt` here. The template
  names it `util.PatchListGeneratorKt`, but the template does not depend on the patches library
  and takes it from the plugin instead — following the template there breaks the task.

The cheapest way to check all of it is to patch with both bundles loaded and `--validate`, which
also catches a fingerprint that matches more than one method:
`java -jar morphe-desktop.jar patch -p patches-*.mpp -p patches-<morphe>.mpp --options-file
opts.json --validate --continue-on-error`. Options are keyed per bundle, so generate `opts.json`
with `--options-update` *while both are loaded* or `-O client-id=` never reaches the patch and
the run dies on a missing option long before it reaches a fingerprint.

## Relationship to Patcheddit

The patch logic is a faithful port. Where this repository intentionally differs:

- Only Sync for Reddit is targeted. All other client patches, the Sync for Lemmy target, and
  the shared code only those used, are dropped. The `.pro` and `.dev` packages were carried over
  as targets at first, at any version; they are dropped too. Neither was ever patched or run,
  every fingerprint is written against the free build, and the paid builds are obfuscated
  separately, so declaring them promised something nobody could check. See `sync/Constants.kt`.
- Patches with no Patcheddit equivalent, written for problems specific to Sync: the RedGifs
  `/info` emulation and the Gfycat to RedGifs redirect. Both came out of endpoints Sync depends
  on that no longer exist. Also the translation patch, and `Unlock Sync Ultra`.
- **Sync Ultra is asked about in three ways**, and a feature kept back may be behind any or all
  of them: `uc.b.j()` (paid for, asked in 43 places), `t7.d0.*` (flags set from afar, all off),
  and an account name containing `.AO-` (the developer's own). Where all three are asked
  together the feature was finished and never given out, and needs nothing but the device —
  website previews, reading text out of an image, tagging a user. Where only the first is asked
  it is usually a small local thing. What is kept on Sync's own servers — paints, tags, cloud
  backup, its own restoring of removed comments — is left gated, since those services answer
  401 or nothing at all.
- The Boost patches that were worth porting are reworked rather than copied, because Sync
  differs at every hook point: no JRAW, a different thread URL shape, raw markdown instead of
  the `_html` fields, Glide on its own client, and a layout driven menu. `org.json` is used
  rather than Jackson, and caches are in memory rather than Room, so the bundle takes on no new
  dependencies.
- Boost's *Fix audio in downloads* is not ported: Sync has its own MPD parser fix. Its
  */r/all* patch is not ported either; it addresses a Boost specific bug, and there is no
  evidence Sync has it.
- Identity: project name, `rootProject.name`, the bundle `about` block, and Gradle group
  (`app.syncup`) are this project's. Required by the upstream Section 7 name restrictions.
- The `Spoof client` option help text says "Sync Up documentation" rather than the upstream
  project's name.
- Release plumbing follows the current
  [morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template) rather than
  Patcheddit's older setup: `.releaserc`, `release.yml`, `open_pull_request.yml`,
  `package.json`, and the README patch list generator all come from there. No GPG signing is
  configured, so `signatureUrlTemplate` is empty.
- `patches/api/patches.api`, the settings and `addresources` resource trees, and the unused
  `:patches:stub` project are not carried over. The API dump was stale upstream; the resources
  belong to settings patches this bundle does not use.
- `test/test_all_apks.py` points at `morphe-desktop` (morphe-cli was renamed), tolerates a
  missing `test/config.json`, and carries a PEP 723 header.

When porting a fix from upstream, keep the `Copyright 2026 wchill` headers on ported files —
that attribution is what the upstream license requires.

## Licensing constraints

GPLv3 with Section 7 conditions inherited from **both** Patcheddit and Morphe; the full text
is in [NOTICE](NOTICE). Two things constrain the code:

- **7c name restriction.** Do not name this project, its bundle, or its branding after
  "Patcheddit" or "Morphe". Descriptive references ("compatible with Morphe", "derived from
  Patcheddit") are fine. Note that `app.morphe.*` package names and the
  `PatchedditInterceptor` class name are inherited identifiers in ported code, not project
  identity — leave them alone.
- **7b attribution.** Both upstream notices must stay reachable: `NOTICE`, the README license
  section, and the license texts bundled into the `.mpp` under
  `patches/src/main/resources/branding-license/`.

## Conventions

- Semantic commit messages; the release version and changelog are generated from them.
  `feat:` minor, `fix:`/`bump:`/`perf:` patch, `chore:` no release.
- Work on `dev`. `main` is stable releases only, reached by merging `dev` (not squashing).
- **Squash the steps of a fix before `main` sees them.** A bug that took several attempts
  belongs in the stable changelog as the fix that worked, not as the attempts: `main` is merged
  rather than squashed, so every commit on `dev` reaches the notes. Prefer not creating the
  noise in the first place — ship an attempt on `build(Needs bump):`, which publishes a
  prerelease and is hidden from the notes, and keep `fix:`/`feat:` for the version confirmed to
  work. Where attempts have already gone out under those types, fold them together on `dev`
  before opening the merge. Rewriting commits that have already been released strands the git
  notes semantic-release keys by commit SHA (`refs/notes/semantic-release-*`), and the next
  release fails until they are re-attached, so squash before the prerelease that supersedes
  them rather than after.
- **Diagnostics go on `chore:` commits.** Because `main` is merged rather than squashed, every
  commit on `dev` appears in the stable changelog, and a release that reads as six entries about
  a diagnostic that no longer exists is worse than no entry at all. A patch written to answer a
  question is `default = false` while it exists and is deleted once it has answered, before the
  release that would ship it. A `chore:` commit publishes nothing, so a diagnostic that has to
  reach a device goes on `build(Needs bump):`, which releases a prerelease and is hidden from
  the notes — the scope has to be exactly that for `.releaserc` to match it.
- **Patch descriptions are one or two sentences of what the patch does.** They are read in the
  manager by someone choosing patches, not by someone maintaining them: no reasoning about why
  the patch exists, no account of what was learnt writing it. The detail — what a patch changes
  and where it stops — goes in the hand-written *What the patches do* section of `README.md`,
  below the `PATCHES_END` marker.
- **No toasts in a stable release.** `Logger.printException` raises one, and it is not
  conditional in practice: it is gated on `BaseSettings.DEBUG_TOAST_ON_ERROR`, which defaults to
  `true` and has no settings UI in this bundle to turn off. Use `printInfo`, which logs the same
  message and exception without the toast. Toasts are acceptable in a prerelease being tested;
  the extension carried none into v1.7.0.
- Never hand-edit `CHANGELOG.md`, `patches-list.json`, `patches-bundle.json`, or the region
  between the `PATCHES_START` / `PATCHES_END` markers in `README.md`. The release writes them.
- Do not create releases by hand.

## Known rough edges

Inherited from upstream:

- The `sync/ads/DisableAdsPatch.kt` builder plus its `syncforreddit/ads` wrapper is now an
  indirection with a single caller, since the Lemmy target is gone.

The `println` in `ModifyWebViewPatch.kt` and the unused `CREATE_NEW_CLIENT_METHOD` in
`reddit/customclients/Constants.kt` were removed before v1.7.0.

Current, from this project's own patches:

- Tapping an archive row in the post menu opens the browser but does not dismiss the sheet.
  That patch is handed the sheet's root view rather than the sheet, so it has nothing to close.
  Closing one is possible where the sheet itself is to hand: `x3()` resolves through a stub on
  `s9/f`, and an androidx stub costs nothing since the stubs are compile only.
- The undelete patches call Arctic Shift and the Wayback Machine, both free community
  services. Results are cached and only fetched when a thread actually contains removed
  content. Keep it that way; do not add speculative prefetching.
- **The undelete interceptor holds the comments while it asks.** It reads the reply, calls the
  archive, and only then hands the thread back, so whatever the archive takes is time the
  comments are not on screen. Arctic Shift went down for an afternoon and every thread holding
  anything removed sat for sixteen seconds — the old fifteen second read timeout, paid again on
  each thread, since only a success was remembered. The wait is five seconds now and a host that
  has failed twice is left alone for five minutes, so an outage costs one wait rather than one
  per thread. Anything added here has to stay bounded the same way: these services are free and
  being briefly down is normal, not exceptional.
- Restored text is marked by a coloured note appended to the line under the author, built with
  Sync's own header builder, because Sync has no equivalent of the model field Boost renders its
  markers in. The wording comes from Reddit's own placeholder (`[ Removed by moderator ]`), so
  it says what actually happened rather than guessing.
