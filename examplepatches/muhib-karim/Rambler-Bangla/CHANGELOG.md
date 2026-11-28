# Changelog

All notable changes to Rambler Bangla. Dates are AEST/AEDT.

## [32.4.0] - 2026-11-28

**SwiftKey Mode, Instant Full-Email & 1-Digit Prefix Personalized Strip, and Systemic Bangla Loanword & Orthography Overhaul.**

- **New SwiftKey Mode (`Patches → Keyboard → SwiftKey Mode`, `GboardSwiftKeyRuntime` + `GboardSwiftKeySettings` + `GboardSwiftKeySettingsFeature`):**
  - **In-Place Shift-to-Capitalize Word at Cursor:** When the cursor is touching any cased word (`hello|` or `he|llo`) with no selection, cycles `hello` → `Hello` → `HELLO` → `hello` directly in place without highlighting and without turning on Caps Lock (keeps Caps Lock normal after spaces and preserves Shift+Backspace forward delete & mid-word Shift chords). Defaults to **Double-tap Shift** with **Single-tap Shift** selectable inside Settings.
  - **Smart Space Trim Before Punctuation:** Typing `,` `.` `?` `!` `;` `:` right after a trailing space (`hello |`) pulls punctuation cleanly back to `hello,` — working harmoniously with Gboard's native **Auto-space after punctuation**.
  - **Custom Text Expansion Shortcuts (`RamblerSwiftKeyShortcutsStore`):** Map any short trigger (including symbols or numbers like `!email`, `@@`, `addr`, `ph`) to full phrases/emails/addresses surfaced directly on Gboard's native suggestion strip (1 tap to insert).
  - **Reversible 1-Tap SwiftKey Keyboard Preset:** Enables Gboard's native Number Row, Long-Press Symbols, snappy 200 ms long-press delay, Auto-space after punctuation, Double-space period, and Undo auto-correct on backspace plus Swipe-Down Dismiss, Shift+Backspace Forward Delete, and Extended Clipboard — snapshotting every touched preference so toggling OFF restores prior settings cleanly.
- **Instant Full-Email & 1-Digit Prefix Personalization (`RamblerAtMentionStore` + `RamblerAtMentionStripRuntime`):**
  - Extends **@Mention, Email & Digit Strip** to auto-learn completed full email addresses (`11name@gmail.com`) and digit-starting alphanumeric IDs (`24x7support`) alongside `@handles` and `@domains`, triggering native strip suggestions from the **very 1st digit** (`1` → `11name@gmail.com`) and on dotted email prefixes (`name.k` → `name.k@gmail.com`) without touching normal prose suggestions.
  - Strictly fail-closed on password, PIN/OTP (`TYPE_CLASS_NUMBER` / `TYPE_CLASS_PHONE`), and incognito fields, and filters out bare numbers, OTPs, and number+unit pairs (`10mb`, `5pm`, `2nd`, `2026`).
- **Systemic Bangla Loanword Phonetic Audit & Full-Lexicon Orthography Overhaul (`scripts/build_bangla_loan_and_phonetic.py` + `GboardRamblerBanglaLexicon` + `GboardRamblerBanglaNormalizer` + `GboardRamblerLoanSpell`):**
  - Cross-checked all AI4Bharat Aksharantar English→Bengali candidates against CMUdict initial consonant groups & English phonetic rules, purging 2,540 noisy Banglish homograph hijacks (`these→ঠেসে`, `will→বলল`, `who→ভিওএ`, `whose→বেশী`, `each→একই`, `vow→হবো`) into a clean **20,609-entry** loanword table + curated function-word overrides (`these→দিজ`, `those→দোজ`, `them→দেম`, `such→সাচ`, `each→ইচ`, `another→অ্যানাদার`, `same→সেম`, `sure→শিওর`, `real→রিয়েল`, `year→ইয়ার`).
  - Added generalized OOV trailing-`ো` stripping (`চৈত্রো→চৈত্র`), full-lexicon single-char homophone repair (`পৌশ→পৌষ`, `শ্রাবন→শ্রাবণ`), and full-lexicon single missing-hasanta conjunct repair (`ফালগুন→ফাল্গুন`, `কারতিক→কার্তিক`) across the entire offline Bengali lexicon with zero extra heap, plus all 12 Bengali calendar months + `মাস`, `আগের চে→আগের চেয়ে`, and `কিবোর্ড এ→কিবোর্ডে`.

## [32.3.0] - 2026-11-28

**Language-Wide Missing-Hasanta Conjunct Repair, `-তেশি` Verbs, Contextual `এখান → এখন`, 25k Mixed Banglish & App Updates 20–30s Note.**

- **Language-Wide Missing-Hasanta Conjunct & `নশ→ংশ` Repair (`GboardRamblerBanglaLexicon` + `GboardRamblerScriptFix`):**
  - Made Level-3 skeleton ignore dropped conjunct hasantas (`্`) and normalize nasal+sibilant (`নস/নশ → ংস`) on OOV words (while 89,556 valid Bengali words exit untouched), plus added `"টুকু"` / `"তুকু"→"টুকু"` suffix repair (`হচছে`→**`হচ্ছে`**, `যাচছে`→**`যাচ্ছে`**, `খাচছে`→**`খাচ্ছে`**, `কিনতু`→**`কিন্তু`**, `আনশতুকু`→**`অংশটুকু`**) and expanded `JOIN_PAIRS` (`chchh`, `nt`, `nsh`, etc.) at the transliterator source.
- **Colloquial `-তেশি / -তেশে / -তেশো` Verb Repair:** Added `শ` variants alongside `স` in `COLLOQUIAL_VERB_ENDINGS` (`বলতেশি`→**`বলতেছি`**, `করতেশি`→**`করতেছি`**, `লিখতেশি`→**`লিখতেছি`**).
- **Contextual `এখান → এখন` & Natural Phrase Spacing (`GboardRamblerBanglaNormalizer`):** Converts standalone `এখান` before verbs/clauses to **`এখন`** (`এখান দেখি`→**`এখন দেখি`**, `এখান দেখা যাক`→**`এখন দেখা যাক`**) while preserving `এখান থেকে` / `এখান পর্যন্ত` / `এখানে`, plus repairs `মনচচে` / `মনেহ হচছে` → **`মনে হচ্ছে`**, `পুরো পুরি` → **`পুরোপুরি`**, and `বাংলা টা` → **`বাংলাটা`**.
- **25,000-Word Banglish Dictionary in Mixed (`abc → বাংলা`) Mode:** Wired `GboardRamblerLoanSpell.banglish(lo)` into `GboardRamblerSentenceLang.classify()` so Romanized Banglish words inside English-heavy mixed clauses (`So, mix language to motamuti ভালোই কাজ করতেছে ja দেখতেছি.`) cleanly convert (`মোটামুটি`, `যা`) while keeping English Latin untouched.
- **Clear 20–30s Install Timing Note on App Updates Screen:** Updated **Settings → About → App updates** footer and update dialogs (`RamblerEnhancementsActivity`) to let users know Android typically takes 20–30 seconds after tapping **Update** / **Install without scanning** to verify and finish updating the ~89 MB keyboard package.

