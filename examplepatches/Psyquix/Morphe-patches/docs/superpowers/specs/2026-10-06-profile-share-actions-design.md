# Profile share actions — Design Spec
Date: 2026-10-06
Status: sections 1-4 chat-approved; Revision A (§6) pending owner review (icon fallback)
Approach: B — Compose ActionItem 2-hook (supersedes A / clone-at-bind, void per Phase 0)

## 1. Intent

What you said:
- On a user profile page, the top share button opens a share sheet whose 2nd row has [Copy link] and [Share via].
- Add 2 new buttons next to [Copy link], same size/appearance:
  1. [Copy username] with letter-U icon — copies the bare username (e.g. `rere`).
  2. [Open ghostddit] with ghost icon — opens `https://ghostddit.aeddit.com/user/<name>/` in an external browser.
- Old behavior (auto-rewriting [Copy link] output to bare username) is fully removed — [Copy link] returns to stock.
- Everything except the 2 new buttons is untouched.
- Icon direction: generic glyphs are fine — locked to option A (bold U + ghost outline vectors).
- Scope change during review: target latest exp only (2026.40.0), then amended to keep 2026.39.0 as well.

Assumptions (correct if wrong):
- Share sheet is a custom in-app bottom sheet (not the system chooser), with a bind-time setup method that configures [Copy link]. Injection clones that button's style.
- Extension package stays `app.morphe.extension.reddit.profile`; class renamed to `ProfileShareActions`.
- `reddit-target.txt` stays the single source of truth (`2026.40.0`); `Constants.kt` lists both exp targets.

Success criteria:
- Profile share sheet shows [Copy link] (stock) + [Copy username] + [Open ghostddit] + [Share via]; new buttons match size/appearance of [Copy link].
- [Copy username] copies bare `rere` (no `u/` prefix, no URL) and shows a toast.
- [Open ghostddit] fires external `ACTION_VIEW` for `https://ghostddit.aeddit.com/user/rere/` (trailing slash, username URL-encoded).
- Post/subreddit/comment shares show no new buttons; [Copy link] is stock everywhere.
- `./gradlew test` passes; patch builds for 2026.40.0 + 2026.39.0.

## 2. Scope and compatibility (Section 1/4 — approved, amended)

- Remove old injection in `ShareProfileUsernamePatch.kt` (`shortenProfileLink` / `wasShortened` prologue). Patch renamed to `Profile share actions`.
- `Constants.kt` `COMPATIBILITY_REDDIT`: two `AppTarget`s — `2026.40.0` (exp) + `2026.39.0` (exp), both `minSdk 29`. Stable `2026.24.0` dropped.
- Buttons gated by `extractUsername(shareUrl) != null` (`/user/<name>`, `/u/<name>`, incl. `/u/<name>/s/<token>`). Null means no injection.
- No changes to [Copy link] / [Share via] listeners, no layout XML replacement.

## 3. Hook and injection (Section 2/4 — approved, approach A)

- Phase 0 of implementation: decompile `com.reddit.frontpage 2026.40.0` (+ spot-check `2026.39.0`) APKM, locate the profile share bottom-sheet bind method that sets the `Copy link` text/listener. Fingerprint in `Fingerprints.kt` on stable signals (sheet Fragment/ViewHolder + `Copy link` string resource + clipboard/`ACTION_VIEW` call proximity), same style as current `ShareProfileLinkFingerprint`. One fingerprint per version if the sheet moved between 39 and 40; shared extension entry points.
- At bind time: resolve the `Copy link` view, read its `LayoutParams`, text/icon size, padding. Inflate 2 siblings into the same 2nd-row parent immediately after [Copy link]: [Copy username] (`U` vector) + [Open ghostddit] (ghost vector). Style cloned at runtime, no hardcoded pixels.
- Wire clicks to extension static methods (section 4). Tag injected views to keep rebinding idempotent.

## 4. Extension logic and assets (Section 3/4 — approved)

