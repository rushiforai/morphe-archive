# 🧩 tvQuickActions patches for Morphe

Unofficial [Morphe](https://morphe.software) patch bundle for **tvQuickActions Pro**
(`dev.vodik7.tvquickactions`), a button/key mapper for Android TV, Google TV and AOSP devices.

Not affiliated with the Morphe project or with tvDev. See the [NOTICE](NOTICE).

## ❓ About

tvQuickActions gates its premium features behind a bundled Google LVL fork, and since 3.8.0 it
loads a native engine library from `Application.onCreate` that **aborts the process when the APK
is not signed with the original certificate**. That makes a plain "patch and re-sign" impossible:
the app dies a fraction of a second after launch, before it draws anything.

The bundle contains five patches:

1. **Unlock premium** (bytecode) forces the licence policy to always report the app as licensed.
2. **Unlock native engine** (native library) patches `libd.so` so that the library loads and keeps
   working on a re-signed APK. It edits the library's own code, because that is where the abort
   comes from:
   - constructor 2 of the library's `INIT_ARRAY` destroys a global mutex, and every thread that
     locks that mutex afterwards dies with
     `FORTIFY: pthread_mutex_lock called on a destroyed mutex`;
   - the library's verification routine, which it runs at load time *and* periodically on one of
     its own worker threads, has failure paths built from deliberate `udf #0` (SIGILL) and writes
     of `0xdead` to a null pointer (SIGSEGV).

   Both are neutralised in place, which leaves the engine's own initialisation intact. This is what
   makes **Web Widget Overlay** and **button emulation** work; a bytecode-only patch cannot reach
   them, which is why earlier releases of this bundle dropped the engine altogether.

   The routine itself is **not** stubbed out. Only the traps are no-ops; the routine runs in full.
   Up to 1.6.9 its prologue was overwritten with `mov w0, wzr; ret`, which removed the routine
   rather than disarming it: the engine came up half-initialised and `nativeActions` - the JNI
   entry point every key-code injection goes through - did nothing, so a remote's **numpad** was
   dead while pointer input kept working through `nativeRender`. If a future release needs the
   engine touched again, keep that distinction in mind.

**Unlock native engine** depends on **Unlock premium**, so selecting the former runs both.

3. **Never stop itself** (bytecode) keeps the app from stopping its own package. **Stop recent
   apps**, **Restart app** and **Force stop app** all end in `am force-stop <package>` handed to
   the app's ADB service, and the app is in the recents list those actions work from, so once an
   ADB connection is up the action stops *itself*, restarts, and loops every few seconds. The
   patch drops that command in the service's command runner, which is the single place every one
   of them passes through, and also takes the app out of the recents list used when ADB is off.
   The app only skips the foreground app, and only when "Don't kill foreground app" is enabled,
   so the patch covers what that preference does not.

4. **Input without the ADB server** (bytecode) keeps numpad keys, pointer and gamepad input
   working while the "Use ADB speed up" server is down. With that preference on, the app stops
   injecting input itself and sends every key, tap and swipe to a small HTTP server it starts as
   the shell user on `localhost:15000`; the requests are fired at a closed port while that server
   is not running and are dropped without the app noticing, so the ordinary path (the input
   method, the accessibility service, a shell `input` command) is never reached and the numpad and
   the pointer do nothing. Each of those request sites is gated on `h3.e.n()` - the app's own
   "is port 15000 taken" probe - so the request is only made while a server is listening and the
   site's own fallback runs otherwise. Nothing changes while the server is up.

5. **ADB server log** (bytecode) is a diagnostic: it makes the server's own output readable, which
   is not otherwise possible because its logger is built at a level that drops everything and its
   stdout goes to `/dev/null`. It also appends the server's exit status, so a `Killed` line can be
   told apart from the app's own `System.exit(255)`.

There is deliberately **no** patch that touches `Server.main`'s `Looper.prepare()`. An earlier
release replaced it with `Looper.myLooper()` on the theory that `app_process` had already prepared
the main Looper; the device says otherwise. The server's own log contains
`MainLooper already prepared: The main Looper has already been prepared.`, which is written from
inside the coroutine (`P3/C2.<clinit>`) that is only reached *after* `Looper.prepare()` succeeded
and set `sMainLooper` by reflection. Dropping the call therefore only removed the Looper that
`Looper.loop()` needs, and the server exited with 255 on every start.

### How to use these patches

Add this repo URL in Morphe Manager → patch sources, then patch your own copy of the app:

```
https://github.com/6zev/morphe-patches
```

<a href="https://morphe.software/add-source?github=6zev/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.7.13](https://github.com/6zev/morphe-patches/releases/tag/v1.7.13)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 tvQuickActions Pro&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `dev.vodik7.tvquickactions`

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock premium](#unlock-premium) | Reports the app as licensed, which unlocks the premium features. |  |

</details>

<!-- PATCHES_END -->

## 📱 Supported versions

| App version | Status |
|---|---|
| 3.8.0 | ✅ developed and tested against this release; both patches apply |
| 3.7.0 | ⚠️ licence patch only — that release does not load the engine |

Get the **original, unmodified APK** (ApkMirror, UpToDown or the Play Store) — do not patch an
APK that was already modded, its fingerprints will not match.

## ⚠️ Notes and caveats

- Morphe signs the patched APK with its own key, so you must **uninstall the original app first**.
  App settings are lost unless the app ships its own backup/export.
- The engine patch edits `libd.so` of the **ARM builds**, `lib/arm64-v8a` and `lib/armeabi-v7a`.
  Android TV 10 boxes are often 32-bit and use the second one, so patch the APK on a device of
  the same architecture as the one you install it on, and check the patched APK still contains
  that `lib/<abi>/libd.so`.
- The engine patch verifies the known layout of each library before it changes a byte, and refuses
  to patch a library that does not match, so it is limited to 3.8.0 instead of quietly damaging a
  future release. A future release will need its offsets re-derived.
- Everything the app did before still works: key remapping, custom menus, macros, ADB/Shizuku,
  cloud/NAS sources, settings, premium — now including **Web Widget Overlay** and
  **button emulation**.
- Root is **not** required.
- A restored backup can carry a trigger or mapping that runs **Stop recent apps**, which
  kills every app in the recents list over ADB - including tvQuickActions itself. On 3.8
  that makes the app restart every few seconds (`Force stopping dev.vodik7.tvquickactions`),
  and enabling ADB is what makes it start, because the kill needs the ADB connection.
  **Never stop itself** makes the app's own stop command a no-op, so the action is safe to keep;
  turning on **Don't kill foreground app** in the app covers only the case where the app is in
  front.
- If the app is updated, the patches may need adjustments: class and method names are obfuscated
  differently in every release. The patches anchor on data that does not change (the LVL
  preferences file name, the unobfuscated `App` class), which should keep them working across
  releases, but a new app version always deserves a test run.

## 🚀 Development

Requires JDK 21 and a GitHub Personal Access Token (classic) with the `read:packages` scope,
exported as `GITHUB_TOKEN`, plus `gpr.user`/`gpr.key` in `~/.gradle/gradle.properties`
(see the [patcher setup guide](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md)).
The Morphe Gradle plugin is hosted on GitHub Packages and cannot be resolved anonymously.

```sh
./gradlew :patches:buildAndroid
```

The built bundle lands in `patches/build/libs/patches-*.mpp`. Apply it locally with
[Morphe Desktop](https://github.com/MorpheApp/morphe-desktop):

```sh
java -jar morphe-desktop-*-all.jar patch -p patches-*.mpp tvquickactions.apk
```

### Layout

```
patches/src/main/kotlin/app/tvqa/patches/
├── shared/Constants.kt                     # app compatibility (package, versions)
└── tvquickactions/
    ├── AdbServerLogPatch.kt                  # redirects ADB server output to a readable log
    ├── AdbInputFallbackPatch.kt              # speed-up requests only while its server is up
    ├── UnlockPremiumPatch.kt                  # licence policy -> allowAccess() = true
    ├── NativeEnginePatch.kt                   # libd anti-tamper + liba server self-stop (ARM32/64)
    └── NeverStopItselfPatch.kt                # stop actions: drop the app's own stop command
```

`NativeEnginePatch` is a resource patch. Morphe's patcher does not list native libraries as
decodable files, but it extracts one on request and writes it back into the APK, which is what the
patch relies on.

## 📜 License

Licensed under the [GNU General Public License v3.0](LICENSE).
