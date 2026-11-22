# Reading the decompiled code

`decompiled/` holds Kim Launcher 1.0.2781's **own** code only; libraries (AndroidX, Google,
Mapbox, Kotlin, Flutter), images and 3D models are dropped. It's git-ignored because it's the
original developer's code. Regenerate it for any version with `tools/decompile.sh <apk>`
(full decompile, then `tools/trim-decompiled.sh`).

```
decompiled/
  java/        JADX Java: read the native logic here
  smali/       same classes as smali: the exact bytecode Morphe patches edit
  dart/
    byd_launcher/   the app's Dart code (UI, settings, features); real names, arm64 asm
    pp.txt          Dart object pool: every string/constant, with the function using it
    blutter_frida.js  Frida hooks for Dart functions (runtime tracing)
  resources/   AndroidManifest.xml, res/values (strings), res/xml, kim_guide (feature docs)
  dart-strings.txt  quick-grep strings from libapp.so
```

## The files that matter

Native (`java/`, same paths in `smali/`). Obfuscated names (`byd/vd`) **change in every app
version**, so patches must find them by fingerprint (strings, signature), never by name.

| File | What it is | Used by patch |
|---|---|---|
| `com/kimkim/KimDeviceGateActivity.java` | Launcher entry; shows "BYD head units only" | |
| `r2/a.java` | Device gate check `a(Context)` (is this a BYD unit?) | candidate: Allow non-BYD devices |
| `com/kimkim/KimApplication.java` | App start; runtime class-loader bootstrap | |
| `com/kimkim/KimLauncherActivity.java` | The Flutter activity; **registers every MethodChannel** | start here to find a feature |
| `A0/g.java` | **MethodChannel handlers**: `onMethodCall` switches on a channel id, then on the method name | finding the native side of any Dart call |
| `byd/e.java` (76 MB) | **Vehicle bridge**: every BYD car read/control (`BYDAuto*Device`) | vehicle features; open with grep or JADX GUI |
| `byd/*Daemon.java`, `byd/Sentry*.java`, `byd/IcCast*.java`, `byd/KimKeyAccessibilityService.java` | Background daemons, Sentry, instrument-cluster cast, steering-key mapping | |
| `byd/vd.java` | In-app updates (check, download, install) | **Settings-only in-app updates** |
| `K1/sd.java` | Firebase cloud sync, auth, vehicle ID, subscription status | network / offline work |
| `K1/jc.java` | Diagnostic log upload to Telegram | network / offline work |
| `M1/h.java` | Weather, news, crypto/FX/gold lookups | network / offline work |
| `N1/I.java` | Voice pack catalogue and downloads | |
| `K1/*`, `L1/*` | Most other feature logic, reached from `A0/g` | |

Dart (`dart/byd_launcher/`). Dart can't be patched by Morphe, but it shows what each screen
does and which MethodChannel method it calls:

| File | What it is |
|---|---|
| `main.dart` (37 MB) | Launcher home, dashboard, settings, entitlement handling |
| `services/automation_service.dart` | Automations |
| `services/key_mapping_service.dart` | Steering-wheel key mapping |
| `services/kim_ai_service.dart`, `kim_ai_*` | Kim AI assistant |
| `services/proximity_key_service.dart` | Proximity smart key |
| `services/kim_config_exchange.dart` | Backup / config import-export |
| `services/mapbox_quota_guard.dart`, `kim_place_search_service.dart`, `kim_route_ahead_service.dart` | Map, search, route |
| `ui/*.dart` | Screens and dialogs (e.g. `kim_custom_ic_theme.dart`, `launcher_system_bar.dart`) |
| `widget_studio/` | Widget Studio editor |

## How to go from a feature to a patch

1. Find the feature's Dart code in `dart/byd_launcher/` (names are readable) and note the
   MethodChannel name and method string it uses (`grep -rl 'methodName' dart/byd_launcher`).
2. Find that channel in `java/com/kimkim/KimLauncherActivity.java`, then its handler in
   `java/A0/g.java`, and follow it into `K1/*` or `byd/*`.
3. Read the target method in `smali/` and build a fingerprint from its stable strings and
   signature (see `patches/src/.../NotifyOnlyOtaUpdatesPatch.kt`).
4. JADX GUI is the easiest reader (Find Usage, full-text search):
   `C:/Workspace/tools/jadx/bin/jadx-gui refer-apk/kim-launcher-1.0.2781.apk`

Notes:
- 129 methods failed to decompile and show `Code decompiled incorrectly`; read those in `smali/`.
- In `smali/`, Windows merges case-colliding folders (`K1/` and `k1/`), so a file can be named
  `uc.1.smali`. Check the `.class` line at the top for the real name.

## Blutter setup (Dart side, one-off, done on this machine)

This snapshot was built by the Dart VM in **release** (non-product) mode with
`no-dedup_instructions`. Stock blutter builds a **product** VM and rejects it.
`tools/blutter-release-snapshot.patch` (against worawit/blutter `4a60ac6`) builds the VM without
`PRODUCT` and adds empty stubs for disassembler symbols blutter never calls.

Steps: clone blutter to `C:/Workspace/refs/blutter`, `git apply` the patch, run
`python scripts/init_env_win.py`, then `tools/decompile.sh`. The first run compiles the app's
Dart version (3.11.5) and needs Visual Studio 2022 Build Tools with C++ and CMake.