## [32.2.0] - 2026-11-28

**Zero Loanword Cold-Miss, Natural Bangladeshi Loanwords, True Multilingual Mixed Bangla+English & Faster `INSTALL_SCENARIO_FAST` OTA Installs.**

- **Eliminated Loanword Cold-Miss (`client` → `কলিএনত`, `everything` → `এভেরয়থিং`):** Preloaded `GboardRamblerLoanSpell.preload()` immediately on keyboard activation and every mic tap (`RamblerTextPipeline.syncActiveGboardKeyboard`), raised preload thread priority, and added a 150 ms bounded wait on `READY` (loads in ~15–25 ms) so the 17,841-entry loanword table never cold-misses into raw letter-by-letter Avro transliteration on first dictation after boot or update.
- **Natural Bangladeshi English Loanwords Across All 17,841 Entries:** Added 9 systematic CMUdict phoneme repairs in `GboardRamblerLoanSpell.cleanCmuLoanSpelling()` (`up*` `অপ`→`আপ`, `-ted/-ded` `টিড/ডিড`→`টেড/ডেড`, `াইঅন্ট`→`ায়েন্ট`, `*body`→`বডি`, `*one`→`ওয়ান`, `ন্চওয়`→`নচুয়া`, `exp*`→`এক্সপ`, `multi*`→`মাল্টি`, `-nce`→`ন্স`) plus 60+ curated everyday workplace/tech loanwords (`client` → **`ক্লায়েন্ট`**, `everything` → **`এভরিথিং`**, `android` → **`অ্যান্ড্রয়েড`**, `fluency` → **`ফ্লুয়েন্সি`**, `multilingual` → **`মাল্টিলিঙ্গুয়াল`**, `updated` → **`আপডেটেড`**, `downloaded` → **`ডাউনলোডেড`**, `everybody` → **`এভরিবডি`**, `everyone` → **`এভরিওয়ান`**, `eventually` → **`ইভেনচুয়ালি`**).
- **True Multilingual Mixed Bangla + English (`abc → বাংলা`) Even in English-Heavy Clauses:** Updated `GboardRamblerSentenceLang.emitSentence()` so mixed clauses where English words outnumber Bangla words (e.g., `Ajke kalke client meeting and everything.`) still convert definite Bengali words to Bengali Unicode while keeping all English words in English Latin (`আজকে কালকে client meeting and everything.`), while pure English clauses remain 100% untouched.
- **Lexicon-Backed Hyphenated Case-Suffix Auto-Joiner:** Updated `GboardRamblerBanglaNormalizer` to join `<bengali>-<suffix>` (`কে`, `টা`, `টি`, `তে`, `এর`, `রা`, `গুলো`, `ই`, `ও`) whenever `word + suffix` is a valid Bengali word in the 89,556-word lexicon (`কাল-কে` → **`কালকে`**, `আজ-কে` → **`আজকে`**, `কাজ-টা` → **`কাজটা`**) while preserving compound hyphens like `বাংলা-ইংলিশ`.
- **Faster In-App OTA Installation on All Android 12–16 Devices:** Added `PackageInstaller.SessionParams.setInstallScenario(PackageManager.INSTALL_SCENARIO_FAST)` (API 31+) so ART defers heavy synchronous `dex2oat` compilation of Gboard's 32.9 MB DEX to idle time after tapping **Update**, plus 4× larger 256 KB session staging buffer.

## [32.1.0] - 2026-11-28

**Language-Wide L3/L4 Dental-Retroflex, Jofola (`্য় → ্য`), `ৈ → ই` & Colloquial Verb (`-তেসি → -তেছি`) Orthography Upgrade.**

- **Eliminated Illegal Bengali Jofola (`্য়` → `্য`) at Both Source & Post-Commit:** Fixed `GboardRamblerScriptFix.transliterate()` so `HASANTA + y` emits `\u09CD\u09AF` (`্য`) instead of illegal `\u09CD\u09DF` (`্য়`), and added unconditional `fixIllegalJofola` cleanup in `GboardRamblerBanglaNormalizer` (`ব্য়াপার` → **`ব্যাপার`**, `ব্য়বহার` → **`ব্যবহার`**).
- **Level-3 & Level-4 Romanized-ASR Phonetic Skeletons in `GboardRamblerBanglaLexicon` (0 ms blocking, zero false positives on 89,556 valid Bengali words):**
  - **Level-3 (`skeleton3`, top 25,000 spoken words):** Collapses dental ↔ retroflex (`ট/ঠ/ত/থ`, `ড/ঢ/দ/ধ`), initial `আ ↔ অ`, and Avro diphthongs (`ৈ → ই`, `ৌ → উ`), automatically repairing thousands of unseen Romanized-Banglish spelling artifacts (`ফাতাফাতি` → **`ফাটাফাটি`**, `থিকমতো` → **`ঠিকমতো`**, `আবস্থা` → **`অবস্থা`**, `মোটামুতি` → **`মোটামুটি`**, `তারাতারি` → **`তাড়াতাড়ি`**, `কথিন` → **`কঠিন`**, `দুস্তু` → **`দুষ্টু`**, `মিস্তি` → **`মিষ্টি`**, `চেস্তা` → **`চেষ্টা`**, `স্পস্ত` → **`স্পষ্ট`**, `অনুস্থান` → **`অনুষ্ঠান`**).
  - **Level-4 (`skeleton4`, top 10,000 spoken words, guarded by `sk3` edit distance ≤ 1):** Repairs Romanized `a/o/u` vowel-sign drops (`একদাম` → **`একদম`**, `ফতাফাতি` → **`ফাটাফাটি`**, `পরাতা` → **`পুরাটা`**).
  - **Colloquial Bengali Verb Ending & Word-Final `ৈ` Repair:** Automatically fixes OOV `-তেসি/-তেসে/-তেসো/-তেসেন/-তেসিলাম` → `-তেছি/-তেছে/-তেছো/-তেছেন/-তেছিলাম` (`লিখতেসি` → **`লিখতেছি`**, `বলতেসি` → **`বলতেছি`**, `করতেসি` → **`করতেছি`**, `বুঝতেসে` → **`বুঝতেছে`**) and OOV trailing `ৈ` → `ই` (`সবৈ` → **`সবই`**).
