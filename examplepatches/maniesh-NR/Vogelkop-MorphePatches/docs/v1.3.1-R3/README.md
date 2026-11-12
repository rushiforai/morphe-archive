# v1.3.1-R3 — X-rung: the fresh-install waiter bypass (2026-11-12)

W1 booted (four-innocent combo cleared). W2 proved the hybrid pipeline and
all four R2 patches behave as designed (no T&C, no default-browser step, no
data-collection step, wallpaper picker kept) — and then froze at the last
gate. Root cause and fix below; full trace in root `STATE.md` §W2 post-mortem.

## Root cause (condensed)

On a fresh install (`version_code == 0`), Opera arms a **startup-dependency
waiter** (`m9k.e` = false) before the onboarding flow may end. The flow
driver (`cek` case 10) then posts the `g49` "Almost there!" screen instead
of the END event, and waits for:

- `j9k` — the remote-config bundle (`config_bundle.active` pref), retried
  through `avj.g(2, …)` (gated on startup-state bit 2) and an `i9k` observer;
- `bac` — the Leanplum/Braze start response;
- or `g49`'s own give-up timeout (`mni` case 24 → `m9k.R(true)`), scheduled
  through the `umi` startup-flow delayed executor.

In S1 and W2 none of these ever fire, so the app parks on "Almost there!"
forever (relaunch: empty due-queue → straight back to the same gate → black
screen). Stock resolves the waiter, which is why every unpatched rung booted.

## The patches

### 02f — waiter bypass (`m9k.smali`)

`m9k.<init>` computes the waiter's initial value as
`has_waited_for_startup_dependencies || !fresh_install`. 02f inserts a
dead-code `const/4 p5, 0x1` right before `Boolean.valueOf(p5)`, forcing the
initial state to **true** — identical to every steady-state launch
(`version_code != 0`), which by construction run fine without the wait.

Effects:

- `tzn` case 2 (`m9k.e.g()`) returns true → `cek` posts `k0o.d` (END) →
  `L()` → `J()` → `g9k.J()` → browser. `g49` is never posted.
- `m9k.S()` still starts `j9k`/`bac`; their late completion is a no-op
  (`m9k.R` early-returns once `e` is true).
- `t77` case 11 (subscribed via `m9k.W`) writes
  `has_waited_for_startup_dependencies` when `e` fires true — harmless
  belt-and-braces for any code path that still reads the pref.
- First browser launch may happen before the remote config / Braze start
  arrive; they keep initializing in the background (same as every launch
  after the first in stock).

### 02h — splash skip (`q0o.smali`)

`q0o.f()`'s first branch posts `q0n(15)` — the `hch` splash
(`delayed_launch_fragment`, "Opera logo with a loading bar") — whenever
`pushed.sequence != 2` and the flow state isn't built yet. 02h replaces the
`if-eq v0, v1, :cond_2e` guard with `goto/16 :cond_2e`, so the posting block
is dead code and the flow always proceeds straight to tree-building.

Effects:

- No splash on first open (PERSONALIZATION is the first thing you see after
  the system cold-start window) and none on relaunch.
- `pushed.sequence` stays 0 forever: its only readers are this site (dead)
  and `cfn` case 0xd (`e0o.shouldShow`, already forced false by 02e).
- `hch`'s 10-second force-launch timeout is retired along with the screen.

## Builds

| # | File | Content | Role |
|---|---|---|---|
| 1 | `X2-rung-universal_signed.apk` | W2 + 02f + 02h | **flash this first** — the v1.3.1 feature candidate |
| 2 | `X1-rung-universal_signed.apk` | W2 + 02f only | differential — only needed if X2 misbehaves |

Both carry everything W2 had: 02a' (T&C auto-accept via the real `X()`
handler), 02d (DEFAULT_BROWSER step dead), 02e (CMP_INTRO + CONSENT steps
dead, unasked consent = all denied), 03d (omnibox VPN Pro / eSIM suggestion
chips gone), 02b/02c/03b/03c-extended, and the C1 startup diagnostics
(`Android/data/com.opera.browser.beta/files/vogelkop-diag.log`).

## Build pipeline (recycle #3 re-provision)

Same hybrid pipeline as R2 (`docs/v1.3.1-R2/README.md`), but starting from
the **W2 rebuilt dex** re-downloaded from the `sandbox-storage` release
(`W-rung-rebuilt-classes3.dex`, hash-checked against `W-RUNG-SHA256SUMS.txt`):

1. Wrap the W2 dex as `classes.dex` in a minimal zip, `apktool d --no-res`.
2. Apply `patches/m9k.smali.patch` (02f) — and for X2 also
   `patches/q0o.smali.patch` (02h).
3. `apktool b` → harvest the rebuilt dex.
4. `scripts/splice_entry.py` → replace `classes3.dex` in the C1 substrate.
5. `scripts/v131_binary_patch.py --only 02b,02c,03b,03c` (anchors re-checked
   on the rebuilt dex) + structural gate over all dexes.
6. zipalign + apksigner v1+v2+v3.

## Reproduction commands (from `work/` after provisioning)

```bash
python3 -c "import zipfile; z=zipfile.ZipFile('xbuild/dexwrap/w2.zip','w'); z.write('dl/W-rung-rebuilt-classes3.dex','classes.dex')"
java -jar tools/apktool.jar d --no-res -f -o xbuild/smali-w2 xbuild/dexwrap/w2.zip
#   → edit smali-w2/smali/{m9k,q0o}.smali per patches/
java -jar tools/apktool.jar b xbuild/smali-w2 -o xbuild/rebuilt-w2x.apk
unzip -o xbuild/rebuilt-w2x.apk classes.dex -d xbuild/rd && mv xbuild/rd/classes.dex xbuild/new_classes3.dex
bash scripts/build_x_rung.sh
```
