---
phase: 03-x-dom-integration
plan: 02
subsystem: extension-content
tags: [chrome-mv3, content-script, dom-extraction, selectors, quoted-tweet, media-only, validation]

# Dependency graph
requires:
  - phase: 03-x-dom-integration (plan 01)
    provides: "bookmark-page.ts discovery loop calling the extractor with a container-scoped article"
provides:
  - "content/selectors.ts: every X selector + fallback and every extension-owned attribute in one module, with queryFirst/queryAll/closestAny/closestArticle helpers"
  - "content/tweet-extractor.ts: getTweetId/getCanonicalUrl/getAuthor/getUsername/getTweetDate/getMainText and extractTweet -> {ok:true,tweet} | {ok:false,reason}"
  - "EXTRACTION_ERROR ('Could not read tweet data') + ExtractionFailureReason for the XI-12 error surface"
affects: [03-x-dom-integration, 04-save-integration, 06-hardening]

# Actuals — chars/4 over selectors.ts + tweet-extractor.ts (15,902 chars).
actuals:
  tokens: 3976
  tasks: 3
  commits: 0

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "Primary+fallback selector cascades addressed by stable SelectorKey names; no selector string exists outside selectors.ts"
    - "Quoted-wrapper exclusion by ancestor walk (card.wrapper, metadata-bearing role=link, or a nested tweet article)"
    - "Display-name/handle parsing from the author header's rendered text rather than unstable inner spans"

key-files:
  created:
    - extension/src/content/selectors.ts
    - extension/src/content/tweet-extractor.ts
  modified: []

key-decisions:
  - "The quoted-tweet check treats a div[role=link] as a quoted wrapper only when it owns its own User-Name/time (or is a nested article), so a generic link wrapper cannot hide legitimate main text"
  - "getAuthor reads the author header's rendered text and cuts at the first '@' or '·', which survives X's nested-span layout; getUsername prefers an explicit @handle match, then a profile link, then the permalink's first path segment"
  - "getCanonicalUrl is normalized to https://x.com/<user>/status/<id> with query/hash stripped, falling back to the extracted @handle when the permalink uses the /i/ prefix"
  - "Failure is typed per missing field (missing_tweet_id/url/author/username/tweet_date); text is the only optional field"
  - "`dot-style` colour indicators are rendered as inline style so they are visible without shipping a content-script stylesheet"

patterns-established:
  - "All X DOM coupling (selectors AND the extension's own marker/root attributes) lives in one file; an X DOM change is a one-file edit"
  - "Every extraction getter takes an Element container and never queries document"
  - "Extraction returns a typed result, so the caller can never accidentally persist a partial record"

requirements-completed: [XI-05, XI-06, XI-07, XI-12]

coverage:
  - id: D1
    description: "Container-scoped extraction of url, author, username, tweet_date, text, tweet_id from the passed article only (two tweets in one document never mix)"
    requirement: "XI-05"
    verification:
      - kind: unit
        ref: "test/tweet-extractor.test.mjs#plain tweet extracts every field from its container"
        status: pass
      - kind: unit
        ref: "test/tweet-extractor.test.mjs#individual getters expose the XI-05 surface"
        status: pass
      - kind: unit
        ref: "test/tweet-extractor.test.mjs#extraction is container-scoped: two tweets in one document never mix"
        status: pass
      - kind: unit
        ref: "test/tweet-extractor.test.mjs#comma, emoji, and multiline text survive extraction"
        status: pass
    human_judgment: false
  - id: D2
    description: "Quoted-tweet text is excluded; only the top-level tweet text is extracted (card.wrapper and metadata-bearing role=link variants)"
    requirement: "XI-06"
    verification:
      - kind: unit
        ref: "test/tweet-extractor.test.mjs#quoted tweet text is excluded when wrapped in card.wrapper (PRD §29)"
        status: pass
      - kind: unit
        ref: "test/tweet-extractor.test.mjs#quoted tweet text is excluded when wrapped in a role=link card (PRD §29)"
        status: pass
      - kind: unit
        ref: "test/tweet-extractor.test.mjs#the quoted tweet's permalink never becomes the parent tweet url"
        status: pass
    human_judgment: true
    rationale: "Fake-DOM fixtures prove the ancestor-walk exclusion rules, but X ships several quoted-card markup variants; confirming the live DOM shape (and that no variant hides the real main text) requires a browser UAT pass that was not possible in this execution."
  - id: D3
    description: "Media-only tweet extracts with text === '' and remains fully saveable; a tweet whose only text is quoted also yields empty text"
    requirement: "XI-07"
    verification:
      - kind: unit
        ref: "test/tweet-extractor.test.mjs#a media-only tweet extracts with text === '' and is still saveable (PRD §30)"
        status: pass
      - kind: unit
        ref: "test/tweet-extractor.test.mjs#a tweet whose only text is quoted extracts with text === ''"
        status: pass
    human_judgment: false
  - id: D4
    description: "A missing required field (url/author/username/tweet_date) yields a typed failure, no partial record, and the exact EXTRACTION_ERROR copy surfaced through the injectable onExtractionError callback (once per node)"
    requirement: "XI-12"
    verification:
      - kind: unit
        ref: "test/tweet-extractor.test.mjs#missing username yields a typed failure and no partial record (XI-12)"
        status: pass
      - kind: unit
        ref: "test/tweet-extractor.test.mjs#missing author yields a typed failure"
        status: pass
      - kind: unit
        ref: "test/tweet-extractor.test.mjs#missing tweet date yields a typed failure"
        status: pass
      - kind: unit
        ref: "test/tweet-extractor.test.mjs#missing status permalink yields a missing-tweet-id failure"
        status: pass
      - kind: unit
        ref: "test/tweet-extractor.test.mjs#EXTRACTION_ERROR is the exact PRD copy (PRD §40)"
        status: pass
      - kind: unit
        ref: "test/bookmark-page.test.mjs#extraction failure surfaces once, injects nothing, and never sends a partial record (XI-12)"
        status: pass
    human_judgment: false
  - id: D5
    description: "Trailing whitespace trimmed while internal newlines/multiline text are preserved (CSV-safe text)"
    requirement: "XI-05"
    verification:
      - kind: unit
        ref: "test/tweet-extractor.test.mjs#trailing whitespace is trimmed while internal newlines are preserved"
        status: pass
    human_judgment: false