- **Real-Phone Dictation Polish & Stronger Gemini Prompt:** Added `কলিরলি` → `ক্লিয়ারলি`, `বেশিভাগ` → `বেশিরভাগ`, `এখান তো` → `এখন তো`, `মাছ অ্যাকিউরেট` → `মাচ অ্যাকিউরেট`, strengthened `GEMINI_PURE_BANGLA_INSTRUCTION` for fast colloquial Bangladeshi speech, and added full unit-test coverage in `RamblerBanglaRuntimeTest`.

## [32.0.0] - 2026-11-28

**Live Gemini Rambler+ Bangla Academy Script Prompt Injection, Zero-Delay Non-Blocking Lexicon, Bulletproof `সব-i` / `হৈতেচে` / `বানানটা` Fixes & ~3.9 MB Slimmer APK.**

- **Live Gemini Rambler+ Active-Keyboard Bangla Script Injection (`RamblerCustomInstructionRules` + `RamblerTextPipeline`):**
  - Refreshes the active Gboard keyboard (`বাংলা` vs `abc → বাংলা` vs `English (US)`) on **every single mic tap** (`captureSessionContext`), not just extension activation.
  - Automatically injects a concise, Bangla Academy **language and script convention** directly into **Google's live Gemini Rambler+ `<custom_instruction>`** (`user_preferences` Bundle, merged cleanly with any user custom rules) whenever `বাংলা` or `abc → বাংলা` is active — so Gemini Rambler+ itself transcribes fluent, context-aware Bangla Academy Bengali (`বানানটা এখনো ভুল হচ্ছে।`, `সবই`, `ঠিকমতো`) directly from audio instead of emitting Romanized Banglish for Avro to guess. Leaves `English (US)` completely untouched.
- **Zero-Delay Non-Blocking Bengali Lexicon (`GboardRamblerBanglaLexicon`):**
  - Removed synchronous commit-thread blocking (`READY.await` / `loadNow` on commit) so voice dictation commits incur **0 ms delay**.
  - Slimmed `GboardRamblerBanglaLexiconData` to a fast **89,556-word** spoken+core valid set (`29,423` frequency-ranked spoken words + core `bn_BD` roots), preloaded asynchronously at extension activation / mic tap in **< 60 ms** (~200 KB smaller).
- **Bulletproof Post-Commit Safety Net Fixes:**
  - Fixed `সব-i` in Mixed mode (`abc → বাংলা`) in both `GboardRamblerSentenceLang` (enclitic check now runs **before** `T_EN_GRAM` skip and handles all Unicode hyphens/dashes `-`, `‐`, `‑`, `–`, `—`, `−`) and `GboardRamblerBanglaNormalizer` (final failsafe for any stray `<Bengali><dash>i/o/e` → `সবই` / `বাংলা-ও`).
  - Fixed broken Avro/ASR forms: `হৈতেচে`/`হৈতেছে`/`hoitese`/`hoiteche` → **`হচ্ছে`**, `ঠিকমত` → **`ঠিকমতো`**, and natural noun+`তা` → `টা` phrases (`বানান তা` → **`বানানটা`**, `কথা তা` → **`কথাটা`**, `জিনিস তা` → **`জিনিসটা`**, etc.).
- **~3.9 MB Slimmer APK (Zero Features Lost):**
  - Optimized all 34 `patches/src/main/resources/settings-previews` PNG/JPG/MP4 previews (`4.55 MB` → `0.89 MB`, **-3.66 MB**) plus the leaner Bengali lexicon (**-0.20 MB**) while keeping all 60 patches and every visual preview crisp and intact.

## [31.9.0] - 2026-11-28

**Full-Language 190,405-Word Offline Bengali Orthography Engine + Android 14–16 In-App Auto-Updater Fix.**

- **Full-Language 190,405-Word Offline Bengali Orthography & Phonetic-Skeleton Engine (`GboardRamblerBanglaLexicon` + `GboardRamblerBanglaLexiconData`):**
  - Generated reproducibly by `scripts/build_bangla_lexicon.py` combining **OpenBangla Keyboard** (`159,384` words, GPL-3.0), **LibreOffice `bn_BD` Hunspell** (`79,224` Bangladesh Bangla Academy roots, GPL-2.0+/LGPL/MPL), and **HermitDave FrequencyWords** (`27,753` spoken frequency ranks, MIT/CC-BY-SA) into ~526 KB gzipped data (~4.5 MB flat UTF-8 byte blob at runtime with binary-search lookup in ~5 µs and zero 190K String GC overhead).
  - **Zero false positives on valid Bengali words:** Every word already in the 190,405-word authoritative dictionary stays untouched (after curated Bangla Academy normalizations).
  - **Level-1 Strict Homophone Skeleton:** Automatically repairs *any* `শ/স/ষ`, `ণ/ন`, `ি/ী`, `ু/ূ`, `য/জ`, `ড়/ঢ়/র`, `ৎ/ত`, `ং/ঙ`, `ঁ` misspelling across the entire Bengali language (`পরিক্ষা` → **`পরীক্ষা`**, `বিস্ববিদ্যালয়` → **`বিশ্ববিদ্যালয়`**, `ভবিস্যত` → **`ভবিষ্যৎ`**, `প্রস্ন` → **`প্রশ্ন`**, `বৈসিস্ট্য` → **`বৈশিষ্ট্য`**, `বাংলাদেস` → **`বাংলাদেশ`**, `জিনীষ` → **`জিনিস`**, `মানুস` → **`মানুষ`**, `পৃথিবি` → **`পৃথিবী`**, `সুনতে` → **`শুনতে`**, `সিক্ষক` → **`শিক্ষক`**).
  - **Level-2 Aspiration, Jofola (`ব্য`↔`বে`) & Geminate Skeleton:** Repairs missing/extra aspiration, jofola shifts, and geminates across the top 22,000 spoken Bengali words (`বেবহার` → **`ব্যবহার`**, `উপস্তিত` → **`উপস্থিত`**, `খাছি` → **`খাচ্ছি`**, `বুযে` → **`বুঝে`**).
  - **Agglutinative Suffix Fallback:** Strips standard Bengali suffixes (`গুলোতে`, `গুলোই`, `গুলোর`, `গুলো`, `দের`, `টা`, `টি`, `কে`, `তে`, `এর`, `ই`, `ও`, etc.), repairs the stem, and re-attaches the suffix (`পরিক্ষাতে` → **`পরীক্ষাতে`**, `অবস্যই` → **`অবশ্যই`**, `বিস্ববিদ্যালয়গুলো` → **`বিশ্ববিদ্যালয়গুলো`**).
