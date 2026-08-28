# Agent Device Workflow Guide

> Learned from a 2.5-hour CapCut patching session (2026-08-27). This document captures what worked, what wasted tokens, and the optimized workflow to follow going forward.

---

## Table of Contents

- [Session Retrospective](#session-retrospective)
- [Optimized Workflow](#optimized-workflow)
- [Convention: Device Profile](#convention-device-profile)
- [Convention: Analysis Notes](#convention-analysis-notes)
- [Convention: Hypotheses](#convention-hypotheses)
- [Convention: UI Navigation](#convention-ui-navigation)
- [Rules](#rules)
- [OOM-Safe Decompilation](#oom-safe-decompilation)
- [Local Verification Before Device Deploy](#local-verification-before-device-deploy)

---

## Session Retrospective

### What Happened

A session to fix an infinite-refresh bug in CapCut's audio library ran for 617 agent turns across 2.5 hours. Only 9 actual code edits were made. One NPE crash was fixed; the root cause (a native `CrackingInterceptor` corrupting API signatures) was identified but not yet patched.

### Stats

| Metric | Value |
|--------|-------|
| Agent turns | 617 |
| Tool calls | 570 |
| `view_file` calls | 189 |
| `run_command` calls | 171 |
| `manage_task` polling | 73 |
| `grep_search` | 63 |
| `replace_file_content` | **9** (actual edits) |
| Screenshots taken | 96 |
| Screen taps | 81 |
| UI hierarchy dumps | ~52 |
| Builds | ~17 |
| Artifacts on disk | 127 MB |

### Where Tokens Were Wasted

| Category | Est. % of tokens | Root cause |
|----------|-------------------|------------|
| Re-reading same smali files | ~35% | No persistent notes; same files read dozens of times as context scrolled away |
| Blind tap→screenshot→retry loops | ~25% | No cached device profile or coordinate map; every tap was a guess |
| `manage_task` polling | ~8% | Polling task status when the system auto-notifies on completion |
| **Effective work** | **~32%** | Analysis, code edits, builds, verification |

### File Re-Read Counts (worst offenders)

| File | Times Referenced |
|------|-----------------|
| `TTNetInit.smali` | 65 |
| `NetworkInitTask.smali` | 49 |
| `KevaSpAopHook.smali` | 39 |
| `NetworkManager.smali` | 32 |
| `CrackingInterceptor.smali` | 24 |
| `InitManager.smali` | 20 |

### What Worked

1. **`grep_search` → `view_file` call chain tracing** — correctly traced obfuscated bytecode chains (e.g., `KevaSpAopHook` → `InitContext.d` → `AppLog.getContext()`)
2. **`verify_patch.sh` with smali assertions** — caught compilation issues before device deploy
3. **Logcat-based diagnosis** — identified the `NullPointerException` and `CronetEngine has not been initialized` errors directly from filtered logs
4. **The KevaSpAopHook NPE fix itself** — well-reasoned null-context fallback that resolved the crash cleanly

---

## Optimized Workflow

### Phase 0: Environment Setup (do once per device, cache forever)

```
1. Run scripts/check_env.sh
2. Detect connected device:
   adb devices -l
   adb shell wm size          → screen_size
   adb shell wm density       → density
   adb shell getprop ro.product.model → model
3. Save to scratch/device-profile.yaml (see convention below)
4. For the target app, do a uiautomator dump to capture nav coordinates
   → append to device profile
```

### Phase 1: Understand the Bug (research only — NO code changes)

```
1. Read the bug report carefully
2. Check if app artifacts exist (decompiled sources in analysis/<app_id>/)
3. If not, fetch → extract → decompile with OOM-safe settings (see below)
4. Write initial hypotheses to scratch/hypotheses.md
5. Research ONE hypothesis at a time:
   a. grep_search for relevant class/method names
   b. view_file for specific method bodies
   c. Write findings to scratch/analysis-notes.md (class purpose, key methods, call chain)
   d. Update hypothesis status (CONFIRMED / REJECTED / NEEDS MORE INFO)
6. DO NOT start coding until you have a clear, specific fix strategy
```

### Phase 2: Implement (one patch at a time)

```
1. Create/edit ONE Fingerprint + Patch file
2. Build: scripts/build.sh
3. Verify locally: scripts/verify_patch.sh <app_id> (with assertions if possible)
4. Optionally: decompile the patched APK and grep for injected code (see below)
5. Only proceed to Phase 3 if local verify passes
```

### Phase 3: Device Testing (structured, not exploratory)

```
1. Patch & install: scripts/patch_local.sh <app_id>
   Or: adb install -r <patched.apk>
2. Clear app data if needed: adb shell pm clear <package>
3. Launch: adb shell am start -n <package>/<activity>
4. Navigate using SAVED coordinates or uiautomator-parsed bounds (see convention)
5. Take ONE screenshot to verify the expected state
6. Capture targeted logcat if needed:
   adb logcat -d --pid=$(adb shell pidof <package>) | grep -i "error\|exception\|crash"
7. If bug is fixed → done
8. If not → capture evidence, update hypotheses, return to Phase 1
```

---

## Convention: Device Profile

On first device connection, create `scratch/device-profile.yaml`:

```yaml
device_id: "35081JEGR00852"
model: "OnePlus Nord"
screen_size: "1080x2400"   # from: adb shell wm size
density: "420dpi"           # from: adb shell wm density

# App-specific nav targets (populated from uiautomator dump)
apps:
  com.lemon.lvoverseas:  # CapCut
    # Bottom navigation bar
    nav_tabs:
      modifica: [90, 2370]
      modelli: [270, 2370]
      progetti: [440, 2370]
      me: [620, 2370]
    # Editor toolbar
    editor:
      audio: [540, 2200]
    # Audio panel
    audio_panel:
      suoni: [200, 400]
      musica: [100, 400]
```

**How to populate:** Run `adb shell uiautomator dump /sdcard/ui.xml && adb pull /sdcard/ui.xml`, parse the XML, and extract `bounds` attributes for each named element. Calculate tap point as center of bounds rectangle:
```
bounds="[0,2340][180,2400]" → tap at (90, 2370)
```

**Reuse:** Before tapping, check the profile. If coordinates exist, use them directly — no screenshot needed to verify you hit the right thing.

---

## Convention: Analysis Notes

After reading a smali/java file for the first time, write a summary to `scratch/analysis-notes.md`:

```markdown
## com.vega.kv.keva.KevaSpAopHook

**Purpose:** SharedPreferences AOP wrapper used by the app's KV storage layer.

**Key methods:**
- `getSharedPreferences(Context, String, int)` — wraps standard SP; calls `KevaMultiProcess.getSharedPreferences()`
- Context can be null at startup before Application.onCreate

**Call chain:**
KevaSpAopHook.getSharedPreferences
  → KevaMultiProcess.getSharedPreferences(context, name, mode)
  → if context is null → NPE

**Fields of interest:**
- None significant; stateless utility class

**Verdict:** Needs null-context guard. Fallback: `InitContext.d.get("globalApplication")` or `AppLog.getContext()`.
```

**Rule:** When you need to reference this class again, read `scratch/analysis-notes.md` instead of re-reading the 1000+ line smali file.

---

## Convention: Hypotheses

Track your debugging hypotheses in `scratch/hypotheses.md`:

```markdown
# Hypotheses for: CapCut audio infinite refresh

## H1: Sounds API fails because CrackingInterceptor corrupts request signatures
- **Evidence:** Logcat shows "Troppe persone stanno utilizzando questa funzionalità" (server rejection)
- **Evidence:** CrackingInterceptor.intercept() is a native method that modifies HTTP headers
- **Test:** Bypass interceptor by stripping NATIVE flag and injecting chain.proceed(chain.request())
- **Status:** CONFIRMED — not yet patched

## H2: CronetEngine fails to initialize, breaking all HTTPS
- **Evidence:** Logcat "CronetEngine has not been initialized"
- **Evidence:** Some requests work (ad images load), so this is partial
- **Test:** Check if Cronet init depends on context from KevaSpAopHook
- **Status:** NEEDS MORE INFO — may be secondary to H1

## H3: (RESOLVED) NPE crash in KevaSpAopHook.getSharedPreferences
- **Evidence:** Logcat NPE stacktrace at KevaSpAopHook line 42
- **Fix applied:** Added null-context fallback via InitContext.d / AppLog.getContext()
- **Status:** FIXED
```

**Rule:** Only investigate one hypothesis at a time. Update status before moving to the next.

---

## Convention: UI Navigation

### Preferred: uiautomator-based navigation

```bash
# 1. Dump UI hierarchy
adb shell uiautomator dump /sdcard/ui.xml
adb pull /sdcard/ui.xml scratch/ui-dump.xml

# 2. Find the element you want to tap
grep -i "audio\|suoni\|modelli" scratch/ui-dump.xml

# 3. Parse bounds and tap center
# bounds="[432,2156][648,2280]" → center = (540, 2218)
adb shell input tap 540 2218
```

### Fallback: cached coordinate tap

Only if uiautomator dump fails (some apps block it):

```bash
# Use coordinates from device profile
adb shell input tap 270 2370   # "Modelli" tab from profile
```

### Anti-pattern: blind tap → screenshot → retry

**Never do this:**
```
adb shell input tap 500 2300  # guess
adb shell screencap ...       # check
# wrong place, try again
adb shell input tap 500 2200  # another guess
adb shell screencap ...       # check again
# ...repeat 5 times
```

Each screenshot + view_file cycle costs significant tokens. Get the coordinates right the first time.

---

## Rules

### 1. Write notes, don't re-read
After reading a smali/java file, summarize it in `scratch/analysis-notes.md`. Reference notes on subsequent access. A smali file can be 1000+ lines — your summary should be 10-20 lines.

### 2. Cache device info
Screen size, density, and nav coordinates don't change between taps. Query once, save to `scratch/device-profile.yaml`, reuse forever.

### 3. One patch at a time
When developing a new patch:
1. Build with ONLY the new patch
2. Verify on device
3. Then build with all patches together and verify again

This isolates failures. When all patches are applied together and something breaks, you can't tell which patch caused it.

### 4. Hypothesis-driven debugging
Don't explore the codebase broadly. Write what you think is wrong, what evidence you need, and go get exactly that evidence. Update `scratch/hypotheses.md` as you go.

### 5. Don't poll background tasks
After launching a build, install, or other background command, **stop calling tools**. The system will notify you when the task completes. Only use `manage_task` if a task seems truly stuck (and set a timer-based check, don't loop).

### 6. Local verify before device deploy
Use `verify_patch.sh` with assertions. Optionally decompile the patched APK and grep for your injected instructions. Only push to device when you're confident the bytecode is correct.

### 7. Use uiautomator for navigation
Parse `uiautomator dump` XML to get exact element bounds. Never guess tap coordinates when a dump is available.

### 8. Minimize screenshots
Take a screenshot only when you need to verify a visual state that can't be checked via logcat or uiautomator. One screenshot per verification step, not a continuous stream.

### 9. Delegate broad research to subagents
If you need to survey 10+ smali files to trace a call chain, spawn a research subagent. This keeps the main agent's context clean for decision-making and code editing.

---

## OOM-Safe Decompilation

Large apps (100MB+ APK) can OOM during jadx decompilation. Use these settings:

```bash
# In config/apps/<app_id>.yaml, specify:
decompile:
  jadx_max_heap: 4g
  jadx_threads: 2

# Or pass directly:
jadx --jobs 2 -Xmx4g --no-res -d analysis/<app_id>/jadx_out <apk>
```

- `--no-res` skips resource decompilation (saves ~40% RAM)
- `--jobs 2` limits parallel threads
- `-Xmx4g` caps heap at 4GB

For very large apps, consider decompiling individual DEX files:
```bash
jadx --jobs 1 -Xmx2g -d analysis/<app_id>/jadx_classes3 classes3.dex
```

---

## Local Verification Before Device Deploy

After `patch_local.sh` produces a patched APK, do a quick local sanity check:

```bash
# 1. Decompile the patched APK
apktool d -f patched.apk -o /tmp/patched-check

# 2. Verify your injected code exists
grep -rn "your_injected_string" /tmp/patched-check/smali*/

# 3. Example: check that CrackingInterceptor was patched
grep -A10 "\.method.*intercept" /tmp/patched-check/smali*/com/vega/launcher/network/interceptors/CrackingInterceptor.smali

# 4. Cleanup
rm -rf /tmp/patched-check
```

This catches bytecode injection errors without the 2-minute build→install→launch→navigate→screenshot cycle on the device.

---

## Estimated Impact

With this workflow applied to the same CapCut session:

| Metric | Before | After (estimated) |
|--------|--------|--------------------|
| Agent turns | 617 | ~200 |
| `view_file` calls | 189 | ~40 (notes replace re-reads) |
| Screenshots | 96 | ~15 (cached coords + uiautomator) |
| Screen taps | 81 | ~20 (precise first-try taps) |
| `manage_task` polling | 73 | ~5 |
| Token cost | 100% | ~30-35% |

**Estimated token reduction: ~3×**

---

## Framework integration

This retrospective is implemented as a repo-local agent framework. **Canonical workflow:** [AGENTS.md](../AGENTS.md) (AI agent workflow section).

| Component | Location |
|-----------|----------|
| Session bootstrap | `scripts/init_session.sh` |
| Scratch templates | `docs/templates/` |
| Cursor skill shortcut | `.agents/skills/morphe-patch-workflow/` |
| Session state | `scratch/<app_id>/` (gitignored) |

### Grilled decisions (2026-08-27)

- **AGENTS.md is canonical** — full workflow inline; skill is a thin pointer
- **No Cursor rule** — avoids triple doc maintenance
- **Tiered research gate** — fast path for known patterns; full Phase 1 for novel bugs
- **No UI scripts** — uiautomator/adb documented in AGENTS.md; fallback chain in skill reference
- **Tiered device testing** — required per session.md acceptance criteria; smali-only goals can stop at local verify
- **Framework repo** — fork to build your own patches; existing apps are non-blocking examples

### Pending implementation (requires agent mode)

- [x] `scripts/init_session.sh`
- [x] `.gitignore` — add `scratch/`
- [x] `config/apps/_template.yaml` — decompile + device.nav blocks
- [x] `scripts/decompile.sh` — OOM-safe jadx options from config
- [x] `Makefile` — `session-init` target
