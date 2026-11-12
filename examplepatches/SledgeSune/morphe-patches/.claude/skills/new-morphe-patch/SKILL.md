---
name: new-morphe-patch
description: Write a new Morphe patch in this repo for an Android app (APK or APKMirror .apkm) — decompile it, find the code behind a behaviour, write fingerprints that survive obfuscation, add Java extension code, build and commit. Use when asked to make, change or fix a patch for any app (Sync.ME, Waze or a new one).
---

# New Morphe patch

Follow CLAUDE.md (layout, fingerprint rules, untrusted-APK rules). Check HANDOFF.md for existing hooks in that app.

## Tools (Git Bash)

```bash
export JAVA_HOME="$(ls -d '/c/Program Files/Eclipse Adoptium'/jdk-21* | tail -1)"
export ANDROID_HOME="$LOCALAPPDATA/Android/Sdk"
JADX_JAR="$(ls "$LOCALAPPDATA"/Microsoft/WinGet/Packages/Skylot.jadx_*/lib/jadx-gui-*-all.jar | tail -1)"
DEXDUMP="$(ls "$ANDROID_HOME"/build-tools/*/dexdump.exe | tail -1)"
PY="$(ls "$LOCALAPPDATA"/Programs/Python/Python3*/python.exe | tail -1)"
```

## 1. Unpack and decompile

```bash
SCRATCH=<scratchpad>
mkdir -p "$SCRATCH/<app>-apkm" && cd "$SCRATCH/<app>-apkm" && unzip -o -q <file>.apkm
unzip -tq <file>.apkm      # report bad CRCs to the owner
grep -oE '"(release_version|versioncode|pname)": *"[^"]*"' info.json
"$JAVA_HOME/bin/java" -Xmx8g -cp "$JADX_JAR" jadx.cli.JadxCLI --show-bad-code -j 8 \
  -d "$SCRATCH/<app>-jadx" "$SCRATCH/<app>-apkm/base.apk"      # background; takes minutes. --no-res if no strings needed
```

## 2. Find the code

1. User-visible text in `resources/res/values/strings.xml`, then the code using that `R.string`.
2. Remote-config keys and log strings (`grep -ao` over `classes*.dex` for a quick first pass).
3. Names that survive obfuscation: manifest classes, JNI methods (`*NativeManager*`, `...JNI`/`...NTV`), protobuf
   classes, enum constants, the app's un-obfuscated packages, `compiled from: X.kt` comments.
4. A single gate method every feature asks.

Native code (`lib/arm64-v8a/*.so` in the ABI split): prefer changing behaviour from Java (e.g. a config value).

```bash
"$PY" -m pip install --quiet --target "$SCRATCH/pydeps" capstone   # once
"$PY" -I .claude/skills/new-morphe-patch/scripts/elf_xref.py lib.so "log text"     # code that loads a string + nearby strings
PYDEPS="$SCRATCH/pydeps" "$PY" -I .claude/skills/new-morphe-patch/scripts/arm64_dis.py lib.so <start> <end>
PYDEPS="$SCRATCH/pydeps" "$PY" -I .claude/skills/new-morphe-patch/scripts/arm64_dis.py lib.so find-imm <hex> <start> <end>
```

## 3. Write the patch

- New app: add `COMPATIBILITY_<APP>` to `shared/Constants.kt`.
- SDK class with the same shape as the target? Exclude it:
  `custom = { _, classDef -> !classDef.type.startsWith("Lcom/facebook/") }`.
- Need another method's obfuscated name at patch time? Fingerprint it and use `.method.name`.

Smali pitfalls:

- `v0` at index 0 is safe only if the method has a local register (dexdump: `registers` > `ins`).
- Pass parameters with `invoke-static/range { p1 .. p2 }` (parameter registers can be above v15).
- When replacing a call, copy its exact register (`FiveRegisterInstruction.registerC` /
  `RegisterRangeInstruction.startRegister`) and keep the following `move-result`.
- Insert later indexes first so earlier ones stay valid.
- Fall through to original code with
  `addInstructionsWithLabels(0, "... if-eqz v0, :original ...", ExternalLabel("original", getInstruction(0)))`.

Extension code must not send data anywhere except the app's own servers, and only when the feature needs it.

## 4. Verify

1. Each fingerprint matches **exactly one** method (grep the jadx sources for its anchors).
2. `"$DEXDUMP" -d classesN.dex > dump.txt`: register count and the exact instructions around the hook.
3. Extension descriptors in the smali match the classes: `grep -ac 'Lapp/sledgesune/...;' extensions/extension/build/morphe/extensions/extension.mpe`.
4. Build (CLAUDE.md › Build), check the patch name is in `patches-list.json`, then revert it.

If the owner wants to test before a release, send them `patches/build/libs/patches-<version>.mpp`.

## 5. Commit

`feat(<App>): Add "<Patch name>" patch` on `dev`, push. Add the patch to HANDOFF.md. Tell the owner plainly what was
verified (builds, fingerprints unique) and what wasn't (never applied to the real APK, never run on a phone).