- **Fixed Android 14 / 15 / 16 (Samsung One UI) In-App Auto-Updater Install Handoff (`RamblerAutoUpdater` + `RamblerEnhancementsActivity`):**
  - Moved 92 MB `PackageInstaller` APK streaming + `fsync()` completely off the main UI thread into a background thread (`launchPackageInstallerAsync`) with live staging progress (`0%` → `100%`).
  - Replaced `PendingIntent.getActivity(...)` (which Android 14–16 `targetSdk 35` silently suppressed under Background Activity Launch / BAL restrictions) with an explicit package-scoped `PendingIntent.getBroadcast(..., FLAG_MUTABLE)` delivered to a live foreground `BroadcastReceiver` (`RECEIVER_NOT_EXPORTED`) that immediately invokes `startActivity(confirm)` directly from the resumed foreground Activity (and queues for `onResume()` if backgrounded).
  - Added a 10-second OEM safety watchdog, clear error reporting, and a 1-tap **"Save to Downloads"** fallback (`MediaStore.Downloads`) so updates can never silently stall.

## [31.8.0] - 2026-11-28

**Foolproof Pure Bangla & Mixed Orthography Engine (Post-LLM & Post-ASR Spell Normalizer, Enclitic Fix & Bangla Dari).**

- **New Post-LLM & Post-ASR Bengali Orthography Normalizer (`GboardRamblerBanglaNormalizer`):**
  - Runs on **100% of Bengali dictation commits** in Pure Bangla (`বাংলা`) and Mixed (`abc → বাংলা`) modes — even when the on-device Rambler LLM emits pure Bengali Unicode with zero Latin letters (removed the early `!containsLatin(input)` bailout in `GboardRamblerScriptFix`).
  - Repairs 120+ exact token-boundary Bengali & phonetic loanword misspellings without touching valid Bengali words (`শবদেহ`, `শবদাহ`, `শব্দ` preserved): `শবকিছু` → **`সবকিছু`**, `শবকিছু-আই` → **`সবকিছুই`**, `বুযে`/`বুজে` → **`বুঝে`**, `ভালে`/`ভাল` → **`ভালো`**, `শুন্দর` → **`সুন্দর`**, `শময়` → **`সময়`**, `ওয়টেভার` → **`হোয়াটেভার`**, `ফনেটিকস` → **`ফোনেটিকস`**, `ক্লির্লি` → **`ক্লিয়ারলি`**, `খাছি` → **`খাচ্ছি`**, plus natural compound adverb spacing (`সুন্দর ভাবে` → **`সুন্দরভাবে`**, `ভালো ভাবে` → **`ভালোভাবে`**, `রাইট নাউ` → **`রাইট নাও`**).
  - Performs Unicode NFC + double-nukta cleanup (`ড়়` → `ড়`, `ঢ়়` → `ঢ়`, `য়়` → `য়`) and converts sentence-ending ASCII `.` after Bengali letters into standard Bengali dari (`।`) in Pure Bangla mode while preserving ellipses (`...`), URLs, and emails.
- **Fixed Hyphenated `-i` Enclitic Conversion & Expanded Curated Dictionaries:**
  - Fixed `GboardRamblerScriptFix` & `GboardRamblerSegmentLock` so hyphenated `-i` emits Bengali emphatic enclitic **`ই`** (joining native bases like `সবকিছুই`, `সবই`, `এখনই`) instead of English pronoun `আই`.
  - Expanded `GboardRamblerScriptFix.EXCEPTIONS` (120+ `shob*`/`bujh*`/`bhalo*`/`shundor*`/`shomoy*` entries, fixed double-nukta literals) and `GboardRamblerLoanSpell.CURATED_BANGLA_LOANS` (+34 curated everyday English-in-Bangla loanwords: `হোয়াটেভার`, `ফোনেটিকস`, `রাইট`, `নাও`, `সেয়িং`, `রিটেন`, `শুড`, `সাপোজড`, `অ্যাকিউরেট`, `প্রপারলি`, etc.), prioritizing `EXCEPTIONS` → `CURATED_BANGLA_LOANS` → Avro Tier-1 ahead of raw CMUdict phonemes.
  - Strengthened `GboardRamblerLiteScriptRuntime.ALL_BANGLA_SCRIPT_RULE` to explicitly guide the on-device Rambler LLM toward standard Bangla Academy spelling and Bengali dari (`।`).
- **End-to-End Regression Coverage:** Added `pureBanglaOrthographyNormalizerFixesAllScreenshotSpellings()` verifying both 100%-Bengali LLM output and Romanized ASR paths, plus valid-word preservation.

## [31.7.0] - 2026-11-28

**Original Rambler Bangla Patches UI (Zero Upstream Repo Icons), Complete Keyboard/Clipboard Migration & Hardened About App Auto-Updates.**

- **Original Rambler Bangla `Patches` Visual Identity (`GboardPatchesSettingsActivity`):**
  - Replaced upstream `jasonwu1994/Gboard-patches`'s Google Blue Material Expressive styling and circular icon badges with Rambler Bangla's own Deep Navy / Ocean / Amber palette (`#070C14` / `#101927` dark, `#F2F5F9` / `#FFFFFF` light), branded gradient hero banner (`RAMBLER BANGLA · v31.7.0`), crisp `16dp` bordered card containers, tracked uppercase amber-bar section headers, and clean border-card typography (zero upstream repo icons).