- `extensions/extension/.../reddit/profile/ProfileShareActions.java` (replaces `ShareProfileUsername.java`):
  - `extractUsername(url)` — reuse existing `PROFILE_LINK` regex semantics (`^https?://(www\.|old\.)?reddit\.com/(?:user|u)/([^/?#]+).*`, case-insensitive) so all current test URL variants keep passing; returns bare name or null.
  - `ghostdditUrl(username)` — `"https://ghostddit.aeddit.com/user/" + Uri.encode(username) + "/"`.
  - `copyUsername(context, username)` — `ClipboardManager.setPrimaryClip(ClipData.newPlainText("username", username))` + toast.
  - `openGhostddit(context, username)` — `ACTION_VIEW` + `FLAG_ACTIVITY_NEW_TASK` for the URL above.
- Icons (bundled vectors, option A): `ic_copy_u.xml` (bold U letterform) + `ic_ghost.xml` (ghost outline from mock). White tint like native; size/padding come from cloned `LayoutParams`.
- Delete `shortenProfileLink` / `wasShortened`; update/rename tests to `extractUsername` + `ghostdditUrl` cases.

Files touched:
- `patches/.../profile/shareusername/ShareProfileUsernamePatch.kt` (rename + new injection)
- `patches/.../profile/shareusername/Fingerprints.kt` (new sheet fingerprints for 40 + 39)
- `patches/.../shared/Constants.kt` (targets 40 + 39)
- `extensions/extension/.../ProfileShareActions.java` + `res/drawable/ic_copy_u.xml`, `ic_ghost.xml`
- `extensions/extension/.../ProfileShareActionsTest.java`
- `README.md` (patch table + description), `reddit-target.txt` unchanged (`2026.40.0`)

## 6. Revision A — Compose ActionItem injection (2026-10-06, supersedes §§2–3 hook mechanism)

Phase-0 finding (Task 3 report): the 2026.40.0/39.0 share sheet is Jetpack Compose
(`ActionSheet extends ComposeBottomSheetScreen`; rows render from `ActionItem`
Parcelable data via `ActionsViewModel.R(..)List`). There is no View/LayoutParams
bind point, so clone-at-bind is void. Replacement design, same success criteria:

- Hook 1 (list): in the profile funnel (`ShareableData$ShareableProfileData` /
  `b.a(...)` factory path, or overflow-menu `ArrayList<ActionItem>` build), append
  2 `ActionItem`s with fresh ids outside the action-type `hashCode()` range.
  Gate on `extractUsername != null`; non-profiles unchanged.
- Hook 2 (click): prologue on `handler/a.g(...)` (`onActionItemClicked`) matching
  the 2 ids → `copyUsername` / `openGhostddit` with a Context from handler fields;
  all other ids fall through untouched. Tag/duplicate-guard so rebinds add once.
- Icons (revised): `IconEnum.Clipboard` + `IconEnum.External` (stable, non-obfuscated
  on both versions). Custom U/ghost vectors cannot feed Compose rows without a
  painter bridge — deferred as follow-up; icon selection lives in one place so the
  swap is contained. Labels hardcoded English v1 (stock rows use `kj2.f(resId)`).
- Per-version fingerprints (obfuscated leaves drifted 39→40, e.g. `kpi→w1f`;
  resource ids drift, e.g. `label_copy_link_v2 0x7f1311f2→0x7f1311f4`): prefer
  `IconEnum` + structural filters over literal ids/names. Fingerprint resolution is
  only verifiable inside the patcher with the APK; final proof needs a device
  apply-test on 40.0 + 39.0 (out of container scope — owner runs Task 4 manual).

## 5. Errors and testing (Section 4/4 — approved)

- Null/empty/non-profile URL → no injection. Clipboard unavailable → toast fallback, no crash. No browser handler → catch `ActivityNotFoundException`, toast. Rebind/rotate → skip if injected-view tags present. Fingerprint miss on a version → that version no-ops to stock sheet, no partial APK, no crash.
- Tests: port all current `shortenProfileLink` URL variants to `extractUsername`; add `ghostdditUrl` cases (plain, encoded chars, trailing slash); keep null/empty passthrough tests. Gate: `./gradlew test`.
- Manual: on 40.0 + 39.0 — profile share shows 2 working buttons; post/sub/comment share shows none; [Copy link] output is stock full URL.
