# Unlimited words

Removes the free-plan weekly word quota, so dictation keeps working past the limit instead of
being refused.

* **Package**: `com.wispr.flowapp`
* **Target version**: 2.8.7 (see `compatibility` in [`patch.json`](patch.json))
* **Evidence**: [`analysis/wispr-flow-2.6.2.md`](../../analysis/wispr-flow-2.6.2.md) §4,
  [`analysis/wispr-flow-2.8.7.md`](../../analysis/wispr-flow-2.8.7.md) §1

## What the app does without the patch

`WordLimitPolicy` (smali: `com/wispr/payment/wordlimit/WordLimitPolicy`) turns the plan and the
weekly limits into a state. The thresholds come from the backend as a `WeeklyWordLimits` object;
the defaults below are the ones observed in 2.6.2 and are no longer inlined as constants.

| Words used in the week | State | Result |
|---|---|---|
| < 800 | `None` | dictation works |
| ≥ 800 | `Warning` | one warning sheet |
| ≥ 1000 | `Exhausted` | upsell sheet, dictation stops |
| ≥ 1500 | `HardCapped` | hard block |

`computeGate` converts that state into a `DictationGate` (`Allow`, `Warn`, `SoftLimit`, `Block`),
and `DictationStartGate` turns the gate into a start decision. The blocking is therefore decided
**before** any audio is sent.

## What the patch changes

Two hooks, both in `classes4.dex`:

| Hook | Method | Injected code |
|---|---|---|
| `WordLimitPolicy.computeState` | `.method public final computeState(ZIJ)Lcom/wispr/payment/wordlimit/WordLimitState;` | returns `WordLimitState$None` immediately |
| `WordLimitEngine.resolveLimited` | `.method private final resolveLimited(J)Ljava/lang/Boolean;` | returns `Boolean.FALSE` immediately |

The first hook is what removes the limit: with `None`, `computeGate` falls through to
`DictationGate$Allow` for every word count. The second stops the engine from re-deriving a limited
plan after a dictation, which would otherwise let the quota state come back between two refresh
passes.

Both are injected as the first instructions of the method body, so the original logic stays in
place but is unreachable — easy to read in a diff, and easy to revert.

## Applying it

```bash
scripts/bootstrap.sh                       # JDK, apktool, jadx, signing tools
scripts/decompile.sh /path/to/wispr-flow.xapk   # the base APK of the bundle

python3 scripts/apply_patches.py --decoded build/decoded --dry-run
python3 scripts/apply_patches.py --decoded build/decoded
python3 scripts/apply_patches.py --decoded build/decoded --revert   # undo
```

The patcher refuses to run when the anchor is missing or occurs more than once, and applying twice
is a no-op. Reverting restores the original files byte for byte.

## Limits of this patch

* **It is client-side.** The weekly counter itself is synced from the vendor backend
  (`HistoryRepository`, `MobileWordsSnapshot`), and the gRPC `Init` message carries no plan or
  entitlement field, so nothing in the inference request tells the server what plan the account is
  on. Whether the server *also* refuses transcription past the quota is not yet confirmed on a
  device — if it does, this patch is not sufficient. See
  [`analysis/wispr-flow-2.6.2.md`](../../analysis/wispr-flow-2.6.2.md) §7.
* **It needs [`play-store-source`](../play-store-source/) to run.** The app ships Google Play
  licensing, which rejects a re-signed build before any of this is reached. This patch is the
  reason to patch; the other one is the reason the app starts.
* **It is version-specific.** The anchors are literal smali from 2.8.7. A new app version means a
  new anchor, and the patcher will refuse rather than patch the wrong thing.
