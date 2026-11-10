# Test Ladder — B0 / B0b / B1 / B2 / B2b / B3 (2026-11-10 rebuild)

Six diagnostic builds of **Opera Beta 104.0.5262.91143** — all from the SAME
original APKMirror .apkm. This ladder replaces the older DIAG pack. It exists to
answer one question: **which ingredient of the patched build kills the engine
boot** (black screen ~5 s → crash, "broken installation" dialog)?

## How to test

- **Uninstall every installed Opera Beta first** (including patched builds).
  Uninstall again between tests.
- The Play Protect "unknown app" prompt during sideload is NORMAL — choose
  install anyway. It is unrelated to the crash.
- Install one rung, open it once, note what happens, then move to the next.
- If you can, also grab `Android/data/com.opera.browser.beta/files/vogelkop-diag.log`
  after the B3 rung (file manager) — or run `adb logcat -d VogelkopDiag:* *:S`
  during any launch.

## The rungs (test in this order)

| Order | File | Build recipe | What it tests |
|---|---|---|---|
| 1 | `B0-apkeditor-nopangle-v123.apk` | APKEditor merge, **pangle split excluded**, .so STORE fix, signed **v1+v2+v3** | The vadj mod's recipe exactly: merge + re-sign, no Morphe involved |
| 2 | `B2b-morphe-zeropatch-v123.apk` | Morphe zero patches, re-signed v1+v2+v3 | The Morphe pipeline (dex/pangle/manifest handling) + good signing |
| 3 | `B1-morphe-v123-all-v123.apk` | v1.2.3 ALL patches, re-signed v1+v2+v3 | Patches + pipeline + good signing — the full product |
| 4 | `B0b-apkeditor-pangle-v123.apk` | APKEditor merge WITH pangle, v1+v2+v3 | Only if B0 boots but B2b fails: is the Pangle split merge the poison? |
| 5 | `B2-morphe-zeropatch-v2.apk` | Morphe zero patches, v2-only (as Morphe ships) | The signing difference alone |
| 6 | `B3-morphe-v130-diag-v123.apk` | v1.3.0 **diagnostics only** (exclusive, NO spoof), v1+v2+v3 | Self-reporting probe: always leaves a trace (file or logcat) |

## Interpreting results

| Observation | Conclusion |
|---|---|
| B0 boots + B2b boots + B1 boots | **v2-only signing was the killer all along** → ship v1+v2+v3 re-signing, done |
| B0 boots, B2b fails | The Morphe rebuild content is the poison (dex rewrite or pangle merge) → next: B0b separates pangle |
| B0 boots, B0b fails | The Pangle split merge specifically breaks the engine |
| B0 fails | The vadj recipe does not transfer to this .apkm input (deeper dig needed) |
| B2 boots but B2b fails | Re-signing (v1/v3 addition) breaks it — keystore or scheme issue |
| Any rung dies with B3-style trace available | Read `vogelkop-diag.log` / logcat tag `VogelkopDiag`: breadcrumbs + heartbeat bound the death moment; the crash stack names the killer |

## Files

- `LADDER-SHA256SUMS.txt` — SHA-256 of every rung (same file also lives on the
  `sandbox-storage` release, which mirrors the whole ladder durably)
- All six rungs are also downloadable from
  https://github.com/maniesh-NR/Vogelkop-MorphePatches/releases/tag/sandbox-storage

Report back the outcome of rungs 1–3 (and any log you grabbed) — the next move
is fully determined by the matrix above.
