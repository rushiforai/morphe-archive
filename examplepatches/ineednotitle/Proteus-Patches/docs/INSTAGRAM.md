# Instagram patches

Proteus targets **Instagram `439.0.0.37.89`** (`com.instagram.android`, ARM64
`384510827` / ARMv7 `384510838`).

The existing V2.3.0 Instagram suite is unchanged in behaviour unless the new
runtime settings are used. The additions below are opt-in where the source
cannot be verified safely.

## Settings button

Apply **Proteus settings** to add two small buttons to the main feed action bar:

| Button | Action |
| :--- | :--- |
| Gear | Opens the Proteus settings dialog |
| Ghost | Toggles Ghost Mode on/off |

The dialog is built entirely in Java and does not depend on Instagram
resources. Settings are stored in the app-private preference file
`proteus_instagram_settings`.

The same dialog is the only required entry point for the runtime toggles below.
If an individual feature patch is not applied, its toggle has no effect.

## Feed

**Limit feed to following profiles** now also turns off
`p92_android_ranked_following_feed:is_enabled` (`108494::0`) and reads the
`chronological_feed` runtime setting. Turning the setting off restores the
ranked following feed flag while leaving the patch applied.

## Ghost mode

Apply **Ghost mode** and enable it from the dialog. The feature combines:

- suppression of direct-message typing indicators
  (`85450::68`, `85450::69`, `115516::0`, `115516::1`, `99511::0`);
- a conditional early return in the `mark_thread_seen-` request builder, so DM
  read receipts are not sent;
- a best-effort block of story seen requests (`media/seen/?reel=`) in the Tigon
  request layer.

Sub-switches allow keeping typing indicators or read receipts while Ghost Mode
is on.

### Limits

Story view blocking is intentionally conservative. Instagram may still update
its local seen state or retry the request. The DM hook only suppresses the
`mark_thread_seen-` path used by the patched build; other server-side read
signals are outside the client's control.

## Reels

| Patch | MobileConfig flags | Runtime toggle |
| :--- | :--- | :--- |
| **Reels playback speed menu** | `109947::0`, `109947::2` | Playback speed menu |
| **Reels double-tap seek** | `118405::1`, `118405::5`, `118405::6` | Double-tap seek |

Instagram applies these flags at the next feed/Reels start; a restart may be
needed after toggling.

## Change like animation

**Change like animation** is marked experimental and is off by default. It maps
Instagram's animation enum through the native animation renderer, the same
approach used by piko. The dialog lists piko's animation values and also offers a
random choice per process; a value that is missing from the installed build
falls back to the native heart at runtime.

If Instagram changes `LikeActionView.setUpCustomLikesAnimation` or the
`XDTUserActivationMetadataImpl` constructor in a later build, the patch fails at
apply time rather than shipping a broken hook.

### Register pressure in the metadata constructor

`XDTUserActivationMetadataImpl.<init>` on `439.0.0.37.89` is register
saturated: every register in the frame is live, so there is no room for two
scratch registers. An earlier revision of this patch requested two free
registers and failed at apply time with:

```
app.morphe.patcher.patch.PatchException: No free registers available
Caused by: java.lang.IllegalStateException: No free registers available
	at app.template.patches.shared.FreeRegisterProvider.getFreeRegister(FreeRegisterProvider.kt:117)
	at app.template.patches.instagram.misc.ChangeLikeAnimationPatchKt...
```

The patch now needs only **one** 4-bit scratch register (required by the
`move-result-object` 11x instruction) and carries the "explicit choice" Boolean
in the `p2` parameter register, matching upstream piko. The selected animation
is written back into the `p1` parameter with the wide-capable
`move-object/from16`. When no animation is selected, the original animation is
left untouched instead of being replaced with `null`.

## Browser tools

The settings dialog includes three in-app WebView tools:

- **Open logged-out browser** — clears the WebView cookie jar after an explicit
  confirmation and opens the public explore page. The app login is not touched.
- **Open a profile's Reels** — opens `instagram.com/<username>/reels/`.
- **Open my liked posts** — opens `instagram.com/your_activity/likes/`.

### Server-enforced limits

Instagram does not expose another account's liked Reels to clients. There is no
client-side flag or bytecode hook that can reveal them. The profile-Reels tool is
therefore the honest fallback. Likewise, browsing as a logged-out user is only
possible for pages Instagram serves publicly; the app's own session cannot be
removed client-side without changing the app's account model.

## Verification status

The new patches compile against the repository's patcher API and the extension
helpers pass the javac-based tests in
`.github/scripts/test_instagram_extension.sh`. The MobileConfig flag IDs come
from piko's `439.0.0.37.89` mapping. The action-bar, DM-seen, and like-animation
fingerprints are name/string anchored and are **not device-verified** for this
exact build in this change; treat the like-animation patch as experimental.
