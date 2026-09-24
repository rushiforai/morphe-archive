# Continuity, timing and inline settings revision

## What the reports establish

The first report has 28 API responses, all 2xx, but repeated locally rejected units and permanent failures after three attempts. The second report also shows the same rejection path. HTTP success is not accepted-caption success. The reports do not contain raw returned JSON or individual rejection reasons, so the exact rejected field cannot be proven retrospectively.

Code review identified avoidable rejection paths: implicit index counting, semantically identical JSON scalar/row representations being rejected, fenced JSON, and overlapping 1ms atoms created for co-timed source segments. We now print [id,text] input pairs and last_id; normalize only exact/lossless number and row forms; preserve strict contiguous/full coverage, valid source times, and translation-quality gates; merge co-timed input instead of inventing overlapping timestamps. Non-speech intervals can be empty without discarding surrounding speech. Invalid responses now expose fixed reasons, expected last index, and numeric returned ends, not response text/keys.

Retries remain capped at three failures. Existing retries receive the failed constraint. Context is bounded to 160 characters per side and accounting measures the actual transmitted context. Background requests can group up to three windows within the existing lookahead. No extra model-based segmentation pass or unlimited retry is added. Real-model failure-rate/token improvements require the user's new trace; synthetic tests are not semantic-quality proof.

## Subsecond timing

Continuous clock estimates cannot move backwards on a slightly lagging callback; callback display uses that same estimate instead of displaying raw callback time immediately after an extrapolated frame. Duplicate callbacks do not imply pause. Explicit seeks and observed pause re-anchor normally. No fixed global early offset is introduced. Weak ASR corrections smaller than 3*MAD are refused, which prevents an uncertain subsecond estimate from being applied as fact. Remaining physical audio/video delay cannot be determined from these traces alone.

## Inline editing and settings toast

The official AbstractPreferenceFragment.onPreferenceLongClick writes the breadcrumb to the clipboard. A scoped wrapper consumes that action only for the API URL/key/model/test rows; the original implementation and all unrelated rows remain unchanged. Inline Android EditText retains its native long-click/selection/Paste handling; the key editor dialog and extra button are removed. Clipboard contents are not proactively read.

The no-setting toast is emitted for unknown SwitchPreference/EditTextPreference/ListPreference registry entries in debug mode. Independently persisted addon switches now use Preference plus a native Switch widget, rather than claiming to be host-registered SwitchPreferences. No logging is globally silenced.

## Preview

The style category contains a 16:9 scene with two sample subtitle lines. Both sliders update it during dragging, save on release, and refresh the real overlay. Preview/player share font scaling and alpha calculations. It represents fullscreen proportions, not a promise that every long subtitle avoids automatic fitting.

## Verification scope

JVM regression includes representation variants, strict rejection, indexed inputs, bounded contexts, co-timed source normalization, jitter/seek behavior, noisy calibration, API-row scope, independent switch hierarchy and shared style math. Official-plus-addon APK build and decoded bytecode audit are tracked in the delivered verification report. No phone or paid API key is connected: native paste-popup interaction, preview aesthetics, audio alignment and model semantic quality remain device checks.
