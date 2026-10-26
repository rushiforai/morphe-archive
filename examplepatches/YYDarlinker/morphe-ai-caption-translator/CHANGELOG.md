## [1.5.8](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.5.7...v1.5.8) (2026-10-26)

### 🐛 Bug Fixes

* harden caption ownership, retries, configuration and cache recovery ([18b4b7e](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/18b4b7e98ad5e760da67b1f1f4020c4f2a30271d))
* release AI caption translator 1.5.8 ([#8](https://github.com/YYDarlinker/morphe-ai-caption-translator/issues/8)) ([09d5384](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/09d5384059b0962f733ec8a2ce1e411fa1a1bcde))

## [1.5.7](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.5.6...v1.5.7) (2026-10-24)

- Returning to the same video with AI captions left on now restores them automatically; no manual off/on toggle is needed.
- Word-by-word or rolling subtitle tracks are rebuilt as complete lines, so lines no longer repeat or mix different speakers' words.
- Opening the comments sheet now resizes captions together with the panel animation instead of after it, so the size no longer lags or jumps back.

## [1.5.6](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.5.5...v1.5.6) (2026-10-22)

- Fix caption boxes running past the screen edge on the detail page after returning from fullscreen. A presentation class captured while the display was still rotating kept the old landscape frame width; the effective frame is now capped by the displayed video and the display, and the class cannot change before the viewport has settled.
- Keep the reading size stable during player transitions. Fullscreen → detail swipes no longer shrink the caption before the page actually changes; a comments-sheet animation commits one class change as it crosses the threshold, then only moves the box.
- Shorts captions now use the detail reading size, based on the displayed video width. Opening Shorts comments no longer changes the size or rebuilds the page.
- A one-line caption page no longer inherits the two-line height of another page from the same event.
- Draw captions above YouTube's player controls, so the progress bar and time labels cannot cover them. The topmost player-overlay container also receives the drag directly, removing the extra full-screen touch proxy.
- Scale the caption with the comments-sheet animation itself: the on-screen video width now drives the reading size continuously (55.5↔44.5), while the binary layout class commits at the animation endpoint. The size now starts and finishes with the sheet instead of changing after it; fullscreen→detail slide gestures still wait, so captions do not shrink before the page switch.
- Never paint YouTube's native subtitle view while the AI switch is on. The engine also starts from the new video's already-captured native selection at video switch instead of waiting for a CC-button scan, so the first video no longer shows the native style for a few seconds before AI.
- Make the AI caption switch take effect immediately. Turning it on now clears an earlier captions-off latch, starts from the current signed native selection even while the native manager is being rebuilt, falls back to the video's source catalogue plus the native target language, and retries a few times if the track list is still arriving.
- Follow the official CC control completely. Captions only appear while YouTube's CC is on and a native track is selected; switching to a video whose CC is off, or which has no default translated track, shows no AI target captions even if the previous video used Auto-translate. The AI switch chooses the drawing style, not whether captions exist, and the previous video's target is cleared at video switch.
- Draw the caption background around the current page's actual line width, so a short page no longer shows the widest page's empty box.
- Rebuilt for Morphe Patcher 2.0.0 and Morphe Patches 1.48.0. The bundle declares `Patcher-Version: 2.0.0`, so it is no longer applied through the 1.x compatibility path with its older fingerprint rules.
- Adapted the hooks to the official 1.48.0 Captions additions and to Patcher 2.0.0 (ordered exact string filters and on-request resource decoding), so the AI patch can be used together with the official Captions patch.
- Removed the add-on's own Auto-translate language list and its menu/metadata hooks. YouTube's native list is used as-is; Morphe's official Captions options own adding and sorting languages.
- YouTube compatibility now follows the 21.x targets of Morphe Patches 1.48.0: 21.42.241, 21.41.525, 21.28.208, 21.23.492, 21.20.405 and 21.16.256. 20.x targets are no longer declared.
- Fix a `VerifyError` in the player flyout menu on Morphe Patches 1.48.0 / YouTube 21.20.405: the quick-toggle hook passed `p0` as the panel, but the new official VideoDelay row uses that register as a Boolean scratch before the divider. The hook now passes the panel register read from the divider call itself.

## [1.5.5](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.5.4...v1.5.5) (2026-10-21)

- Translated captions no longer disappear when the model's sentence boundary differs from an uploaded subtitle's cue boundary. Exact cue pages stay preferred; remaining translated events are shown as event pages, so the reproduced 14.5 s authored-caption block now stays translated for its full duration instead of showing “Translating…”.
- Partial translation results are published instead of rejecting the whole block. One invalid event no longer hides the rest; missing ranges show a neutral `…`, slow retries stop after three attempts, and a failed block shows the neutral marker instead of source text.
- Pagination now follows the writing system instead of a Chinese-only path: Korean spacing, RTL/CJK/Indic profiles, language punctuation, explicit overflow pages for authored cues longer than two lines, and time-balanced page turns.
- Source timing from subtitle XML is used where available, so auto-generated caption pages land on real speech boundaries rather than only estimated positions.
- Numeric, date and unit differences are advisory instead of a hard rejection, and CJK whitespace or Unicode composition differences no longer discard an otherwise valid event.
- The separate **Remember caption selection** patch is removed. This source now ships only **AI caption translator**, which follows YouTube's native caption selection and the official Captions / **Preferred caption language** setting; it no longer invents or carries a target language across videos.
- Captions no longer go blank while a translation is still on its way: the previous line stays up briefly, then a neutral placeholder appears until the new line arrives. Only the line you are watching is translated again instead of the whole section.

## [1.5.4](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.5.3...v1.5.4) (2026-10-14)

- The add-on icon is shown again on the player menu row for the regular player and Shorts; the 1.5.3 resource rewrite had dropped it.

## [1.5.3](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.5.2...v1.5.3) (2026-10-14)

- Smaller and simpler: the code was hand-rewritten module by module (dead code removed, long logic split, about 8-12% less main code) and the extension is shrunk by R8; the patch package drops from 1.3 MB to about 0.57 MB. Translation prompts and protocol are unchanged and match the pinned upstream.
- Experimental support for YouTube 21.40.161, 21.39.522, 21.38.130, 21.28.208 and 21.23.492, following the experimental targets of official Morphe Patches 1.47.0. 21.13.164 and 21.07.247 are no longer declared.
- Both patches are selected by default. The reference caption cache now persists, saving one download when reopening a video.

## [1.5.2](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.5.1...v1.5.2) (2026-10-12)

- Keep uploaded subtitles exactly as authored, including two-row subtitles such as romanization above a translation; only auto-generated subtitles get locally optimized sentence breaks and page turns, tuned for Japanese and other unpunctuated languages.
- Remove bracketed furigana readings from the text sent for translation, so the translation does not repeat them.

## [1.5.1](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.5.0...v1.5.1) (2026-10-12)

- Fix captions that were missing or shown twice on videos whose subtitle tracks repeat every cue.
- Choose the source subtitle track by the video's spoken language, preferring human-made tracks.
- Show the video's own subtitles in the selected language directly, without translation requests, with sentence breaks and page turns optimized locally.

## [1.5.0](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.4.1...v1.5.0) (2026-10-12)

- Support YouTube 21.20.405 with official Morphe Patches 1.47.0.
- Fix Shorts captions disappearing after looping or reopening a video.
- Fix YouTube crashes caused by interrupted translation responses.
- Improve caption pagination and prevent repeated pages and flicker.
- Reduce caption startup latency with streaming responses and faster planning.
- Display original subtitles in the AI caption overlay without translation requests.

## [1.4.1](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.4.0...v1.4.1) (2026-10-11)

- Remove prompt settings.
- Fix Arabic interface layout issues.

## [1.4.0](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.3.5...v1.4.0) (2026-10-05)

### 🐛 Bug Fixes

* apply and audit menu hooks in the resolved assembly body ([a404c9d](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/a404c9d6cf694486702bb28e297e65fcd0cb1139))
* bind historical official deferred caption menu assembly safely ([64448bf](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/64448bf2724bdb498c44e54c4537f0c4f4dbf59e))
* bound A14 semantic repair and audit N13 replay ([5b51c8b](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/5b51c8becc2e9b737cf404d56bca9a161b95ade5))
* **captions:** remove redundant standalone language patch ([66a2584](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/66a258466a912e43ff67fb174cb5052ee3d5d548))
* N23 slider consistency, native masking and bounded rebuild scheduling ([45a830a](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/45a830a7a7383427573cc0a1e5380d72d28f80c1))
* N24 revert review rules to N22, align slider endpoints, bound rebuild scheduling ([9049591](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/904959166a255c3912b0a87a6dab968b261b3bc9))
* N25 diagnostics headings carry one separator, add locale coverage and delivery record ([99e7be5](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/99e7be545f3627c656115132976c4dd20c4c8942))
* N25 settings layout, RTL rail geometry and full UI localization ([8941244](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/89412443e51fd8333b411fcfe3344c99ec011b8b))
* N26 move the AI caption settings entry into the Morphe video page ([509d50a](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/509d50a3ec3c24ab9f518502b19f62e43a6ebb6d))
* N27 lift the caption above the regular player's own controls ([62c4916](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/62c491625a17a3e19154c6216576530c298a13e3))
* N27r bind the caption controls guard to the real return and audit final DEX branches ([4c1d33f](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/4c1d33fd45245bc04901d40b0b6cec6379f69bda))
* **n28c-r1:** separate UI retirement and enforce readable non-Chinese pages ([9a7bdf3](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/9a7bdf35351b9a052233bac8b9004241548eb1eb))
* **n28c:** 修复既有调度基础并交付非中文呈现 ([4d98eec](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/4d98eec20f9f9d1d9a8b2bf0e52934cade8d93b0))
* **n29:** complete 1.45 integration, bootstrap supply and semantic paging ([3eefe00](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/3eefe00ee1491ea4c6bb4e076dbc511fc120fe65))
* **n30:** stabilize startup and player transitions, complete language menus and localization ([d5ca720](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/d5ca720ecf0c83349ea232d929ee09b11840c65a))
* **n31:** unify settings locale and bindings, separate default prompt display ([dc304cb](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/dc304cbe3ae995e7e0edad2754b160c959cafce3))
* **n37r2:** center captions in physical video coordinates across UI directions ([6ff1053](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/6ff1053c74c2deaa10bf733f5328d3b6756abd49))
* **n37:** retract denied captions, unify pause evidence and snapshot diagnostics ([98ac1a1](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/98ac1a16440f64d8b1e095d0f4496cae7cdcece9))
* **settings:** bind verified receivers after language updates to prevent ART crashes ([1bc94ae](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/1bc94aed459300b79bd5ee93dca03d2db99d593c))

### ✨ New Features

* N28A add read-only language context and platform ICU counting foundations ([d683e59](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/d683e5927191928c335957b3e9fe4fb4816ac518))
* N28B bind request review and cache policy to immutable language scope ([d02d7cc](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/d02d7ccefbd3847d7c1df3b0306e22a3a14429f0))
* **n33:** rebuild N30 settings localization and two-root delivery ([b52b65b](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/b52b65b7a206f1a07464dae62dc30cabc164bf10))
* **n34:** preserve owned-window captions and conservative source evidence ([26edf55](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/26edf555c8956e12a4b0448b72aef34597141409))
* **n35:** repair caption timing chain and preview frame stability ([1967dac](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/1967dacff904173ef685602e831cc21291fffb94))
* **n36:** stabilise input, player permission, transition and diagnostics hot paths ([6319fd6](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/6319fd69900b1f08b231b14161713021d0fb616d))
* prepare N37R2 stable captions release and current YouTube target catalog ([9b3cb33](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/9b3cb3385213d079d577213e0a7d06f97e1155bd))

## [1.3.5](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.3.4...v1.3.5) (2026-09-27)

### Bug Fixes

* Set caption size controls and stored values to 8–15 sp, with 13 sp as the default.
* Label saved diagnostic exports with the actual release version, 1.3.5.

### Source Recovery

* Restore a nearby R2.12 Java source snapshot and exact assembleable Smali source, with a verified round-trip rebuild.

## [1.3.4](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.3.3...v1.3.4) (2026-09-18)

### 🐛 Bug Fixes

* bound semantic batching costs and redact escaped diagnostic URLs ([ca4fa0e](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/ca4fa0e54b9582ea3e44314a385ff0fed84430e2))
* distinguish quality evidence across video sessions ([5e47a37](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/5e47a373845e5454d7998f30b0694b61d5d0febb))
* isolate strict phrase validation from unchanged source timing ([24b22e8](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/24b22e83760d8ac2d1ead50cd3191d71b1de8953))
* preserve numeric ranges and bound quality evidence retention ([414a743](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/414a743b566dd265ba362b6b94b7f5b86f37fafb))
* separate semantic caption tasks and enforce aligned readable output ([bd7c141](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/bd7c1416db6c46d7379f7fb0fc10bc63f91305b4))

## [1.3.3](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.3.2...v1.3.3) (2026-09-18)

### 🐛 Bug Fixes

* recover caption playback and streamline startup with inline profile management ([253983f](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/253983f66a888ffd57a9eadcddae0dde0c612628))

## [1.3.2](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.3.1...v1.3.2) (2026-09-18)

### 🐛 Bug Fixes

* streamline profile actions and preserve first-tap keyboard editing ([195a588](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/195a588bc14454b3357059f62fea3f75c1f77abd))

## [1.3.1](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.3.0...v1.3.1) (2026-09-18)

### 🐛 Bug Fixes

* simplify API profile management and restore reliable inline editing ([34834c8](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/34834c81c438ca9fb204a559a558ebf0f27705f2))

## [1.3.0](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.2.7...v1.3.0) (2026-09-18)

### ✨ New Features

* add isolated named API profiles and provider-aware endpoint support ([4786edc](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/4786edc92dda16de6dfef53fc53d47b0f55412b6))

## [1.2.7](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.2.6...v1.2.7) (2026-09-16)

### 🐛 Bug Fixes

* make regular and Shorts caption flyout entries independently optional ([f8e9fde](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/f8e9fdea09437b7a8e764afa169844d92f3d8c04))

## [1.2.6](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.2.5...v1.2.6) (2026-09-16)

### 🐛 Bug Fixes

* distinguish caption model video ownership from playback nonce ([512e57e](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/512e57e36c0573480caf0624fdf32b53d5ef4cb7))

## [1.2.5](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.2.4...v1.2.5) (2026-09-16)

### 🐛 Bug Fixes

* capture automatic caption tracks across every video transition ([ece6a73](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/ece6a73f7d1cad8a94ae734992f9dc583475697c))

## [1.2.4](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.2.3...v1.2.4) (2026-09-15)

### 🐛 Bug Fixes

* make caption takeover atomic and restore two-line startup ([ed4fae5](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/ed4fae5564acb677867666665f077a2b28ae16d7))

## [1.2.3](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.2.2...v1.2.3) (2026-09-15)

### 🐛 Bug Fixes

* recover Shorts AI engine switching after video changes ([0394b86](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/0394b869e54a3b77ad1a5caf0aac3140dc7685b1))

## [1.2.2](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.2.1...v1.2.2) (2026-09-15)

### 🐛 Bug Fixes

* correct ART return types in caption menu bridge ([5e4ed0f](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/5e4ed0ffe07c22ea62b6ec918f4751299f3f7059))

## [1.2.1](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.2.0...v1.2.1) (2026-09-15)

### 🐛 Bug Fixes

* integrate player toggle and prioritize multilingual ASR timing ([c8a91a4](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/c8a91a41ce2b3023e6fcc5cde50c2a6b1fa5d4fa))

## [1.2.0](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.1.3...v1.2.0) (2026-09-15)

### ✨ New Features

* split caption patches, localize settings and add player toggle ([8d5fad6](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/8d5fad690e7328ae315e4cb1cf1f8130e953012e))

## [1.1.3](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.1.2...v1.1.3) (2026-09-14)

### 🐛 Bug Fixes

* restore caption quality, fit backgrounds and use ASR cue timing ([6b0fae9](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/6b0fae996167adb23e13e30ace3388347c1cd535))

## [1.1.2](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.1.1...v1.1.2) (2026-09-14)

### 🐛 Bug Fixes

* refine anchored caption startup, recovery and presentation ([9ed211e](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/9ed211e991a86f7a5a6c83279089990c20ea2f89))

## [1.1.1](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.1.0...v1.1.1) (2026-09-14)

### 🐛 Bug Fixes

* align translated source phrases and stabilize caption timing ([95b948c](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/95b948c2b2fdfcba4bc3e0ab62e31680ea33eefd))

## [1.1.0](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.0.9...v1.1.0) (2026-09-14)

### ✨ New Features

* restore 1.0.8 baseline with semantic captions and guarded playback timing ([d6f79c4](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/d6f79c412ff58a538cf364f1425edcecfd0a34c8))

## [1.0.9](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.0.8...v1.0.9) (2026-09-14)

### 🐛 Bug Fixes

* apply clause-first segmentation rules from 1.0.7 ([138c078](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/138c07881204f12a82a78be039fe87844f936ae3))
* restore clause-first subtitle editing from 1.0.7 ([c5d8623](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/c5d862344a81c7ed43028bed590718be6ffe44b7))
* restore editorial segmentation from 1.0.7 baseline ([436779f](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/436779f2dea8f5c99c3bb316542f2c964704ec12))

## [1.0.8](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.0.7...v1.0.8) (2026-09-14)

### 🐛 Bug Fixes

* follow video viewport and unify cost-bounded subtitle segmentation ([bc991a3](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/bc991a3c87237595607da9f74f923417e6fcf6fc))

## [1.0.7](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.0.6...v1.0.7) (2026-09-14)

### 🐛 Bug Fixes

* align captions to ASR and recover missing subtitles ([b0f8d1d](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/b0f8d1d79add38c84849d0a13b2489865070ee2f))

## [1.0.6](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.0.5...v1.0.6) (2026-09-14)

### 🐛 Bug Fixes

* restore anchored caption pacing release baseline ([3c4c811](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/3c4c811b0789232051fb8e827e625c2b84dddf1e))

## [1.0.5](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.0.4...v1.0.5) (2026-09-13)

### 🐛 Bug Fixes

* improve subtitle readability timing and inline paste ([c5eec87](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/c5eec8798039dad5fc1150f48a396c81270f2709))

## [1.0.4](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.0.3...v1.0.4) (2026-09-13)

### 🐛 Bug Fixes

* reduce avoidable caption rejection and restore native inline editing ([4f8b501](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/4f8b50188c97db6e9ddb914f7013147e1ec5731d))

## [1.0.3](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.0.2...v1.0.3) (2026-09-13)

### 🐛 Bug Fixes

* recover stopped captions after API test without changing language ([edc2f91](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/edc2f91e83e297e9cacb4f01609c7463b0b533b9))

## [1.0.2](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.0.1...v1.0.2) (2026-09-13)

### 🐛 Bug Fixes

* require explicit translation selection before paid requests ([c408a18](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/c408a180a273d92f1851dff9c8e7aee16a4be9b8))

## [1.0.1](https://github.com/YYDarlinker/morphe-ai-caption-translator/compare/v1.0.0...v1.0.1) (2026-09-13)

### 🐛 Bug Fixes

* restore caption output and separate source display from AI translation ([015fe49](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/015fe49a53bb12f0c20856472dcc753974f6eefd))

## 1.0.0 (2026-09-13)

### 🐛 Bug Fixes

* establish independent project and remove retired caption engines ([4002d52](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/4002d52c69f98fa6ce42dd22ae8ec3e4fea73a3a))
* normalize controller source newline ([242e779](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/242e77997122e6b94170f7a3d9e2a345da6fb0fe))
* repair Morphe source manifest and enforce native release contract ([ee18da0](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/ee18da076bc50b58c26f4b9a5730603232519fd5))
* restore controller compatibility accessor ([459228c](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/459228ccc5feb078d04f7974af523e88779bbd43))

### ✨ New Features

* anchored AI captions with native subtitle takeover ([ae86930](https://github.com/YYDarlinker/morphe-ai-caption-translator/commit/ae869307189ae62281b9bad499b95a4c09d68380))

# Changelog

This independent project starts at 1.0.0. Entries below are generated by its release pipeline; historical upstream release notes are not included.
