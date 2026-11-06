# Reddit listing performance (v2.2.7+)

Why Reddit could feel janky or its animations could lag on builds patched with
the Proteus "Block AutoMod comments", "Content filters" and/or "Show deleted
comments" patches — and what changed.

## What was happening

All three patches wrap the same `Listing.children` choke point
(`com.reddit.domain.model.listing.Listing` — see `reddit/shared/RedditListingChildren.kt`):

- once at `Listing.<init>` (list construction, off the UI thread), **and**
- once at every `Listing.getChildren()` return — which Compose re-reads constantly
  on the UI path (composition, diffing, semantics, re-binds).

On every such read each enabled helper did a **full reflective traversal** of
the whole children list: per row a depth-limited recursive field walk (with an
`IdentityHashMap` allocation per call), reflective getter invocations, and
string normalization. Three helpers × N rows × many reads per frame =
main-thread CPU churn, GC pressure and skipped frames — visible exactly
where the report was: feed scrolling and list animations feeling like they
lag.

"Show deleted comments" was additionally doing a batched archive query for
threads containing `[deleted]` rows, but only for uncached ids and only on
first sight — the animation lag was not the network, it was the repeated
reflection.

## What changed (behaviour-preserving)

- `ProteusListMemo` (new): a small identity-keyed, size-guarded, access-ordered
  LRU (16 entries) shared by the three helpers. Repeated passes over the same
  list instance — the constructor pass, every `getChildren()` read — now cost a
  map hit and nothing else. Output is bit-identical on every pass of the same
  list; a list whose size changed since caching is re-processed instead of
  serving stale output.
- Both `findModel` fast paths now return immediately when a row **is** a Reddit
  model (the common case), skipping the `IdentityHashMap` allocation and the
  recursive field walk.
- The "filter is live" probe for Block AutoMod now logs on the first real pass
  only, not on every `getChildren()` call.

## What did *not* change

- Patch-time behaviour, fingerprints, injection points and defaults.
- The AutoMod / content-filter / deleted-comment logic itself.
- The `[deleted]` network path (still opt-in, still id-only, still off the UI
  thread via the listing deserialization path).
- No patch defaults were flipped; this is a code-level optimization inside the
  extension (`extensions/extension/.../ProteusListMemo.java`), shipped with the
  next release.

## Verifying on-device

1. Patch Reddit 2026.42.0 with the same three patches.
2. Open a long comment thread and scroll quickly; expand/collapse replies;
   switch feed/sort. Animations and scroll should no longer stutter.
3. `adb logcat | grep -i proteus` should show the usual one-time probes and
   drop counters — and nothing per-frame.

## Honest limits

- Reddit's stock Compose feed is heavy on its own; this removes the
  patch-added cost, it does not make unpatched Reddit fast.
- The memo holds up to 16 list identities per process; on endless pagination
  the oldest entries are evicted silently.
- If an app mutates a `Listing.children` list **in place** without changing its
  size, the memo can serve the previous result for that instance. Reddit builds
  fresh lists per page, so this is not expected in practice; size changes do
  invalidate the entry automatically.

*Verification status: static analysis + CI build only; no JDK/APK/device was
available for this change. Treat the fix as reasonable-by-construction, not
device-proven.*