# Metrics
duration: 6min
completed: 2026-09-27
status: complete
---

# Phase 3: X DOM Integration — Plan 02 Summary

**One selector module for all X DOM coupling plus a container-scoped `TweetExtractor` that excludes quoted text, yields `text === ""` for media-only tweets, and returns a typed per-field failure instead of a partial record.**

## Performance

- **Duration:** ~6 min
- **Started:** 2026-09-27T01:38:00Z
- **Completed:** 2026-09-27T01:48:00Z
- **Tasks:** 3
- **Files modified:** 2 (created)

## Accomplishments
- `selectors.ts` holds every X anchor as a primary selector plus ordered fallbacks (`article[data-testid="tweet"]`/`article[role="article"]`, `[data-testid="tweetText"]`, `[data-testid="User-Name"]`, `time[datetime]`, `a[href*="/status/"]`, `div[role="group"]`, `bookmark`/`removeBookmark`, card wrappers, profile links) **and** every attribute the extension writes, with `queryFirst`/`queryAll`/`matchesAny`/`closestAny`/`closestArticle` helpers. A grep proves no selector string or extension attribute exists in any other `src/` module.
- `tweet-extractor.ts` exports the full XI-05 surface (`getTweetId`, `getCanonicalUrl`, `getAuthor`, `getUsername`, `getTweetDate`, `getMainText`) and `extractTweet(article)` returning `{ok:true,tweet}` or `{ok:false,reason}`; `EXTRACTION_ERROR` is the exact PRD copy.
- Quoted-tweet exclusion walks ancestors to the article and rejects text inside `[data-testid="card.wrapper"]`, a `div[role="link"]` that owns its own author/time, or a nested tweet article — so quoted text and the quoted permalink never leak into the parent record.
- Media-only tweets extract successfully with `text === ""`; internal newlines and commas/emoji are preserved while trailing whitespace is trimmed.
- A missing `tweet_id`/`url`/`author`/`username`/`tweet_date` returns a machine-readable reason, and `bookmark-page` surfaces `EXTRACTION_ERROR` through `onExtractionError` exactly once per article node without injecting anything.

## Task Commits

No commits were made — this execution was explicitly forbidden from running any `git` command.

**Plan metadata:** not committed (git out of scope).

## Files Created/Modified
- `extension/src/content/selectors.ts` — all X selector cascades, extension-owned attribute names, and query helpers
- `extension/src/content/tweet-extractor.ts` — scoped getters, quoted/media handling, typed extraction result, `EXTRACTION_ERROR`

## Decisions Made
- **Metadata-bearing `role="link"` guard:** treating every `div[role="link"]` as quoted would risk excluding real main text, so the check requires the wrapper to own a `User-Name`/`time` (or be a nested article).
- **Text-based author parsing:** X's name/handle spans are not addressed by stable test ids, so `getAuthor` reads the header's rendered text up to the first `@`/`·`, and `getUsername` prefers an `@handle` match, then a profile link, then the permalink segment.
- **`innerText` with `textContent` fallback:** preserves rendered newlines in a browser while remaining usable against non-layout DOM implementations.
- **Typed failure instead of `null`:** callers get a reason string, which is what makes the XI-12 "no partial record" path explicit and testable.

## Deviations from Plan

None — the plan was executed as written. The typed failure (Task 3) was implemented as the primary `extractTweet` return shape rather than a `null`-first signature, exactly as the plan's Task 3 specifies.

## Issues Encountered
- None in production code. (The test helper's selector engine needed the attribute-operator fix described in plan 03-01.)

## User Setup Required
None.

## Next Phase Readiness
- Phase 4's payload builder can call `extractTweet` and forward `.tweet` directly; `tweetId` is already exposed for the saved cache, and a failure never produces a partial `SaveTweetPayload`.
- Remaining manual UAT for this plan: on a real bookmarked tweet with a quoted card, confirm only the parent text would be persisted (Phase 4 CSV), and confirm an image-only tweet yields an empty `text` in the CSV.
- No blockers.

---
*Phase: 03-x-dom-integration*
*Completed: 2026-09-27*