- **Complete Keyboard & Clipboard Migration out of `Rambler Enhancements` into `Patches`:**
  - **Patches → Keyboard:** Promoted **AMOLED Dark Keyboard (#000000)**, **@Mention & Email Strip** (new `GboardAtMentionSettingsFeature` including Add custom `@mentions`, Learned preview/clear, and optional Native email provider completion), and **Hide launcher icon** to direct 1-tap switches right inside `Patches → Keyboard`, alongside **Appearance & Theme**, **Layout & Toolbar**, and **Typing Tools & Gestures**.
  - **Patches → Clipboard & Sharing → Clipboard:** Added **Quick-paste direct clipboard chip** alongside **Drag-to-reorder clips** and all clipboard patches.
  - **Pure Voice `Rambler Enhancements`:** Removed `@Mention & email strip` and keyboard/clipboard hidden flags from `RamblerEnhancementsActivity` (`RamblerHiddenFlagOverrideRuntime.voiceEntries()`).
- **Hardened `Settings → About → App auto-updates`:**
  - `GboardAboutPageResourcePatch` now runs in `finalize` and writes explicit `android:targetPackage`, `android:targetClass="dev.abotmaker.ramblerenhancements.RamblerEnhancementsActivity"`, `android:focusable="true"`, `android:selectable="true"`, and `section="updates"` for rock-solid Android 14–16 launch.
- **Full-Text Search Index & Docs Sync:** Regenerated `GboardSettingsSearchIndexData.java`, updated `README.md`, `docs/index.html`, SVGs, and Morphe manifests (`patches-bundle.json`, `patches-list.json`) with complete GPL-3.0/MIT/MPL-2.0/BSD/§7c credits.

## [31.6.0] - 2026-11-28

**Production Settings Redesign: App Auto-Updates under About, 4-Section Patches Tab & Moved Keyboard/Clipboard/Launcher Controls.**

- **App Auto-Updates moved under Settings → About:**
  - `GboardAboutPageResourcePatch` now adds **App updates** directly under **Settings → About** (right after Author & Patch Version), launching a dedicated **App updates** screen (`RamblerEnhancementsActivity`, `section="updates"`) with the **Auto-check for updates** toggle, **Check for updates now**, SHA-256 `SHA256SUMS.txt` verification, and 1-tap `PackageInstaller` updates.
- **Redesigned 4-Section Patches Tab (Distinct Rambler Bangla Organization):**
  - Replaced upstream's flat generic "Features" + "More settings" layout with 4 clean, purpose-built sections (all 100% searchable with regenerated `GboardSettingsSearchIndexData.java`):
    1. **Keyboard:** *Appearance & Theme* (now including **AMOLED Dark Keyboard (#000000)** alongside Frosted Glass, Custom Theme, Rounded Keyboard, Spacebar Logo, Emoji Size), *Layout, Keys & Toolbar*, *Typing Tools & Gestures*, and a direct 1-tap **Hide launcher icon** toggle.
    2. **Voice & Smart Input:** *AI & Voice Input* and *Dictionaries & Predictions*.
    3. **Clipboard & Sharing:** *Clipboard* (now including **Drag-to-reorder clips** moved from Rambler Enhancements) and *FTP Server*.
    4. **System & Preferences:** *Language*, *Settings Style*, *Backup & Restore*, and *Developer Options*.
- **Focused Rambler Enhancements Tab:** Removed keyboard/launcher/updater controls from `RamblerEnhancementsActivity` so **Rambler Enhancements** stays cleanly dedicated to Rambler+ voice, Bangla script/phonetics, Hex waveforms, per-app rules, dictionary/contacts, snippets/replace, and dictation stats/history.
- **Homepage & Navigation Map:** Updated `README.md`, `docs/index.html`, `docs/banner.svg`, `docs/feature-showcase.svg`, and Morphe manifests (`patches-bundle.json`, `patches-list.json`) with a clear Settings Navigation Map and complete GPL-3.0/MIT/MPL-2.0/BSD/§7c credits.

## [31.5.0] - 2026-11-28

**Pure Bangla Natural Spelling Overhaul, Hyphenated Enclitic Fix, SHA-256 Verified In-App GitHub Auto-Updater & 2-Minute Setup Guide.**

- **Fixed Pure Bangla (`বাংলা`) narration spellings & hyphenated enclitics:**
  - Wired **curated modern Bengali loanwords** (`CURATED_BANGLA_LOANS`: 70+ everyday words including `english` → `ইংলিশ`, `understand`/`understands` → `আন্ডারস্ট্যান্ড`/`আন্ডারস্ট্যান্ডস`, `clearly` → `ক্লিয়ারলি`, `voice` → `ভয়েস`, `mixture` → `মিক্সচার`, `language` → `ল্যাঙ্গুয়েজ`, `settings` → `সেটিংস`, `example` → `এক্সাম্পল`) + the **2,265-word Avro Tier-1 dictionary** (`GboardRamblerTier1`) ahead of raw CMUdict phonemes in Pure Bangla mode (`layout == 1`), plus `wellFormed`/`repair` validation.
  - Added systematic CMUdict cleanup (`GboardRamblerLoanSpell.cleanCmuLoanSpelling`) across all 17,841 table entries fixing initial `un-`/`under-` (`অ` → `আ`), `-ear`/`-eer` (`ির্লি` → `িয়ারলি`), `oi`/`oy` glides (`য়স` → `য়েস`), double-`জজ` plurals (`জেস`), and voiced plural `-s` (`জ` → `স`).
  - Fixed hyphenated Bengali enclitic particles in Mixed mode (`abc → বাংলা`): `সব-i` → **`সব-ই`**, `বাংলা-o` → `বাংলা-ও`, `কাজ-e` → `কাজ-এ` instead of misclassifying `-i` as English `"I"`.
  - Updated Pure Bangla LLM prompt (`GboardRamblerLiteScriptRuntime`) to request natural modern Bengali spellings.
- **In-App GitHub Auto-Updater (`RamblerAutoUpdater`):**
  - Added **Auto-check for updates** toggle (default ON, checks at most once every 12h when opening **Rambler Enhancements**) and **Check for updates now** button under **App updates (GitHub Releases)**.
  - Strictly allowlisted to `api.github.com/repos/muhib-karim/Rambler-Bangla/releases/latest` and `github.com/muhib-karim/Rambler-Bangla/releases/download/`, verifies downloaded APK's **SHA-256** against `SHA256SUMS.txt` fail-closed, and launches Android's native 1-tap `PackageInstaller` update sheet directly inside the app (no browser or GitHub hunting required).
- **Beginner-Friendly Setup & Dictation Guide:** Added a clear step-by-step **How to Set Up & Use Rambler Bangla (2-Minute Guide)** to `README.md` and `docs/index.html`.

## [31.4.0] - 2026-11-28

**True 3-Keyboard Rambler Dictation Modes, Custom Rambler Bangla App Logo (`র`) & Live Hide Launcher Icon Toggle (Issue #39).**

- **3-Keyboard Active-Mode Dictation Overhaul (no `Bangla (Latin)` keyboard required):**
  - Reads Gboard 18.5.4's active `InputMethodEntry` (`Lpev;` → `ImeDef.stringId` + layout variant) alongside `fhv.w()` on `AgenticDictationExtension.onActivateInternal`, cleanly distinguishing `বাংলা (বাংলাদেশ) — বাংলা` (`bn-BD` / `ime_bengali_bangladesh`), `বাংলা (বাংলাদেশ) — abc → বাংলা` (`bn-XU` / `ime_bengali_india_transliteration`), `English (US)` (`en-US`), and optional `Bangla (Latin)` (`bn-XA`).
  - Syncs the active keyboard mode directly into **both** the on-device Rambler LLM prompt (`GboardRamblerLiteScriptRuntime`) and the post-ASR engine (`GboardRamblerScriptFix` / `GboardRamblerSentenceLang`):
    1. **`English (US)` — All English / Phonetic Latin:** Always stays in English / phonetic ASCII Latin even when speaking Bangla (`GboardRamblerLayoutPair` no longer silently hijacks `English (US)` into Bengali conversion).
    2. **`বাংলা (বাংলাদেশ)` — `বাংলা` — 100% Bangla:** Always outputs Bengali Unicode script (including spoken English loanwords), even if a commit already contains partial Bengali characters (fixed `containsBengali()` early-bailout bug).
    3. **`বাংলা (বাংলাদেশ)` — `abc → বাংলা` — True Mixed Bangla + English:** Clause-aware intra-sentence code-switching writes spoken Bangla words/clauses in **বাংলা** while preserving English words & clauses in **English** inside the same sentence (e.g., `"পুরা টা বাংলা আসতেসে, English এ আসে না, and then it should understand Bangla English altogether."`).
- **Custom Rambler Bangla App Launcher Logo:** Bundled adaptive (`mipmap-anydpi-v26` + vertical `#2D6FA3`→`#0B1F3B` background + crisp `র` amber-underline foreground + monochrome themed icon) and legacy `mdpi`–`xxxhdpi` launcher icons generated from the project's brand logo (`docs/assets/2-icon-512.png`), wired in `AndroidManifest.xml` (`android:icon` and `android:roundIcon`).
- **Live `Hide launcher icon` toggle (Issue #39):** Added a live switch under **Rambler Enhancements → Keyboard appearance, clipboard & launcher** that cleanly disables/enables `LauncherActivity` via `PackageManager.setComponentEnabledSetting` (restoring the classic Gboard app-icon hide feature while keeping Settings accessible from the keyboard's gear button and Android System → Keyboard settings).

## [31.3.1] - 2026-11-28

**Hotfix: Fixed ART `VerifyError` crash on keyboard load in `Lrmt;-><init>` & Hardened ART/IME Emulator Verification.**

- **Fixed keyboard not loading after `v31.3.0`:** In Gboard 18.5.4's `Lrmt;-><init>(Context, Z)V`, R8 reuses parameter register `p1` for an `int` color return value (`move-result p1`) right before `return-void`. Passing `p1` to `readAmoledDarkKeyboardEnabled(Context)` triggered an ART `VerifyError` when inflating the keyboard theme. Replaced with zero-arg `RamblerEnhancementsSettings.isAmoledDarkKeyboardEnabled()` (using `RamblerFlagRuntime.resolveContext()`), added a clobbered-`p1` unit test in `RamblerBanglaPatchTest`, added clean-decompilation JADX checks, and hardened `android-smoke.yml` with real ART `cmd package compile -m verify -f` + live IME activation check.

## [31.3.0] - 2026-11-27

**Live `AMOLED Dark Keyboard` Toggle (Default OFF) & Persistent `Clipboard Drag-to-Reorder` (60 Morphe Patches).**

- **Live in-app `AMOLED Dark Keyboard` toggle (default OFF):** Gated Gboard 18.5.4's Material 3 GM3 dark palette override (`Lrmt;-><init>`) on `RamblerEnhancementsSettings.readAmoledDarkKeyboardEnabled(context)` with default **OFF** so stock Material You dark themes keep normal layered dark-gray contrast out of the box instead of collapsing all 4 surfaces to pitch `#000000`. Users can toggle pure `#000000` AMOLED Dark ON or OFF anytime under **Rambler Enhancements → Keyboard appearance & clipboard**.
- **Persistent `Clipboard Drag-to-Reorder` (new 60th Morphe patch, default ON):** Dynamically patches Gboard 18.5.4's clipboard `ItemTouchHelper.Callback` (`fqi`) via `RamblerClipboardReorderRuntime` to support 4-direction (`UP | DOWN | LEFT | RIGHT`) tap-and-hold drag-to-reorder within **Pinned** or **Recent** sections (works on 1/2/3-column staggered grids, locks section headers, preserves card opacity during drag instead of swipe-fade, and persists the new order permanently to `ClipboardContentProvider` by reassigning sorted descending timestamps and cleanly renaming image clip files via `ClipboardKeyboard.ab`). Stationary tap-and-hold (release without dragging) still opens Gboard's Pin/Paste/Delete popup, swipe left/right still deletes with Undo, and Edit Mode stays untouched. Includes a live Settings toggle under **Rambler Enhancements → Keyboard appearance & clipboard**.
- **Maintainer-signed in-place upgrade:** Signed with the persistent Rambler Bangla maintainer certificate (`679cfdec...`) via `.github/workflows/private-test-build.yml` so `v31.3.0` installs seamlessly over `v31.2.0` with zero data loss.

## [31.2.0] - 2026-11-27

**True Native Gboard Suggestion-Strip Integration for `@Mention` Suggestions (Zero Floating Overlay / Zero White Background).**

- **Native Gboard suggestion strip (`InputBundle` / `IKeyboardDelegate` / `CandidateViewBuilder`):** Replaced the floating custom `HorizontalScrollView` pill bar with direct native `Candidate` (`owu`) injection into Gboard's own suggestion strip (`pbh.K`, `pbo.aa`, `phr.aw`). Personalized `@handles` (`@grok`, `@claude`, etc.) now render natively inside Gboard's suggestion bar with exact theme matching (AMOLED `#000000`, Material You Dark/Light, Frosted Glass blur, and Custom Themes), native typography/dividers, tap-to-insert (`-10002`), and native long-press/drag-up "Remove suggestion" (`-10031`).
- **Maintainer-signed APK:** Signed via `.github/workflows/private-test-build.yml` (`679cfdec...`) so upgrading from `v31.1.0` installs seamlessly in-place with zero uninstall and zero data loss.

## [31.1.0] - 2026-11-27

**100% Personalized `@Mention` Strip Suggestions & Persistent Maintainer-Key APK Signing.**

- **Personalized `@` suggestions (zero fixed standalone defaults):** Removed hardcoded `DEFAULT_EMAIL_DOMAINS` backfill from standalone `@` mentions and defaulted Gboard's fixed `enable_email_provider_completion` override OFF so typing `@` / `@g` surfaces only your own learned `@handles` (`@grok`, `@claude`, etc.), ranked by frequency and recency. Common email-domain fallback now applies only in explicit email-address context (`name@g`).
- **Reliable learning across every input flow:** Captures all newly completed `@handles`/`@domains` in the buffer, flushes pending `@tokens` on Send/Enter/field-clear, field-switch (`onStartInputView`), and keyboard close (`onInputWindowHidden`) without false-learning backspaced typos, and learns dictated `@handles` in `RamblerTextPipeline` (strictly fail-closed in password/incognito fields).
- **In-app `@Mention` management:** Added an **Add custom @mentions or domains** dialog and top-learned preview inside Rambler Bangla Settings alongside live toggle and Clear All.
- **Persistent maintainer signing key:** Signed the `v31.1.0` Release APK with the repository's persistent maintainer certificate (`679cfdec...`) via GitHub Actions (`private-test-build.yml`), enabling seamless in-place APK upgrades on Android without uninstalling.

## [31.0.0] - 2026-11-27

**Rambler+ Activation Fix, `nl-morphe-patches` Integration, SwiftKey-Style `@Mention` Strip Suggestions (59 Morphe Patches), Phonetic Bangla Voice Handoff & In-App Branding.**

- **Fixed Rambler+ activation under Voice typing:** Forced `enable_agentic_dictation`, `config_agentic_dictation`, `enable_jetson_in_toolbar`, `enable_rambler_al_toolbar`, `enable_rambler_toolbar_at_cursor_position`, and `ad_activation_type = 2L` unconditionally in both `GboardRamblerStockPolicy` (`oki.g()`) and `RamblerFlagRuntime` (`oki.x()`), matching stock Pixel rollout and `johninnld/nl-morphe-patches` so `ModuleManager` always loads `AgenticDictationExtension` and selecting **Rambler+** activates immediately without restart.
- **Phonetic Bangla voice dictation reliability:** Wired Gboard's live active language tag (`fhv.w()`) into `GboardRamblerScriptFix` on extension activation, defaulted EN/BN multilingual pairing (`GboardRamblerLayoutPair`) ON for any enabled `bn*` keyboard, and added comprehensive E2E phonetic Bangla + CMUdict loanword + multilingual + protected-span unit tests.
- **SwiftKey-style `@Mention & Email Strip Suggestions` (new Morphe patch + live toggle):** Automatically learns typed `@handles` (e.g. `@grok`, `@claude`) and email domains (e.g. `@gmail.com`) on-device, displays tap-to-insert Material You pill chips on the suggestion strip when typing `@` / `@prefix`, supports long-press to forget and Settings clear/toggle, enables Gboard's native `enable_email_provider_completion` flag, coexists cleanly with Calculator & Manual Incognito, and stays strictly fail-closed in password/incognito fields.
- **Integrated `johninnld/nl-morphe-patches` Gboard features for Gboard 18.5.4 (3 new Morphe patches, 55 → 59 total with `@Mention` strip):**
  - `AMOLED Dark Keyboard` — dynamic Material 3 `rmt` pure `#000000` dark surface override.
  - `Rambler Toolbar & Revert Extras` — floating Rambler toolbar overflow menu, keep rewritten text on revert, and one-tap direct clipboard quick-paste chip.
  - `Hidden Flags Override` — native Gboard 18.5.4 `okf.g(olk.OVERRIDE)` → `okq.e()` live flag override store with toggles inside Settings.
- **In-app author & branding:** Updated in-app author/repo fields (`Patches`, `About`, and `Rambler Bangla` settings) to `muhib-karim` / `Rambler Bangla` while preserving complete, source-license-compliant upstream credits in `ATTRIBUTION.md`, `THIRD-PARTY-NOTICES.md`, `NOTICE`, `README.md`, and `docs/index.html`.

## [30.0.0] - 2026-11-27

Unified **Morphe Patcher 2.1.0** patch suite targeting Gboard `18.5.4.993608717-release-arm64-v8a` with **55 selectable Morphe patches** in a single `patches-30.0.0.mpp` bundle, combining Rambler Bangla's Bengali-first phonetic/voice engine with all upstream features from `abotmaker/gboard-rambler-enhancements` (v1.3.4) and `jasonwu1994/Gboard-patches` (v4.5.0).

- **Rambler Bangla Lite Script Policy (Morphe patch):** Dynamically resolves Gboard 18.5.4's JetsonLite cleanup builder (`fja.d`) and prompt owner (`ezn.b`) using fail-closed SHA-256 fingerprint verification, supporting both 18.5.4 and 18.3.1 anchor orderings. Preserves Bengali Unicode for `bn-BD`, `bn-IN`, and `bn-Beng` while respecting explicit `bn-Latn` Romanization.
- **Rambler Bangla Phonetic & Multilingual Engine (Morphe patch):** Ports the complete V29.3+/V29.5 Bengali phonetic transliteration engine (`GboardRamblerScriptFix`, `GboardRamblerSegmentLock`, `GboardRamblerSentenceLang`, `GboardRamblerLoanSpell`, `GboardRamblerLoanTable`, `GboardRamblerTier1`, `GboardRamblerEnglishWords`, `GboardRamblerDiag`, `GboardRamblerLayoutPair`) into the Morphe extension, wired ahead of `RamblerTextPipeline` with fail-closed password/sensitive/incognito field bypass and a native Material You **Rambler Bangla (phonetic & script)** Settings page.
- **Gboard Rambler Enhancements (`abotmaker/gboard-rambler-enhancements` v1.3.4, GPL v3.0):** All 7 patches integrated — Hex by Anomaly Waveform Animation (MIT), Custom Instructions & Per-App Rules, Personal Dictionary (`MUSE_STATS`), Contact Names Sync, Cursor-Aware & Append-Only Editing, App Context, and Rambler Productivity Tools (Smart Search Bars, Spacebar Long-Press Rambler, Toolbar quick-access button, Fix & Learn, On-Device Dictation Stats, Hands-Free Voice Send & Search, Voice Snippets, Find & Replace, Dictation History, Auto Parallel Retry, Longer Dictation Sessions, and JSON Backup & Restore).
- **Gboard Patches / GboardWu (`jasonwu1994/Gboard-patches` v4.5.0, GPL v3.0):** All 46 patches integrated — Advanced Voice Typing, AI Writing Tools, Backup & Restore, Clipboard Enhancements & Custom Character Limit, Custom Theme (Rboard/ZIP), Frosted Glass, Web Clipboard, LAN FTP Server, Floating Web Search, Simple Calculator, OCR / Scan Text, Toolbar Editing Buttons, Long-Press Editing Shortcuts, Swipeable Custom Top Row, Swipe Down to Dismiss, Shift + Backspace Forward Delete, Incognito Mode Toggle, Custom Symbols, G Logo on Spacebar, Rounded Keyboard Panel, Keypress Vibration Intensity Control, Dictionaries & Predictions, Package Rename (defaulting to `Rambler Bangla` / `com.aidev2024.ramblerbangla`), Signature Bypass, and all Gboard feature unlocks.
- **Attribution & Notices:** Full third-party credits and licenses documented in `ATTRIBUTION.md`, `THIRD-PARTY-NOTICES.md`, `NOTICE` (Morphe Section 7c), `NOTICE-cmudict.txt`, and `README.md`.
- **Legacy 18.3.1 standalone patcher & CI preserved:** All 88 Python unit tests and 22 static-suite checks remain intact; historical `v29.3-smali-hooks.diff` moved to `docs/historical/v29.3-smali-hooks.diff`.

## Unreleased (in review, PR #26)

Identity-rename (`rename/`) correctness fix plus its end-to-end gate. No patcher, runtime, fingerprint or signing changes, and no APKs.

- Fix: `rename/axml_pool.py` `StringPool.rebuild` wrote the Python code-point count into the AXML string-pool length prefixes; the format contract is UTF-16 code units, so a replacement value with an astral character (e.g. an emoji in the app label) produced a corrupt pool entry: aapt2 logs "Bad string block" and reads an empty label, androguard raises `ResParserError`. Covered by unit tests in `tests/python/test_axml_pool.py`.
- Static suite gains an end-to-end identity-rename round-trip gate: a label-variant fixture (`android:label="PixelBoard"`) is renamed to a label containing an astral character, and the exact label must read back through aapt2's strict string-pool parser and androguard. The fixture carries no package-identity strings, so the gate exercises the manifest label rewrite only, not package, DEX or arsc renaming. The suite is now 21 checks; README, CONTRIBUTING, RELEASING, ARCHITECTURE and the Pages site quote the new count, and a homepage check fails on any stale quoted suite count.

## V29.5 - 2026-10-24 (in review, not released)

Clipboard Recent | History. Static and host-tested only: no phone or emulator has run this build yet. It is an overlay on the maintainer's V29.4 rc4 build, not a published release.

- The clipboard panel gets a small Recent | History tab row above the clip list. Recent is the stock list, unchanged; ClipOrder, ClipDrag, ClipSmooth and ClipAccess still act on it. History is a scrolling list of the last 50 unique text clips, newest first, above up to 10 pinned clips that do not count towards the 50. Copying the same text again moves it to the top. Tap pastes into the current field; long-press offers Pin or Unpin and Delete.
- History survives keyboard restarts. It lives in one app-private file in the no-backup directory, written atomically, and is never read before the phone is first unlocked. No network code.
- Recording rides on Gboard's own clipboard read, so it works while the panel is closed. It only records live copies (clipboard timestamp within 10 seconds) of plain text up to 32,768 characters. It skips clips marked `IS_SENSITIVE`, clips Gboard masks, Gboard incognito, clipboard opt-in off, and copies made while a password or no-learning field is active, even if focus moves on before the read is handled. Deleting an entry leaves no copy or hash of its text. History is hidden in those fields too.
- New runtime classes in `extension-src/.../rambler/` (`GboardRamblerClipHistory`, `ClipHistoryPanel`, `ClipHistoryStore`, `ClipHistoryPolicy`, `ClipHistoryGboardPrivacy`). Seven hook calls in seven Gboard methods, each pinned by method hash in `fingerprints/clipboard-history-rc4.json`: IME start, finish and destroy (`aeij`), the clipboard read (`kvk.call`), and panel open, close and view discard (`ClipboardKeyboard`).
- `scripts/build_clip_history.sh BASE OUTPUT` refuses anything but the exact rc4 APK. It checks every hooked method's hash and anchor, that every hook calls an existing runtime method with the right number of arguments, and that every Gboard name the runtime reaches by reflection exists. It also checks that untouched classes and APK entries are unchanged. It adds the runtime as `classes6.dex` and writes an unsigned, zipaligned APK. No resource or manifest changes.
- 9 new Python unit tests (49 in total), including a JVM harness for the store and privacy policy, and synthetic hook, guard and ZIP fixtures.

## [29.4.1] - 2026-10-21

Docs only. No patcher, runtime, fingerprint or signing changes, and no APKs.

- README rewritten as the project homepage: what and why, architecture mermaid (fingerprint guard, smali patch, policy runtime, verify), device-free CI, build from source, fail-closed safety, source-only and legal note, FAQ, roadmap and links. Latest release now points at v29.4.
- GitHub Pages landing page restyled to match: mobile-first, WCAG AA colour tokens, skip link and landmarks, native FAQ, no scripts, external fonts or trackers.
- New stdlib unit tests (`tests/python/test_docs_homepage.py`) keep the README and the site honest: required sections, badges, local links, quoted test count, contrast, no trackers. The CI unit job now runs 40 tests.
- CI: `ci.yml` bumps `actions/checkout` 4 to 7, `actions/setup-python` 5 to 7 and `actions/setup-java` 4 to 6 (Dependabot #15, #17, #16).
- Docs index lists the V29.4 release notes; project memory files for coding agents (`AGENTS.md`, `CLAUDE.md`, `docs/PROJECT_BRAIN.md`), `TASKS.md`, `HANDOFF.md` and `SKILLS_USED.md`.

## V29.4 - 2026-10-18

Source-only release. No runtime or conversion changes against V29.3. Details: [`docs/V29.4-RELEASE-NOTES.md`](docs/V29.4-RELEASE-NOTES.md).

- New maintainer signing key (certificate SHA-256 `679cfdec...2e78`); the V29.3 key is lost. Builds signed with the new key cannot install over V29.3 builds: uninstall once first. Record: [`ledger/v29.4-provenance.md`](ledger/v29.4-provenance.md).
- The maintainer key now lives only in GitHub Actions secrets (plus an offline backup kept by the maintainer). New manual workflow `maintainer-key-check.yml` signs the synthetic fixture with it and checks the signer; it publishes no APK.
- Docs: portfolio README, architecture, user guide and releasing docs, docs index; community files (code of conduct, contributing, PR and issue templates, CODEOWNERS, Dependabot).
- CI: `ci.yml` runs 26 Python unit tests for the patcher helpers and the static suite on every push and pull request.
- Patcher fix: array parameters count as one register slot in `dex_patch.py`, whatever the element type.
- Project website (GitHub Pages), banner, brand sheet, icon showcase and favicon (2026-10-05 to 2026-10-08).
- Fixture hygiene: personal-looking emails in the v29.3 corpus, target and golden fixtures replaced with `example.com` addresses.
- Removed the temporary clipboard-mask and instrumented-settings diagnostic probes and their workflows.
- Dependency bumps: `actions/checkout` 4.2.2 to 7.0.1, `actions/upload-artifact` 4.6.2 to 7.0.2.

### Maintainer test builds 245 to 253 - October 2026

Private builds, not public downloads, and not part of this source release. Evidence levels in the README's "Maintainer builds, October 2026" table.

- 253: compatibility update, two static reviews passed; the maintainer reports the Gboard AI writing-tools icon is back on their phone. Cause not proven.
- 251: removes the pin exemption for the stray "123" label (static review; phone check pending).
- 250: unpinned path clean on the phone; pinned still showed "123".
- 247 to 249: spacebar label and list/popup candidates; not shipped.
- Planned: clause segmentation, phonetic typing with EN/BN toggle, Bangla (Latin).

## V29.3 - 2026-09-24

- One language per sentence in multilingual voice typing.
- Real Bangla spellings for English words (CMU Pronouncing Dictionary plus reviewed overrides).
- Protected text: #hashtags, @handles, links, emails and times stay in Latin letters.
- Clipboard drag-to-reorder (in development).
- Host corpus of 292 cases passes all gates. Details: [`docs/V29.3-RELEASE-NOTES.md`](docs/V29.3-RELEASE-NOTES.md).

## V29 - 2026-09-23

- Bangla spelling normalization: garble-resistant English near-match demotion and a 2,265-pair roman-to-script table.
- Design: [`docs/V29-DESIGN.md`](docs/V29-DESIGN.md).

## V28 / v28d

- Segment-locked multilingual dictation. Last stable baseline. Evidence: [`docs/EVIDENCE.md`](docs/EVIDENCE.md).
