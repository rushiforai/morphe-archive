# Convert Editor Implementation Plan

> Execute inline, task by task, with superpowers:executing-plans. No delegation needed.

**Goal:** Biên tập QT/Hán Việt ngay khi đọc; action riêng xử lý khoảng chương A–B.
**Architecture:** vBook translate extension, synchronous DeepSeek JSON requests. Shared paragraph-level localDatabase cache lets range processing and live reading reuse results without changing original book content.
**Tech Stack:** Plain JavaScript, vBook documented APIs, Node built-in test runner, Python zipfile.
**Spec:** User approved live editing first and separate inclusive A–B action. Chapter numbers are one-based TOC order, not numbers parsed from titles.

## Global constraints
- Official DeepSeek endpoint only. Key entered locally, never packaged or logged.
- Vietnamese convert to fluent Vietnamese; preserve facts, names and terminology. No guessed recovery of missing Chinese original.
- No automatic lookahead or extra AI learning calls. Batch starts only through the action's Start button.
- Only locally available raw chapters; missing chapters are reported, never fetched by undocumented APIs.
- Failed, malformed or truncated output is never cached. Originals are never written.
- Cache includes exact source, prompt, model and style; no cross-book mixing. Changed instructions invalidate extension cache.

## Review focus
Oversized paragraphs, duplicate text/cache collisions, malformed provider JSON, missing/local-only chapters and invalid ranges must be covered by tests.

### Task 1: Shared editor and live translation
- [x] Write Node VM host tests; run and observe missing-feature failure.
- [x] Implement common.js, translate.js and language/model/style/config scripts.
- [x] Verify paragraph preservation, cache reuse/invalidation/isolation, missing key, 401/402/429, malformed/truncated JSON, long input and passthrough of nonchapter sources.

### Task 2: Range action and delivery
- [x] Test A–B inclusive mapping, missing content, failure/resume and HTML/plain cache reuse.
- [x] Implement batch action and dynamic action description with range preview; no background jobs.
- [x] Package plugin.zip and source zip; verify manifest script paths, syntax, no embedded credentials and test suite.
- [x] Deliver install instructions and state that real vBook/device/API calls remain untested.

## Execution ledger
- 2026-11-25: User chose live chapter editing plus separate A–B action. No automatic lookahead.
- Scope: new extension only; existing Morphe/APK builds and reference archives untouched.
- Validation: 11 Node VM host tests passed. No API key or paid calls used. JavaScript syntax checked.
- Ruling: paragraph-level cache is shared between actions and reader; arbitrary host splitting can reduce cache reuse, documented rather than relying on an undocumented chapter-write API.
- Superseded in 1.1.1: source ID `vi-convert` did not avoid Vietnamese-to-Vietnamese bypass; native code reduces it to base language `vi` before invoking JS. Source now `vi`, target private-use `qaa`, displayed as Vietnamese editing. No APK modification required.
- Ruling: no auto name-learning calls or background scheduler; these are outside the approved minimal scope.
- 1.1.0: User requested prompt configuration modeled on DeepSeek Translate. Added editable global system_prompt, six compatible placeholders, shared editable genre prompt table with custom picker IDs; retained existing book instructions/glossary keys. Rendered prompt is included in cache identity for both live reader and batch. JSON contract remains fixed outside user template. Added two regression tests (13 total).
- 1.1.1: User reported successful batch with no reader change. Root cause: official APK class i4j.g() normalizes languages through xda.c() -> Locale.getLanguage() and rejects source language equal to target; initialization disables reader translation for such a book. Added gate regression test (red on old declaration, green after target change) and local diagnostic action. 15 tests pass. Prompt/cache signature unchanged to retain paid batch results from 1.1.0. Device verification outstanding.
