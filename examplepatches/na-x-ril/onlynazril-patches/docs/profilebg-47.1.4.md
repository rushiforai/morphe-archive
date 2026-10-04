# Profile background (TikTok)

How the app decides whether the profile background runs, what the patch does about it,
and what was checked on every version before the patch was written.

## The app decides with one AB decision

The feature ships in the app complete: the background component
(`ProfileBackgroundComponent`), the pickers (`ProfileBgImagePreviewActivity` for a static
image, `ProfileBgVideoListActivity` + `ProfileBgVideoListViewModel` to choose a post,
`ProfileBgVideoPreviewActivity` for the animated case), and the save endpoint
(`ProfileBgApi#commitProfileBackground(int, String, String, Float, …)`). Whether any of
it runs is one AB decision, read from two `com.bytedance.ies.abmock` config keys:

| Key | Carries |
|---|---|
| `profile_bg_in_allow_list` | the allow list the server pushes per account |
| `profile_bg_enable_consumption_group` | the experiment group |

The compiled-in defaults live in a ~200-method registry in which every method returns
`void`; the server pushes values for accounts in the experiment; and an obfuscated class
next to the keys answers every component that asks. The data model is real-named on every
version checked:

- `ProfileBgInfo`: `mediaType`, `imageUrlList`, `videoInfo`, `hasBackground()`,
  `isImage()`, `isVideo()`. Static is an image list; animated is a video.
- `ProfileBgVideoInfo`: `awemeInfo` (the post that *is* the background), `autoPlay`,
  `offsetYRatio`.
- `ProfileBgBizData`: `profileBgInfo`, `autoPlay`, `needGuide`, carried in the profile
  response (`ProfileUser`).

## The gate holder, per version

The class and its method names are obfuscated and change every build, so the shape was
checked on every version available here before anything was written down:

| Version | Class | Gate | Setter | Cached decision |
|---|---|---|---|---|
| 46.2.3 | `X.0iZu` | `LIZIZ(Z)→Z` (29 ops, 26 callers) | `LIZJ(Z)→V` (18 ops, 5 callers) | none |
| 46.3.3 | `X.0By2` | same | same | none |
| 46.5.3 | `X.0InD` | same | same | none |
| 46.9.3 | `X.0Nfm` | same (28 callers) | same | none |
| 47.0.3 | `X.0kzw` | same (28 callers) | same | none |
| 47.1.4 | `X.0OSK` | `LIZJ(Z)→Z` (29 ops, 28 callers) | `LIZLLL(Z)→V` (18 ops, 5 callers) | `LIZIZ()→Z` (10 ops, 3 callers) |

Every version also carries `LIZ() → <pair>` (76 ops, 3 callers): the allow-list read for
the current user (`getCurUserId`), which the gate calls. 47.1.4 inserted the cached
decision above the gate, which is why the gate moved from `LIZIZ` to `LIZJ`: a name-based
anchor would have broken on exactly that release.

The shape is the anchor, not the name: **the one class that reads either key and carries a
`(boolean) -> boolean` method next to a `(boolean) -> void` setter.** The registry reads
the same keys but returns nothing in boolean; the class that only lists the keys in its
static init has two `void` methods; neither has the shape, so the gate holder is unique
without a name.

## Why it shows on other profiles and not on your own

A profile page gets its background from one place: the profile response. `ProfileBgInfo`
arrives inside `ProfileBgBizData` in `ProfileComponents#bizData`, and
`ProfileBackgroundComponent` draws it. There is no second copy of the data and no second
renderer: the same component serves your own page and everybody else's, which is why the
feature is not off on your profile but empty on it.

Your own page is filled by a different request than other people's. `ProfilePlatformViewModel#O83`
calls `getSelfUserInfo` (`/tiktok/user/profile/self/v1`) rather than `getOtherUserInfo`
(`/tiktok/user/profile/other/v1`), and the two carry the background under different rules:

```
getSelfUserInfo(String, I,I,I,I,I,I,I, Object)     /tiktok/user/profile/self/v1
  p6 @Query "profile_bg_in_allow_list"

getOtherUserInfo(String, String, String, String, I,I,I,I,I,I, Object)
                                                       /tiktok/user/profile/other/v1
  p8 @Query "profile_bg_in_allow_list"
  p9 @Query "profile_bg_enable_consumption_group"
```

Both send the allow-list value, so the difference is not that one path asks and the other
does not. What the request asks for is the deciding part, and the answer is on the server:
the response for an account outside the rollout carries no `profile_background` at all, and
a component with nothing to draw shows nothing. The switch opens the pickers, the save
goes through, and other people see the result because *their* request is not held back by
your account's rollout.

## What the patch does

1. Discovers the gate holder by that shape, and fails with a `PatchException` naming the
   candidates when it is not exactly one.
2. Hooks the gate (the class's one `(boolean) -> boolean` method) to answer `true`
   while the Tweaks switch says so. The answer comes from
   `ProfileBgBridge#forceEnabled`, which reads `ProfileBgSettings` (`profile_bg_enabled`,
   off by default).
3. From 47.1.4, hooks the cached decision (the no-arg boolean the fragments read) the
   same way; earlier builds have none and nothing to hook.

The switch is off by default for the same reason the download feature's is: the pickers
lead to a save the server refuses for an account that is not in the rollout, so a user
who never saw the feature would get an entry that cannot keep its result.

## What it cannot do

The client answers; the server decides, and here the decision is the whole of it. The
gate and the cached decision only choose what a profile page draws from a response that
already carries a background. When the server withholds the field, there is nothing on the
client to draw and no gate to answer differently.

## Tried and reverted: answering the allow-list snapshot

`getMineSnapshot` (the class's one no-arg method returning a non-primitive, 76 instructions,
3 callers, on every version checked) reads the AB value for the current uid and is what
both requests put in the `profile_bg_in_allow_list` field. Hooking it to answer with a
snapshot claiming the allow list looked like the missing half of the gate: 46.2.3, 46.3.3,
46.5.3, 46.9.3, 47.0.3 and 47.1.4 all carry it, the patch applied cleanly, and the method
read back from the patched APK as 76 ops before and 83 after with both fall-through
branches landing on the app's own first instruction.

On a device it did not work, and it made refresh hang. Both are the server's answer rather
than the hook's: the background still did not arrive, and a snapshot carrying a uid that
does not match the account asks the server a question it answers by stalling. The hook was
removed rather than tuned further, since a snapshot's uid is the one field that has to be
real and the one field a client cannot invent.

`tools/dexprobe/VerifyAnchors` still checks the snapshot method's shape
(`requireProfileBgGate`), so the method is known to be there if this is ever picked up
again: the anchor is not the part that was wrong.

## Verified

- `tools/dexprobe/run.sh VerifyAnchors "<apk>"` checks the gate holder's shape on every
  release (`requireProfileBgGate`), mirroring the patch's discovery exactly.
- The per-version table above came from a method-level scan for both keys on every APK,
  then the `(Z)→Z` + `(Z)→V` shape check on each class that carries one, run against
  46.2.3, 46.3.3, 46.5.3, 46.9.3, 47.0.3 and 47.1.4.
- The self-profile request was read out of the retrofit annotations of
  `UpdateProfileUserAPI`, which is where the two endpoints and their query names are.
