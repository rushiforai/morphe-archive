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

**Note that `android:dependency` is not an answer here.** It only keys off a checkbox, so a row
that should follow a list preference's value has to be turned on and off in code.

**Menus are layouts, not lists.** The post overflow sheet is
`res/layout/dialog_bottom_post_more.xml`, a `LinearLayout` of `MaterialRow` views dispatched by
`view.getId()` in `onItemClicked`. Adding an entry the way Boost does is not possible; rows are
built and inserted at runtime instead, which avoids introducing an id resource.

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
or the version — the user agent does both, and this bundle is offered for the Pro and Dev
packages at any version — match with `custom` over the method's instructions instead, which is
not string matching at all and so reads the same under either behaviour.

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
  the shared code only those used, are dropped.
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
