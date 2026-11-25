# Rambler correction learning: client-side proof-of-concept design

Research only: nothing in this note is built or shipped. Static analysis of Gboard 18.6.3.1002251336 arm64
(`base.apk`, jadx) and strings of `lib/arm64-v8a/libintegrated_shared_object.so`. Names in `code` are the obfuscated
18.6.3 classes; the original names come from Gboard's own logging strings. Background:
[hidden features inventory](2026-11-12-gboard-rambler-hidden-features.md).

## What "correction learning" is

The Rambler settings footer promises that "Rambler learns from your contacts and from words you fix after
dictating". The words end up in the UserFeatureCache (UFC) feature `MUSE_STATS` (proto `keyboard.decoder.ufc.MuseStats`:
`Word{spelling, pronunciation, lang_code, type}`, per-app conversation, punctuation and capitalisation preferences,
`last_processed_text`). Rambler gets them because `NewS3Recognizer.getBiasingWords` (`knt`) reads list 3 (`rwn.d`)
and attaches it to every request when `enable_user_contact_biasing` is on. The Voice correction list screen shows lists
1, 3 and 4 (`rwn.b`, `rwn.d`, `rwn.e`).

Nothing in Java writes learned words. The learner is native: `keyboard::decoder::ufc::MuseStatsProcessor`
(`muse_stats_processor.cc`), registered and fed by `InputActionsUserFeatureProcessor`.

## Gate chain on a re-signed build

| # | Gate | Default here | Evidence | Needed for PoC |
| --- | --- | --- | --- | --- |
| G1 | `enable_user_feature_cache` (`rxy.a`) loads module `ryi` | forced on since v1.67.2 | `ModuleManager` load condition | already done |
| G2 | `MUSE_STATS` store registered (`enabled_user_feature_cache_features_v2`, `rxy.c`) | on: default proto lists feature 23 → `rwn` | `rxy` static init | nothing |
| G3 | Processor list `user_feature_cache_metric_processors_v2` (`ryj.a`, `aahw` = repeated string field 1) | **empty** | `UserFeatureCache.g()` passes `ryj.a.l().b` as the processor names | override to contain `MuseStatsProcessor` |
| G4 | Processor params: `use_input_actions_processor_params_v2` (`ryj.d`) false → v1 path; `input_actions_processor_params` (`ryj.b`, `rvx`) | empty `rvx` | `InputActionsUserFeatureProcessor.c()` ("convertV1ToV2") turns the name into `rvw{name, feature=MUSE_STATS, params=rwc}` | nothing; conversion always attaches `rwc` |
| G5 | POS-tag model for `rwc.c` (field 4): asset `postags-en.smfb` | **absent from every split** | `m(Context)` → `assets.open("postags-en.smfb")`, logs and returns null | unknown effect, see risks |
| G6 | Session start: `TRAINING_CACHE_SESSION` begin; input actions only buffered inside a session | needs training-cache metrics | `ryk.b` buffers `rqa.INPUT_ACTION` only when `ykn.c` is set by the session begin | probably `enable_training_cache_metrics_processors` |
| G7 | Session end: `rqa.NEBULAE_SESSION_METADATA` (`ytf`) triggers `nativeUpdateSession` + `nativeProcessRequest` | emitted by `NebulaeTrainingCacheMetricsProcessor` (`kcq`/`kcr`) | `kcr` emits it; `kcq.o()` sets `ytf.A` = `text_from_rambler` | **`enable_training_cache_metrics_processors`** (`rmz.a`, default false) gates module 221 `TrainingCacheMetricsProcessorManager` (`rqo`) that hosts it |
| G8 | Input actions themselves: `Latin5NativeMetricsProcessor` (`ibh`) emits `rqa.INPUT_ACTION` from the native decoder's metrics (`yqd.g`) | unverified | `ibh` line ~343 | phone check |

`input_action_byte_size_limit_for_ufc` (`ryj.e`) defaults to 0, which means no limit (only enforced when > 0).

## PoC design (client side only)

1. **G3 via the existing flag hook.** Proto flags (`odl.h`) are `byte[]` `odo` flags (`ods.a.j(byte[].class, …)`), so
   they pass through the same `odo` getter our flag-family composer already hooks. A new family
   `RAMBLER_CORRECTION_LEARNING` receives `("user_feature_cache_metric_processors_v2", byte[])` and returns the stock
   bytes with one more field-1 string appended: `0x0A 0x12 "MuseStatsProcessor"` (18 bytes). Appending keeps any
   processors Google might send. No new hook site, no proto classes needed in the extension.
2. **G7/G6.** The same family returns `true` for `enable_training_cache_metrics_processors`. This loads the training
   cache producer (module 221), whose Nebulae processor starts/ends the sessions UFC needs and marks
   `text_from_rambler`. Do **not** touch `enable_report_from_training_cache`, the federated (brella split) flags or
   any upload/export flags (`enable_export_ufc`, `enable_export_pcv2_revert_history`): everything stays on the phone.
   Optional extra training-cache stats flags (`enable_typo_stats`, `enable_spatial_stats`, …) stay off.
3. **Keep v1 params** (G4): leave `use_input_actions_processor_params_v2` false so the Java conversion supplies
   `MuseStatsProcessorParams`; the native "MuseStatsProcessorParams missing" error only occurs without params.
4. **No asset in the first PoC** (G5). Measure first; only if nothing is learned, investigate the native parser of
   `rwc.c` (a flatbuffer, `.smfb`) and whether English POS tags are mandatory or only used to classify words.
5. **Patch shape:** experimental patch "Rambler correction learning (experimental)", default off, depends on Rambler
   personal dictionary (G1, sending). One runtime method plus a pure byte helper with JVM tests (append to empty /
   to an existing list / idempotent when already present / non-byte[] values untouched).

## Acceptance (phone, unrooted)

1. `adb shell dumpsys activity service <pkg>/com.android.inputmethod.latin.LatinIME`: `ModuleInitListener-ryi` available
   and the training cache module (221) listed as available.
2. Dictate a sentence with Rambler containing an unusual name, correct the misspelled word by typing, close the field
   (session end), wait a minute.
3. Open Gboard settings → Voice typing → Rambler → Voice correction list: the corrected word appears (Export confirms).
4. Dictate the name again: Rambler spells it right (the list is sent when the dictionary patch is applied).
5. Negative check: with the patch off, step 3 shows nothing new.

Gboard's flogger output does not reach logcat on this build, so the list screen is the observable result. If a
richer probe is wanted, a read-only log of `UserFeatureCache.c(MUSE_STATS, rwn.class)` word counts from our runtime
at Rambler start is the smallest addition.

## Risks and unknowns

- The training-cache module stores typing history (input actions) in Gboard's local training-cache database. It is
  local, but it is more on-device logging than stock Gboard does for this user; document it.
- MuseStatsProcessor may learn from all typing, not only fixes of Rambler text; the proto also tracks per-app style
  preferences. What `Word.type` values mean is not visible in the strings.
- Without `postags-en.smfb` the native processor may skip words, learn only some, or treat every word as a candidate.
- Whether the native decoder emits input actions (G8) without further decoder parameters is unverified.
- Server-side, Rambler may ignore words beyond its biasing limit (`smart_dictation_max_biasing_context_size` is 200
  for smart dictation; Rambler's own limit is unknown).
