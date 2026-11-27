# V29 Gboard parity study - multilingual dictation

Analysis only (2026-09-23). Scope: dictation / speech / multilingual-enablement
surfaces. Typing UX is out of scope and stays byte-identical to V27.11.

## Key structural finding

Google itself has no automatic Bangla-English code-mixed dictation anywhere.

- Assistant voice typing (the on-device Pixel path, Pixel 6+) supports only
  English, French, German, Italian, Japanese, Spanish. Its multilingual
  auto-detect mode (Pixel 8+, live "Language tag" of the detected language)
  covers the same set - no Bengali, no Indic language.
- Bengali voice typing in stock Gboard is the classic server-based path (added
  August 2017): one language per dictation session, user-selected, transcribed
  straight to Bengali script by a Bengali acoustic model.
- For a mixed-language sentence on the wrong session language, stock Gboard
  produces single-model gibberish (documented: "Brot und Kase" -> "broad on
  cases" on the old English path).

Rambler's segment lock therefore already does something stock Gboard cannot:
automatic intra-sentence Bangla-English handling. The gaps below are the ASR
path, user override, visibility, onboarding, and offline behavior.

## Reference contract: what stock Gboard does (evidence-backed)

- Two voice paths (above). Language selection in the classic path: voice
  toolbar language chip (bottom-left abbreviation) or the keyboard globe;
  multiple languages must be enabled first.
- Enablement UX: Settings > Voice typing > Languages (per-language tick list);
  Offline speech recognition (All / Installed / Auto-update tabs, per-language
  packs with sizes, at least one pack must remain); mic permission runtime
  prompt on first use ("While using the app" / "Only this time" / "Don't
  allow"); "Speak now" panel; Auto punctuation toggle; Block offensive words.
- Pixel 8+ multilingual: auto-detects mid-sentence switches, keeps each span
  in its own language, adds punctuation automatically; known flaw: silently
  switches the whole keyboard to the dominant language and cannot be pinned.

## Smali grounding (this build, prod-decoded)

- Base is patched Gboard; full stock subtype list in res/xml/method.xml
  includes bn_BD and bn_IN.
- classifyLayout3 (GboardRamblerScriptFix): subtype locale "bn*" + an
  English-named layout => k2 multilingual; plain "bn*" => k1; non-bn => k3.
  So the k2 multilingual subtype carries a bn-prefixed locale. Stock Gboard's
  voice stack follows the subtype locale, so the recognizer should already be
  requesting bn. Observed romanized output on the test device means either
  this build requests en for voice, or the bn recognition path falls back on
  that device. This fork in the road is exactly what the on-device check
  below settles.
- The base APK's extension settings layer already has a voice settings
  surface (offline-speech-language querying, feature groups, advancedvoice /
  writingtools packages) - the V29 UX items have an existing hook point, not
  greenfield smali UI.

## Parity gaps, ranked by user-visible impact

### 1. ASR path / acoustic model - highest impact

This is the "call" -> কাল class from the field report: Bangla speech goes
through the wrong acoustic model and comes back as misheard English phonemes;
the lexical layer can only convert what survived acoustically. Gboard sends
Bengali speech to a Bengali model and gets script directly.

- Smallest-change path: verify which locale the engine requests for voice on
  k2 (see below). If the voice entry point takes a locale, the V29 candidate
  is a Bangla dictation mode running the bn-BD / bn-IN recognizer, output
  passed through as already-script (locked-Bangla semantics, zero lexical
  guessing). Full automatic dual-recognizer probing is V30-scale.
- ON-DEVICE VERIFICATION NEEDED: what locale the voice session actually
  requests; whether the bn recognizer path is reachable and what it returns.
  Cannot be proven on the JVM rig (it tests the text layer, not audio).

### 2. Manual override during dictation

Gboard lets the user pin the session language (toolbar chip, globe). Rambler
V28d's engine decides alone; a wrong lock destroys the sentence and the user
can only retype.

- Smallest-change path: long-press mic (or a voice chip) cycles
  Auto / Bangla / English for the session. Bangla = lock-all, English =
  preserve-all - one verdict-override branch at the existing SegmentLock
  entry. Tiny smali surface, fully verifiable on the v28d JVM rig.

### 3. Language state visibility

Gboard shows the session language (toolbar abbreviation chip); Pixel 8+ shows
a live "Language tag" of the detected language as you speak. Rambler users
find out which language came out only after a sentence is destroyed.

- Smallest-change path: per-segment lock verdict chip in the candidate strip
  (বাং / EN). Reuses the existing classification; no model work. Rig-verifiable
  for the verdict logic; the chip rendering needs a device smoke pass.

### 4. First-enable onboarding / enable screen - PENDING MAINTAINER SCREENSHOT

Gboard: Languages tick list, offline-pack UI, mic-permission flow, "Speak
now" panel. What this build's k2 first-run currently shows is unverified;
expected gap: nothing tells the user multilingual dictation exists or how it
decides.

- Smallest-change path: exact target defined by the maintainer's screenshot. Likely one
  settings row + short explainer on the existing extension settings surface,
  plus a verified permission flow.
- ON-DEVICE VERIFICATION NEEDED: current first-run behavior; the screenshot.

### 5. Offline / poor-network behavior

Gboard: downloadable per-language packs with auto-update, graceful
degradation. Rambler's lexical layer is offline by nature, but if the active
voice locale has no offline pack, dictation dies without network.

- Smallest-change path: verify whether bn-BD / bn-IN packs appear under
  Offline speech recognition on device; document; if gap 1 lands, request a
  locale that has a pack.
- ON-DEVICE VERIFICATION NEEDED: pack availability.

### 6. Auto punctuation

Gboard adds punctuation automatically (on-device path; server path per
language). Rambler's romanized ASR stream arrives punctuation-free; the
segment lock only cuts at ASR-provided punctuation. Punctuation comes from
the recognizer, not our layer - documented gap, re-evaluate only if gap 1
changes the recognizer configuration.

### 7. Voice commands (delete / clear / next, emoji by voice)

English-only even in stock Gboard; Bengali is unsupported by Google itself.
Documented non-goal for V29.

## What the rig can prove vs what needs a device

- JVM rig (offline, ground truth): everything in the text layer - verdict
  overrides (gap 2), verdict classification for the chip (gap 3 logic), all
  regressions against the v28d suite set.
- Device (maintainer installs; CI smoke covers what it can): voice locale
  request (gap 1), bn recognizer reachability (gap 1), offline packs (gap 5),
  first-run onboarding (gap 4), chip rendering (gap 3 visual).

## Sources

- support.google.com/gboard/answer/2781851 - voice typing UX, language chip,
  permission flow, "Speak now".
- support.google.com/gboard/answer/11197787 - advanced voice typing features.
- 9to5google.com/2023/10/23/google-pixel-7-multilingual-voice-typing-gboard -
  Google's text: auto-detect + Language tag, Pixel 8+ (coming to Pixel 7).
- androidauthority.com/gboard-voice-typing-3222912 - AVT language list per
  Google (en/fr/de/it/ja/es).
- androidpolice.com/google-pixel-8-multi-language-less-than-perfect - real
  mixed-dictation tests, gibberish failure mode, keyboard-switch flaw.
- indiatoday.in (2017-08-14) - Bengali voice typing added; server ASR
  pipeline (phoneme -> word -> context).
- keyboardapps.net/gboard-voice-typing - settings / offline-pack UX.
