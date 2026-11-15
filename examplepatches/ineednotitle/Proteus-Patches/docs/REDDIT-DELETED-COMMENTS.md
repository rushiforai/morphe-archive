# Show deleted comments — Reddit

**App:** Reddit (`com.reddit.frontpage`) · **Patch:** Show deleted comments · **Default:** off

Shows the original text of comments that were deleted by their author or removed by a
moderator. Reddit does not send the text of such comments back to clients, so the only
possible source is a third-party archive — this patch queries one at view time and marks
what it restored.

## How it works

1. The patch hooks the same verified `Listing.<init>` children choke point used by
   "Block AutoMod comments" / "Content filters" (plus `getChildren()` when present), via
   `injectListingChildrenFilter(...)` in `reddit/shared/RedditListingChildren.kt`.
   This covers feed/listing surfaces (including posts).
2. Comment threads do **not** build a `Listing` on 2026.42.0. They are emitted by the
   obfuscated comment-tree store as a `TreeData` object whose constructor takes
   `(build-specific changes, List ids, Map id→comment, Map id→tree-item)`. The patch
   finds that class from the APK being patched by constructor shape and ordered
   `IPUT_OBJECT` writes — never by a hard-coded R8 name — and injects the archive
   restore before the comment map is written. See
   `reddit/shared/RedditCommentTree.kt`. This matters because Reddit shipped
   2026.42.0 with more than one versionCode: the public 2642001 APKM names the class
   `Lm5l0;`, while an earlier build used the `Lc5l0;` interface. A hard-coded name
   failed with `Failed to match the fingerprint` on 2642001.
3. `RedditDeletedCommentHelper.undeleteContent(List)` walks every row. A row is in
   scope only when it is comment-shaped (`t1_*` kind, a comment-model class name, or the
   usual parent/depth markers) **and** its visible text is exactly `[deleted]` or
   `[removed]`. The check covers `body`, `bodyPreview`, and the nested
   `CommentTombstone.markdown`/`richtext` placeholders used by current Reddit builds.
4. All in-scope comment ids in the listing are looked up in **one batched request**
   against the free [Arctic Shift](https://github.com/ArthurHeitmann/arctic_shift) id
   endpoint (`GET /api/comments/ids?ids=…&fields=id,body`, no API key). If Arctic Shift
   errors or has no copy, the helper falls back to [PullPush](https://pullpush.io)
   (`GET /reddit/search/comment/?ids=…&size=…`, also keyless). Listings with no deleted
   comments never touch the network.
5. Restored text is written back into the comment model prefixed with `[archived] ` so
   provenance is always visible. Bodies are replaced through a `setBody`-style setter
   when the model exposes one; otherwise through instance `String` fields whose current
   value is exactly the placeholder. Current builds render deleted comments from a
   nested `CommentTombstone`, so the helper also rewrites its markdown and clears its
   richtext placeholder; otherwise the UI would keep showing the original tombstone.
   Author/user-like fields are never touched.
6. Results — including misses — are cached in memory for the lifetime of the process.

## Privacy notes

- Opening a thread that contains deleted comments sends **only the ids** of those
  comments to the archive host. No account information, no other comment ids, nothing
  else. The archive can infer "someone viewed thread X recently", nothing more.
- The query is read-only. Nothing is posted, voted, or written anywhere.
- This is why the patch is off by default.

## Limits (honest)

- **Coverage is archive coverage.** A comment is restored only if it was archived at
  some point (Arctic Shift covers public Reddit roughly 2005–present with a lag of
  hours to weeks; PullPush similar). Very recent deletions and comments never archived
  stay `[deleted]`.
- **Delete timing matters.** Deleted self-posts (`t3_*`) are out of scope; only comments.
- **Render timing.** Restoration happens when the listing is built, i.e. before the
  comment UI binds its text. If Reddit someday binds comment text lazily from a second
  model, re-verify on-device.
- **Network on the load path.** Comment pages are deserialized off the main thread, so
  the batched request (≤ 100 ids per call, 2.5 s connect / 4 s read timeout) adds
  latency there, not on the UI thread. Misses are cached for the process lifetime.

## Checking archive coverage manually

Coverage is the whole game for fresh deletions, and you can check it yourself before
blaming the patch:

1. Open the Arctic Shift search UI: <https://arctic-shift.photon-reddit.com/search>
2. Search the comment id (the part after `t1_` in any fullname) or paste the comment
   link. The endpoint the patch uses is the same service:
   `GET /api/comments/ids?ids=<id>&fields=id,body` (verified 2026-11-06 against the
   [official API docs](https://github.com/ArthurHeitmann/arctic_shift/blob/master/api/README.md),
   comma-separated ids, `fields` parameter supported; see the status page at
   <https://status.arctic-shift.photon-reddit.com/> if it misbehaves).
3. If the search shows the comment's body, a re-patched build with this patch enabled
   will restore it. If it shows nothing — typical for deletions less than days old —
   the row will stay `[deleted]` everywhere, permanently. That is not a bug.

## Verification status

- Arctic Shift API contract verified against the official API documentation on
  2026-11-06 (endpoint path, `ids` limit 500, `fields` parameter, response envelope).
- The bytecode injection rides the `Listing.children` anchor used by the existing
  "Remove ads" patch on Reddit 2026.42.0 (static match only, not exercised on-device).
- The comment-thread `TreeData` resolver was validated against the public
  **2026.42.0 / versionCode 2642001** APKM: exactly one class matches the
  List/Map/Map constructor shape (`Lm5l0;`, writes at v2/v3/v4), while the
  `Lc5l0;` interface is rejected. A synthetic-dex regression test covers the
  shape matcher (`patches/src/test/.../RedditCommentTreeTest.kt`). Runtime
  archive restoration is still not exercised on a device.
- The runtime restore path (reflection into the comment model and nested
  `CommentTombstone`) has **not** been exercised on-device. It fails safe: any
  exception, missing field, or field-layout drift leaves the stock `[deleted]` row
  intact and logs to stdout.
- Unit tests cover `body`/`bodyPreview`/`CommentTombstone` detection and replacement;
  the Android bundle and patch injection are build-verified against 2026.42.0.

## Re-verifying after a Reddit update

1. Confirm `Lcom/reddit/domain/model/listing/Listing;->children` still exists with the
   same constructor writes (see `reddit/shared/RedditListingChildren.kt` header).
2. Confirm the comment-thread `TreeData` class still matches the List/Map/Map
   constructor shape (see `reddit/shared/RedditCommentTree.kt`). On 2026.42.0
   comment rows do **not** flow through `Listing`; only posts/listings do.
3. Confirm `Comment` still exposes `getBody`/`getBodyPreview` and
   `getCommentTombstone`, and that `CommentTombstone` still has `markdown`/`richtext`
   fields. Deleted rows may leave `body` empty and put the placeholder in the
   tombstone, so body-only detection is not sufficient.
4. If the archive lookup fails silently on-device, check `adb logcat` for
   `[Proteus] Show deleted comments:` lines — the helper logs how many deleted rows it
   saw, how many ids the archive returned, and whether a hit could be written back into
   the model. Endpoint changes or rate limits are logged there, and the comment is left
   `[deleted]`.

## Performance

Repeated `Listing.getChildren()` reads on the UI thread no longer redo the archive
placeholder scan: results are memoized per list identity (see
`docs/REDDIT-PERFORMANCE.md` — it covers the jank/animation-lag report and why the
patch-added cost disappeared without changing any behaviour).
